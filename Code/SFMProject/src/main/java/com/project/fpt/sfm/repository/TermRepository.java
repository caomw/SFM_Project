package com.project.fpt.sfm.repository;

import com.project.fpt.sfm.entities.Term;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

/**
 * Created by Khắc Vỹ on 10/8/2015.
 */
@Repository
public interface TermRepository extends JpaRepository<Term, Integer>{
    Term findByIsActive(boolean isActive);
}
