package com.platform.quartz;

import com.alibaba.fastjson.JSONObject;
import com.platform.commons.utils.DateUtil;
import com.platform.commons.utils.PageData;
import com.platform.commons.utils.sms.SendSmsUtil;
import com.platform.mapper.MessageMapper;
import com.platform.mapper.OrderMapper;
import com.platform.mapper.UserMapper;
import lombok.extern.slf4j.Slf4j;
import org.apache.shiro.crypto.hash.Hash;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import javax.annotation.Resource;
import java.text.DateFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Slf4j
@Component
public class orderJob {

    @Resource
    private OrderMapper orderMapper;

    @Autowired
    private UserMapper userMapper;


    @Resource
    private MessageMapper messageMapper;

    /**
     * 订单的定时通知处理
     */
    @Scheduled(fixedDelay = 60 * 1000)
    public void notifyJob() {
        System.out.println("进入定时器" + DateUtil.getTime());
        long nowTime = System.currentTimeMillis();
        PageData pd = new PageData();
        pd.put("status", "1");
        List<PageData> list = orderMapper.selectByStatus(pd);
        Map<String, String> map = new HashMap<>();
        map.put("type", "2");
        for (PageData orderpd : list) {
            String orderUuid = orderpd.getString("orderUuid");
            String createTimeStr = orderpd.get("createTime").toString();
            long createTime = DateUtil.fomatDate2(createTimeStr).getTime();

            System.out.println("订单号：" + orderUuid + "**创建时间" + createTime + "》》》》》现在时间" + nowTime);

            if (nowTime - createTime > 5 * 60 * 1000) {
                //修改状态对超过5分钟未报价的订单系统提示后台管理介入人工处理
                String message = "【道巴士】" + "订单【" + orderUuid + "】无人报价中,请前往处理";
                List<PageData> listSystem = userMapper.selectList(map);
                for (PageData sysPd : listSystem) {
                    String phone = sysPd.getString("phone");
                    JSONObject sms = SendSmsUtil.sendSms(message, phone);
                    if (sms.getString("code").equals("0")) {
                        continue;
                    }
                }
                orderMapper.update("2", orderpd.getString("uuid"), orderUuid);
            } else if (nowTime - createTime > 4 * 60 * 1000) {
                //修改状态对超过4分钟未报价的订单平台对车队管理人员手机发短信提示
                String message = "【道巴士】" + "订单【" + orderUuid + "】正在报价中,请前往参加";
                List<PageData> listFleet = userMapper.selectListBus(map);
                for (PageData fleetPd : listFleet) {
                    String tel = fleetPd.getString("tel");
                    JSONObject sms = SendSmsUtil.sendSms(message, tel);
                    if (sms.getString("code").equals("0")) {
                        pd.put("message", message);
                        pd.put("uuid", fleetPd.getString("userUuid"));
                        messageMapper.save(pd);
                    }
                }
            } else {
                continue;
            }
        }


    }

}