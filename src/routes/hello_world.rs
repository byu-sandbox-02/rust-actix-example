use actix_web::{HttpResponse, post, web};
use serde::{Deserialize};

#[derive(Deserialize)]
pub struct HelloWorldRequest {
    pub name: String,
}

#[post("/hello/world")]
pub async fn hello_world(body: web::Json<HelloWorldRequest>) -> HttpResponse {
    HttpResponse::Ok().body(format!("Hello {}", body.name))
}