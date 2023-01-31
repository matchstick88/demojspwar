package com.example.demojspwar;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequiredArgsConstructor
@Slf4j
public class TestRestController {

    @PostMapping("/test4")
    public String test4(@RequestBody String msg){
        log.info("test4 controller init ");
        log.info("test4 : "+msg);
        return msg;
    }
}
