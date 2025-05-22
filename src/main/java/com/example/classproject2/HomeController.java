package com.example.classproject2;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.List;

@Controller
public class HomeController {

    @GetMapping("/home")
    public String home(Model model) {
        var userName = "User";
        model.addAttribute("userName", userName);
        return "home";
    }

    @GetMapping("/team")
    public String team(Model model) {
        var team = List.of("Steve Wozniak", "John Sculley", "Jony Ive", "Tim Cook", "Ed Catmull");
        model.addAttribute("team", team);
        return "team";
    }

}

