package com.swop4a.databases.generator.impl;

import com.swop4a.databases.generator.Generator;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.PrintWriter;
import java.util.Random;

/**
 * Created by Swop4a on 16.04.2017.
 */
public class ResumeGenerator implements Generator {
    private PrintWriter writer = new PrintWriter(new File("src/main/resources/files/resume.txt"));

    public ResumeGenerator() throws FileNotFoundException {
    }

    public void generate() {
        Random random = new Random();

        for (int i = 0; i < 20000; i++) {
            StringBuilder description = new StringBuilder();

            for (int j = 0; j < random.nextInt(150) + 1; j++) {
                description.append((char) (random.nextInt(('z' - 'a') + 1) + 'a'));
            }

            writer.println(i
                    + ", " + description.toString()
                    + ", " + (random.nextInt(10000) + 10000)
                    + ", " + (random.nextInt(20000)));
        }

        writer.close();
    }
}
