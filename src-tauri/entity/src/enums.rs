use serde::{Deserialize, Serialize};

#[derive(Debug, Serialize, Deserialize)]
pub enum MediaType {
    Audio(AudioType),
    Video(VideoType),
}

#[derive(Debug, Serialize, Deserialize)]
pub enum AudioType {
    Music,
    AudioBook,
    Podcast,
    Other(String),
}

#[derive(Debug, Serialize, Deserialize)]
pub enum VideoType {
    TVEpisode,
    Movie,
    WebEpisode,
    Other(String),
}
