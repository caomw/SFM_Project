package com.project.fpt.sfm.processexcel;

import com.project.fpt.sfm.entities.Subject;
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
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 * Created by Khắc Vỹ on 10/5/2015.
 */
public class ParseSubject {

    public List<Subject> parseCurrentFile(MultipartFile file) {
        List<Subject> listSubject = new ArrayList<>();

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
                     String subjectNameE = "";
                     String subjectNameV = "";
                     String subjectCode = "";
                     String abbreviation = "";
                    //every row has cells, iterate over them
                    Iterator<Cell> cellIterator = row.cellIterator();
                    while (cellIterator.hasNext()) {
                        //Get the Cell object
                        Cell cell = cellIterator.next();

                        switch (cell.getColumnIndex()) {
                            case 1:
                                if (cell.getCellType() == Cell.CELL_TYPE_STRING) {
                                    subjectNameE = cell.getStringCellValue().trim();
                                }
                                if (cell.getCellType() == Cell.CELL_TYPE_NUMERIC) {
                                    subjectNameE = String.valueOf((int) cell.getNumericCellValue());
                                }
                                break;
                            case 2:
                                if (cell.getCellType() == Cell.CELL_TYPE_STRING) {
                                    subjectNameV = cell.getStringCellValue().trim();
                                }
                                if (cell.getCellType() == Cell.CELL_TYPE_NUMERIC) {
                                    subjectNameV = String.valueOf((int) cell.getNumericCellValue());
                                }
                                break;
                            case 3:
                                if (cell.getCellType() == Cell.CELL_TYPE_STRING) {
                                    abbreviation = cell.getStringCellValue().trim();
                                }
                                if (cell.getCellType() == Cell.CELL_TYPE_NUMERIC) {
                                    abbreviation = String.valueOf((int) cell.getNumericCellValue());
                                }
                                break;
                            case 4:
                                if (cell.getCellType() == Cell.CELL_TYPE_STRING) {
                                    subjectCode = cell.getStringCellValue().trim();
                                }
                                if (cell.getCellType() == Cell.CELL_TYPE_NUMERIC) {
                                    subjectCode = String.valueOf((int) cell.getNumericCellValue());
                                }
                                if(subjectCode.length() > 15){
                                    subjectCode = subjectCode.substring(0, subjectCode.lastIndexOf("or")).trim();
                                }
                                break;
                        }
                    }

                    Subject subject = new Subject();
                  //  subject.setSubjectCategory();
                    subject.setSubjectNameE(subjectNameE);
                    subject.setSubjectNameV(subjectNameV);
                    subject.setSubjectCode(subjectCode);
                    subject.setAbbreviation(abbreviation);
                    subject.setIsActive(true);

                    listSubject.add(subject);
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

        return listSubject;
    }
}
