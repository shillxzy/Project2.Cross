package data;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@Entity
@Table(name = "team_members")
public class TeamMember {
    @Id
    @GeneratedValue
    private Long id;

    private String name;
    private String role;

    @ManyToOne
    @JoinColumn(name = "project_id")
    private Project project;

    @OneToOne(mappedBy = "teamMember", cascade = CascadeType.ALL)
    private Profile profile;


}

