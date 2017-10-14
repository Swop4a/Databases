package ssu.databases.agency.repository;

import java.util.List;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import ssu.databases.agency.model.Vacancy;

public interface VacancyRepository extends JpaRepository<Vacancy, Long> {
}
