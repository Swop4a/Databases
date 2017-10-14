package ssu.databases.agency.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import ssu.databases.agency.model.Employee;
import ssu.databases.agency.model.Profession;
import ssu.databases.agency.model.Resume;
import ssu.databases.agency.model.Vacancy;
import ssu.databases.agency.repository.*;

import java.util.List;

@Service
public class CommonService {

	@Autowired
	private CommentRepository commentRepository;

	@Autowired
	private CompanyRepository companyRepository;

	@Autowired
	private EmployeeRepository employeeRepository;

	@Autowired
	private EmployerRepository employerRepository;

	@Autowired
	private ForumRepository forumRepository;

	@Autowired
	private GraduationRepository graduationRepository;

	@Autowired
	private LastJobRepository lastJobRepository;

	@Autowired
	private ProfessionRepository professionRepository;

	@Autowired
	private ProfessionKindRepository professionKindRepository;

	@Autowired
	private ResumeRepository resumeRepository;

	@Autowired
	private VacancyRepository vacancyRepository;

	public List<Vacancy> vacancies() {
		return vacancyRepository.findAll();
	}

	public Employee findEmployeeByName(String name) {
		return employeeRepository.findFirstByName(name);
	}

	public void saveResume(Resume resume) {
		resumeRepository.save(resume);
	}

	public List<Resume> resumes() {
		return resumeRepository.findAll();
	}

	public Profession findProfessionByName(String name) {
		return professionRepository.findFirstByName(name);
	}

	public void saveVacancy(Vacancy vacancy) {
		vacancyRepository.save(vacancy);
	}
}
