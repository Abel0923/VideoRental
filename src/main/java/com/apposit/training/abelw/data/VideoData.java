package com.apposit.training.abelw.data;

import com.apposit.training.abelw.model.VideoGenre;
import com.apposit.training.abelw.model.VideoType;

import javax.persistence.*;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Size;
import java.io.Serializable;

@Entity
@Table(name = "video")
public class VideoData implements Serializable {

    private static final long serialVersionUID = 1L;

    @Id
    @SequenceGenerator(name="seq-gen",sequenceName="MY_SEQ_GEN", initialValue=205, allocationSize=1)
    @GeneratedValue(strategy= GenerationType.AUTO, generator="seq-gen")
    @Column(name = "id")
    private Long id;

    @NotBlank(message = "Title Can not be Empty!")
    @Size(min = 2, message = "Title text size can not be less than 2")
    @Column(name = "title")
    private String title;

    @Column(name = "type_id")
    private int type_id;

    @Column(name = "genre_id")
    private int genre_id;

    @Column(name = "age")
    private int age;

    @Column(name = "year")
    private int year;

    @Column(name = "image_uri")
    private String image_uri;

    public VideoData() {
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

    public int getType_id() {
        return type_id;
    }

    public void setType_id(int type_id) {
        this.type_id = type_id;
    }

    public int getGenre_id() {
        return genre_id;
    }

    public void setGenre_id(int genre_id) {
        this.genre_id = genre_id;
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

    public String getImage_uri() {
        return image_uri;
    }

    public void setImage_uri(String image_uri) {
        this.image_uri = image_uri;
    }
}
