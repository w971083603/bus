package com.platform.commons.utils;


import org.joda.time.DateTime;
import org.springframework.util.StringUtils;

import java.io.File;
import java.io.FileOutputStream;
import java.io.UnsupportedEncodingException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.text.DecimalFormat;
import java.util.Random;
import java.util.UUID;

public final class Util {


    public static Integer randomInteger(int max) {
        Random random = new Random();
        return random.nextInt(max);
    }

    public static Integer randomInteger(int min, int max) {
        Random random = new Random();
        return random.nextInt(max) % (max - min + 1) + min;
    }

    public static String newRxOrderNumber() {
        int captcha = (int) (Math.random() * (9999999 - 1000000 + 1)) + 1000000; //产生10000-99999的随机数
        return  String.valueOf(captcha);
    }


    /**
     * 生成user的uuid
     **/
    public static String newUuid() {
        return UUID.randomUUID().toString().replaceAll("-", "");
    }

    /**
     * 生成water的uuid
     **/
    public static String newWaterUuid(String id) {
        return new DateTime().toString("yyyyMMddhhmmss")
                + new DecimalFormat("0000000000").format(Integer.parseInt(id))
                + randomInteger(123456, 999999);
    }

    public static String md5(String str) {
        MessageDigest messageDigest = null;
        try {
            messageDigest = MessageDigest.getInstance("MD5");
            messageDigest.reset();
            messageDigest.update(str.getBytes("GB2312"));
        } catch (NoSuchAlgorithmException e) {
            System.out.println("NoSuchAlgorithmException caught!");
            System.exit(-1);
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }

        byte[] byteArray = messageDigest.digest();

        StringBuffer md5StrBuff = new StringBuffer();

        for (int i = 0; i < byteArray.length; i++) {
            if (Integer.toHexString(0xFF & byteArray[i]).length() == 1)
                md5StrBuff.append("0").append(Integer.toHexString(0xFF & byteArray[i]));
            else
                md5StrBuff.append(Integer.toHexString(0xFF & byteArray[i]));
        }
        return md5StrBuff.toString();
    }


    /**
     * 校验图片格式
     *
     * @param filename
     * @return
     */
    public static boolean isImageFile(String filename) {
        // 校验图片格式
        boolean isLegal = false;
        for (String type : new String[]{".bmp", ".jpg", ".jpeg", ".gif", ".png"}) {
            if (StringUtils.endsWithIgnoreCase(filename, type)) {
                isLegal = true;
                break;
            }
        }
        return isLegal;
    }
    /**
     * 校验图片格式
     *
     * @param userId
     * @return
     */
    public static String fileName(String userId) {
        return new DateTime().toString("yyyyMMddhhmmss") + userId + ".png";
    }

    public static void uploadFile(byte[] file, String filePath, String fileName) throws Exception {
        File targetFile = new File(filePath);
        if (!targetFile.exists()) {
            targetFile.mkdirs();
        }
        FileOutputStream out = new FileOutputStream(filePath + fileName);
        out.write(file);
        out.flush();
        out.close();
    }
}
