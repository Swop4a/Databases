package ssu.databases.agency.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import ssu.databases.agency.model.Company;

public interface CompanyRepository extends JpaRepository<Company, Long> {
}
