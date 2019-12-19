package com.apposit.training.abelw.data;

import com.apposit.training.abelw.model.VideoGenre;
import com.apposit.training.abelw.model.VideoType;
import org.hibernate.annotations.Tables;
import org.ocpsoft.prettytime.PrettyTime;
import org.springframework.stereotype.Component;

import javax.persistence.Entity;
import java.util.Date;

public class VideoByTypeDto {

    private Long videoId;
    private String videoTitle;
    private VideoType videoType;
    private VideoGenre videoGenre;
    private int age;
    private int year;
    private Double price;
    private int onOfDays;
    private String image_uri;
    private Date created_at;

    public VideoByTypeDto(Long videoId,
                          String videoTitle,
                          VideoType videoType,
                          VideoGenre videoGenre,
                          int age,
                          int year,
                          Double price,
                          int onOfDays,
                          String image_uri,
                          Date created_at) {
        this.videoId = videoId;
        this.videoTitle = videoTitle;
        this.videoType = videoType;
        this.videoGenre = videoGenre;
        this.age = age;
        this.year = year;
        this.price = price;
        this.onOfDays = onOfDays;
        this.image_uri = image_uri;
        this.created_at = created_at;
    }

    public VideoByTypeDto() {
    }

    public Long getVideoId() {
        return videoId;
    }

    public void setVideoId(Long videoId) {
        this.videoId = videoId;
    }

    public String getVideoTitle() {
        return videoTitle;
    }

    public void setVideoTitle(String videoTitle) {
        this.videoTitle = videoTitle;
    }

    public VideoType getVideoType() {
        return videoType;
    }

    public void setVideoType(VideoType videoType) {
        this.videoType = videoType;
    }

    public VideoGenre getVideoGenre() {
        return videoGenre;
    }

    public void setVideoGenre(VideoGenre videoGenre) {
        this.videoGenre = videoGenre;
    }

    public int getAge() {
        return age;
    }

    public void setAge(int age) {
        this.age = age;
    }

    public int getYear() {
        return year;
    }

    public void setYear(int year) {
        this.year = year;
    }

    public Double getPrice() {
        return price;
    }

    public void setPrice(Double price) {
        this.price = price;
    }

    public int getOnOfDays() {
        return onOfDays;
    }

    public void setOnOfDays(int onOfDays) {
        this.onOfDays = onOfDays;
    }

    public String getImage_uri() {
        return image_uri;
    }

    public void setImage_uri(String image_uri) {
        this.image_uri = image_uri;
    }

    public String getCreated_at() {
        return new PrettyTime().format(created_at);
    }

    public void setCreated_at(Date created_at) {
        this.created_at = created_at;
    }
}
