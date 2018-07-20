package com.platform.controller;

import com.alibaba.fastjson.JSONObject;
import com.platform.commons.utils.PageData;
import com.platform.commons.utils.ResponseWrapper;
import com.platform.commons.utils.StringUtils;
import com.platform.commons.utils.sms.SendSmsUtil;
import com.platform.mapper.FleetMapper;
import com.platform.mapper.MessageMapper;
import com.platform.mapper.OrderMapper;
import com.platform.mapper.UserMapper;
import com.platform.result.DatatablesResult;
import com.platform.service.IFleetService;
import com.platform.service.IOrderService;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
import java.io.IOException;


/**
 * Created by Administrator on 2017/8/8.
 * Description: *_*
 */

@RestController
@RequestMapping("/fleet")
public class FleetController extends BaseController {


    @Resource
    private IFleetService fleetService;

    @Resource
    private FleetMapper fleetMapper;

    @Resource
    private UserMapper userMapper;

    @Resource
    private MessageMapper messageMapper;

    private String msgHeader = "【有道巴士】";

    /**
     * 订单列表：type，status
     *
     * @param params
     * @return
     */
    @RequestMapping(value = "/system/dataGrid", method = RequestMethod.POST)
    public ResponseEntity<DatatablesResult> zhdataGrid(@RequestBody JSONObject params) {
        int rows = params.getIntValue("length");
        int start = params.getIntValue("start");
        int draw = params.getIntValue("draw");
        int page = (start / rows) + 1;
        try {
            DatatablesResult datatablesResult = this.fleetService.selectList(params, page, rows, draw);
            return ResponseEntity.ok(datatablesResult);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(null);
    }


    /**
     * 修改订单状态
     *
     * @return
     * @throws IOException
     */
    @RequestMapping(value = "/system/audit", method = RequestMethod.POST)
    public ResponseEntity audit() throws IOException {
        ResponseWrapper result = ResponseWrapper.succeed(true);
        try {
            PageData pd = this.getPageData();
            int n = fleetMapper.updateById(pd);
            if (n == 0) return ResponseEntity.ok(ResponseWrapper.failed(-1, "车队审核失败"));
            PageData fleetPd = fleetMapper.findById(pd.getString("id"));
            String tel = fleetPd.getString("tel");
            String msg = "";
            if (pd.getString("status").equals("2")) {
                msg = msgHeader + "您的车队已审核通过。";
            } else if(pd.getString("status").equals("3")){
                msg = msgHeader + "您的车队审核不通过，原因【" + pd.getString("auditRemarks") + "】。";
            }
            if (!StringUtils.isEmpty(msg)) {
                JSONObject sms = SendSmsUtil.sendSms(msg, tel);
                if (sms.getString("code").equals("0")) {
                    pd.put("message",msg);
                    messageMapper.save(pd);
                } else {
                    return ResponseEntity.ok(ResponseWrapper.failed(-1, "短信发送失败"));
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(e.getMessage());
        }
        return ResponseEntity.ok(result);
    }

}
