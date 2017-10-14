package com.swop4a.databases.generator.impl;

import com.swop4a.databases.generator.Generator;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.PrintWriter;
import java.util.Random;

/**
 * Created by Swop4a on 16.04.2017.
 */
public class EmployeeGenerator implements Generator {
    private PrintWriter writer = new PrintWriter(new File("src/main/resources/files/employee.txt"));

    public EmployeeGenerator() throws FileNotFoundException {
    }

    public void generate() {
        Random random = new Random();

        for (int i = 0; i < 20000; i++) {
            StringBuilder name = new StringBuilder();
            StringBuilder number = new StringBuilder();

            for (int j = 0; j < random.nextInt(15) + 1; j++) {
                name.append((char) (random.nextInt(('z' - 'a') + 1) + 'a'));
            }

            for (int j = 0; j < 14; j++) {
                number.append(random.nextInt(10));
            }

            writer.println(i
                    + ", " + random.nextInt(60) + 1
                    + ", " + name.toString()
                    + ", " + number.toString()
                    + ", " + random.nextInt(7000)
                    + ", " + random.nextInt(1000));
        }

        writer.close();
    }
}
