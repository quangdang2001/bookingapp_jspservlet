package com.proj.bookingapp.utils;

import com.amazonaws.AmazonClientException;
import com.amazonaws.AmazonServiceException;
import com.amazonaws.auth.BasicAWSCredentials;
import com.amazonaws.services.s3.AmazonS3;
import com.amazonaws.services.s3.AmazonS3Client;
import com.amazonaws.services.s3.model.CannedAccessControlList;
import com.amazonaws.services.s3.model.DeleteObjectRequest;
import com.amazonaws.services.s3.model.PutObjectRequest;

import java.io.File;
import java.io.IOException;

public class S3Util {
    private static String awsId="AKIA5QHSOL46OJJPU2WO";
    private static String awsKey="QFL+NFwL1ziMvd7WMtcqXm3wdUUzCzKYwtUs0jco";
    private static String bucketName="bookingappltw";
    private static String urlReturn;
    private final static AmazonS3 s3client = new AmazonS3Client(new BasicAWSCredentials(awsId, awsKey));

    public static String upload(String fileName, String pathFile) throws IOException {

        try {
            File file = new File(pathFile);
            s3client.putObject(new PutObjectRequest(bucketName, fileName, file)
                    .withCannedAcl(CannedAccessControlList.PublicRead));

            return  "https://"+ bucketName + ".s3.amazonaws.com/" + fileName;
        } catch (AmazonServiceException e) {
            System.out.println("AmazonServiceException: "+ e.getMessage());
        } catch (AmazonClientException ace) {
            System.out.println("AmazonClientException: "+ ace.getMessage());
        }
        return null;
    }
    public static boolean deleteObj(String name){
        try {
            name = name.substring(name.lastIndexOf("/")+1);
            s3client.deleteObject(new DeleteObjectRequest(bucketName,name));
            return true;
        }catch (AmazonServiceException e){
            System.out.println(e.getMessage());
            return false;
        }
    }
}
