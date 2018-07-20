package com.platform.commons.utils.sms;

import org.apache.commons.httpclient.HttpClient;
import org.apache.commons.httpclient.HttpStatus;
import org.apache.commons.httpclient.NameValuePair;
import org.apache.commons.httpclient.URI;
import org.apache.commons.httpclient.methods.GetMethod;

import java.io.ByteArrayOutputStream;
import java.io.InputStream;
import java.net.URLEncoder;

public class HttpSender {
    public static void main(String[] args) {
        getCodeSms("13616524441","12345");
    }

    public static boolean  getCodeSms(String phone, String code){
        String url = "http://222.73.117.158/msg/";// 应用地址
        String account = "chongwu123";// 账号
        String pswd = "Chongwu123";// 密码
        String mobile = phone;// 手机号码，多个号码使用","分割
        String msg = "您好，您的验证码是" + code;// 短信内容
        String product = "";
        boolean needstatus = true;// 是否需要状态报告，需要true，不需要false
        String extno = null;// 扩展码
        try {
            String returnString = HttpSender.batchSend(url, account, pswd, mobile, msg, needstatus, product, extno);
            System.out.println("短信返回验证码" + returnString);
            // TODO 处理返回值,参见HTTP协议文档


        } catch (Exception e) {
            // TODO 处理异常
            e.printStackTrace();
        }
        return  true;
    }



    /**
     * @param url        应用地址，类似于http://ip:port/msg/
     * @param account    账号
     * @param pswd       密码
     * @param mobile     手机号码，多个号码使用","分割
     * @param msg        短信内容
     * @param needstatus 是否需要状态报告，需要true，不需要false
     * @return 返回值定义参见HTTP协议文档
     * @throws Exception
     */
    public static String batchSend(String url, String account, String pswd, String mobile, String msg,
                                   boolean needstatus, String product, String extno) throws Exception {
        HttpClient client = new HttpClient();
        GetMethod method = new GetMethod();
        try {
            URI base = new URI(url, false);
            method.setURI(new URI(base, "HttpBatchSendSM", false));
            method.setQueryString(new NameValuePair[]{
                    new NameValuePair("account", account),
                    new NameValuePair("pswd", pswd),
                    new NameValuePair("mobile", mobile),
                    new NameValuePair("needstatus", String.valueOf(needstatus)),
                    new NameValuePair("msg", msg),
                    new NameValuePair("product", product),
                    new NameValuePair("extno", extno),
            });
            int result = client.executeMethod(method);
            if (result == HttpStatus.SC_OK) {
                InputStream in = method.getResponseBodyAsStream();
                ByteArrayOutputStream baos = new ByteArrayOutputStream();
                byte[] buffer = new byte[1024];
                int len = 0;
                while ((len = in.read(buffer)) != -1) {
                    baos.write(buffer, 0, len);
                }
                return URLEncoder.encode(baos.toString(), "UTF-8");
            } else {
                throw new Exception("HTTP ERROR Status: " + method.getStatusCode() + ":" + method.getStatusText());
            }
        } finally {
            method.releaseConnection();
        }

    }


}
