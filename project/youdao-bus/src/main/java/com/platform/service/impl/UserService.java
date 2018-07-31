package com.platform.service.impl;

import com.alibaba.fastjson.JSONObject;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.platform.commons.utils.PageData;
import com.platform.commons.utils.cmsUtil;

import com.platform.mapper.UserMapper;
import com.platform.result.DatatablesResult;
import com.platform.service.IUserService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import java.util.List;
import java.util.Map;

/**
 * Created by Administrator on 2017/8/17.
 *
 */

@Service
public class  UserService implements IUserService {

    @Autowired
    private  UserMapper userMapper;


    //==========================


    @Override
    public DatatablesResult<PageData> selectList(JSONObject params, Integer page, Integer rows, Integer draw) {
        PageHelper.startPage(page, rows);
        Map<String,String> whereMap = cmsUtil.toHashMap(params);
        List<PageData> userlistVos = this.userMapper.selectList(whereMap);
        PageInfo<PageData> pageInfo = new PageInfo<PageData>(userlistVos);
        DatatablesResult pageResult = new DatatablesResult<PageData>();
        pageResult.setData(userlistVos);
        pageResult.setDraw(draw);
        pageResult.setRecordsTotal(((int)pageInfo.getTotal())==0?1:(int)pageInfo.getTotal());
        pageResult.setRecordsFiltered(pageResult.getRecordsTotal());
          return pageResult;
    }


    @Override
    public DatatablesResult<PageData> selectListBus(JSONObject params, Integer page, Integer rows, Integer draw) {
        PageHelper.startPage(page, rows);
        Map<String,String> whereMap = cmsUtil.toHashMap(params);
        List<PageData> userlistVos = this.userMapper.selectListBus(whereMap);
        PageInfo<PageData> pageInfo = new PageInfo<PageData>(userlistVos);
        DatatablesResult pageResult = new DatatablesResult<PageData>();
        pageResult.setData(userlistVos);
        pageResult.setDraw(draw);
        pageResult.setRecordsTotal(((int)pageInfo.getTotal())==0?1:(int)pageInfo.getTotal());
        pageResult.setRecordsFiltered(pageResult.getRecordsTotal());
          return pageResult;
    }
}
