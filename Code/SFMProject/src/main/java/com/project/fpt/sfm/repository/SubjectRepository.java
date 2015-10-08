package com.project.fpt.sfm.repository;

import com.project.fpt.sfm.entities.Subject;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

/**
 * Created by Khắc Vỹ on 10/5/2015.
 */
@Repository
public interface SubjectRepository extends CrudRepository<Subject, Integer>{
}
