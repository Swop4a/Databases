package ssu.databases.agency.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import ssu.databases.agency.model.Vacancy;

public interface VacancyRepository extends JpaRepository<Vacancy, Long> {
}
