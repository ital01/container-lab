use actix_web::{get, App, HttpResponse, HttpServer, Responder};
use serde_json::json;

#[get("/")]
async fn index() -> impl Responder {
    HttpResponse::Ok()
        .content_type("application/json")
        .json(json!({
            "message": "Study from Rust!"
        }))
}

#[actix_web::main]
async fn main() -> std::io::Result<()> {
    println!("Server running on port 3000");
    
    HttpServer::new(|| {
        App::new()
            .service(index)
    })
    .bind("0.0.0.0:3000")?
    .run()
    .await
}
