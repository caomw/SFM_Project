package com.project.fpt.sfm.repository;

import com.project.fpt.sfm.entities.SubjectCategory;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

/**
 * Created by Khắc Vỹ on 10/9/2015.
 */
@Repository
public interface SubjectCategoryRepository extends JpaRepository<SubjectCategory, Integer>{
}
