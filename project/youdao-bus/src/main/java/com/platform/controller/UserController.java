package com.platform.controller;

import com.alibaba.fastjson.JSONObject;
import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.platform.commons.utils.*;
import com.platform.mapper.OrderMapper;
import com.platform.mapper.RoleMapper;
import com.platform.mapper.UserMapper;
import com.platform.result.DatatablesResult;
import com.platform.service.IUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
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
@RequestMapping("/user")
public class UserController extends BaseController {

    @Autowired
    private IUserService userService;

    @Autowired
    private UserMapper userMapper;

    @Autowired
    private RoleMapper roleMapper;

    /**
     * 账号列表==============================================
     *
     * @param params
     * @return
     */
    @RequestMapping(value = "/system/dataGrid", method = RequestMethod.POST)
    public ResponseEntity<DatatablesResult> dataGrid(@RequestBody JSONObject params) {
        int rows = params.getIntValue("length");
        int start = params.getIntValue("start");
        int draw = params.getIntValue("draw");
        int page = (start / rows) + 1;
        try {
            DatatablesResult datatablesResult = this.userService.selectList(params, page, rows, draw);
            return ResponseEntity.ok(datatablesResult);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(null);
    }

  /**
     * 客服列表==============================================
     *
     * @param params
     * @return
     */
    @RequestMapping(value = "/system/dataGridKf", method = RequestMethod.POST)
    public ResponseEntity<DatatablesResult> dataGridKf(@RequestBody JSONObject params) {
        int rows = params.getIntValue("length");
        int start = params.getIntValue("start");
        int draw = params.getIntValue("draw");
        int page = (start / rows) + 1;
        try {
            params.put("roleId","2");
            DatatablesResult datatablesResult = this.userService.selectList(params, page, rows, draw);
            return ResponseEntity.ok(datatablesResult);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(null);
    }


    /**
     * 判断当前登录账号是否可以新增
     *
     * @param loginNumber
     * @return
     * @throws IOException
     */
    @RequestMapping(value = "/system/loginNameIsHave", method = RequestMethod.POST)
    public ResponseEntity updateUserForXt(String loginNumber) {
        ResponseWrapper result = ResponseWrapper.succeed(true);
        try {
            PageData pd = userMapper.selectByLoginName(loginNumber);
            if (pd != null)  result = ResponseWrapper.failed(-1, "当前账户已存在");
        } catch (Exception e) {
            e.printStackTrace();
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(e.getMessage());
        }
        return ResponseEntity.ok(result);
    }


    /**
     * 新增管理账户的信息
     *
     * @return
     * @throws IOException
     */
    @RequestMapping(value = "/system/addUser", method = RequestMethod.POST)
    public ResponseEntity addUserForXt() {
        ResponseWrapper result = ResponseWrapper.succeed(true);
        try {
            PageData pd = this.getPageData();
            pd.put("password", StringUtils.getMD5Str(pd.getString("password")));
            pd.put("code", StringUtils.get5NUmber());
            int n = userMapper.saveUser(pd);
            if (n == 0) {
                result = ResponseWrapper.failed(-1, "新增信息失败");
            } else {
                pd.put("userId", pd.get("id"));
                int m = roleMapper.saveRoleUser(pd);
                if (m == 0) result = ResponseWrapper.failed(-1, "新增信息失败");
            }
        } catch (Exception e) {
            e.printStackTrace();
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(e.getMessage());
        }
        return ResponseEntity.ok(result);
    }

    /**
     * 修改管理账户的信息
     *
     * @return
     * @throws IOException
     */
    @RequestMapping(value = "/system/updateUser", method = RequestMethod.POST)
    public ResponseEntity updateUserForXt() throws IOException {
        ResponseWrapper result = ResponseWrapper.succeed(true);
        try {
            PageData pd = this.getPageData();
            int n = userMapper.updateUser(pd);
            if (n == 0) result = ResponseWrapper.failed(-1, "修改信息失败");
        } catch (Exception e) {
            e.printStackTrace();
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(e.getMessage());
        }
        return ResponseEntity.ok(result);
    }

    /**
     * 修改管理账户的状态
     *
     * @return
     * @throws IOException
     */
    @RequestMapping(value = "/system/updateUserStatus", method = RequestMethod.POST)
    public ResponseEntity updateUserForStatus() throws IOException {
        ResponseWrapper result = ResponseWrapper.succeed(true);
        try {
            PageData pd = this.getPageData();
            int n = userMapper.updateUser(pd);
            if (n == 0) result = ResponseWrapper.failed(-1, "修改状态失败");
        } catch (Exception e) {
            e.printStackTrace();
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(e.getMessage());
        }
        return ResponseEntity.ok(result);
    }


    /**
     * 修改密码
     *
     * @return
     * @throws IOException
     */
    @RequestMapping(value = "/system/updatePassword", method = RequestMethod.POST)
    public ResponseEntity updatePassword(HttpSession session) throws IOException {
        ResponseWrapper result = ResponseWrapper.succeed(true);
        ;
        try {
            PageData pd = this.getPageData();
            String oldPassword = pd.getString("oldPassword");
            String password = pd.getString("password");
            if (!StringUtils.getMD5Str(oldPassword).equals( this.getShiroUser().getPassword())) {
                return ResponseEntity.ok(ResponseWrapper.failed(-1, "旧密码错误，请重新输入"));
            }
            pd.put("password", StringUtils.getMD5Str(password));
            int n = userMapper.updateUser(pd);
            if (n == 0) result = ResponseWrapper.failed(-1, "修改密码失败");
        } catch (Exception e) {
            e.printStackTrace();
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(e.getMessage());
        }
        return ResponseEntity.ok(result);
    }


}
