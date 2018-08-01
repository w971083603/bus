package com.platform.controller;

import com.alibaba.fastjson.JSONObject;
import com.google.common.base.Strings;
import com.google.common.collect.Lists;
import com.google.common.collect.Maps;
import com.platform.commons.utils.*;
import com.platform.commons.utils.sms.SendSmsUtil;
import com.platform.commons.utils.sms.response.SmsSendResponse;
import com.platform.mapper.MessageMapper;
import com.platform.mapper.OrderMapper;
import com.platform.mapper.UserMapper;
import com.platform.result.DatatablesResult;
import com.platform.service.IOrderService;
import com.platform.service.IUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.AbstractUrlBasedView;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


/**
 * Created by Administrator on 2017/8/8.
 * Description: *_*
 */

@RestController
@RequestMapping("/order")
public class OrderController extends BaseController {


    @Resource
    private IOrderService orderService;

    @Resource
    private OrderMapper orderMapper;

    @Resource
    private UserMapper userMapper;

    @Resource
    private MessageMapper messageMapper;

    private String msgHeader = "【道巴士】";

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
            DatatablesResult datatablesResult = this.orderService.selectList(params, page, rows, draw);
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
            int n = orderMapper.updateByOrderUuid(pd);
            if (n == 0) return ResponseEntity.ok(ResponseWrapper.failed(-1, "订单报价失败"));

            String fleetUserUuid = pd.getString("fleetUserUuid");
            String amount = pd.getString("amount");
            String status = pd.getString("status");
            List<PageData> orderFleetList = orderMapper.selectAllFleetByOrderUuid(pd);
            if(status.equals("2") && orderFleetList.size() == 0){
                if(Strings.isNullOrEmpty(fleetUserUuid)){
                    return ResponseEntity.ok(ResponseWrapper.failed(-1, "订单报价车队不能为空"));
                }
                if(Strings.isNullOrEmpty(amount)){
                    return ResponseEntity.ok(ResponseWrapper.failed(-1, "订单报价金额不能为空"));
                }
                pd.put("userUuid", pd.getString("fleetUserUuid"));
                pd.put("amount", amount);
                int nfleet = orderMapper.insertFleetAmount(pd);
                if(nfleet == 0)  return ResponseEntity.ok(ResponseWrapper.failed(-1, "订单报价失败"));
            }
            PageData userPd = userMapper.selectByUuid(pd.getString("uuid"));
            String tel = userPd.getString("tel");
            String msg = msgHeader + "平台已对订单号【" + pd.getString("orderUuid") +"】进行操作。";
            JSONObject sms = SendSmsUtil.sendSms(msg, tel);
            if (sms.getString("code").equals("0")) {
                pd.put("message",msg);
                messageMapper.save(pd);
//                smsCodeMapper.insert(tel, messageCode, type);
            } else {
                return ResponseEntity.ok(ResponseWrapper.failed(-1, "短信发送失败"));
            }
        } catch (Exception e) {
            e.printStackTrace();
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(e.getMessage());
        }
        return ResponseEntity.ok(result);
    }

    /**
     * 上传图片
     *
     * @param files 文件
     * @return
     */
    @RequestMapping(value = "/saveImage", method = RequestMethod.POST)
    public ResponseEntity saveImage(
            @RequestParam(value = "upLoadImage", required = false) MultipartFile[] files
    ) {
        String imageUrl = "";
        ResponseWrapper result;
        try {
            if (files != null && files.length > 0) {
                //循环获取file数组中得文件
                int n = files.length;
                for (int i = 0; i < n; i++) {
                    MultipartFile file = files[i];
                    //保存文件
                    String filePath = SystemConfig.getInstance().getABSOLUTELY_URL();                    //头像上传路径相对地址
                    System.out.println("下载路径" + filePath);
                    String fileName = FileUpload.fileUp(file, filePath, StringUtils.getUUId());                    //执行上传
                    System.out.println("地址" + fileName);
                    String newUrl = SystemConfig.getInstance().getURL_BASE_IMG() + fileName;    //设置头像路径（域名+名称）
                    System.out.println("上传后的路径:" + newUrl);
                    if (n > 1) {
                        imageUrl = imageUrl + "," + newUrl;
                    } else {
                        imageUrl = newUrl;
                    }
                }
                result = ResponseWrapper.succeed(imageUrl);
            } else {
                result = ResponseWrapper.failed(-1, "上传失败");
            }
        } catch (Exception e) {
            result = ResponseWrapper.failed(-1, "上传失败");
        }
        return ResponseEntity.ok(result);
    }

}
