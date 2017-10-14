package com.swop4a.databases;

import com.swop4a.databases.generator.impl.*;
import com.swop4a.databases.util.EntityList;

import java.io.FileNotFoundException;

/**
 * Created by Swop4a on 16.04.2017.
 */
public class Main {
    public static void main(String[] args) throws FileNotFoundException {
        EntityList list = new EntityList();
        list
                .add(new CommentsGenerator())
                .add(new CompanyGenerator())
                .add(new EmployeeGenerator())
                .add(new EmployerGenerator())
                .add(new ForumGenerator())
                .add(new GraduationGenerator())
                .add(new LastJobGenerator())
                .add(new ProfessionGenerator())
                .add(new ProfessionKindGenerator())
                .add(new ResumeGenerator())
                .add(new VacancyGenerator())
                .add(new VacancyListGenerator());
        list.run();
    }
}
