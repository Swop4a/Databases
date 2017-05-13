package ssu.databases.agency.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import ssu.databases.agency.model.Employer;

public interface EmployerRepository extends JpaRepository<Employer, Long> {
}
