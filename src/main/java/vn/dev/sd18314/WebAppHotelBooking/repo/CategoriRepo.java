package vn.dev.sd18314.WebAppHotelBooking.repo;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import vn.dev.sd18314.WebAppHotelBooking.entity.Categoris;

import java.util.List;

@Repository
public interface CategoriRepo extends JpaRepository<Categoris, String> {

}
