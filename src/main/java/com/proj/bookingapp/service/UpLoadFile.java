package com.proj.bookingapp.service;

import com.proj.bookingapp.utils.S3Util;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Date;
import java.util.List;

@MultipartConfig
public class UpLoadFile {
    public static List<String> upLoad(Collection<Part> parts, String appPath) throws IOException, ServletException {
        String SAVE_DIRECTORY = "images";

        String fullSavePath=null;
        if (appPath.endsWith("/") || appPath.endsWith("\\")) {
            fullSavePath = appPath + SAVE_DIRECTORY;
        } else {
            fullSavePath = appPath + "/" + SAVE_DIRECTORY;
        }
        File fileSaveDir = new File(fullSavePath);
        if (!fileSaveDir.exists()) {
            fileSaveDir.mkdir();
        }
        String temp="";
        List<String> listFileName= new ArrayList<>();
        String fileName ="";
        for (Part part : parts) {
            fileName = extractFileName(part);
            if (fileName != null && fileName.length() > 0) {
                String temp1= generateFileName(fileName);
                String filePath = fullSavePath + File.separator + temp1;
                //listFileName.add(generateFileName(fileName));
                System.out.println("Write attachment to file: " + filePath);
                part.write(filePath);
                temp= S3Util.upload(generateFileName(fileName),filePath);
                System.out.println(temp);
                if (temp!=null){
                    listFileName.add(temp);
                }
                else {
                    System.out.println("Upload img to S3 fail");
                }

            }

        }
        return listFileName;
    }
    private static String extractFileName(Part part) {

        String contentDisp = part.getHeader("content-disposition");
        String[] items = contentDisp.split(";");
        for (String s : items) {
            if (s.trim().startsWith("filename")) {

                String clientFileName = s.substring(s.indexOf("=") + 2, s.length() - 1);
                clientFileName = clientFileName.replace("\\", "/");
                int i = clientFileName.lastIndexOf('/');

                return clientFileName.substring(i + 1);
            }
        }
        return null;
    }
    private static String generateFileName(String name ) {
        return new Date().getTime() + "-" + name.replace(" ", "_");
    }

}
