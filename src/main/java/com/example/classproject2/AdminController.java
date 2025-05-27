package com.example.classproject2;

import data.repository.UserRepository;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/admin")
public class AdminController {

    private final UserRepository userRepository;

    public AdminController(UserRepository userRepository) {
        this.userRepository = userRepository;
    }

    @GetMapping
    public String adminPanel(Model model) {
        model.addAttribute("users", userRepository.findAll());
        return "admin"; // jte
    }

    @PostMapping("/users/{id}/change-role")
    public String changeRole(@PathVariable Long id) {
        var user = userRepository.findById(id).orElseThrow();
        if ("ADMIN".equals(user.getRole())) {
            user.setRole("USER");
        } else {
            user.setRole("ADMIN");
        }
        userRepository.save(user);
        return "redirect:/admin";
    }




}

