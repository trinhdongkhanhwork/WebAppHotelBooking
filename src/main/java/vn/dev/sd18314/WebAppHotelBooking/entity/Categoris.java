package vn.dev.sd18314.WebAppHotelBooking.entity;

import ch.qos.logback.core.joran.spi.DefaultClass;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import lombok.*;
import lombok.experimental.FieldDefaults;

import java.io.Serializable;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Entity
@Table(name = "Categoris")
@FieldDefaults(level = AccessLevel.PRIVATE)
public class Categoris implements Serializable {
    @Id
    @Column(name = "Id")
    String id;
    @Column(name = "Name")
    String name;
}
