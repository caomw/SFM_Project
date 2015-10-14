package com.project.fpt.sfm.repository;

import com.project.fpt.sfm.entities.*;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by Khắc Vỹ on 10/12/2015.
 */
@Repository
public interface CourseRepo extends JpaRepository<Course, Integer>{

    List<Course> findBySubjectInSemesterSemesterTerm(Term term);

    Course findByStudentAndClazzAndSubjectInSemester(Student student, Clazz clazz, SubjectInSemester subInSem);

    @Query(value = "SELECT u FROM Course u where u.student = ?1 group by u.subjectInSemester.semester.studyStage")
    List<Course> findStudentCourseGroupByStudyStage(Student student);

    @Query(value = "SELECT u FROM Course u where u.isPass = ?1 and u.isRetake = ?2 and u.isActive = true and u.subjectInSemester.semester.term = ?3")
    List<Course> findByPassAndRetakeInTerm(boolean isPass, boolean isRetake, Term term);

    @Query(value = "SELECT u FROM Course u where u.subjectInSemester.semester.term = ?1 group by u.subjectInSemester, u.clazz")
    List<Course> findCourseInTermOrderByClass(Term term);

    @Query(value = "SELECT u FROM Course u where u.subjectInSemester.semester.term = ?1")
    List<Course> findCourseOfStudentInTerm(Term term);
}
