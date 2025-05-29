package com.example.classproject2;

import data.User;
import data.repository.UserRepository;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.List;

@Controller
@RequestMapping("/admin")
public class AdminController {

    private final UserRepository userRepository;
    private final PasswordEncoder passwordEncoder;

    public AdminController(UserRepository userRepository, PasswordEncoder passwordEncoder) {
        this.userRepository = userRepository;
        this.passwordEncoder = passwordEncoder;
    }

    @GetMapping
    public String adminPanel(Model model, @RequestParam(required = false) String createError) {
        List<User> users = (List<User>) userRepository.findAll();
        model.addAttribute("users", users);
        model.addAttribute("createError", createError);
        return "admin";
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

    @PostMapping("/create")
    public String createUser(@RequestParam String username,
                             @RequestParam String password,
                             @RequestParam String role,
                             RedirectAttributes redirectAttributes) {
        if (userRepository.findByUsername(username).isPresent()) {
            redirectAttributes.addAttribute("createError", "Користувач з таким ім'ям вже існує.");
            return "redirect:/admin";
        }

        User user = new User();
        user.setUsername(username);
        user.setPassword(passwordEncoder.encode(password));
        user.setRole(role);
        userRepository.save(user);

        return "redirect:/admin";
    }




}

