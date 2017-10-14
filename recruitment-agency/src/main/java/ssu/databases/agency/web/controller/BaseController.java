package ssu.databases.agency.web.controller;

import java.util.Collection;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import ssu.databases.agency.model.Resume;
import ssu.databases.agency.model.Vacancy;
import ssu.databases.agency.service.CommonService;
import ssu.databases.agency.web.dto.ResumeDto;
import ssu.databases.agency.web.dto.VacancyDto;
import ssu.databases.agency.web.dto.Wrapper;

import java.util.List;

@Controller
public class BaseController {

	@Autowired
	private CommonService commonService;

	@RequestMapping(value = {"/", "/index"}, method = {RequestMethod.GET, RequestMethod.POST})
	@PreAuthorize("!isAuthenticated()")
	public String index() {
		return "index";
	}

	@RequestMapping(value = "/auth")
	public String redirect(Authentication authentication) {
		if (!authentication.isAuthenticated()) {
			return "redirect:/";
		}

		Collection<? extends GrantedAuthority> authorities = authentication.getAuthorities();

		if (authorities.contains(new SimpleGrantedAuthority("ROLE_COMPANY"))) {
			return "redirect:/resumes";
		} else {
			return "redirect:/vacancies";
		}
	}

	@RequestMapping(value = "/vacanciesJSON", produces = {"application/json"}, method = RequestMethod.GET)
	@ResponseBody
	public Wrapper vacanciesJSON() {
		List<Vacancy> vacancies = commonService.vacancies();
//		List<Vacancy> vacancies = new ArrayList<>();
//		for (int i = 0; i < 20; i++) {
//			Vacancy vacancy = new Vacancy();
//			vacancy.setId((long) i);
//			vacancy.setClose(new Date(30, 30, 10));
//			vacancy.setCompany(new Company());
//			vacancy.setDescription("sdmasdmsadlma;d,sa;slda,");
//			vacancy.setOpen(new Date(30, 30, 30));
//			vacancy.setProfession(new Profession());
//			vacancy.setResumeList(new ArrayList<>());
//			vacancy.setSalary(30000);
//
//			vacancies.add(vacancy);
//		}
		Wrapper wrapper = new Wrapper();

		for (Vacancy vacancy : vacancies) {
			VacancyDto dto = new VacancyDto();

			dto.setId(vacancy.getId());
			dto.setClose(vacancy.getClose().toString());
			dto.setOpen(vacancy.getOpen().toString());
			dto.setCompany(vacancy.getCompany().getName());
			dto.setDescription(vacancy.getDescription());
			dto.setProfession(vacancy.getProfession().getName());
			dto.setSalary(vacancy.getSalary());

			wrapper.add(dto);
		}

		return wrapper;
	}

	@RequestMapping(value = "/resumesJSON", produces = {"application/json"}, method = RequestMethod.GET)
	@ResponseBody
	public Wrapper resumeJSON() {
		List<Resume> resumes = commonService.resumes();
		Wrapper wrapper = new Wrapper();
		for (Resume resume : resumes) {
			ResumeDto dto = new ResumeDto();
			dto.setId(resume.getId());
			dto.setDescription(resume.getDescription());
			dto.setSalary(resume.getDesireSalary());
			dto.setEmployee(resume.getEmployee().getName());

			wrapper.add(dto);
		}

		return wrapper;
	}
}
