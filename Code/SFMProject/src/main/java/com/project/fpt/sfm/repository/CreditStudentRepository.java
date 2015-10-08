package com.project.fpt.sfm.repository;

import com.project.fpt.sfm.entities.CreditStudent;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

/**
 * Created by Khắc Vỹ on 10/8/2015.
 */
@Repository
public interface CreditStudentRepository extends JpaRepository<CreditStudent, Integer>{
}
