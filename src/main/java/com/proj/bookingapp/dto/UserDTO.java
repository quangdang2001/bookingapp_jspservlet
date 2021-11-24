package com.proj.bookingapp.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @AllArgsConstructor @NoArgsConstructor
public class UserDTO {
    private String fName;
    private String lName;
    private String email;
    private String password;
    private String code;
}
