package com.project.fpt.sfm.service;

import com.project.fpt.sfm.entities.*;
import com.project.fpt.sfm.processexcel.model.StudentDto;

import java.util.List;

/**
 * Created by Khắc Vỹ on 10/3/2015.
 */
public interface StudentService {
    void addStudentInDevelopmentMode(StudentDto studentDto);

    Student getCurrentStudent();

    /**
     * Get All Semester which studied by student
     *
     * @param student
     * @return
     */
    List<Semester> getListSemester(Student student);

    /**
     * Get Semester by id
     *
     * @param semesterId
     * @return
     */
    Semester findSemesterById(int semesterId);

    /**
     * Get List Courses of student in semester
     *
     * @param student
     * @param semester
     * @return
     */
    List<StudentCourse> getListCourseInSemester(Student student, Semester semester);

    /**
     * Get List Payment Of Student
     *
     * @param student
     * @return
     */
    List<TuitionPayment> getListTuitionPayment(Student student);

    /**
     * Get List Resit course Of Student
     *
     * @param student
     * @return
     */
    List<ResitCoursePayment> getListResitCoursePayment(Student student);

    /**
     * Get List Tuition
     *
     * @return
     */
    List<Tuition> getListTuition();

    /**
     * Get Financial Rate depend financial type of student
     *
     * @param student
     * @return
     */
    int getFinancialRateOfStudent(Student student);

    /**
     * Get List Resit Course of student
     *
     * @param student
     * @return
     */
    List<StudentCourse> getListResitCourse(Student student);

    /**
     * Save student.
     * @param student
     * @return
     */
    Student saveStudent(Student student);
}
