package com.yash.VidyaSync.model;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@Entity
@Table(name = "resource_types")
public class ResourceType {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long resourceTypeId;

    @Column(nullable = false, unique = true, length = 100)
    private String resourceName;
}
