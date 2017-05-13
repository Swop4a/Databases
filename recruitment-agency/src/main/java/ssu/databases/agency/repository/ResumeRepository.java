package ssu.databases.agency.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import ssu.databases.agency.model.Resume;

public interface ResumeRepository extends JpaRepository<Resume, Long> {
}
