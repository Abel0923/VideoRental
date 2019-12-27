package com.apposit.training.abelw.data;

import com.apposit.training.abelw.model.Video;
import org.hibernate.annotations.Fetch;
import org.hibernate.annotations.FetchMode;
import org.postgresql.util.PGmoney;

import javax.persistence.*;
import java.util.List;
import java.util.Set;

@Entity
@Table(name = "rented")
public class Rented {

    private static final long serialVersionUID = 1L;

    @Id
    @SequenceGenerator(name="seq-gen",sequenceName="MY_SEQ_GEN", initialValue=205, allocationSize=1)
    @GeneratedValue(strategy= GenerationType.AUTO, generator="seq-gen")
    @Column(name = "id")
    private Long id;


    @Column(name = "video_id")
    private int video_id;

    @Column(name = "no_days")
    private int no_days;

    @Column(name = "total_price")
    private int total_price;

    @ManyToOne(targetEntity = Video.class)
    @JoinColumn(name = "video_id", insertable = false, updatable = false)
    public Video video;

    public Rented() {
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

    public int getVideo_id() {
        return video_id;
    }

    public void setVideo_id(int video_id) {
        this.video_id = video_id;
    }

    public int getNo_days() {
        return no_days;
    }

    public void setNo_days(int no_days) {
        this.no_days = no_days;
    }

    public int getTotal_price() {
        return total_price;
    }

    public void setTotal_price(int total_price) {
        this.total_price = total_price;
    }

    public Video getVideo() {
        return video;
    }

    public void setVideo(Video video) {
        this.video = video;
    }
}
