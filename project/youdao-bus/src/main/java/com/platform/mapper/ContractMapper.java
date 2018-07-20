package com.platform.mapper;


import com.platform.commons.utils.PageData;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import java.util.List;

/**
 * Created by Administrator on 2017/4/28.
 */
public interface ContractMapper {

    int save(PageData pd);
    @Select("select id,user_uuid as uuid,name,phone from t_contact where user_uuid = #{uuid}")
    List<PageData> selectByUuid(@Param("uuid") String uuid);

    @Delete("delete from t_contact where id = #{id}")
    int delete(@Param("id") String id);

    @Update("update t_contact set name = #{name},phone = #{phone} where id = #{id}")
    int update(@Param("id") String id, @Param("name") String name, @Param("phone") String phone);


}
