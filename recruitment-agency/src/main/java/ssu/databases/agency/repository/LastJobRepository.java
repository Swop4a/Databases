package ssu.databases.agency.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import ssu.databases.agency.model.LastJob;

public interface LastJobRepository extends JpaRepository<LastJob, Long> {
}
