package com.project.fpt.sfm.service;

import com.project.fpt.sfm.entities.Term;

/**
 * Created by Khắc Vỹ on 10/10/2015.
 */
public interface StaffService {
    /**
     * Add new Term
     *
     * @param term
     */
    void addTerm(Term term);

    /**
     * Get Current Term
     *
     * @return
     */
    Term getCurrentTerm();
}
