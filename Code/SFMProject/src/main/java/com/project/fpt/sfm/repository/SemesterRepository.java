package com.project.fpt.sfm.repository;

import com.project.fpt.sfm.entities.Semester;
import com.project.fpt.sfm.entities.Student;
import org.springframework.data.domain.Sort;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by Khắc Vỹ on 10/7/2015.
 */
@Repository
public interface SemesterRepository extends JpaRepository<Semester, Integer>{
    List<Semester> findByStudent(Student student);

    Semester findTop1ByStudent(Student student, Sort sort);
}
