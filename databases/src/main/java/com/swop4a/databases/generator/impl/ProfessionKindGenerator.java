package com.swop4a.databases.generator.impl;

import com.swop4a.databases.generator.Generator;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.PrintWriter;
import java.util.Random;

/**
 * Created by Swop4a on 16.04.2017.
 */
public class ProfessionKindGenerator implements Generator {
    private PrintWriter writer = new PrintWriter(new File("src/main/resources/files/profession_kind.txt"));

    public ProfessionKindGenerator() throws FileNotFoundException {
    }

    public void generate() {
        Random random = new Random();

        for (int i = 0; i < 5000; i++) {
            StringBuilder sb = new StringBuilder();
            for (int j = 0; j < random.nextInt(20) + 1; j++) {
                sb.append((char) (random.nextInt(('z' - 'a') + 1) + 'a'));
            }

            writer.println(i + ", " + sb.toString());
        }

        writer.close();
    }
}
