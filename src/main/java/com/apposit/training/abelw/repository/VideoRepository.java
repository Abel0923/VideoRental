package com.apposit.training.abelw.repository;

import com.apposit.training.abelw.model.Video;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface VideoRepository extends JpaRepository<Video, Long> {


     List<Video> findVideosById(long id);
     Video findVideoById(long id);

}
