package ssu.databases.agency.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import ssu.databases.agency.model.Employee;

public interface EmployeeRepository extends JpaRepository<Employee, Long> {
}
