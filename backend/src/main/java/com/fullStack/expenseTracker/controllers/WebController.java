package com.fullStack.expenseTracker.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class WebController {

    @RequestMapping(value = {"/", "/login", "/register", "/forgot-password", "/dashboard", "/transactions", "/statistics", "/profile", "/admin/**"})
    public String forward() {
        return "forward:/index.html";
    }
}
