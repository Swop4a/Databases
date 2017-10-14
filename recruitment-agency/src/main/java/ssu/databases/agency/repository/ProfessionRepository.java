package ssu.databases.agency.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import ssu.databases.agency.model.Profession;

public interface ProfessionRepository extends JpaRepository<Profession, Long> {
	Profession findFirstByName(String name);
}
