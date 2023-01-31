package com.example.demojspwar;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@Controller
@RequiredArgsConstructor
@Slf4j
public class TestController {

    @GetMapping(path = "/test1")
    public String test1(){
        log.info("test1 controller init ");
        return "test1";
    }

    @GetMapping(path = "/test2")
    public String test2(){
        log.info("controller init ");
        return "test2";
    }

    @GetMapping(path = "/test3")
    public String test3(){
        log.info("controller init ");
        return "test3";
    }




}
