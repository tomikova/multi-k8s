package com.example.demo.controller;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.UUID;

@RestController
public class DummyController {

    @Value("${app.prefix}")
    private String prefix;

    @GetMapping(path = "/getRandom")
    public String generateRandom() {
        return prefix + "-" + UUID.randomUUID();
    }

}
