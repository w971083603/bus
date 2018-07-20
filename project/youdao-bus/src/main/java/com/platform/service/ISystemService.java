package com.platform.service;


import com.alibaba.fastjson.JSONObject;
import com.platform.commons.utils.PageData;
import com.platform.result.DatatablesResult;


/**
 * Created by Administrator on 2017/8/17.
 *
 */

public interface ISystemService {

     DatatablesResult<PageData> dataGridMessage(JSONObject params, Integer page, Integer rows, Integer draw);

     DatatablesResult<PageData> dataGridProblem(JSONObject params, Integer page, Integer rows, Integer draw);

}
