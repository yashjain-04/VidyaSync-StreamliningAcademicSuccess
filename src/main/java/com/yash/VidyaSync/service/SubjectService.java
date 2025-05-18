package com.yash.VidyaSync.service;

import com.yash.VidyaSync.model.Subject;
import com.yash.VidyaSync.repository.SubjectRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class SubjectService {

    @Autowired
    SubjectRepository subjectRepository;

    public List<Subject> getSubjectsByBranchAndSemester(Integer branchId, Integer semester) {
        return subjectRepository.findByBranch_BranchIdAndSemester(branchId, semester);
    }
}

