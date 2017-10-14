package ssu.databases.agency.web.dto.adapter;

import java.sql.Date;
import java.util.ArrayList;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import ssu.databases.agency.model.Company;
import ssu.databases.agency.model.Vacancy;
import ssu.databases.agency.service.CommonService;
import ssu.databases.agency.web.dto.VacancyDto;

@Component
public class VacancyAdapter {

	@Autowired
	private CommonService commonService;

	public Vacancy convert(VacancyDto dto) {
		Vacancy vacancy = new Vacancy();
		vacancy.setId(dto.getId());
		vacancy.setSalary(dto.getSalary());
		vacancy.setResumeList(new ArrayList<>());
		vacancy.setProfession(commonService.findProfessionByName(dto.getProfession()));
		vacancy.setOpen(new Date(12, 11, 12));
		vacancy.setCompany(new Company());
		vacancy.setClose(new Date(12, 2, 3));

		return vacancy;
	}
}
