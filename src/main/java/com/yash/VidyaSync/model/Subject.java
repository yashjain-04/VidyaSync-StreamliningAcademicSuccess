package com.yash.VidyaSync.model;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@Entity
@Table(name = "subjects")
public class Subject {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long subjectId;

    @Column(nullable = false, length = 255)
    private String subjectName;

    @ManyToOne
    @JoinColumn(nullable = false)
    private Branch branch;

    @Column(nullable = false)
    private Integer semester;
}