package com.platform.mapper;

import com.platform.commons.utils.PageData;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import java.util.List;
import java.util.Map;


/**
 * Created by Administrator on 2017/4/28.
 */
public interface RoleMapper {

    @Select(" select group_concat(role_id) from m_role_user where user_id = #{id}")
    String getRoleById(@Param("id") String id);

    @Select(" select * from m_role_user where id = #{id}")
    PageData selectById(@Param("id") Long id);

    @Select(" select id as roleId,role_name as roleName from m_roles where is_delete = 0 and id not in (1)")
    List<PageData> selectList();

    List<Map<Long, String>> selectModulesListByRoleId(Long roleId);

    List<PageData> selectListVoPage(Map<String, String> params);

    @Select(" select id, role_id as roleId,module_id as moduleId from m_role_modules where role_id = #{roleId}")
    List<PageData> selectModulesRoleList(@Param("roleId") String roleId);

    @Delete("delete from m_role_modules where role_id = #{roleId}")
    int deleteFromRoleId(@Param("roleId") String roleId);


    int  saveRole( PageData pd);
    int  saveRoleUser( PageData pd);
    int  saveRoleModuleId( PageData pd);

}
