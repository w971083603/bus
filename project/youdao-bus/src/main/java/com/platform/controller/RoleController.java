package com.platform.controller;

import com.alibaba.fastjson.JSONObject;
import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.platform.commons.utils.PageData;
import com.platform.commons.utils.ResponseWrapper;
import com.platform.entity.RoleModulesEntity;
import com.platform.mapper.RoleMapper;
import com.platform.result.DatatablesResult;
import com.platform.service.IRoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.io.IOException;
import java.sql.Timestamp;
import java.util.Date;
import java.util.List;

/**
 * 角色管理
 *
 * @author wuyudong
 */
@Controller
@RequestMapping("/role")
public class RoleController extends BaseController {

    @Autowired
    private RoleMapper roleMapper;

    @Autowired
    private IRoleService roleService;


    /**
     * 获取角色列表
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
            DatatablesResult datatablesResult = this.roleService.selectRoleVo(params, page, rows, draw);
            return ResponseEntity.ok(datatablesResult);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(null);
    }


    /**
     * 获取角色列表
     *
     * @return
     * @throws IOException
     */
    @RequestMapping(value = "/system/getRoleList", method = RequestMethod.POST)
    public ResponseEntity getRoleList() throws IOException {
        ResponseWrapper result;
        try {
            //将角色集合存到session
            List<PageData> roleList = roleMapper.selectList();
            result = ResponseWrapper.succeed(roleList);
        } catch (Exception e) {
            e.printStackTrace();
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(e.getMessage());
        }
        return ResponseEntity.ok(result);
    }


    /**
     * 新增角色
     *
     * @return
     * @throws IOException
     */
    @RequestMapping(value = "/system/addRole", method = RequestMethod.POST)
    public ResponseEntity addRole() throws IOException {
        ResponseWrapper result;
        try {
            PageData pd = this.getPageData();
            roleMapper.saveRole(pd);
            result = ResponseWrapper.succeed(true);
        } catch (Exception e) {
            e.printStackTrace();
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(e.getMessage());
        }
        return ResponseEntity.ok(result);
    }


    /**
     * 获取权限相关的菜单
     *
     * @param roleId
     * @return
     * @throws IOException
     */
    @RequestMapping(value = "/system/findModulesById", method = RequestMethod.POST)
    public ResponseEntity findModulesById(String roleId) throws IOException {
        ResponseWrapper result;
        try {
            List<PageData> relist = roleMapper.selectModulesRoleList(roleId);
            String modulesstr = "";
            for (PageData pd : relist) {
                if (pd.get("moduleId").toString().length() == 1) {
                    modulesstr += "0" + pd.get("moduleId").toString() + ",";
                } else {
                    modulesstr += pd.get("moduleId").toString() + ",";
                }
            }
            result = ResponseWrapper.succeed(modulesstr);
        } catch (Exception e) {
            e.printStackTrace();
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(e.getMessage());
        }

        return ResponseEntity.ok(result);
    }


    /**
     * 修改角色权限
     *
     * @param roleId     角色ID
     * @param modulesStr 菜单集合，逗号分隔
     * @return
     * @throws IOException
     */
    @RequestMapping(value = "/system/updateRoleModules", method = RequestMethod.POST)
    public ResponseEntity updateRoleModules(String roleId, String modulesStr, String loginName) throws IOException {
        ResponseWrapper result;
        try {
            //清空当前角色的所有权限
            roleMapper.deleteFromRoleId(roleId);
            //新增权限
            String[] modules = modulesStr.split(",");
            for (int i = 0; i < modules.length; i++) {
                if (modules[i].equals("")) {
                    continue;
                }
                PageData pd = new PageData();
                pd.put("roleId",roleId);
                pd.put("moduleId",modules[i]);
                roleMapper.saveRoleModuleId(pd);
            }
            result = ResponseWrapper.succeed(true);
        } catch (Exception e) {
            e.printStackTrace();
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(e.getMessage());
        }
        return ResponseEntity.ok(result);
    }


}
