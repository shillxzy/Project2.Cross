package com.example.classproject2;

import data.TeamMember;
import data.repository.TeamMemberRepository;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.List;

@Controller
public class TeamMemberController {

    private final TeamMemberRepository teamMemberRepository;

    public TeamMemberController(TeamMemberRepository teamMemberRepository) {
        this.teamMemberRepository = teamMemberRepository;
    }

    @GetMapping("/team")
    public String listTeamMembers(Model model) {
        List<TeamMember> team = teamMemberRepository.findAll();
        model.addAttribute("team", team);
        return "team"; // твій шаблон team.jte
    }
}
