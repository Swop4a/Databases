package ssu.databases.agency.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import ssu.databases.agency.model.Graduation;

public interface GraduationRepository extends JpaRepository<Graduation, Long> {
}
