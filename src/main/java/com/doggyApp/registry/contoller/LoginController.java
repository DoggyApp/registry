package com.doggyApp.registry.contoller;

import jakarta.servlet.http.HttpServletRequest;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/registry")
@CrossOrigin
public class LoginController {

    @GetMapping("/test")
    public ResponseEntity<String> testResponse() {
        String testString = "working";
        return ResponseEntity.status(200).body(testString);
    }
}
