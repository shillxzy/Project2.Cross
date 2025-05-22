@param java.util.List<data.TeamMember> team

@template.main(content = @`
    <div>
        <h2>Steve Jobs' Team</h2>
        <ul>
            @for(data.TeamMember member : team)
                <li>
                    ${member.getName()} — ${member.getRole()}
                    @if(member.getProfile() != null)
                        <br>Email: ${member.getProfile().getEmail()}
                        <br>Phone: ${member.getProfile().getPhone()}
                        <br>Bio: ${member.getProfile().getBio()}
                    @endif
                </li>
            @endfor
        </ul>
    </div>
`)
