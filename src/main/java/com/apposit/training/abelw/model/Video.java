package com.apposit.training.abelw.model;

import org.hibernate.annotations.Fetch;
import org.hibernate.annotations.FetchMode;

import javax.persistence.*;
import javax.validation.Valid;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Size;
import java.io.Serializable;

@Entity
@Table(name = "video")
public class Video implements Serializable {
    private static final long serialVersionUID = 1L;

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id")
    private Long id;

    @NotBlank(message = "Title can not be Empty")
    @Size(min = 1, message = "Title text size can not be less than 2")
    @Column(name = "title")
    public  String title;


    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "type_id", insertable = false, updatable = false)
    @Fetch(FetchMode.JOIN)
    private VideoType type;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "genre_id", insertable = false, updatable = false)
    @Fetch(FetchMode.JOIN)
    private VideoGenre genre;

    @Column(name = "age")
    private  String age;

    @Column(name = "year")
    private  String year;

    public Video() {
    }

    public static long getSerialVersionUID() {
        return serialVersionUID;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public VideoType getType() {
        return type;
    }

    public void setType(VideoType type) {
        this.type = type;
    }

    public VideoGenre getGenre() {
        return genre;
    }

    public void setGenre(VideoGenre genre) {
        this.genre = genre;
    }

    public String getAge() {
        return age;
    }

    public void setAge(String age) {
        this.age = age;
    }

    public String getYear() {
        return year;
    }

    public void setYear(String year) {
        this.year = year;
    }
}
