package vn.dev.sd18314.WebAppHotelBooking.api;

import lombok.AccessLevel;
import lombok.experimental.FieldDefaults;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import vn.dev.sd18314.WebAppHotelBooking.entity.Categoris;
import vn.dev.sd18314.WebAppHotelBooking.service.impl.CategoriServiceImpl;

import java.util.List;

@RestController
@RequestMapping("/product/category/v1")
@CrossOrigin("*")
@FieldDefaults(level = AccessLevel.PRIVATE)
public class CategoriApi {
    @Autowired
    CategoriServiceImpl categoriServiceImpl;

    @GetMapping
    List<Categoris> doGetCategori() {
    return categoriServiceImpl.doGetAll();
    }
}
