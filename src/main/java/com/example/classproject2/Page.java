package com.example.classproject2;

public class Page
{
    private String title;
    private String description;

    public Page(String title, String description) {
        this.title = title;
        this.description = description;
    }

    // Гетери, якщо треба використовувати в шаблоні
    public String getTitle() {
        return title;
    }

    public String getDescription() {
        return description;
    }
}
