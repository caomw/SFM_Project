package com.project.fpt.sfm.repository;

import com.project.fpt.sfm.entities.Student;
import com.project.fpt.sfm.entities.TuitionPayment;
import org.springframework.data.domain.Sort;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by Khắc Vỹ on 10/7/2015.
 */
@Repository
public interface TuitionPaymentRepository extends JpaRepository<TuitionPayment, Integer>{
    List<TuitionPayment> findByStudent(Student student, Sort sort);
}
