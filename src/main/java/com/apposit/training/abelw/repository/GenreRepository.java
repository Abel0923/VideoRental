package com.apposit.training.abelw.repository;

import com.apposit.training.abelw.model.VideoGenre;
import org.springframework.data.jpa.repository.JpaRepository;

public interface GenreRepository extends JpaRepository<VideoGenre, Long> {
}
