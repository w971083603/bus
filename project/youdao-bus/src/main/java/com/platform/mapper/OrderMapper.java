package com.platform.mapper;


import com.platform.commons.utils.PageData;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import java.util.List;
import java.util.Map;

/**
 * Created by Administrator on 2017/4/28.
 */
public interface OrderMapper {

    int insert(PageData pd);

    int insertAddress(PageData pd);

    PageData selectByOrderUuid(PageData pd);

    @Update("update t_orders set status = #{status} where user_uuid = #{uuid} and order_uuid = #{orderUuid}")
    int update(@Param("status") String status, @Param("uuid") String uuid, @Param("orderUuid") String orderUuid);

    PageData countOrder(PageData pd);

    List<PageData> selectByUuidAndStatus(PageData pd);

    List<PageData> selectList(Map<String, String> para);

    int updateByOrderUuid(PageData pd);

}