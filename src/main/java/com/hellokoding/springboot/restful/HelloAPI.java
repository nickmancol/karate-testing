package com.hellokoding.springboot.restful;
import org.springframework.web.bind.annotation.*;


@RestController
@RequestMapping("/")
public class HelloAPI {
    
    // $ curl localhost:8080/api/hello
    @GetMapping
    public String greet(@RequestParam(required=false, defaultValue = "world") String name) {
        return String.format("Hello %s!, you are probably looking for /api/v1/products", name);
    }
}