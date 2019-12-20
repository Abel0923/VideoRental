package com.apposit.training.abelw.service;

import com.apposit.training.abelw.data.Rented;
import com.apposit.training.abelw.data.VideoByTypeDto;
import com.apposit.training.abelw.model.Video;
import com.apposit.training.abelw.model.VideoGenre;
import com.apposit.training.abelw.model.VideoType;
import com.apposit.training.abelw.repository.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

@Service
public class UserService {

    List<VideoByTypeDto> videos = new ArrayList<>();

    @Autowired
    VideoRepository videoRepository;

    @Autowired
    GenreRepository genreRepository;

    @Autowired
    VideoTypeRepository videoTypeRepository;

    @Autowired
    RentedRepository rentedRepository;


    public void fetchData(){
        this.videos.clear();
        videos.addAll(videoRepository.fetchAllVideos());
    }

    public void fetchDataByGenre(long id){
        this.videos.clear();
        videos.addAll(videoRepository.fetchAllVideos());
        setVideos(videos.stream().filter(videoByTypeDto -> videoByTypeDto.getVideoGenre().id == id)
                .collect(Collectors.toList()));
    }

    public List<VideoByTypeDto> getVideos(){
        return this.videos;
    }

    public void setVideos(List<VideoByTypeDto> videos){
        this.videos = videos;
    }

    public List<VideoGenre> findAllGenre(){
        return genreRepository.findAll();
    }

    public List<VideoType> findAllType() {
        return videoTypeRepository.findAll();
    }

    public List<VideoByTypeDto> findVideoById(int id){
        return videoRepository.fetchVideoId(id);
    }


    public void fetchDataByType(int type) {
        this.videos.clear();
        videos.addAll(videoRepository.fetchAllVideos());
        setVideos(videos.stream().filter(videoByTypeDto -> videoByTypeDto.getVideoType().getId() == type)
                .collect(Collectors.toList()));
    }

    public void renteVideo(List<VideoByTypeDto> videoByTypeDto, Double total_price){
        Rented rented;
        Video videoRented;
        for (VideoByTypeDto video: videoByTypeDto) {
            rented = new Rented();
            rented.setVideo_id(Math.toIntExact(video.getVideoId()));
            rented.setNo_days(video.getOnOfDays());
            rented.setTotal_price(total_price.intValue());
            rentedRepository.save(rented);
        }
    }
}
