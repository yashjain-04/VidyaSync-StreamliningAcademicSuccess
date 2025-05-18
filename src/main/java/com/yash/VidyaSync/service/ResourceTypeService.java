package com.yash.VidyaSync.service;

import com.yash.VidyaSync.model.ResourceType;
import com.yash.VidyaSync.repository.ResourceTypeRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
@RequiredArgsConstructor
public class ResourceTypeService {

    private final ResourceTypeRepository resourceTypeRepository;

    public Optional<ResourceType> getResourceTypeByName(String name) {
        return resourceTypeRepository.findByResourceName(name);
    }

    public List<ResourceType> getAllResourceTypes() {
        return resourceTypeRepository.findAll();
    }
}
