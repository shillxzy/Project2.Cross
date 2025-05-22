package com.example.classproject2;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import data.*;

@Controller
public class ProjectController
{
    private final ProjectRepository projectRepository;

    @Autowired
    public ProjectController(ProjectRepository projectRepository)
    {
        this.projectRepository = projectRepository;
    }

    @GetMapping("/projects")
    public String getProjects(Model model)
    {
        Iterable<Project> projects = projectRepository.findAll();
        model.addAttribute("projects", projects);
        return "projects";
    }
}

