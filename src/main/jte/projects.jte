@import data.Project
@import data.TeamMember
@import data.Technology

@param java.lang.Iterable<Project> projects

@template.main(content = @`
    <h1>Список проєктів AppleCompany</h1>

    @for(Project project : projects)
        <div style="border:1px solid #ccc; margin-bottom:20px; padding:10px;">
            <h2>${project.getName()}</h2>
            <p>${project.getDescription()}</p>

            <h3>Команда:</h3>
            <ul>
                @for(TeamMember member : project.getTeamMembers())
                    <li>${member.getName()} — ${member.getRole()}
                        @if(member.getProfile() != null)
                            <br> Email: ${member.getProfile().getEmail()}
                        @endif
                    </li>
                @endfor
            </ul>

            <h3>Технології:</h3>
            <ul>
                @for(Technology tech : project.getTechnologies())
                    <li>${tech.getName()}</li>
                @endfor
            </ul>
        </div>
    @endfor
`)
