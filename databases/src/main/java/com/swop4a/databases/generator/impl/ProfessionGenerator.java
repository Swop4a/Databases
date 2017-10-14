package com.swop4a.databases.generator.impl;

import com.swop4a.databases.generator.Generator;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.PrintWriter;
import java.util.Random;

/**
 * Created by Swop4a on 16.04.2017.
 */
public class ProfessionGenerator implements Generator {
    private PrintWriter writer = new PrintWriter(new File("src/main/resources/files/profession.txt"));

    public ProfessionGenerator() throws FileNotFoundException {
    }

    public void generate() {
        Random random = new Random();

        for (int i = 0; i < 7000; i++) {
            StringBuilder name = new StringBuilder();
            StringBuilder professionDescription = new StringBuilder();

            for (int j = 0; j < random.nextInt(30) + 1; j++) {
                name.append((char) (random.nextInt(('z' - 'a') + 1) + 'a'));
            }

            for (int j = 0; j < random.nextInt(140) + 1; j++) {
                professionDescription.append((char) (random.nextInt(('z' - 'a') + 1) + 'a'));
            }

            writer.println(i
                    + ", " + (random.nextInt(5000) + 7000)
                    + "," + professionDescription.toString()
                    + ", " + name.toString()
                    + ", " + random.nextInt(5000));
        }

        writer.close();
    }
}
