use std::path::PathBuf;

use log::{Level, debug, error};
use migration::{Migrator, MigratorTrait};
use sea_orm::{ConnectOptions, Database, DatabaseConnection};

pub struct DataStore {
    data_file: PathBuf,
}

impl DataStore {
    pub async fn new(data_path: &PathBuf) -> Self {
        let new_data_store = Self {
            data_file: data_path.join(env!("CARGO_PKG_NAME")).join("/sqlite.db"),
        };

        debug!(
            "Connecting to {}",
            new_data_store.data_file.to_string_lossy()
        );
        let connection = new_data_store.connect().await;
        match Migrator::up(&connection, None).await {
            Ok(()) => new_data_store,
            Err(err) => {
                error!("Failed ot migrate data store\n{err:?}");
                panic!("Exiting");
            }
        }
    }

    pub async fn connect(self: &Self) -> DatabaseConnection {
        let mut connect_options = ConnectOptions::new(format!(
            "sqlite://{}?mode=rwc",
            self.data_file.to_string_lossy()
        ));
        connect_options
            .sqlx_logging(true)
            .sqlx_logging_level(Level::Trace.to_level_filter());
        Database::connect(connect_options).await.unwrap()
    }
}
