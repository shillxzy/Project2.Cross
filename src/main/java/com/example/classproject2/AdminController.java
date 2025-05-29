package com.example.classproject2;

import data.User;
import data.repository.UserRepository;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.data.domain.Sort;

import java.util.List;
import java.util.Optional;

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
    public String adminPanel(
            Model model,
            @RequestParam(required = false) String createError,
            @RequestParam(required = false, defaultValue = "id") String sortField,
            @RequestParam(required = false, defaultValue = "asc") String sortDir,
            @RequestParam(required = false) String query
    ) {
        List<User> users;

        Sort sort = Sort.by(sortField);
        sort = sortDir.equalsIgnoreCase("asc") ? sort.ascending() : sort.descending();

        if (query != null && !query.isBlank()) {
            users = userRepository.findByUsernameContainingIgnoreCase(query, sort);
        } else {
            users = (List<User>) userRepository.findAll(sort);
        }

        model.addAttribute("users", users);
        model.addAttribute("createError", createError);
        model.addAttribute("sortField", sortField);
        model.addAttribute("sortDir", sortDir);
        model.addAttribute("reverseSortDir", sortDir.equalsIgnoreCase("asc") ? "desc" : "asc");
        model.addAttribute("searchQuery", query);

        return "admin";
    }

    @GetMapping("/search")
    public String searchUsers(
            @RequestParam String query,
            Model model,
            @RequestParam(required = false, defaultValue = "id") String sortField,
            @RequestParam(required = false, defaultValue = "asc") String sortDir
    ) {
        Sort sort = Sort.by(sortField);
        sort = sortDir.equalsIgnoreCase("asc") ? sort.ascending() : sort.descending();

        List<User> users = userRepository.findByUsernameContainingIgnoreCase(query, sort);
        model.addAttribute("users", users);
        model.addAttribute("searchQuery", query);
        model.addAttribute("sortField", sortField);
        model.addAttribute("sortDir", sortDir);
        model.addAttribute("reverseSortDir", sortDir.equalsIgnoreCase("asc") ? "desc" : "asc");

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

    @GetMapping("/users/{id}/edit")
    public String editUserForm(@PathVariable Long id, Model model) {
        Optional<User> userOpt = userRepository.findById(id);
        if (userOpt.isEmpty()) {
            return "redirect:/admin?createError=Користувача не знайдено";
        }

        model.addAttribute("user", userOpt.get());
        return "edit-user";
    }



    @PostMapping("/users/{id}/edit")
    public String editUserSubmit(
            @PathVariable Long id,
            @RequestParam String username,
            @RequestParam(required = false) String password,
            @RequestParam String role,
            RedirectAttributes redirectAttributes
    ) {
        Optional<User> userOpt = userRepository.findById(id);
        if (userOpt.isEmpty()) {
            redirectAttributes.addFlashAttribute("createError", "Користувача не знайдено");
            return "redirect:/admin";
        }

        User user = userOpt.get();
        user.setUsername(username);
        if (password != null && !password.isBlank()) {
            user.setPassword(passwordEncoder.encode(password));
        }
        user.setRole(role);

        userRepository.save(user);
        return "redirect:/admin";
    }

    @PostMapping("/users/{id}/delete")
    public String deleteUser(@PathVariable Long id, RedirectAttributes redirectAttributes) {
        Optional<User> userOpt = userRepository.findById(id);
        if (userOpt.isEmpty()) {
            redirectAttributes.addFlashAttribute("createError", "Користувача не знайдено");
            return "redirect:/admin";
        }

        userRepository.deleteById(id);
        return "redirect:/admin";
    }





}

