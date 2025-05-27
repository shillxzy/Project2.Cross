package com.example.classproject2;

import data.User;
import data.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.security.Principal;
import java.util.List;

@Controller
public class IndexController
{
    UserRepository userRepository;

    @GetMapping("/")
    public String index(Model model, Principal principal) {
        var homePageInfo = new Page("Home", "Welcome to the official Steve Jobs page");
        var skills = List.of("Innovating technology", "Designing user-friendly products", "Leadership", "Building visionary companies", "Public speaking");  // Змінили навички
        model.addAttribute("name", "Steve Jobs");
        model.addAttribute("pageInfo", homePageInfo);
        model.addAttribute("skills", skills);

        String username = principal.getName();
        User user = userRepository.findByUsername(username).orElseThrow();
        model.addAttribute("role", user.getRole());
        model.addAttribute("userName", username);
        
        
        return "main";
    }
}
