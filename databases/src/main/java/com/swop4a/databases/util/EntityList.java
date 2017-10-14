package com.swop4a.databases.util;

import com.swop4a.databases.generator.Generator;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by Swop4a on 16.04.2017.
 */
public class EntityList{
    private List<Generator> entity = new ArrayList<>();

    public EntityList add(Generator generator) {
        entity.add(generator);
        return this;
    }

    public void run() {
        entity.forEach(Generator::generate);
    }
}
