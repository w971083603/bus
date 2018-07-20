package com.platform.mapper;


import com.platform.commons.utils.PageData;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import java.util.List;

/**
 * Created by Administrator on 2017/4/28.
 */
public interface SmsCodeMapper {

    @Select("SELECT id,tel,code,DATE_FORMAT(send_time,'%Y-%m-%d %H:%i:%s') as sendTime  from t_sms_code WHERE type=#{type} and tel = #{tel} order by send_time desc limit 1")
    PageData selectSmsCode(@Param("type") String type, @Param("tel") String tel);

    @Insert("INSERT INTO t_sms_code(tel, code, send_time, type) VALUES ( #{tel},#{code}, now(),#{type})")
    int insert(@Param("tel") String tel,@Param("code") String code,@Param("type") String type );
}
