package com.apposit.training.abelw.service;

import com.apposit.training.abelw.data.Rented;
import com.apposit.training.abelw.model.Video;
import com.apposit.training.abelw.model.VideoGenre;
import com.apposit.training.abelw.model.VideoType;
import com.apposit.training.abelw.repository.*;
import com.google.api.services.drive.model.File;
import com.google.api.services.drive.model.FileList;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

@Service
public class UserService {

    List<Video> videos = new ArrayList<>();

    @Autowired
    VideoRepository videoRepository;

    @Autowired
    GenreRepository genreRepository;

    @Autowired
    VideoTypeRepository videoTypeRepository;

    @Autowired
    RentedRepository rentedRepository;
    @Autowired
    GoogleServiceHandler googleServiceHandler;

    public void fetchData(){
        this.videos.clear();
        videos.addAll(videoRepository.findAll());
    }


    public void fetchDataByGenre(long id){
        this.videos.clear();
        videos.addAll(videoRepository.findAll());
        setVideos(videos.stream().filter(video -> video.getGenre().id == id)
                .collect(Collectors.toList()));
    }

    public List<Video> getVideos(){

        FileList list;
        List<File> result = new ArrayList<File>();
        list = googleServiceHandler.getListOfImages(googleServiceHandler.drive);
        result.addAll(list.getFiles());

        for (int i=0; i<videos.size(); i++) {
            googleServiceHandler.getImageLink(result, i,videos.get(i).getImage_uri(), videos);
        }
        return this.videos;
    }

    public void setVideos(List<Video> videos){
        this.videos = videos;
    }

    public List<VideoGenre> getAllGenre(){
        return genreRepository.findAll();
    }

    public List<VideoType> getAllType() {
        return videoTypeRepository.findAll();
    }

    public List<Video> findVideoById(int id){
        return videoRepository.findVideosById(id);
    }


    public void getDataByType(int type) {
        this.videos.clear();
        videos.addAll(videoRepository.findAll());
        setVideos(videos.stream().filter(video -> video.getType().getId() == type)
                .collect(Collectors.toList()));
    }

    public void renteVideo(List<Video> videos, Double total_price){
        Rented rented;
        for (Video video: videos) {
            rented = new Rented();
            rented.setVideo_id(Math.toIntExact(video.getId()));
            rented.setNo_days(video.getNoOfDays());
            rented.setTotal_price(total_price.intValue());
            rentedRepository.save(rented);
        }
    }
}
