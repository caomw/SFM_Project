package com.project.fpt.sfm.repository;

import com.project.fpt.sfm.entities.Course;
import com.project.fpt.sfm.entities.Student;
import com.project.fpt.sfm.entities.Term;
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

    @Query(value = "SELECT u FROM Course u where u.student = ?1 group by u.subjectInSemester.semester.studyStage")
    List<Course> findStudentCourseGroupByStudyStage(Student student);
}
