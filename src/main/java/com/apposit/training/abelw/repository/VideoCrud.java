package com.apposit.training.abelw.repository;

import com.apposit.training.abelw.data.VideoData;
import org.springframework.data.jpa.repository.JpaRepository;

public interface VideoCrud extends JpaRepository<VideoData, Long> {

}
