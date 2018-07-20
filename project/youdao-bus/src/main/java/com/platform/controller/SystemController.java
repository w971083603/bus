package com.platform.controller;

import com.alibaba.fastjson.JSONObject;
import com.platform.result.DatatablesResult;
import com.platform.service.ISystemService;
import com.platform.service.IUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpSession;
import java.io.IOException;


/**
 * Created by Administrator on 2017/8/8.
 * Description: *_*
 */

@RestController
@RequestMapping("/system")
public class SystemController extends BaseController {

    @Autowired
    private ISystemService systemService;

    /**
     * 消息列表==============================================
     *
     * @param params
     * @return
     */
    @RequestMapping(value = "/system/dataGridMessage", method = RequestMethod.POST)
    public ResponseEntity<DatatablesResult> dataGridMessage(@RequestBody JSONObject params) {
        int rows = params.getIntValue("length");
        int start = params.getIntValue("start");
        int draw = params.getIntValue("draw");
        int page = (start / rows) + 1;
        try {
            DatatablesResult datatablesResult = this.systemService.dataGridMessage(params, page, rows, draw);
            return ResponseEntity.ok(datatablesResult);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(null);
    }


    /**
     * 問題反饋列表==============================================
     *
     * @param params
     * @return
     */
    @RequestMapping(value = "/system/dataGridProblem", method = RequestMethod.POST)
    public ResponseEntity<DatatablesResult> dataGridProblem(@RequestBody JSONObject params) {
        int rows = params.getIntValue("length");
        int start = params.getIntValue("start");
        int draw = params.getIntValue("draw");
        int page = (start / rows) + 1;
        try {
            DatatablesResult datatablesResult = this.systemService.dataGridProblem(params, page, rows, draw);
            return ResponseEntity.ok(datatablesResult);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(null);
    }



}
