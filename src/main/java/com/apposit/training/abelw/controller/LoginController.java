package com.apposit.training.abelw.controller;

import com.apposit.training.abelw.service.GoogleServiceHandler;
import com.google.api.client.auth.oauth2.Credential;
import com.google.api.client.googleapis.auth.oauth2.GoogleAuthorizationCodeFlow;
import com.google.api.client.googleapis.auth.oauth2.GoogleAuthorizationCodeRequestUrl;
import com.google.api.client.googleapis.auth.oauth2.GoogleClientSecrets;
import com.google.api.client.googleapis.auth.oauth2.GoogleTokenResponse;
import com.google.api.client.http.HttpTransport;
import com.google.api.client.http.javanet.NetHttpTransport;
import com.google.api.client.json.jackson2.JacksonFactory;
import com.google.api.client.util.store.FileDataStoreFactory;
import com.google.api.services.drive.DriveScopes;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.core.io.Resource;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import javax.annotation.PostConstruct;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.InputStreamReader;
import java.util.Collections;
import java.util.List;

@Controller
public class LoginController {

    @Autowired
    GoogleServiceHandler googleServiceHandler;
    @GetMapping("/login")
    public String loginPage(){
        return "login";
    }

    @PostConstruct
    public void init() throws Exception{
        GoogleClientSecrets secrets = GoogleClientSecrets.load(GoogleServiceHandler.JSON_FACTORY,
                new InputStreamReader(googleServiceHandler.gdSecretKeys.getInputStream()));
        googleServiceHandler.flow = new GoogleAuthorizationCodeFlow.Builder(GoogleServiceHandler.HTTP_TRANSPORT,
                GoogleServiceHandler.JSON_FACTORY,
                secrets,
                GoogleServiceHandler.SCOPES)
                .setDataStoreFactory(new FileDataStoreFactory(googleServiceHandler.credentialsFolder.getFile())).build();
    }

    @GetMapping("/")
    public String showHomePage() throws Exception{
        boolean isUserAuthenticated = false;

        Credential credential = googleServiceHandler.flow.loadCredential(GoogleServiceHandler.USER_IDENTIFIER_KEY);
        if (credential != null){
            boolean tokenValid = credential.refreshToken();

            if (tokenValid){
                isUserAuthenticated = true;
            }
        }

        return isUserAuthenticated?"home":"login";
    }

    @GetMapping("/googlesignin")
    public void doGoogleSignIn(HttpServletResponse response) throws Exception{
        GoogleAuthorizationCodeRequestUrl url = googleServiceHandler.flow.newAuthorizationUrl();
        String redirectURL = url.setRedirectUri(googleServiceHandler.CALLBACK_URI).setAccessType("offline").build();
        response.sendRedirect(redirectURL);
    }

    @GetMapping("/oauth")
    public String saveAuthorizationCode(HttpServletRequest request) throws Exception{
        String code = request.getParameter("code");
        if (code!=null){
            googleServiceHandler.saveToken(code);
            System.out.println("Saved!");
            return "redirect:/user/";
        }
        return "login";
    }



}
