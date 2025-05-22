package data;

import org.springframework.data.repository.CrudRepository;

import java.util.List;

public interface TeamMemberRepository extends CrudRepository<TeamMember, Long> {
    List<TeamMember> findAll();
}
