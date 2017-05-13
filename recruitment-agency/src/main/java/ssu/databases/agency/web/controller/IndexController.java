package ssu.databases.agency.web.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import ssu.databases.agency.model.Vacancy;
import ssu.databases.agency.service.CommonService;

import java.util.ArrayList;
import java.util.List;

@Controller
public class IndexController {

    @Autowired
    private CommonService commonService;

    @RequestMapping(value = "/", method = {RequestMethod.GET, RequestMethod.POST})
    public String index() {
        return "index";
    }

    @RequestMapping(name = "/vacancies", method = RequestMethod.GET)
    @ResponseBody
    public List<Vacancy> vacancies() {
        List<Vacancy> vacancies = commonService.vacancies();
        List<Vacancy> response = new ArrayList<>();

        for (int i = 0; i < 10; i++) {
            response.add(vacancies.get(i));
        }

        return response;
    }
}
