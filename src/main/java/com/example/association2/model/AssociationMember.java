package com.example.association2.model;

import lombok.Data;

@Data
public class AssociationMember {
    private int id;
    private int userId;
    private int associationId;
    private int position;
    private String description;
}
