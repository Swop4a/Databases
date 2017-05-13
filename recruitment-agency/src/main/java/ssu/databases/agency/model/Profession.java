package ssu.databases.agency.model;

import javax.persistence.*;

@Entity
@Table
public class Profession {

    @Id
    @Column(name = "id")
    private Long id;

    @Column(name = "name")
    private String name;

    @Column(name = "description")
    private String description;

    @Column(name = "average_salary")
    private Integer averageSalary;

    @ManyToOne
    @JoinColumn(name = "profession_kind_id")
    private ProfessionKind professionKind;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Integer getAverageSalary() {
        return averageSalary;
    }

    public void setAverageSalary(Integer averageSalary) {
        this.averageSalary = averageSalary;
    }

    public ProfessionKind getProfessionKind() {
        return professionKind;
    }

    public void setProfessionKind(ProfessionKind professionKind) {
        this.professionKind = professionKind;
    }
}
