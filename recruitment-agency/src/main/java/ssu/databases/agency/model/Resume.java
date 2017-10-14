package ssu.databases.agency.model;

import com.fasterxml.jackson.annotation.JsonIgnore;

import javax.persistence.*;
import java.util.List;

@Entity
@Table(name = "resume_table")
public class Resume {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
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

    public List<Vacancy> getVacancyList() {
        return vacancyList;
    }

    public void setVacancyList(List<Vacancy> vacancyList) {
        this.vacancyList = vacancyList;
    }

    @Override
    public String toString() {
        return "Resume{" +
                "id=" + id +
                ", desireSalary=" + desireSalary +
                ", description='" + description + '\'' +
                ", employee=" + employee +
                '}';
    }
}
