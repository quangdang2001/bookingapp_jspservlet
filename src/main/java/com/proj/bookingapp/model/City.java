package com.proj.bookingapp.model;

import lombok.*;
import org.hibernate.annotations.Nationalized;

import javax.persistence.*;
import java.util.List;

@Entity
@Data @AllArgsConstructor @NoArgsConstructor
public class City {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(unique = true,nullable = false)
    @Nationalized
    private String name;

    @OneToMany(mappedBy = "city",fetch = FetchType.EAGER,
            cascade = CascadeType.ALL)

    private List<Building> buildings;

}
