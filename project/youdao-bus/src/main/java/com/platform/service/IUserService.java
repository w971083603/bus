package com.platform.service;


import com.alibaba.fastjson.JSONObject;
import com.platform.commons.utils.PageData;
import com.platform.result.DatatablesResult;

import java.util.List;


/**
 * Created by Administrator on 2017/8/17.
 *
 */

public interface IUserService{

     //=============后台管理的账户

     DatatablesResult<PageData> selectList(JSONObject params, Integer page, Integer rows, Integer draw);

     DatatablesResult<PageData> selectListBus(JSONObject params, Integer page, Integer rows, Integer draw);

}
