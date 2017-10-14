package ssu.databases.agency.web.dto;

public class ResumeDto {
    private Long id;
    private String description;
    private Integer salary;
    private String employee;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Integer getSalary() {
        return salary;
    }

    public void setSalary(Integer salary) {
        this.salary = salary;
    }

    public String getEmployee() {
        return employee;
    }

    public void setEmployee(String employee) {
        this.employee = employee;
    }

    @Override
    public String toString() {
        return "ResumeDto{" +
                "id=" + id +
                ", description='" + description + '\'' +
                ", salary=" + salary +
                ", employee='" + employee + '\'' +
                '}';
    }
}
