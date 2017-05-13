package ssu.databases.agency.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import ssu.databases.agency.model.Vacancy;
import ssu.databases.agency.repository.VacancyRepository;

import java.util.List;

@Service
public class CommonService {

    @Autowired
    private VacancyRepository vacancyRepository;

    public List<Vacancy> vacancies() {
        return vacancyRepository.findAll();
    }
}
