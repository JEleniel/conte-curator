mod configuration;
mod data_store;
mod model;

use configuration::Configuration;
use data_store::DataStore;
use dirs::{data_dir, data_local_dir};
use serde::{Deserialize, Serialize};
use std::{
    path::PathBuf,
    sync::{Arc, Mutex},
};
use tauri::{Emitter, Manager};
use tauri_plugin_os;

#[derive(Debug, Clone, Serialize, Deserialize)]
struct AppData {
    pub data_dir: Arc<Mutex<PathBuf>>,
}

#[derive(Clone, Serialize)]
struct Payload {
    args: Vec<String>,
    cwd: String,
}

#[tauri::command]
fn greet(name: &str) -> String {
    format!("Hello, {}! You've been greeted from Rust!", name)
}

#[cfg_attr(mobile, tauri::mobile_entry_point)]
pub async fn run() {
    let _configuration = Configuration::build();

    let data_dir: PathBuf = data_local_dir().unwrap_or(data_dir().unwrap());
    DataStore::new(&data_dir).await;

    tauri::Builder::default()
        .setup(move |app| {
            app.manage(AppData {
                data_dir: Arc::new(Mutex::new(data_dir.clone())),
            });
            Ok(())
        })
        .plugin(tauri_plugin_single_instance::init(|app, argv, cwd| {
            println!("{}, {argv:?}, {cwd}", app.package_info().name);
            app.emit("single-instance", Payload { args: argv, cwd })
                .unwrap();
        }))
        .plugin(tauri_plugin_os::init())
        .plugin(tauri_plugin_opener::init())
        .plugin(tauri_plugin_dialog::init())
        .invoke_handler(tauri::generate_handler![greet])
        .run(tauri::generate_context!())
        .expect("error while running tauri application");
}
