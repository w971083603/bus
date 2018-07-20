package com.platform.commons.utils.sms;/**
 * 杭州猜一猜网络科技有限公司
 * 浪子
 * 2018/7/50:51
 */

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.google.common.collect.Maps;
import com.platform.commons.utils.DateUtil;
import com.platform.commons.utils.HttpClientUtil;
import com.platform.commons.utils.StringUtils;
import com.platform.commons.utils.sms.request.SmsSendRequest;
import com.platform.commons.utils.sms.response.SmsSendResponse;
import com.platform.commons.utils.sms.util.ChuanglanSmsUitl;

import java.util.Date;
import java.util.Map;

/**
 *
 *
 *
 * 杭州猜一猜网络科技有限公司
 * 浪子
 * 2018/7/50:51
 */
public class SendSmsUtil {
    public static String smsSingleRequestServerUrl = "http://api.niubaifa.com/api/send";
    public static final String charset = "utf-8";
    // 用户平台API账号(非登录账号,示例:N1234567)
    public static String account = "hzyuwo";
    // 用户平台API密码(非登录密码)
    public static String pswd = "hzyuwo";

    public static JSONObject sendSms(String msg,String phone) {
        Map<String,Object> map = Maps.newHashMap();
        long time = new Date().getTime();
        String key = StringUtils.getMD5Str(String.valueOf(time) + pswd + account);
        map.put("timestamp",time);
        map.put("key",key);
        map.put("user_name",account);
        map.put("message",msg);
        map.put("mobile",phone);
        String param = JSONObject.toJSONString(map);
        String result = HttpClientUtil.postJson(smsSingleRequestServerUrl,param);
        JSONObject jsonObject = JSONObject.parseObject(result);
      /*  System.out.println("before request string is: " + requestJson);

        String response = ChuanglanSmsUitl.sendSmsByPost(smsSingleRequestServerUrl, requestJson);

        System.out.println("response after request result is :" + response);

        SmsSendResponse smsSingleResponse = JSON.parseObject(response, SmsSendResponse.class);*/
        return  jsonObject;
    }
}
