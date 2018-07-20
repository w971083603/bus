package com.platform.shiro;

import com.platform.commons.utils.PageData;
import com.platform.commons.utils.StringUtils;
import com.platform.mapper.RoleMapper;
import com.platform.mapper.UserMapper;
import com.platform.service.IRoleService;
import com.platform.service.IUserService;
import org.apache.shiro.authc.*;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.apache.shiro.subject.SimplePrincipalCollection;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.*;

public class CmsGuessRealm extends AuthorizingRealm {

    @Autowired
    private UserMapper userMapper;

    @Autowired
    private IUserService userService;

    @Autowired
    private IRoleService roleService;

    @Autowired
    private RoleMapper roleMapper;

    @Override
    protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principals) {
        ShiroUser shiroUser = (ShiroUser) principals.getPrimaryPrincipal();
        SimpleAuthorizationInfo info = new SimpleAuthorizationInfo();
        info.addStringPermissions(shiroUser.getModulesSet());
        return info;
    }

    @Override
    protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken authcToken) throws AuthenticationException {
        UsernamePasswordToken token = (UsernamePasswordToken) authcToken;
        String loginName = token.getUsername();
        String loginPassoword = String.valueOf(token.getPassword());

        PageData pageData = userMapper.selectByLoginName(loginName);
        //判断是否存在
        if (pageData == null) throw new DisabledAccountException();
        // 账号未启用
        if (Integer.parseInt(pageData.getString("user_status")) == 1) throw new DisabledAccountException();
        String password = pageData.getString("password");
        String name = pageData.getString("name");
        String phone = pageData.getString("phone");
        String id = pageData.get("id").toString();
        //判断密码是否一致
        if (StringUtils.getMD5Str(password).equals(loginPassoword)) {
            //更新登录时间
            userMapper.updateLastTime(id);
        }

        String roleIdStr = roleMapper.getRoleById(id);
      // 读取用户的url和角色
        Map<String, Set<String>> resourceMap = roleService.selectModulesMapByUserId(roleIdStr);

        System.out.println("权限id【" + resourceMap.get("roles") + "】集合");
        System.out.println("菜单权限【" + resourceMap.get("mods") + "】集合");

        ShiroUser shiroUser = new ShiroUser(Long.parseLong(id), loginName, name,  resourceMap.get("mods"));
        shiroUser.setRolesstr(roleIdStr);
        shiroUser.setPhone(phone);
        shiroUser.setPassword(password);

        return new SimpleAuthenticationInfo(shiroUser, password.toCharArray(), getName());
    }

    @Override
    public void onLogout(PrincipalCollection principals) {
        super.clearCachedAuthorizationInfo(principals);
        ShiroUser shiroUser = (ShiroUser) principals.getPrimaryPrincipal();
        removeUserCache(shiroUser);
    }

    /**
     * 清除用户缓存
     *
     * @param shiroUser
     */
    public void removeUserCache(ShiroUser shiroUser) {
        removeUserCache(shiroUser.getLoginName());
    }

    /**
     * 清除用户缓存
     *
     * @param loginName
     */
    public void removeUserCache(String loginName) {
        SimplePrincipalCollection principals = new SimplePrincipalCollection();
        principals.add(loginName, super.getName());
        super.clearCachedAuthenticationInfo(principals);
    }

}
