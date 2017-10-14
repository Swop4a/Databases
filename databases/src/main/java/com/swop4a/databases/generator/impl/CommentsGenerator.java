package com.swop4a.databases.generator.impl;

import com.swop4a.databases.generator.Generator;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.PrintWriter;
import java.util.Random;

/**
 * Created by Swop4a on 16.04.2017.
 */
public class CommentsGenerator implements Generator {
    private PrintWriter writer = new PrintWriter(new File("src/main/resources/files/comments.txt"));

    public CommentsGenerator() throws FileNotFoundException {
    }

    public void generate() {
        Random random = new Random();

        for (int i = 0; i < 25000; i++) {
            StringBuilder comment = new StringBuilder();

            for (int j = 0; j < random.nextInt(40); j++) {
                comment.append((char) (random.nextInt(('z' - 'a') + 1) + 'a'));
            }

            writer.println(i
                    + ", " + comment.toString()
                    + ", " + random.nextInt(10)
                    + ", " + random.nextInt(1200)
                    + ", " + random.nextInt(1500));
        }

        writer.close();
    }
}
