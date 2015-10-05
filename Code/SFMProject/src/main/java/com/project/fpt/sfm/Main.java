package com.project.fpt.sfm;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by Khắc Vỹ on 10/5/2015.
 */
public class Main {
    public static void main(String[] args) {
        List<String> list = new ArrayList<>();

        list.add(3, "xxx");
        list.add(1, "zzz");
        list.add(0, "yyy");
        list.add(2, "uuu");

        for(String s : list){
            System.out.println(s);
        }
    }
}
