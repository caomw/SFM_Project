package com.project.fpt.sfm.service;

import com.project.fpt.sfm.entities.Manager;
import com.project.fpt.sfm.entities.Season;
import com.project.fpt.sfm.entities.TuitionPayment;

import java.util.List;

/**
 * Created by Khắc Vỹ on 10/8/2015.
 */
public interface AdminService {
    /**
     * Create new Season
     *
     * @param season
     * @return
     */
    Season addSeason(Season season);

    /**
     * Get All Tuition Payment
     *
     * @return
     */
    List<TuitionPayment> getListTuitionPayment();

    /**
     * Get Logged Manager
     *
     * @return
     */
    Manager getCurrentUser();
}
