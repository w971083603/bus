package com.platform.commons.utils;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;

import com.google.common.io.Files;
import org.apache.commons.io.FileUtils;
import org.springframework.web.multipart.MultipartFile;

/**
 * 上传文件
 * 创建人：cyr
 * 创建时间：2014年12月23日
 */
public class FileUpload {

    /**
     * @param file     //文件对象
     * @param filePath //上传路径
     * @param fileName //文件名
     * @return 文件名
     */
    public static String fileUp(MultipartFile file, String filePath, String fileName) {
        String extName = ""; // 扩展名格式：
        try {
            if (file.getOriginalFilename().lastIndexOf(".") >= 0) {
                extName = file.getOriginalFilename().substring(file.getOriginalFilename().lastIndexOf("."));
            }
            copyFile(file.getInputStream(), filePath, fileName + extName).replaceAll("-", "");
        } catch (IOException e) {
            System.out.println(e);
            e.printStackTrace();
        }
        return fileName + extName;
    }

    /**
     * 写文件到当前目录的upload目录中
     *
     * @param in
     * @param dir
     * @param realName
     * @return
     */
    public static String copyFile(InputStream in, String dir, String realName) {
        try {
            File file = new File(dir, realName);
            if (!file.exists()) {
                if (!file.getParentFile().exists()) {
                    file.getParentFile().mkdirs();
                }
                file.createNewFile();
            }
            FileUtils.copyInputStreamToFile(in, file);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return realName;
    }


    /**
     * 复制文件
     * @param oldUrl
     * @param newUrl
     * @param fileName
     * @return
     */
    public static String copyFileTwo(String oldUrl, String newUrl, String fileName) throws IOException {
        File oldFile = new File(oldUrl);
        InputStream targetStream = Files.asByteSource(oldFile).openStream();
        copyFile(targetStream, newUrl, fileName);
        return fileName;
    }


    /**
     * 新建文件夹
     * @param newUrl
     */
    public static String addParentFile(String newUrl) throws IOException {
        File file=new File(newUrl);
        if (!file.exists()) {
            if (!file.getParentFile().exists()) {
                file.getParentFile().mkdirs();
            }
            file.createNewFile();
        }
        return newUrl;
    }

    /**
     * 删除文件夹
     * @param path
     * @return
     */
    public static boolean delAllFile(String path) {
        boolean flag = false;
        File file = new File(path);
        if (!file.exists()) {
            return flag;
        }
        if (!file.isDirectory()) {
            return flag;
        }
        String[] tempList = file.list();
        File temp = null;
        for (int i = 0; i < tempList.length; i++) {
            if (path.endsWith(File.separator)) {
                temp = new File(path + tempList[i]);
            } else {
                temp = new File(path + File.separator + tempList[i]);
            }
            if (temp.isFile()) {
                temp.delete();
            }
            if (temp.isDirectory()) {
                delAllFile(path + "/" + tempList[i]);//先删除文件夹里面的文件
                delFolder(path + "/" + tempList[i]);//再删除空文件夹
                flag = true;
            }
        }
        return flag;
    }

    /**
     * 删除文件
     * @param folderPath
     */
    public static void delFolder(String folderPath) {
        try {
            delAllFile(folderPath); //删除完里面所有内容
            String filePath = folderPath;
            filePath = filePath.toString();
            java.io.File myFilePath = new java.io.File(filePath);
            myFilePath.delete(); //删除空文件夹
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
