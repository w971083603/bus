package com.platform.mapper;

import com.platform.commons.utils.PageData;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

public interface ConfigMapper {
    @Select("SELECT id,minute  from m_config")
    PageData select();

    @Insert("INSERT INTO m_config(minute) VALUES ( #{minute})")
    int insert(@Param("minute") Integer minute);

    @Update("UPDATE m_config set minute = #{minute} where id = #{id}")
    int update(@Param("minute") Integer minute,@Param("id") Integer id);
}
