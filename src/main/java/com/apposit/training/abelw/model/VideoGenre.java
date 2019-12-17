package com.apposit.training.abelw.model;

import javax.persistence.*;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Size;
import java.io.Serializable;

@Entity
@Table(name = "genre")
public class VideoGenre implements Serializable {

    private static final long serialVersionUID = 1L;

    @Id
    @SequenceGenerator(name="seq-gen",sequenceName="MY_SEQ_GEN", initialValue=205, allocationSize=1)
    @GeneratedValue(strategy= GenerationType.AUTO, generator="seq-gen")
    @Column(name = "id")
    public long id;

    @NotBlank(message = "Title can not be Empty")
    @Size(min = 1, message = "Title text size can not be less than 2")
    @Column(name = "title")
    public String title;


    public VideoGenre() {
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
}
