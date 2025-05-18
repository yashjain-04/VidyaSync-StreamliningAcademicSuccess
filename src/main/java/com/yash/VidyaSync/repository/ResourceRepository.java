package com.yash.VidyaSync.repository;

import com.yash.VidyaSync.model.Resource;
import com.yash.VidyaSync.model.ResourceType;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ResourceRepository extends JpaRepository<Resource, Long> {
    List<Resource> findBySubject_SubjectIdAndResourceType_ResourceTypeId(Long subjectId, Long resourceTypeId);
    List<Resource> findBySubject_SubjectId(Long subjectId);
    //List<Resource> findByResourceType_ResourceTypeId()


    @Query("SELECT DISTINCT r.resourceType FROM Resource r WHERE r.subject.subjectId = ?1")
    List<ResourceType> findResourceTypesBySubjectId(Long subjectId);

//
//    @Query("SELECT DISTINCT r.resourceType FROM Resource r WHERE r.subject.subjectId = ?1")
//    Optional<ResourceType> findResourceTypeBySubjectId(Long subjectId);
}
