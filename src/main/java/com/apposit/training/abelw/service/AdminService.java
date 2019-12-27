package com.apposit.training.abelw.service;

import com.apposit.training.abelw.data.Rented;
import com.apposit.training.abelw.data.VideoData;
import com.apposit.training.abelw.model.Video;
import com.apposit.training.abelw.model.VideoGenre;
import com.apposit.training.abelw.model.VideoType;
import com.apposit.training.abelw.repository.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.List;

@Service
public class AdminService {
    public static String uploadDirectory  = System.getProperty("user.dir")+"/uploads";
    StringBuilder fileNames = new StringBuilder();
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
    VideoCrud videoCrud;

    public void fetchData(){
        this.videos.clear();
        videos.addAll(videoRepository.findAll());
    }
    public List<Video> getVideos(){
        return this.videos;
    }

    public List<VideoGenre> findAllGenre(){
        return genreRepository.findAll();
    }
    public Video findVideoById(Long id){
        return videoRepository.findVideoById(id);
    }

    public List<VideoType> findAllVideoType(){
        return videoTypeRepository.findAll();
    }

    public void addVideos(VideoData videoData, MultipartFile file){

        Path fileNameAndPath = Paths.get(uploadDirectory, file.getOriginalFilename());
        fileNames.append(file.getOriginalFilename()+" ");
        try {
            Files.write(fileNameAndPath, file.getBytes());
        } catch (IOException e) {
            e.printStackTrace();
        }

        videoData.setImage_uri(file.getOriginalFilename());
        videoCrud.save(videoData);
        fetchData();
    }

    public void saveType(VideoType videoType){
        videoTypeRepository.save(videoType);
    }
    public void saveGenre(VideoGenre videoGenre){
        genreRepository.save(videoGenre);
    }
    public void deleteVideo(Long id){
        videoRepository.deleteById(id);
        videos.removeIf(video -> video.getId().equals(id));
    }

    public void deleteGenre(Long id){
        genreRepository.deleteById(id);
    }
    public void deleteType(Long id){
        videoTypeRepository.deleteById(id);
    }

    public void saveEditedVideo(Video selectedVideo){
        Video video = videoRepository.findVideoById(selectedVideo.getId());
        video.setTitle(selectedVideo.getTitle());
        videoRepository.save(video);
    }

    public List<Rented> getRentedVideos(){
        return  rentedRepository.findAll();
    }
}
