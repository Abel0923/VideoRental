package com.apposit.training.abelw.data;


import com.apposit.training.abelw.model.Video;

public class VideoOrder {

    private Video video;

    public VideoOrder(Video video) {
        this.video = video;
    }

    public Video getVideo() {
        return video;
    }

    public void setVideo(Video video) {
        this.video = video;
    }
}
