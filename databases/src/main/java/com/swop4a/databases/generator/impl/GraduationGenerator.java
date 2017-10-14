package com.swop4a.databases.generator.impl;

import com.swop4a.databases.generator.Generator;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.PrintWriter;
import java.util.Arrays;
import java.util.Random;

/**
 * Created by Swop4a on 16.04.2017.
 */
public class GraduationGenerator implements Generator {
    private PrintWriter writer = new PrintWriter(new File("src/main/resources/files/graduation.txt"));

    public GraduationGenerator() throws FileNotFoundException {
    }

    public void generate() {
        Random random = new Random();

        for (int i = 0; i < 1000; i++) {
            StringBuilder sb = new StringBuilder();
            for (int j = 0; j < random.nextInt(20) + 1; j++) {
                sb.append((char) (random.nextInt(('z' - 'a') + 1) + 'a'));
            }

            writer.println(i + ", " + sb.toString());
        }

        writer.close();
    }
}
