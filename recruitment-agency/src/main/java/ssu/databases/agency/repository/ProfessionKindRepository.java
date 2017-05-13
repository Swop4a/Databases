package ssu.databases.agency.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import ssu.databases.agency.model.Profession;

public interface ProfessionKindRepository extends JpaRepository<Profession, Long> {
}
