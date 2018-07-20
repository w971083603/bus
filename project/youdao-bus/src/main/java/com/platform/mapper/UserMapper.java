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
public interface UserMapper {

    @Select("SELECT id, login_number,  password, name, phone, create_time, user_status, last_time " +
            " from m_sys_user  " +
            " WHERE login_number=#{loginName}")
    PageData selectByLoginName(@Param("loginName") String loginName);

    @Select(" update m_sys_user  set last_time = now()   WHERE id=#{id}")
    int updateLastTime(@Param("id") String id);

    List<PageData> selectList(Map<String, String> whereMap);

    //新增服务商
    int saveUser(PageData pd);

    //修改服务商
    int updateUser(PageData pd);

    @Select("SELECT * from t_user WHERE id=#{id}")
    PageData selectById(@Param("id") int id);
    //注册去重======通过类型和电话和楼盘
    @Select("SELECT * from t_user WHERE type=#{type} and tel = #{tel}")
    PageData selectByTypeAndTel(@Param("type") String type, @Param("tel") String tel);

    //新增会员
    int saveClient(PageData pd);

    @Select("SELECT * from t_user WHERE tel=#{tel} and password = #{password} and type = #{type}")
    PageData selectByLoginNameAndPassword(@Param("tel") String tel,@Param("password") String password,@Param("type") String type);

    @Select("SELECT * from t_user WHERE tel=#{tel} and type = #{type}")
    PageData selectByTelAndType(@Param("tel") String tel,@Param("type") String type);

    @Select("SELECT * from t_user WHERE uuid=#{uuid}")
    PageData selectByUuid(@Param("uuid") String uuid);

    @Update("update t_user set password = #{password} where id = #{id}")
    int update(@Param("id") String id,@Param("password") String password);

    @Update("update t_user set password = #{password},tel = #{tel} where id = #{id}")
    int updateTelAndPassword(@Param("id") String id,@Param("password") String password,@Param("tel") String tel);

    @Update("update t_user set nickname = #{nickname},birthday = #{birthday},email = #{email},sex = #{sex},header_url=#{headerUrl} where id = #{id}")
    int updateUserData(@Param("id") String id,@Param("nickname") String nickname,@Param("birthday") String birthday,
                       @Param("email") String email,@Param("sex") String sex,@Param("headerUrl") String headerUrl);
}
