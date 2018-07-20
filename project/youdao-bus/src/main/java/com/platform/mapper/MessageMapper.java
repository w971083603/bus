package com.platform.mapper;


import com.platform.commons.utils.PageData;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import java.util.List;

/**
 * Created by Administrator on 2017/4/28.
 */
public interface MessageMapper {

    @Select("SELECT user_uuid as uuid,id,massage, is_yorn as isYorn," +
            " is_delete as isDelete,create_time as createTime from t_massage WHERE is_delete = 0 and user_uuid = #{uuid}")
    List<PageData> selectByUuid(@Param("uuid") String uuid);

    @Select("select ifnull(sum(case when is_yorn = 0 then 1 else 0 end),0) as noRead, count(*) as allRead from t_massage WHERE is_delete = 0 and user_uuid = #{uuid}")
    PageData countByUuid(@Param("uuid") String uuid);

    @Update("update t_massage set is_yorn = 1 where FIND_IN_SET(id,#{ids})")
    int updateIsYorn(@Param("ids") String ids);

    @Update("update t_massage set is_delete = 1 where FIND_IN_SET(id,#{ids})")
    int updateIsDelete(@Param("ids") String ids);

    int save(PageData pd);

}
