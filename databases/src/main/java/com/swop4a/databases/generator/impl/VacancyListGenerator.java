package com.swop4a.databases.generator.impl;

import com.swop4a.databases.generator.Generator;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.PrintWriter;
import java.util.Random;

/**
 * Created by Swop4a on 16.04.2017.
 */
public class VacancyListGenerator implements Generator{
    private PrintWriter writer = new PrintWriter(new File("src/main/resources/files/vacancy_list.txt"));

    public VacancyListGenerator() throws FileNotFoundException {
    }

    public void generate() {
        Random random = new Random();

        for (int i = 0; i < 15000; i++) {
            writer.println(random.nextInt(15000)
                    + ", " + random.nextInt(20000));
        }

        writer.close();
    }
}
