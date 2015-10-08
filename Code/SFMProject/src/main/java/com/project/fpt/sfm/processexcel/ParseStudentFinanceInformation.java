package com.project.fpt.sfm.processexcel;

import com.project.fpt.sfm.common.Constant;
import com.project.fpt.sfm.processexcel.model.SessionTuitionDto;
import com.project.fpt.sfm.processexcel.model.StudentDto;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.springframework.web.multipart.MultipartFile;

import java.io.ByteArrayInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.*;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 * Created by Khắc Vỹ on 10/5/2015.
 */
public class ParseStudentFinanceInformation {

    public List<SessionTuitionDto> parseCurrentFile(MultipartFile file) {
        List<SessionTuitionDto> listSessionTuition = new ArrayList<>();
        ByteArrayInputStream inputStream = null;
        try {
            inputStream = new ByteArrayInputStream(file.getBytes());
            Workbook workbook = new HSSFWorkbook(inputStream);
            //get first sheet
            Sheet sheet = workbook.getSheetAt(0);
            //every sheet has rows, iterate over them
            Iterator<Row> rowIterator = sheet.iterator();
            while (rowIterator.hasNext()) {
                Row row = rowIterator.next();
                if (row.getRowNum() >= 2) {
                    int no = 0;
                    String transferDate = "";
                    String bank = "";
                    String studentCode = "";
                    String studentName = "";
                    String content = "";
                    String tuitionAmount = "";
                    Map<String, String> subtractAmount = new HashMap<>();
                    String tuitionAmountRequired = "";
                    String sentAmount = "";
                    String cashBalance = "";
                    String cashShortage = "";
                    String collectedAmount = "";
                    //every row has cells, iterate over them
                    Iterator<Cell> cellIterator = row.cellIterator();
                    while (cellIterator.hasNext()) {
                        //Get the Cell object
                        Cell cell = cellIterator.next();

                        switch (cell.getColumnIndex()) {
                            case 0:
                                no = (int) cell.getNumericCellValue();
                                break;
                            case 3:
                                transferDate = cell.getStringCellValue().trim();
                                break;
                            case 4:
                                bank = cell.getStringCellValue().trim();
                                break;
                            case 5:
                                if (cell.getCellType() == Cell.CELL_TYPE_STRING) {
                                    studentCode = cell.getStringCellValue().trim();
                                }
                                if (cell.getCellType() == Cell.CELL_TYPE_NUMERIC) {
                                    studentCode = String.valueOf((int) cell.getNumericCellValue());
                                }
                                break;
                            case 6:
                                studentName = cell.getStringCellValue().trim();
                                break;
                            case 11:
                                content = cell.getStringCellValue().trim();
                                break;
                            case 12:
                                if (cell.getCellType() == Cell.CELL_TYPE_STRING) {
                                    tuitionAmount = cell.getStringCellValue().trim();
                                }
                                if (cell.getCellType() == Cell.CELL_TYPE_NUMERIC) {
                                    tuitionAmount = String.valueOf((int) cell.getNumericCellValue());
                                }
                                break;
                            case 13:
                                if (cell.getCellType() == Cell.CELL_TYPE_STRING) {
                                    subtractAmount.put("laptop", cell.getStringCellValue().trim());
                                }
                                if (cell.getCellType() == Cell.CELL_TYPE_NUMERIC) {
                                    subtractAmount.put("laptop", String.valueOf((int) cell.getNumericCellValue()));
                                }
                                break;
                            case 14:
                                if (cell.getCellType() == Cell.CELL_TYPE_STRING) {
                                    subtractAmount.put("ontoan", cell.getStringCellValue().trim());
                                }
                                if (cell.getCellType() == Cell.CELL_TYPE_NUMERIC) {
                                    subtractAmount.put("ontoan", String.valueOf((int) cell.getNumericCellValue()));
                                }
                                break;
                            case 15:
                                if (cell.getCellType() == Cell.CELL_TYPE_STRING) {
                                    subtractAmount.put(Constant.FINANCE_TYPE_SCHOLARSHIP, cell.getStringCellValue().trim());
                                }
                                if (cell.getCellType() == Cell.CELL_TYPE_NUMERIC) {
                                    subtractAmount.put(Constant.FINANCE_TYPE_SCHOLARSHIP, String.valueOf((int) cell.getNumericCellValue()));
                                }
                                break;
                            case 16:
                                if (cell.getCellType() == Cell.CELL_TYPE_STRING) {
                                    subtractAmount.put(Constant.FINANCE_TYPE_LOANS_CREDIT, cell.getStringCellValue().trim());
                                }
                                if (cell.getCellType() == Cell.CELL_TYPE_NUMERIC) {
                                    subtractAmount.put(Constant.FINANCE_TYPE_LOANS_CREDIT, String.valueOf((int) cell.getNumericCellValue()));
                                }
                                break;
                            case 17:
                                if (cell.getCellType() == Cell.CELL_TYPE_STRING) {
                                    subtractAmount.put(Constant.FINANCE_TYPE_INVESTING, cell.getStringCellValue().trim());
                                }
                                if (cell.getCellType() == Cell.CELL_TYPE_NUMERIC) {
                                    subtractAmount.put(Constant.FINANCE_TYPE_INVESTING, String.valueOf((int) cell.getNumericCellValue()));
                                }
                                break;
                            case 18:
                                if (cell.getCellType() == Cell.CELL_TYPE_STRING) {
                                    subtractAmount.put("khac", cell.getStringCellValue().trim());
                                }
                                if (cell.getCellType() == Cell.CELL_TYPE_NUMERIC) {
                                    subtractAmount.put("khac", String.valueOf((int) cell.getNumericCellValue()));
                                }
                                break;
                            case 19:
                                if (cell.getCellType() == Cell.CELL_TYPE_STRING) {
                                    tuitionAmountRequired = cell.getStringCellValue().trim();
                                }
                                if (cell.getCellType() == Cell.CELL_TYPE_NUMERIC) {
                                    tuitionAmountRequired = String.valueOf((int) cell.getNumericCellValue());
                                }
                                break;
                            case 20:
                                if (cell.getCellType() == Cell.CELL_TYPE_STRING) {
                                    sentAmount = cell.getStringCellValue().trim();
                                }
                                if (cell.getCellType() == Cell.CELL_TYPE_NUMERIC) {
                                    sentAmount = String.valueOf((int) cell.getNumericCellValue());
                                }
                                break;
                            case 24:
                                if (cell.getCellType() == Cell.CELL_TYPE_STRING) {
                                    cashBalance = cell.getStringCellValue().trim();
                                }
                                if (cell.getCellType() == Cell.CELL_TYPE_NUMERIC) {
                                    cashBalance = String.valueOf((int) cell.getNumericCellValue());
                                }
                                break;
                            case 25:
                                if (cell.getCellType() == Cell.CELL_TYPE_STRING) {
                                    cashShortage = cell.getStringCellValue().trim();
                                }
                                if (cell.getCellType() == Cell.CELL_TYPE_NUMERIC) {
                                    cashShortage = String.valueOf((int) cell.getNumericCellValue());
                                }
                                break;
                            case 26:
                                if (cell.getCellType() == Cell.CELL_TYPE_STRING) {
                                    collectedAmount = cell.getStringCellValue().trim();
                                }
                                if (cell.getCellType() == Cell.CELL_TYPE_NUMERIC) {
                                    collectedAmount = String.valueOf((int) cell.getNumericCellValue());
                                }
                                break;
                        }
                    }

                    SessionTuitionDto sessionTuitionDto = new SessionTuitionDto(no, transferDate,bank,studentCode, studentName, content, tuitionAmount, subtractAmount, tuitionAmountRequired, sentAmount, cashBalance, cashShortage, collectedAmount);
                    listSessionTuition.add(sessionTuitionDto);

                }
            }

        } catch (FileNotFoundException ex) {
            Logger.getLogger(ParseStudentInformation.class.getName()).log(Level.SEVERE, null, ex);
        } catch (IOException ex) {
            Logger.getLogger(ParseStudentInformation.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                inputStream.close();
            } catch (IOException ex) {
                Logger.getLogger(ParseStudentInformation.class.getName()).log(Level.SEVERE, null, ex);
            }
        }

        return listSessionTuition;
    }
}
