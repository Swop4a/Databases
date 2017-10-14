package com.swop4a.databases.generator.impl;

import com.swop4a.databases.generator.Generator;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.PrintWriter;
import java.util.Random;

/**
 * Created by Swop4a on 16.04.2017.
 */
public class CompanyGenerator implements Generator{
    private PrintWriter writer = new PrintWriter(new File("src/main/resources/files/company.txt"));

    public CompanyGenerator() throws FileNotFoundException {
    }

    public void generate() {
        Random random = new Random();

        for (int i = 0; i < 1200; i++) {
            StringBuilder sb = new StringBuilder();
            for (int j = 0; j < random.nextInt(20) + 1; j++) {
                sb.append((char) (random.nextInt(('Z' - 'A') + 1) + 'A'));
            }

            writer.println(i + ", " + sb.toString());
        }

        writer.close();
    }
}
