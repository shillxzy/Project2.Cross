@param java.util.List<data.User> users

@template.main(content = @`
    <h1>Панель адміністратора</h1>

    @for(var user : users)
        <div style="border:1px solid #ccc; padding:15px; margin-bottom:15px; border-radius:4px;">
            <h2>${user.getUsername()} (ID: ${user.getId()})</h2>
            <p><strong>Роль:</strong> ${user.getRole()}</p>

            <form method="post" action="/admin/users/${user.getId()}/change-role" style="margin-top:10px;">
                <button type="submit" style="
                    background-color:#007bff;
                    color:#fff;
                    border:none;
                    padding:8px 16px;
                    border-radius:3px;
                    cursor:pointer;
                    font-size:14px;
                ">
                    Змінити роль
                </button>
            </form>
        </div>
    @endfor
`)
