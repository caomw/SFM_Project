package com.project.fpt.sfm.repository;

import com.project.fpt.sfm.entities.Student;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

/**
 * Created by Khắc Vỹ on 10/3/2015.
 */
@Repository
public interface StudentRepository extends JpaRepository<Student, Integer> {

}
