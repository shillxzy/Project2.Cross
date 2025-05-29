package data.repository;
import data.User;
import org.springframework.data.domain.Sort;
import org.springframework.data.repository.CrudRepository;

import java.util.List;
import java.util.Optional;

public interface UserRepository extends CrudRepository<User, Long> {
    Optional<User> findByUsername(String username);

    Object findAll(Sort sort);
    List<User> findByUsernameContainingIgnoreCase(String query, Sort sort);
}