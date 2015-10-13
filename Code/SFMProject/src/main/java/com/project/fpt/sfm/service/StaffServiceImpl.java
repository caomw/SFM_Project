package com.project.fpt.sfm.service;

import com.project.fpt.sfm.entities.Term;
import com.project.fpt.sfm.repository.TermRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * Created by Khắc Vỹ on 10/10/2015.
 */
@Service
@Transactional
public class StaffServiceImpl implements StaffService{
    @Autowired
    TermRepository termRepository;

    /**
     * Add new Term
     *
     * @param term
     */
    @Override
    @Transactional(rollbackFor = Exception.class)
    public void addTerm(Term term) {
        termRepository.save(term);
    }

    /**
     * Get Current Term
     *
     * @return
     */
    @Override
    @Transactional(readOnly = true)
    public Term getCurrentTerm() {
        return termRepository.findByIsActive(true);
    }
}
