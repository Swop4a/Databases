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
public class LastJobGenerator implements Generator {
    private PrintWriter writer = new PrintWriter(new File("src/main/resources/files/last_job.txt"));

    public LastJobGenerator() throws FileNotFoundException {
    }

    public void generate() {
        Random random = new Random();

        for (int i = 0; i < 10000; i++) {
            writer.println(i
                    + ", " + new Date(random.nextInt(2010), random.nextInt(12), random.nextInt(30))
                    + ", " + new Date(random.nextInt(2010), random.nextInt(12), random.nextInt(30))
                    + ", " + random.nextInt(7000));
        }

        writer.close();
    }
}
