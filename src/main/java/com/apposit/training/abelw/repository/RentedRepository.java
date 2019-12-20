package com.apposit.training.abelw.repository;

import com.apposit.training.abelw.data.Rented;
import org.springframework.data.jpa.repository.JpaRepository;

public interface RentedRepository extends JpaRepository<Rented, Long> {
}
