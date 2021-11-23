package com.proj.bookingapp.service;

import javax.servlet.http.Part;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.util.Date;

public class UpLoadFile {
    public static String upLoad(String realPath, String fileName, Part part) throws IOException {
        if (!Files.exists(Path.of(realPath))){
            Files.createDirectories(Path.of(realPath));
        }
        fileName = generateFileName(fileName);
        part.write(realPath+"/"+fileName);
        return fileName;
    }
    private static String generateFileName(String name ) {
        return new Date().getTime() + "-" + name.replace(" ", "_");
    }

}
