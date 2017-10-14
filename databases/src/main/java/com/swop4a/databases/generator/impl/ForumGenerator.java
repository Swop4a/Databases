package com.swop4a.databases.generator.impl;

import com.swop4a.databases.generator.Generator;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.PrintWriter;
import java.util.Random;

/**
 * Created by Swop4a on 16.04.2017.
 */
public class ForumGenerator implements Generator{
    private PrintWriter writer = new PrintWriter(new File("src/main/resources/files/forum.txt"));

    public ForumGenerator() throws FileNotFoundException {
    }

    public void generate() {
        Random random = new Random();

        for (int i = 0; i < 1500; i++) {
            StringBuilder name = new StringBuilder();

            for (int j = 0; j < random.nextInt(15) + 1; j++) {
                name.append((char) (random.nextInt(('z' - 'a') + 1) + 'a'));
            }

            writer.println(i
                    + ", " + name
                    + ", " + random.nextInt(5));
        }

        writer.close();
    }
}
