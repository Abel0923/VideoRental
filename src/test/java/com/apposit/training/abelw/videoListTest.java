package com.apposit.training.abelw;

import com.apposit.training.abelw.service.UserService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.mockito.Mockito;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.WebMvcTest;
import org.springframework.boot.test.mock.mockito.MockBean;
import org.springframework.http.MediaType;
import org.springframework.test.context.junit4.SpringRunner;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.MvcResult;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;

import java.util.Collections;

import static org.mockito.Mockito.*;

//@RunWith(SpringRunner.class)
//@WebMvcTest
public class videoListTest {

    @Autowired
    MockMvc mockMvc;

    @MockBean
    UserService userService;

//    @Test
//    public void getVideos() throws Exception{
//
//        when(userService.getVideos()).thenReturn(
//                Collections.emptyList()
//        );
//
//        MvcResult mvcResult = mockMvc.perform(
//                MockMvcRequestBuilders.get("/user/home")
//                .accept(MediaType.ALL)
//        ).andReturn();
//
//        System.out.println("----------------------------");
//        System.out.println(mvcResult.getResponse());
//        verify(userService).getVideos();
//
//    }
}