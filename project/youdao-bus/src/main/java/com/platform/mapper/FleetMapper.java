package com.platform.mapper;


import com.platform.commons.utils.PageData;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import java.util.List;
import java.util.Map;

/**
 * Created by Administrator on 2017/4/28.
 */
public interface FleetMapper {

    int save(PageData pd);

    List<PageData> selectList(Map<String, String> para);

    int updateById(PageData pd);
    @Select("select * from t_fleet where id = #{id}")
    PageData findById(@Param("id") String id);

    @Select("select * from t_fleet where status = 2")
    List<PageData> selectAllPassFleet();

}
