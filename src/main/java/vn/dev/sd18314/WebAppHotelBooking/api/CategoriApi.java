package vn.dev.sd18314.WebAppHotelBooking.api;

import lombok.AccessLevel;
import lombok.experimental.FieldDefaults;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import vn.dev.sd18314.WebAppHotelBooking.entity.Categoris;
import vn.dev.sd18314.WebAppHotelBooking.service.impl.CategoriServiceImpl;

import java.util.List;
import java.util.Optional;

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

    @GetMapping("/{id}")
    Optional<Categoris> doGetCategoriById(@PathVariable String id) {
        return categoriServiceImpl.doGetById(id);
    }
}
