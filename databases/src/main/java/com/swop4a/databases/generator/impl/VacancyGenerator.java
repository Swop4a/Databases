package com.swop4a.databases.generator.impl;

import com.swop4a.databases.generator.Generator;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.PrintWriter;
import java.sql.Date;
import java.util.Random;

/**
 * Created by Swop4a on 16.04.2017.
 */
public class VacancyGenerator implements Generator{
    private PrintWriter writer = new PrintWriter(new File("src/main/resources/files/vacancy.txt"));

    public VacancyGenerator() throws FileNotFoundException {
    }

    public void generate() {
        Random random = new Random();

        for (int i = 0; i < 15000; i++) {
            StringBuilder description = new StringBuilder();

            for (int j = 0; j < random.nextInt(150) + 1; j++) {
                description.append((char) (random.nextInt(('z' - 'a') + 1) + 'a'));
            }
            writer.println(i                                                            //ID
                    + ", " + new Date(2013, 7, 22)                    //Open
                    + ", " + description                                                //Desc
                    + ", " + new Date(1999, 4, 3)                    //Close
                    + ", " + random.nextInt(10000) + 6000                       //Salary
                    + ", " + random.nextInt(7000)
                    + ", " + random.nextInt(1200));
        }

        writer.close();
    }
}
