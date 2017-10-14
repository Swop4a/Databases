package ssu.databases.agency.web.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.annotation.Secured;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import ssu.databases.agency.model.Resume;
import ssu.databases.agency.service.CommonService;
import ssu.databases.agency.web.dto.ResumeDto;
import ssu.databases.agency.web.dto.adapter.ResumeAdapter;

@Controller
@RequestMapping(value = "/resumes")
public class ResumeController {

	@Autowired
	private CommonService commonService;

	@Autowired
	private ResumeAdapter resumeAdapter;

	@RequestMapping
	@Secured("ROLE_COMPANY")
	public String resumes() {
		return "resumes";
	}

	@RequestMapping(value = "/addResume", method = RequestMethod.GET)
	@Secured("ROLE_CUSTOMER")
	public String addResume(Authentication authentication) {
		authentication.getAuthorities().forEach(System.out::println);
		return "addResume";
	}

	@RequestMapping(value = "/confirm", method = RequestMethod.POST)
	@Secured("ROLE_CUSTOMER")
	public String confirm(@ModelAttribute ResumeDto resumeDto) {
		Resume resume = resumeAdapter.convert(resumeDto);
		commonService.saveResume(resume);
		return "redirect:/vacancies";
	}
}
