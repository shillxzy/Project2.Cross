package data;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;

@Entity
@Getter
@Setter
@Table(name = "profiles")
public class Profile {
    @Id
    @GeneratedValue
    private Long id;

    private String email;
    private String phone;
    private String bio;

    @OneToOne
    @JoinColumn
    private TeamMember teamMember;
}

