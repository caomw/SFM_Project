package com.project.fpt.sfm.repository;

import com.project.fpt.sfm.entities.Manager;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

/**
 * Created by Khắc Vỹ on 10/9/2015.
 */
@Repository
public interface ManagerRepository extends JpaRepository<Manager, Integer>{
}
