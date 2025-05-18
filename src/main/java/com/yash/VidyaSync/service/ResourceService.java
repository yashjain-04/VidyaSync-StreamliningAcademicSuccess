package com.yash.VidyaSync.service;

import com.yash.VidyaSync.model.Resource;
import com.yash.VidyaSync.model.ResourceType;
import com.yash.VidyaSync.repository.ResourceRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class ResourceService {

    @Autowired
    ResourceRepository resourceRepository;

    public List<Resource> getResourcesBySubjectAndType(Long subjectId, Long resourceTypeId) {
        return resourceRepository.findBySubject_SubjectIdAndResourceType_ResourceTypeId(subjectId, resourceTypeId);
    }

    public List<Resource> getResourcesBySubject(Long subjectId) {
        return resourceRepository.findBySubject_SubjectId(subjectId);
    }

    public List<ResourceType> findResourceTypesBySubjectId(Long subjectId) {
        return resourceRepository.findResourceTypesBySubjectId(subjectId);
    }
}
