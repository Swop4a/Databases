package ssu.databases.agency.web.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.annotation.Secured;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import ssu.databases.agency.model.Vacancy;
import ssu.databases.agency.service.CommonService;
import ssu.databases.agency.web.dto.VacancyDto;
import ssu.databases.agency.web.dto.adapter.VacancyAdapter;

@Controller
@RequestMapping(value = "/vacancies")
public class VacanciesController {

	@Autowired
	private VacancyAdapter vacancyAdapter;

	@Autowired
	private CommonService commonService;

	@RequestMapping
	@Secured("ROLE_CUSTOMER")
	public String vacancies() {
		return "vacancies";
	}

	@RequestMapping(value = "/addVacancy", method = RequestMethod.GET)
	@Secured("ROLE_COMPANY")
	public String addVacancy() {
		return "addVacancy";
	}

	@RequestMapping(value = "/confirm", method = RequestMethod.POST)
	@Secured("ROLE_COMPANY")
	public String confirm(@ModelAttribute VacancyDto vacancyDto) {
		Vacancy vacancy = vacancyAdapter.convert(vacancyDto);
		commonService.saveVacancy(vacancy);
		return "redirect:/resumes";
	}
}
