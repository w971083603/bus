package com.platform.quartz;

 import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

@Slf4j
@Component
public class orderJob {


    /**
     * 订单的定时通知处理
     */
    @Scheduled(cron = "0 0/1 * * * ?")
    public void notifyJob() {

    }

}
