package ssu.databases.agency.model;

import com.fasterxml.jackson.annotation.JsonIgnore;

import javax.persistence.*;
import java.util.List;

@Entity
@Table(name = "resume_table")
public class Resume {

    @Id
    @Column(name = "id")
    private Long id;

    @Column(name = "desire_salary")
    private Integer desireSalary;

    @Column(name = "description")
    private String description;

    @ManyToOne
    @JoinColumn(name = "employee_id")
    private Employee employee;

    @JsonIgnore
    @ManyToMany(mappedBy = "resumeList")
    private List<Vacancy> vacancyList;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Integer getDesireSalary() {
        return desireSalary;
    }

    public void setDesireSalary(Integer desireSalary) {
        this.desireSalary = desireSalary;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Employee getEmployee() {
        return employee;
    }

    public void setEmployee(Employee employee) {
        this.employee = employee;
    }
}
