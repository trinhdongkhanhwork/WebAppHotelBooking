package vn.dev.sd18314.WebAppHotelBooking.service.impl;

import lombok.AccessLevel;
import lombok.experimental.FieldDefaults;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import vn.dev.sd18314.WebAppHotelBooking.entity.Categoris;
import vn.dev.sd18314.WebAppHotelBooking.repo.CategoriRepo;

import java.util.List;

@Service
@FieldDefaults(level = AccessLevel.PRIVATE)
public class CategoriServiceImpl {
    @Autowired
    CategoriRepo categoriRepo;

    public List<Categoris> doGetAll() {
        return categoriRepo.findAll();
    }
}
