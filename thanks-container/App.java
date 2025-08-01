import static spark.Spark.*;

public class App {
    public static void main(String[] args) {
        ipAddress("0.0.0.0");
        port(3000);
        get("/", (req, res) -> {
            res.type("application/json");
            return "Thanks from Java!";
        });
    }
}
