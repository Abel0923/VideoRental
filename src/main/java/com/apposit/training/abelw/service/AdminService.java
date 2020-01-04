package com.apposit.training.abelw.service;

import com.apposit.training.abelw.data.Rented;
import com.apposit.training.abelw.data.VideoData;
import com.apposit.training.abelw.model.Video;
import com.apposit.training.abelw.model.VideoGenre;
import com.apposit.training.abelw.model.VideoType;
import com.apposit.training.abelw.repository.*;
import com.google.api.client.auth.oauth2.Credential;
import com.google.api.client.googleapis.auth.oauth2.GoogleAuthorizationCodeFlow;
import com.google.api.client.googleapis.auth.oauth2.GoogleClientSecrets;
import com.google.api.client.http.FileContent;
import com.google.api.client.http.HttpTransport;
import com.google.api.client.http.javanet.NetHttpTransport;
import com.google.api.client.json.jackson2.JacksonFactory;
import com.google.api.client.util.store.FileDataStoreFactory;
import com.google.api.services.drive.Drive;
import com.google.api.services.drive.DriveScopes;
import com.google.api.services.drive.model.File;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.core.io.Resource;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.PostConstruct;
import javax.imageio.ImageIO;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.*;
import java.util.List;

@Service
public class AdminService {
    public static String uploadDirectory = System.getProperty("user.dir") + "/uploads";
    StringBuilder fileNames = new StringBuilder();
    List<Video> videos = new ArrayList<>();
    private GoogleAuthorizationCodeFlow flow;
    private static final String USER_IDENTIFIER_KEY = "MY_DUMMY_USER";
    public static HttpTransport HTTP_TRANSPORT = new NetHttpTransport();
    public static JacksonFactory JSON_FACTORY = JacksonFactory.getDefaultInstance();
    public static final List<String> SCOPES = Collections.singletonList(DriveScopes.DRIVE);


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

    @Autowired
    GoogleServiceHandler googleServiceHandler;

    Drive drive;
    @PostConstruct
    public void init() throws Exception{

    }


    public void fetchData() {
        this.videos.clear();
        videos.addAll(videoRepository.findAll());
    }

    public List<Video> getVideos() {
        return this.videos;
    }

    public List<VideoGenre> findAllGenre() {
        return genreRepository.findAll();
    }

    public Video findVideoById(Long id) {
        return videoRepository.findVideoById(id);
    }

    public List<VideoType> findAllVideoType() {
        return videoTypeRepository.findAll();
    }

    public void addVideos(VideoData videoData, MultipartFile file) {

        Path fileNameAndPath = Paths.get(uploadDirectory, file.getOriginalFilename());
        fileNames.append(file.getOriginalFilename() + " ");
        try {
            if (ImageIO.read(file.getInputStream()) != null) {
                saveImageToCloud(file);
                Files.write(fileNameAndPath, file.getBytes());
                videoData.setImage_uri(file.getOriginalFilename());
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        videoData.setImage_uri(videoData.getImage_uri());
        videoCrud.save(videoData);
        fetchData();
    }

    @Value("${google.oauth.callback.uri}")
    private String CALLBACK_URI;

    @Value("${google.secret.key.path}")
    private Resource gdSecretKeys;

    @Value("${google.credentials.folder.path}")
    private Resource credentialsFolder;

    private void saveImageToCloud(MultipartFile file) throws Exception {
        java.io.File file1 = this.convert(file);
        if(googleServiceHandler.saveImage(file,this.convert(file))){
            file1.delete();
        }
    }
    private java.io.File convert(MultipartFile file) throws IOException {
        java.io.File convFile = new java.io.File(Objects.requireNonNull(file.getOriginalFilename()));
        convFile.createNewFile();
        FileOutputStream fos = new FileOutputStream(convFile);
        fos.write(file.getBytes());
        fos.close();
        return convFile;
    }

    public void saveType(VideoType videoType) {
        videoTypeRepository.save(videoType);
    }

    public void saveGenre(VideoGenre videoGenre) {
        genreRepository.save(videoGenre);
    }

    public void deleteVideo(Long id) {
        videoRepository.deleteById(id);
        videos.removeIf(video -> video.getId().equals(id));
    }

    public void deleteGenre(Long id) {
        genreRepository.deleteById(id);
    }

    public void deleteType(Long id) {
        videoTypeRepository.deleteById(id);
    }

    public void saveEditedVideo(Video selectedVideo) {
        Video video = videoRepository.findVideoById(selectedVideo.getId());
        video.setTitle(selectedVideo.getTitle());
        videoRepository.save(video);
    }

    public List<Rented> getRentedVideos() {
        return rentedRepository.findAll();
    }
}
