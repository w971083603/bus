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
public interface AddressMapper {

    @Select("SELECT * from t_address WHERE order_uuid = #{orderUuid}")
    List<PageData> selectByOrderUuid(@Param("orderUuid") String orderUuid);

}
