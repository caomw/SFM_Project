package com.project.fpt.sfm.repository;

import com.project.fpt.sfm.entities.Student;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by Khắc Vỹ on 10/13/2015.
 */
@Repository
public interface StudentRepo extends JpaRepository<Student, Integer>{
    List<Student> findByIsActive(boolean isActive);
}
