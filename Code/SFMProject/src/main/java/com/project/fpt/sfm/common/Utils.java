package com.project.fpt.sfm.common;

import java.util.Random;

/**
 * Created by Khắc Vỹ on 10/4/2015.
 */
public class Utils {

    /**
     * Generate the String has 8 characters
     *
     * @return
     */
    public static String generatePassword() {
        char[] chars = "abcdefghijklmnopqrstuvwxyz".toCharArray();
        StringBuilder sb = new StringBuilder();
        Random random = new Random();
        for (int i = 0; i < 8; i++) {
            char c = chars[random.nextInt(chars.length)];
            sb.append(c);
        }
        String output = sb.toString();

        return output;
    }

    /**
     * @param financeType
     * @return
     */
    public static String[] checkStudentFinanceType(String financeType) {
        /**
         * Remove all white space, '%' character and Uppercase String
         */
        financeType.toUpperCase();
        financeType = financeType.replaceAll("\\s", "");
        financeType = financeType.replace("%", "");

        String[] result = new String[2];

        if (financeType.contains(Constant.FINANCE_TYPE_SCHOLARSHIP)) {
            financeType = financeType.replace(Constant.FINANCE_TYPE_SCHOLARSHIP, "").trim();
            result[0] = Constant.FINANCE_TYPE_SCHOLARSHIP;
            result[1] = financeType;
        } else if (financeType.contains(Constant.FINANCE_TYPE_LOANS_CREDIT)) {
            financeType = financeType.replace(Constant.FINANCE_TYPE_LOANS_CREDIT, "").trim();
            result[0] = Constant.FINANCE_TYPE_LOANS_CREDIT;
            result[1] = financeType;
        }else if(financeType.contains(Constant.FINANCE_TYPE_INVESTING)){
            financeType = financeType.replace(Constant.FINANCE_TYPE_INVESTING, "").trim();
            result[0] = Constant.FINANCE_TYPE_INVESTING;
            result[1] = financeType;
        }else{
            result[0] = Constant.FINANCE_TYPE_NVD;
            result[1] = "100";
        }
        return result;
    }

    public static void main(String[] args) {
        int a = 70;
        float x = (float)a/100;
        System.out.println(x);
    }

}
