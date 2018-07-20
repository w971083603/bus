package com.platform.service;


import com.alibaba.fastjson.JSONObject;
import com.platform.commons.utils.PageData;
import com.platform.result.DatatablesResult;

import java.util.Map;
import java.util.Set;

public interface IRoleService  {

    Map<String, Set<String>> selectModulesMapByUserId(String roleIds);

    DatatablesResult<PageData> selectRoleVo(JSONObject params, Integer page, Integer rows, Integer draw);

 }
