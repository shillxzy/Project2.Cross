INSERT INTO projects (name, description) VALUES
                                             ('Apple Vision Pro', 'AR пристрій нового покоління'),
                                             ('Apple AI', 'Машинне навчання для продуктів Apple');

INSERT INTO team_members (name, role, project_id) VALUES
                                                      ('Wozniak', 'Engineer', 1),
                                                      ('Ive', 'Designer', 1),
                                                      ('Tim Cook', 'Manager', 2);

INSERT INTO profiles (team_member_id, email, phone, bio) VALUES
                                                             (1, 'woz@apple.com', '+1234567890', 'Співзасновник компанії.'),
                                                             (2, 'ive@apple.com', '+0987654321', 'Головний дизайнер.'),
                                                             (3, 'tim@apple.com', '+1010101010', 'Генеральний директор.');

INSERT INTO technologies (name) VALUES
                                    ('Spring Boot'),
                                    ('PostgreSQL'),
                                    ('React'),
                                    ('AI Toolkit');

INSERT INTO project_technology (project_id, technology_id) VALUES
                                                               (1, 1), (1, 2), (1, 3),
                                                               (2, 1), (2, 2), (2, 4);
