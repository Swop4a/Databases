package ssu.databases.agency.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import ssu.databases.agency.model.Comment;

public interface CommentRepository extends JpaRepository<Comment, Long> {
}
