package com.platform.controller;

import com.alibaba.fastjson.JSONObject;
import com.google.common.base.Strings;
import com.platform.commons.utils.*;
import com.platform.commons.utils.sms.SendSmsUtil;
import com.platform.mapper.ConfigMapper;
import com.platform.mapper.MessageMapper;
import com.platform.mapper.OrderMapper;
import com.platform.mapper.UserMapper;
import com.platform.result.DatatablesResult;
import com.platform.service.IOrderService;
import org.apache.commons.collections.CollectionUtils;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import java.io.IOException;
import java.util.Collection;
import java.util.List;


/**
 * Created by Administrator on 2017/8/8.
 * Description: *_*
 */

@RestController
@RequestMapping("/config")
public class ConfigController extends BaseController {


    @Resource
    private ConfigMapper configMapper;

    /**
     * 获取车队更新时间
     *
     * @return
     */
    @RequestMapping(value = "/system/getFleetTime", method = RequestMethod.POST)
    public Object getFleetTime() {
        PageData configPd = configMapper.select();
        return configPd;
    }

    @RequestMapping(value = "/system/insert", method = RequestMethod.POST)
    public Object insert() {
        PageData pd = this.getPageData();
        Integer minute = pd.getInteger("minute");
        PageData configPd = configMapper.select();
        Integer id;
        if (configPd != null) {
            id = configPd.getInteger("id");
            configMapper.update(minute, id);
        } else {
            configMapper.insert(minute);
        }
        return true;
    }


}
