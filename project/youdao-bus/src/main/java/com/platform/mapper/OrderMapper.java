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
    PageData countOrderForFleet(PageData pd);

    List<PageData> selectByStatus(PageData pd);
    List<PageData> selectByUuidAndStatus(PageData pd);
    List<PageData> selectByUserUuidFleet12(PageData pd);
    List<PageData> selectByUuidAndStatusFleet2345(PageData pd);
    List<PageData> selectAllFleetByOrderUuid(PageData pd);
    PageData selectFleetByOrderUuidAndUserUuid(PageData pd);

    List<PageData> selectList(Map<String, String> para);

    int updateByOrderUuid(PageData pd);

    //新增报价信息
    int insertFleetAmount(PageData pd);
    //修改报价信息
    int updateFleetAmount(PageData pd);
    @Update("update t_orders set order_fleet_id = #{orderFleetId},status = 5 where order_uuid = #{orderUuid}")
    int updateOrderForFleet(@Param("orderUuid") String orderUuid, @Param("orderFleetId") String orderFleetId);
    @Update("update t_orders set  status = #{status} where order_uuid = #{orderUuid}")
    int updateOrderForStatus(@Param("orderUuid") String orderUuid, @Param("status") String status);
    @Update("update t_orders set  contract_over = #{contractOver} where order_uuid = #{orderUuid}")
    int updateOrderForContractOver(@Param("orderUuid") String orderUuid, @Param("contractOver") String contractOver);
}
