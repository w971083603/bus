package com.platform.service.impl;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.platform.commons.utils.PageData;
import com.platform.commons.utils.StringUtils;
import com.platform.commons.utils.SystemConfig;
import com.platform.commons.utils.cmsUtil;
import com.platform.mapper.AddressMapper;
import com.platform.mapper.OrderMapper;
import com.platform.mapper.UserMapper;
import com.platform.result.DatatablesResult;
import com.platform.service.IOrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.io.*;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by Administrator on 2017/8/17.
 */

@Service
public class OrderService implements IOrderService {

    @Autowired
    private OrderMapper orderMapper;

    @Autowired
    private AddressMapper addressMapper;

    @Override
    public DatatablesResult<PageData> selectList(JSONObject params, Integer page, Integer rows, Integer draw) {
        PageHelper.startPage(page, rows);
        Map<String, String> whereMap = cmsUtil.toHashMap(params);
        List<PageData> list = orderMapper.selectList(whereMap);
        for (PageData pd : list) {
            String orderUuid = pd.getString("orderUuid");
            List<PageData> addressList = addressMapper.selectByOrderUuid(orderUuid);
            String address = "";
            for (PageData addressPd : addressList) {
                if(address.equals("")){
                    address = addressPd.getString("address");
                }else {
                    address += "," + addressPd.getString("address");
                }
            }
            pd.put("address",address);
        }
        PageInfo<PageData> pageInfo = new PageInfo<>(list);
        DatatablesResult pageResult = new DatatablesResult<PageData>();
        pageResult.setData(list);
        pageResult.setDraw(draw);
        pageResult.setRecordsTotal(((int) pageInfo.getTotal()) == 0 ? 1 : (int) pageInfo.getTotal());
        pageResult.setRecordsFiltered(pageResult.getRecordsTotal());
        return pageResult;
    }



}
