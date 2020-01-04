package com.apposit.training.abelw.service;

import com.apposit.training.abelw.model.Video;
import com.google.api.client.auth.oauth2.Credential;
import com.google.api.client.googleapis.auth.oauth2.GoogleAuthorizationCodeFlow;
import com.google.api.client.googleapis.auth.oauth2.GoogleClientSecrets;
import com.google.api.client.googleapis.auth.oauth2.GoogleTokenResponse;
import com.google.api.client.http.FileContent;
import com.google.api.client.http.HttpTransport;
import com.google.api.client.http.javanet.NetHttpTransport;
import com.google.api.client.json.jackson2.JacksonFactory;
import com.google.api.client.util.store.FileDataStoreFactory;
import com.google.api.services.drive.Drive;
import com.google.api.services.drive.DriveScopes;
import com.google.api.services.drive.model.File;
import com.google.api.services.drive.model.FileList;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.core.io.Resource;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.PostConstruct;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;

@Service
public class GoogleServiceHandler {
    public static HttpTransport HTTP_TRANSPORT = new NetHttpTransport();
    public static JacksonFactory JSON_FACTORY = JacksonFactory.getDefaultInstance();
    public static final List<String> SCOPES = Collections.singletonList(DriveScopes.DRIVE);
    public static final String USER_IDENTIFIER_KEY = "MY_DUMMY_USER";

    @Value("${google.oauth.callback.uri}")
    public String CALLBACK_URI;

    @Value("${google.secret.key.path}")
    public Resource gdSecretKeys;

    @Value("${google.credentials.folder.path}")
    public Resource credentialsFolder;

    @Value("${google.drive.folder.id}")
    public String googleDriveImageFolderId;

    public GoogleAuthorizationCodeFlow flow;

    public Drive drive;
   @PostConstruct
    public void init() throws Exception{
       GoogleClientSecrets secrets = GoogleClientSecrets.load(GoogleServiceHandler.JSON_FACTORY,
               new InputStreamReader(gdSecretKeys.getInputStream()));
       flow = new GoogleAuthorizationCodeFlow.Builder(GoogleServiceHandler.HTTP_TRANSPORT,
               GoogleServiceHandler.JSON_FACTORY,
               secrets,
               GoogleServiceHandler.SCOPES)
               .setDataStoreFactory(new FileDataStoreFactory(credentialsFolder.getFile())).build();

       Credential credential = flow.loadCredential(GoogleServiceHandler.USER_IDENTIFIER_KEY);

       drive = new Drive.Builder(HTTP_TRANSPORT,JSON_FACTORY, credential).setApplicationName("videorentalwebapp").build();
    }


    public void saveToken(String code) throws Exception{
        GoogleTokenResponse response = flow.newTokenRequest(code).setRedirectUri(CALLBACK_URI).execute();
        flow.createAndStoreCredential(response, USER_IDENTIFIER_KEY);
    }

    public FileList getListOfImages(Drive drive){
        FileList list = new FileList();
        try {

             list = drive.files().list()
                    .setQ("'1H7GR8Fv4KaUbYWFFZqgWrXoQ-QHyebVP' in parents and mimeType != 'application/vnd.google-apps.folder' and trashed = false")
                    .setSpaces("drive")
                    .setFields("files(id,name,thumbnailLink)").execute();
        }catch (IOException e){

        }
        return list;
    }

    public File getImageLink(List<File> result, int id, String name,  List<Video> videoList){
        File file = result.stream().filter(x -> {
            if (x.getName().equalsIgnoreCase(name)){
                System.out.println("Name : " + name + " = " + x.getThumbnailLink() );
                videoList.get(id).setImage_uri(x.getThumbnailLink());
                return true;
            }
            return false;
        }).findAny().orElse(null);

        return file;
    }


    public boolean saveImage(MultipartFile file, java.io.File convert) {
        File fileMetadata = new File();
        fileMetadata.setName(file.getOriginalFilename());
        fileMetadata.setParents(Arrays.asList(googleDriveImageFolderId));
        FileContent mediaContent = new FileContent("image/*", convert);
        try {
            drive.files().create(fileMetadata, mediaContent).setFields("id").execute();
            return true;
        }catch (IOException e){

        }
        return false;
    }
}
