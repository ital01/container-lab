package com.example;

import static spark.Spark.*;

public class App {
    public static void main(String[] args) {
        ipAddress("0.0.0.0");
        port(3000);
        
        get("/", (req, res) -> {
            res.type("application/json");
            return "{\"message\": \"Thanks from Java!\"}";
        });

        after((req, res) -> {
            res.type("application/json");
        });

        exception(Exception.class, (exception, req, res) -> {
            res.status(500);
            res.type("application/json");
            res.body("{\"error\": \"" + exception.getMessage() + "\"}");
        });
    }
}
