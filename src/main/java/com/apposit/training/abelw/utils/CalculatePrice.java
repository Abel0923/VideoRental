package com.apposit.training.abelw.utils;

import com.apposit.training.abelw.model.Video;
import org.springframework.stereotype.Component;

import java.util.Date;
import java.util.List;

@Component
public class CalculatePrice {

    Double totalPrice = 0.0;
    int days = 1;
    Double rate = 0.0;
    Double ageValue = 0.0;
    int year = 0;

    public Double calculatedPrice(List<Video> cartValue){
        for (Video video :cartValue) {
             this.rate = video.getType().getPrice();
             if (video.getType().getType_title().equalsIgnoreCase("CHILDREN") && video.getAge() > 2){
                 this.ageValue = (double) video.getAge() / 2;
                 this.totalPrice = rate * video.getNoOfDays() + ageValue + this.totalPrice;
             }else if(video.getType().getType_title().equalsIgnoreCase("NEW") && video.getYear() > 0){
                this.year = new Date().getYear() - video.getYear();
                this.totalPrice = rate * video.getNoOfDays() - this.year + this.totalPrice;
            }else {
                 this.totalPrice = rate * days + this.totalPrice;
             }
        }

        return this.totalPrice;
    }
}
