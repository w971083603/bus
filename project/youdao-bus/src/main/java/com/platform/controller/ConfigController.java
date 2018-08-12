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
     * 订单列表：type，status
     *
     * @param params
     * @return
     */
    @RequestMapping(value = "/system/dataGrid", method = RequestMethod.POST)
    public ResponseEntity zhdataGrid(@RequestBody JSONObject params) {
        ResponseWrapper result;
        try {
            //将角色集合存到session
            PageData configPd = configMapper.select();
            result = ResponseWrapper.succeed(configPd);
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(e.getMessage());
        }
        return ResponseEntity.ok(result);
    }

    @RequestMapping(value = "/system/insert", method = RequestMethod.POST)
    public ResponseEntity addRole() {
        ResponseWrapper result;
        try {
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
            result = ResponseWrapper.succeed(true);
        } catch (Exception e) {
            e.printStackTrace();
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(e.getMessage());
        }
        return ResponseEntity.ok(result);
    }


}
