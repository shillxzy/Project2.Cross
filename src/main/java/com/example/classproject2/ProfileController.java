package com.example.classproject2;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class ProfileController {

    @GetMapping("/profile")
    public String profilePage(Model model) {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();

        String username = auth.getName(); // логін користувача

        // Беремо першу роль (якщо є), бо може бути декілька, але в тебе одна ролі зазвичай
        String role = auth.getAuthorities().stream()
                .map(GrantedAuthority::getAuthority)
                .findFirst()
                .orElse("USER");

        // Зазвичай ролі йдуть з префіксом "ROLE_", отримаємо чистий формат
        if (role.startsWith("ROLE_")) {
            role = role.substring(5);
        }

        model.addAttribute("username", username);
        model.addAttribute("role", role);

        return "profile";
    }
}
