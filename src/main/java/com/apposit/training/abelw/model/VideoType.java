package com.apposit.training.abelw.model;

import javax.persistence.*;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Size;
import java.io.Serializable;
import java.util.Set;

@Entity
@Table(name = "type")
public class VideoType implements Serializable {

    private static final long serialVersionUID = 1L;

    @Id
    @SequenceGenerator(name="seq-gen",sequenceName="MY_SEQ_GEN", initialValue=205, allocationSize=1)
    @GeneratedValue(strategy= GenerationType.AUTO, generator="seq-gen")
    @Column(name = "id")
    private Long id;

    @NotBlank(message = "Title can not be Empty")
    @Column(name = "type_title")
    private String type_title;

    @Column(name = "price")
    private Double price;

    @OneToMany(targetEntity = Video.class,
            mappedBy = "id", orphanRemoval = false,
            fetch = FetchType.LAZY)
    private Set<Video> videos;

    public VideoType() {
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

    public String getType_title() {
        return type_title;
    }

    public void setType_title(String type_title) {
        this.type_title = type_title;
    }

    public Double getPrice() {
        return price;
    }

    public void setPrice(Double price) {
        this.price = price;
    }

    public Set<Video> getVideos() {
        return videos;
    }

    public void setVideos(Set<Video> videos) {
        this.videos = videos;
    }
}
