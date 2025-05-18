package com.yash.VidyaSync.service;

import com.yash.VidyaSync.model.Branch;
import com.yash.VidyaSync.repository.BranchRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
@RequiredArgsConstructor
public class BranchService {

    @Autowired
    BranchRepository branchRepository;

    public Optional<Branch> getBranchByName(String name) {
        return branchRepository.findByBranchName(name);
    }

    public List<Branch> getAllBranches() {
        return branchRepository.findAll();
    }
}

