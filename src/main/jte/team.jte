@param java.util.List<String> team
<%-- Коментарі --%>

@template.main(content = @`
    <div>
        <h2>Steve Jobs' Team</h2>
        <ul>
            @for(String teamMember : team)
                <li>${teamMember}</li>
            @endfor
        </ul>
    </div>
`)
