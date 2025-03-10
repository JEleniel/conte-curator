mod logging;

use config::{Config, Environment, File};
use log::trace;
use logging::init_logging;
use serde::Deserialize;

#[derive(Debug, Deserialize)]
pub struct Configuration {
    package_name: String,
    logs: logging::Configuration,
}

impl Configuration {
    pub fn build() -> Configuration {
        trace!(target: module_path!(),"Loading configuration.");

        let user_configuration_dir =
            dirs::config_local_dir().unwrap_or(dirs::config_dir().unwrap());

        let builder = Config::builder()
            .set_default("package_name", env!("CARGO_PKG_NAME"))
            .unwrap()
            .add_source(File::with_name("config.default.json"))
            .add_source(File::with_name(
                user_configuration_dir.join("config.json").to_str().unwrap(),
            ))
            .add_source(Environment::with_prefix("CC_"))
            .build()
            .unwrap();
        let configuration: Configuration = builder.try_deserialize().unwrap();

        init_logging(&configuration.logs);

        trace!(target: module_path!(), "Configuration loaded:\n{configuration:?}");
        configuration
    }
}
