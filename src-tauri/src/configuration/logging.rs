use std::{fs::create_dir_all, path::PathBuf};

use fern::colors::{Color, ColoredLevelConfig};
use log::{info, Level};
use serde::Deserialize;

#[derive(Debug, Deserialize)]

pub struct Target {
    level: Level,
    target: String,
}

#[derive(Debug, Deserialize)]
pub struct Configuration {
    path: PathBuf,
    root: Level,
    targets: Option<Vec<Target>>,
}

pub fn init_logging(logs: &Configuration) {
    create_dir_all(&logs.path).unwrap();

    let console = fern::Dispatch::new()
        .format(|out, message, record| {
            let colors = ColoredLevelConfig::new()
                .trace(Color::BrightBlack)
                .debug(Color::White)
                .info(Color::BrightWhite)
                .warn(Color::BrightYellow)
                .error(Color::Red);
            out.finish(format_args!(
                "[{} {} {}] {}",
                chrono::Local::now().to_rfc3339().as_str(),
                colors.color(record.level()),
                record.target(),
                message
            ));
        })
        .chain(std::io::stdout());

    let file = fern::Dispatch::new()
        .format(|out, message, record| {
            out.finish(format_args!(
                "[{} {} {}] {}",
                chrono::Local::now().to_rfc3339().as_str(),
                record.level(),
                record.target(),
                message
            ));
        })
        .chain(fern::log_file(logs.path.join("app.log")).unwrap());

    let mut combined_builder = fern::Dispatch::new()
        .chain(console)
        .chain(file)
        .level(logs.root.to_level_filter());

    match &logs.targets {
        Some(levels) => {
            for level in levels {
                combined_builder =
                    combined_builder.level_for(level.target.clone(), level.level.to_level_filter());
            }
        }
        None => (),
    }
    combined_builder.apply().unwrap();

    info!(target: module_path!(), "----- Logging started -----");
}
