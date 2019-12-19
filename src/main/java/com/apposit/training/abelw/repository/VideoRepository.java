package com.apposit.training.abelw.repository;

import com.apposit.training.abelw.data.VideoByTypeDto;
import com.apposit.training.abelw.model.Video;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface VideoRepository extends JpaRepository<Video, Long> {
    @Query(value = "SELECT new com.apposit.training.abelw.data.VideoByTypeDto" +
            "(v.id, v.title, t, g, v.age, v.year, t.price, 1, v.image_uri, v.created_at) "
            + "FROM Video v JOIN v.type t JOIN v.genre g WHERE t.id = v.type.id and g.id = v.genre.id")
    List<VideoByTypeDto> fetchEmpDeptDataInnerJoin();

;

    @Query(value = "SELECT new com.apposit.training.abelw.data.VideoByTypeDto" +
            "(v.id, v.title, v.type, v.genre, v.age, v.year, v.type.price, 1, v.image_uri, v.created_at) "
            + "FROM Video v WHERE  v.id = :id")
     List<VideoByTypeDto> fetchVideoId(long id);

    @Query(value = "SELECT new com.apposit.training.abelw.data.VideoByTypeDto" +
            "(v.id, v.title, v.type, v.genre, v.age, v.year, v.type.price, 1, v.image_uri, v.created_at) "
            + "FROM Video v WHERE  v.id = :id")
     VideoByTypeDto findVideosById(long id);



    Video findVideoById(long id);

}
