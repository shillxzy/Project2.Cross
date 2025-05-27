@param java.lang.String username
@param java.lang.String role

@template.main(content = @`
    <div class="profile">
    <div class="profile-header">
    <div class="profile-emoji">
    @if(role.equals("ADMIN"))
        ⭐
        @else
        👤
        @endif
        </div>
        <div class="profile-info">
        <div class="profile-username">${username.toUpperCase()}</div>
        <div class="profile-role">
        @if(role.equals("ADMIN")) {
            ADMIN
            } @else {
            USER
            }
            @endif
            </div>
            </div>
            </div>

            @if(role.equals("ADMIN"))
                <div class="profile-action">
                    <a href="/admin" class="admin-link">Перейти до панелі адміністратора</a>
                </div>
                @endif

        <div class="profile-action">
            <a href="/logout" class="logout-link">Вийти з системи</a>
        </div>
                </div>

                <style>
                    .profile {
                        background-color: var(--color-gray-light);
                        padding: 30px;
                        border-radius: var(--border-radius);
                        box-shadow: var(--shadow);
                        margin-bottom: 40px;
                        display: flex;
                        flex-direction: column;
                        gap: 20px;
                    }

                    .profile-header {
                        display: flex;
                        align-items: center;
                        gap: 20px;
                    }

                    .profile-emoji {
                        font-size: 2.5rem;
                    }

                    .profile-info {
                        display: flex;
                        flex-direction: column;
                    }

                    .profile-username {
                        font-size: 1.8rem;
                        font-weight: bold;
                        color: var(--color-dark-blue);
                        letter-spacing: 1px;
                    }

                    .profile-role {
                        font-size: 1.2rem;
                        color: var(--color-gray-dark);
                        margin-top: 4px;
                    }

                    .profile-action {
                        margin-top: 10px;
                    }

                    .admin-link {
                        display: inline-block;
                        background-color: var(--color-mid-blue);
                        color: white;
                        text-decoration: none;
                        padding: 10px 20px;
                        border-radius: var(--border-radius);
                        font-weight: 600;
                        transition: background-color 0.3s ease;
                    }

                    .admin-link:hover {
                        background-color: var(--color-dark-blue);
                    }
                </style>
                `)
