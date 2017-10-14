package ssu.databases.agency.web.dto;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by Swop4a on 14.05.2017.
 */
public class Wrapper {
    private List data;

    public List getData() {
        return data;
    }

    public void setData(List data) {
        this.data = data;
    }

    public void add(Object item) {
        if (data == null) {
            data = new ArrayList();
        }
        data.add(item);
    }
}
