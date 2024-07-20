package vn.dev.sd18314.WebAppHotelBooking.util;

import jakarta.servlet.http.HttpSession;
import vn.dev.sd18314.WebAppHotelBooking.constant.SessionConstant;
import vn.dev.sd18314.WebAppHotelBooking.entity.Users;

public class SessionUtil {

    public static Users getCurrentUser(HttpSession session) {
        return (Users) session.getAttribute(SessionConstant.CURRENT_USER);
    }
}
