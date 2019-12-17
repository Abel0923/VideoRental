package com.apposit.training.abelw.utils;

import com.apposit.training.abelw.data.VideoByTypeDto;
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

    public Double calculatedPrice(List<VideoByTypeDto> cartValue){
        for (VideoByTypeDto video :cartValue) {
             this.rate = video.getPrice();
             if (video.getVideoType().getType_title().equalsIgnoreCase("CHILDREN") && video.getAge() != null){
                 this.ageValue = Double.parseDouble(video.getAge()) / 2;
                 this.totalPrice = rate * days + ageValue + this.totalPrice;
             }else if(video.getVideoType().getType_title().equalsIgnoreCase("NEW") && video.getYear() != null){
                this.year = new Date().getYear() - Integer.parseInt(video.getYear());
                this.totalPrice = rate * days - this.year + this.totalPrice;
            }else {
                 this.totalPrice = rate * days + this.totalPrice;
             }
        }

        return this.totalPrice;
    }
}
