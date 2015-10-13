package com.project.fpt.sfm.repository;

import com.project.fpt.sfm.entities.RetakeCoursePayment;
import com.project.fpt.sfm.entities.Student;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by Khắc Vỹ on 10/7/2015.
 */
@Repository
public interface ResitCoursePaymentRepository extends JpaRepository<RetakeCoursePayment, Integer>{
    List<RetakeCoursePayment> findByStudent(Student student);
}
