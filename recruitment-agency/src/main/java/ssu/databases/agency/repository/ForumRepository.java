package ssu.databases.agency.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import ssu.databases.agency.model.Forum;

public interface ForumRepository extends JpaRepository<Forum, Long> {
}
