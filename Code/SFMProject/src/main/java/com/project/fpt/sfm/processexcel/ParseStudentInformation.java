package com.project.fpt.sfm.processexcel;

import com.project.fpt.sfm.common.Constant;
import com.project.fpt.sfm.entities.Student;
import com.project.fpt.sfm.processexcel.model.StudentDto;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ClassPathResource;
import org.springframework.core.io.ResourceLoader;
import org.springframework.web.multipart.MultipartFile;

import java.io.*;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 * Created by Khắc Vỹ on 10/3/2015.
 */
public class ParseStudentInformation {
    /**
     * Parse Current File for get information
     *
     * @param file
     * @return
     */
    public List<StudentDto> parseCurrentFile(MultipartFile file) {
        List<StudentDto> listStudent = new ArrayList<>();

        ByteArrayInputStream inputStream = null;
        try {
            inputStream = new ByteArrayInputStream(file.getBytes());

            //String fileName = file.getOriginalFilename();
            Workbook workbook = new HSSFWorkbook(inputStream);
            //get first sheet
            Sheet sheet = workbook.getSheetAt(0);
            //every sheet has rows, iterate over them
            Iterator<Row> rowIterator = sheet.iterator();
            while (rowIterator.hasNext()) {
                Row row = rowIterator.next();
                if (row.getRowNum() >= 3) {
                     String no = "";
                     String studentCode = "";
                     String studentName = "";
                     String major = "";
                     String term = "";
                     String startMajorSemester = "";
                     String clazz = "";
                     String session = "";
                     String studentType = "";
                     String financeType = "";
                     String studentStatus = "";
                     String note = "";
                     String specialize = "";

                    //every row has cells, iterate over them
                    Iterator<Cell> cellIterator = row.cellIterator();
                    while (cellIterator.hasNext()) {
                        //Get the Cell object
                        Cell cell = cellIterator.next();

                        switch (cell.getColumnIndex()) {
                            case 0:
                                no = String.valueOf((int) cell.getNumericCellValue());
                                break;
                            case 1:
                                if (cell.getCellType() == Cell.CELL_TYPE_STRING) {
                                    studentCode = cell.getStringCellValue().trim();
                                }
                                if (cell.getCellType() == Cell.CELL_TYPE_NUMERIC) {
                                    studentCode = String.valueOf((int) cell.getNumericCellValue());
                                }
                                break;
                            case 2:
                                studentName = cell.getStringCellValue().trim();
                                break;
                            case 3:
                                major = cell.getStringCellValue().trim();
                                break;
                            case 4:
                                if (cell.getCellType() == Cell.CELL_TYPE_STRING) {
                                    term = cell.getStringCellValue().trim();
                                }
                                if (cell.getCellType() == Cell.CELL_TYPE_NUMERIC) {
                                    term = String.valueOf((int) cell.getNumericCellValue());
                                }
                                break;
                            case 5:
                                startMajorSemester = cell.getStringCellValue().trim();
                                break;
                            case 6:
                                clazz = cell.getStringCellValue().trim();
                                break;
                            case 7:
                                if (cell.getCellType() == Cell.CELL_TYPE_STRING) {
                                    session = cell.getStringCellValue().trim();
                                }
                                if (cell.getCellType() == Cell.CELL_TYPE_NUMERIC) {
                                    session = String.valueOf((int) cell.getNumericCellValue());
                                }
                                break;
                            case 8:
                                studentType = cell.getStringCellValue().trim();
                                break;
                            case 9:
                                financeType = cell.getStringCellValue().trim();
                                break;
                            case 10:
                                studentStatus = cell.getStringCellValue().trim();
                                break;
                            case 11:
                                note = cell.getStringCellValue().trim();
                                break;
                            case 13:
                                specialize = cell.getStringCellValue().trim();
                                break;
                        }
                    }

                    StudentDto studentDto = new StudentDto(no, studentCode, studentName, major, term, startMajorSemester, clazz, session, studentType, financeType, studentStatus, note, specialize);
                    listStudent.add(studentDto);
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

        return listStudent;
    }
}
