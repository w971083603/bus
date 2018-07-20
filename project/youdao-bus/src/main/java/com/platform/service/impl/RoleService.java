package com.platform.service.impl;


import com.alibaba.fastjson.JSONObject;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.platform.commons.utils.PageData;
import com.platform.commons.utils.StringUtils;
import com.platform.commons.utils.cmsUtil;
import com.platform.mapper.RoleMapper;
import com.platform.result.DatatablesResult;
import com.platform.service.IRoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.*;

@Service
public class RoleService  implements IRoleService {

	@Autowired
	private RoleMapper roleMapper;

	@Override
	public Map<String, Set<String>> selectModulesMapByUserId(String roleIds) {
		Map<String, Set<String>> resourceMap = new HashMap<String, Set<String>>();
		Set<String> modSet = new HashSet<String>();
		Set<String> roles = new HashSet<String>();
		String[] str=String.valueOf(roleIds).split(",");
		for (int i = 0; i < str.length; i++) {
			if(!str[i].trim().equals("")){
				Long roleId=Long.parseLong(str[i]);
				List<Map<Long, String>> resourceList = roleMapper.selectModulesListByRoleId(roleId);
				if (resourceList != null) {
					for (Map<Long, String> map : resourceList) {
						if (StringUtils.isNotBlank(map.get("modulstr"))) {
							modSet.add(map.get("modulstr"));
						}
					}
				}
				PageData pd = roleMapper.selectById(roleId);
				if (pd != null) {
					roles.add(String.valueOf(pd.get("id").toString()));
				}
			}
		}
		resourceMap.put("mods", modSet);
		resourceMap.put("roles", roles);
		return resourceMap;
	}


	/**
	 * 获取角色列表
	 * @param params
	 * @param page
	 * @param rows
	 * @param draw
	 * @return
	 */
	@Override
	public DatatablesResult<PageData> selectRoleVo(JSONObject params, Integer page, Integer rows, Integer draw) {
		PageHelper.startPage(page, rows);
		Map<String,String> whereMap = cmsUtil.toHashMap(params);
		List<PageData> rolelistVos = this.roleMapper.selectListVoPage(whereMap);
		PageInfo<PageData> pageInfo = new PageInfo<PageData>(rolelistVos);
		DatatablesResult pageResult = new DatatablesResult<PageData>();
		pageResult.setData(rolelistVos);
		pageResult.setDraw(draw);
		pageResult.setRecordsTotal((int)pageInfo.getTotal());
		pageResult.setRecordsFiltered(pageResult.getRecordsTotal());
		return pageResult;
	}




}
