CREATE TABLE projects (
                          id SERIAL PRIMARY KEY,
                          name VARCHAR(100) NOT NULL,
                          description TEXT
);

CREATE TABLE team_members (
                              id SERIAL PRIMARY KEY,
                              name VARCHAR(100) NOT NULL,
                              role VARCHAR(50),
                              project_id INT REFERENCES projects(id)
);

CREATE TABLE profiles (
                          id SERIAL PRIMARY KEY,
                          team_member_id INT UNIQUE REFERENCES team_members(id),
                          email VARCHAR(100),
                          phone VARCHAR(20),
                          bio TEXT
);

CREATE TABLE technologies (
                              id SERIAL PRIMARY KEY,
                              name VARCHAR(50) UNIQUE NOT NULL
);

CREATE TABLE project_technology (
                                    project_id INT REFERENCES projects(id),
                                    technology_id INT REFERENCES technologies(id),
                                    PRIMARY KEY (project_id, technology_id)
);



