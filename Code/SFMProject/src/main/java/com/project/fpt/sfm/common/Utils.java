package com.project.fpt.sfm.common;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
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


    public static Date getDate(String strDate){
        SimpleDateFormat sdf = new SimpleDateFormat("dd-M-yyyy");
        try {
            Date date = sdf.parse(strDate);
            return date;
        } catch (ParseException e) {
            e.printStackTrace();
        }
        return null;
    }

    public static int calculateTuition(int tuition, int rate){
        int result = 0;
        if(rate == 0){
            result = tuition;
        }else if(rate == 100){
            result = 0;
        }else{
            result = (tuition*rate)/100;
        }

        return result;
    }

    public static int calculateResitTuition(int numOfCredit, String financialType, int rate){
        int result;
        int factor = 50;
        int tuition = Constant.COURSE_CREDIT_FEE_USD*numOfCredit;
        if(financialType.equals(Constant.FINANCE_TYPE_NORMAL) || financialType.equals(Constant.FINANCE_TYPE_LOANS_CREDIT)){
            result = (tuition*factor)/100;
        }else{
            factor = factor + rate;
            result = (tuition*factor)/100;
        }

        return result;
    }

    public static void main(String[] args) {
        System.out.println(calculateTuition(20000000, 70));
    }

}
