package com.project.fpt.sfm.service;

import com.project.fpt.sfm.entities.*;
import com.project.fpt.sfm.processexcel.model.StudyResultTemplate;
import com.project.fpt.sfm.repository.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by Khắc Vỹ on 10/13/2015.
 */
@Service
public class CourseServiceImpl implements CourseService{
    @Autowired
    CourseRepo courseRepo;
    @Autowired
    TermRepo termRepo;
    @Autowired
    StudentRepo studentRepo;
    @Autowired
    ClassRepo classRepo;
    @Autowired
    SubInSemesterRepo subInSemesterRepo;
    /**
     * Get All Retake of a student
     *
     * @param student
     * @return
     */
    @Override
    public List<Course> getAllFailedCourseOfStudent(Student student, Term term) {
        List<Course> listFailedCourse = courseRepo.findByPassAndRetakeInTerm(false, false, term);
        System.out.println("SIZE : " + listFailedCourse.size());
        List<Course> listPassedRetakeCourse = courseRepo.findByPassAndRetakeInTerm(true, true, term);
        List<Course> result = new ArrayList<>();
        if(listFailedCourse.size() > 0 && listPassedRetakeCourse.size() > 0){
            for(Course failedCourse : listFailedCourse){
                if(!listPassedRetakeCourse.contains(failedCourse)){
                    result.add(failedCourse);
                }
            }
        }

        return result;
    }

    @Override
    public List<Course> getAllCourseInSemester() {
        Term term = termRepo.findByIsCurrent(true);
        List<Course> listCourse = courseRepo.findCourseInTermOrderByClass(term);
        return listCourse;
    }

    @Override
    public void addCourseResult(Integer clazzId, Integer subInSemId, StudyResultTemplate temp) {
        Student student = studentRepo.findByStudentCode(temp.getStudentCode());
        Clazz clazz = classRepo.findOne(clazzId);
        SubjectInSemester subInSem = subInSemesterRepo.findOne(subInSemId);

        Course course = courseRepo.findByStudentAndClazzAndSubjectInSemester(student, clazz, subInSem);
       if(course != null){
           course.setStudent(student);
           course.setSubjectInSemester(subInSem);
           course.setClazz(clazz);
           if(!temp.getMark().equals("N/A")){
               System.out.println("Mark : " + temp.getMark());
               course.setMark(temp.getMark());
           }
           if(temp.getIsRetake().equals("HL")){
               course.setIsRetake(true);
           }
           if(temp.getStatus().equals("Đạt")){
               course.setIsPass(true);
           }else{
               course.setIsPass(false);
           }
           course.setIsActive(true);
           course.setNote(temp.getNote());

           courseRepo.save(course);
       }
    }
}
