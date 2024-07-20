package vn.dev.sd18314.WebAppHotelBooking.dto;


import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import vn.dev.sd18314.WebAppHotelBooking.entity.Gender;

import java.io.Serializable;

@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
public class RegisterUserDto implements Serializable {

    private static final long serialVersionUID = 590799992485246296L;

    private String username;
    private String email;
    private String password;
    private Gender gender;
    private String address;
    private String fullname;
    private String phone;
}
