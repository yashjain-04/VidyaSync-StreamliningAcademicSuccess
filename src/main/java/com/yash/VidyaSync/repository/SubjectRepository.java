package com.yash.VidyaSync.repository;

import com.yash.VidyaSync.model.Subject;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface SubjectRepository extends JpaRepository<Subject, Long> {
    List<Subject> findByBranch_BranchIdAndSemester(Integer branchId, Integer semester);
}