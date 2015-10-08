package com.project.fpt.sfm.common;

import org.springframework.stereotype.Component;

import java.text.NumberFormat;
import java.util.Locale;

/**
 * Created by Khắc Vỹ on 10/6/2015.
 */
public class NumberUtils {
    public static String formatCurrency(int num){
        NumberFormat usa = NumberFormat.getNumberInstance(Locale.US);
        return usa.format(num);
    }
}
