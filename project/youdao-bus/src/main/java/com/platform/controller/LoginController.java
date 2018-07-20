package com.platform.controller;


import com.platform.commons.utils.PageData;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.*;
import org.apache.shiro.subject.Subject;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.Map;

/**
 * 登录管理
 * @author wuyudong
 *
 */
@RestController
public class LoginController  extends BaseController  {
	

    /**
     * post登录方法
     * @return
     */
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public ResponseEntity<Map<String, Object>> loginPost(HttpSession session) {
		Map<String, Object> result = new HashMap<String, Object>();
		try{
			PageData pd = this.getPageData();
			String validCode = pd.getString("validCode");
			String passWord = pd.getString("passWord");
			String loginNumber = pd.getString("loginNumber");
  			if (!(validCode.equalsIgnoreCase(session.getAttribute("code").toString()))) {
				result.put("msg", "验证码不正确");
  				return ResponseEntity.ok(result);
			}
			Subject sybject = SecurityUtils.getSubject();
			UsernamePasswordToken token = new UsernamePasswordToken(loginNumber, passWord.toCharArray());
			token.setRememberMe(true);
			try {
				sybject.login(token);
				result.put("msg", "");
			} catch (UnknownAccountException e) {
				result.put("msg", "账号不存在");
			} catch (DisabledAccountException e) {
				result.put("msg", "账号未启用");
			} catch (IncorrectCredentialsException e) {
				result.put("msg", "密码错误");
			} catch (AuthenticationException e) {
				// 其他错误，比如锁定，如果想单独处理请单独catch处理
				e.printStackTrace();
				System.out.println("其他错误：" + e.getMessage());
				result.put("msg", "未知错误,请联系管理员");
			}catch (Exception e){
				e.printStackTrace();
				System.out.println("其他错误：" + e.getMessage());
				result.put("msg", "未知错误,请联系管理员");
			}
		}catch (Exception e){
			e.printStackTrace();
		}
		return ResponseEntity.ok(result);
	}
	
	/**
	 * 退出登录
	 * @return
	 */
	@RequestMapping(value = "/logout", method = RequestMethod.POST)
	public ResponseEntity<Boolean> logout(){
		Subject subject = SecurityUtils.getSubject();
        subject.logout();
        return ResponseEntity.ok(true);
	}
}
