package com.platform.mapper;


import com.platform.commons.utils.PageData;

import java.util.List;

/**
 * Created by Administrator on 2017/4/28.
 */
public interface ModulesMapper{

    List<PageData> selectModulesListByRoleId(String roleIds);

    List<PageData> selectList(PageData pd);
}
