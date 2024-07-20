package vn.dev.sd18314.WebAppHotelBooking.service;

import org.springframework.stereotype.Service;
import vn.dev.sd18314.WebAppHotelBooking.dto.RegisterUserDto;
import vn.dev.sd18314.WebAppHotelBooking.entity.Users;

@Service
public interface UserService {
    Users doLogin(String username, String password);
    Users doRegister(RegisterUserDto user);
}
