package com.project.fpt.sfm.repository;

import com.project.fpt.sfm.entities.Course;
import com.project.fpt.sfm.entities.Semester;
import com.project.fpt.sfm.entities.Student;
import com.project.fpt.sfm.entities.StudentCourse;
import org.springframework.data.domain.Sort;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by Khắc Vỹ on 10/7/2015.
 */
@Repository
public interface StudentCourseRepository extends JpaRepository<StudentCourse, Integer>{
    List<StudentCourse> findByStudentAndSemester(Student student, Semester semester);

    List<StudentCourse> findByStudent(Student student);

    List<StudentCourse> findByStudentAndIsPass(Student student, boolean isPass, Sort sort);

    List<StudentCourse> findByStudentAndIsRetakeAndIsPass(Student student, boolean isResit, boolean isPass);
}
