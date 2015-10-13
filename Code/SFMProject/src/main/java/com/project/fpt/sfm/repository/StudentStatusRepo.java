package com.project.fpt.sfm.repository;

import com.project.fpt.sfm.entities.StudentStatus;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

/**
 * Created by Khắc Vỹ on 10/12/2015.
 */
@Repository
public interface StudentStatusRepo extends JpaRepository<StudentStatus, Integer>{
    StudentStatus findByStatusName(String statusName);
}
