package ssu.databases.agency.web.dto.adapter;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import ssu.databases.agency.model.Resume;
import ssu.databases.agency.service.CommonService;
import ssu.databases.agency.web.dto.ResumeDto;

import java.util.ArrayList;

@Component
public class ResumeAdapter {

	@Autowired
	private CommonService commonService;

	public Resume convert(ResumeDto dto) {
		Resume resume = new Resume();
		resume.setId(dto.getId());
		resume.setDescription(dto.getDescription());
		resume.setDesireSalary(dto.getSalary());
		resume.setEmployee(commonService.findEmployeeByName(dto.getEmployee()));
		resume.setVacancyList(new ArrayList<>());

		return resume;
	}
}
