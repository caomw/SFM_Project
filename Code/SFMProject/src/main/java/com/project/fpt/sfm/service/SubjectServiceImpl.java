package com.project.fpt.sfm.service;

import com.project.fpt.sfm.entities.Student;
import com.project.fpt.sfm.entities.Subject;
import com.project.fpt.sfm.repository.SubjectRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * Created by Khắc Vỹ on 10/5/2015.
 */
@Service
public class SubjectServiceImpl implements SubjectService{
    @Autowired
    SubjectRepository subjectRepository;

    @Override
    public boolean addSubject(Subject subject) {
        Subject savedSubject = subjectRepository.save(subject);
        if(savedSubject != null){
            return true;
        }
        return false;
    }

    @Override
    public boolean updateSubject(Subject subject) {
        Subject savedSubject = subjectRepository.save(subject);
        if(savedSubject != null){
            return true;
        }
        return false;
    }
}
