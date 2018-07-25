package com.platform.controller;

import com.google.common.base.Strings;
import com.platform.commons.utils.PageData;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;


/**
 * 视图
 * @author wuyudong
 *
 */
@Controller
public class ViewController extends  BaseController {

	/**
	 * 登录页面
	 * @return
	 */
	@RequestMapping(value = "/login", method = {RequestMethod.GET})
	public String login(){
		return "login";
	}

	/**
	 * 主页面
	 *
	 * @return
	 */
	@RequestMapping("/index")
	public String index() {
 		return "index";
	}

	 


	//==============================================
	/**
	 * 账号列表
	 * @return
	 */
	@RequestMapping("/user/systemuser")
	public String systemuser() {
		return "systemnumber/systemuser";
	}

	/**
	 * 客服列表
	 * @return
	 */
	@RequestMapping("/user/kflist")
	public String kflist() {
		return "systemnumber/systemkf";
	}

	/**
	 * 角色列表
	 * @return
	 */
	@RequestMapping("/user/rolelist")
	public String rolelist() {
		return "systemnumber/rolelist";
	}



	/**
	 * 消息列表
	 * @return
	 */
	@RequestMapping("/system/massagelist")
	public String massagelist() {
		return "system/massagelist";
	}


	/**
	 * 问题列表
	 * @return
	 */
	@RequestMapping("/system/problemlist")
	public String problemlist() {
		return "system/problemlist";
	}

	/**
	 * 订单
	 * @return
	 */
	@RequestMapping("/order/order")
	public String systemOrders() {
		return "order/order";
	}

	/**
	 * 车队入住
	 * @return
	 */
	@RequestMapping("/fleet/fleet")
	public String systemFleet() {
		return "fleet/fleet";
	}



//==============================================前端页面========================================

	/**
	 * bus首页
	 * @return
	 */
	@RequestMapping(value = "/api/busindex", method = {RequestMethod.GET})
	public String busIndex() {
		return "api/busindex";
	}

	/**
	 * 账号设置页
	 * @return
	 */
	@RequestMapping(value = "/api/zhsz", method = {RequestMethod.GET})
	public String zhsz(HttpSession session) {
        if(session.getAttribute("uuid") == null){
            return "redirect:login";
        }
	    return "api/zhsz";
	}

	/**
	 * 注册
	 * @return
	 */
	@RequestMapping(value = "/api/register", method = {RequestMethod.GET})
	public String register() {
		return "api/register";
	}

    /**
     * 忘记密码
     * @return
     */
    @RequestMapping(value = "/api/forgetpassword", method = {RequestMethod.GET})
    public String forgetpassword() {
        return "api/forgetpassword";
    }

	/**
	 * login
	 * @return
	 */
	@RequestMapping(value = "/api/login", method = {RequestMethod.GET})
	public String apiLogin() {
		return "api/login";
	}

    /**
     * 我的消息
     * @return
     */
    @RequestMapping(value = "/api/mymessage", method = {RequestMethod.GET})
    public String messages(HttpSession session) {
        if(session.getAttribute("uuid") == null){
            return "redirect:login";
        }
        return "api/mymessage";
    }

	/**
	 * 个人资料
	 * @return
	 */
	@RequestMapping(value = "/api/grzl", method = {RequestMethod.GET})
	public String grzl(HttpSession session) {
        if(session.getAttribute("uuid") == null){
            return "redirect:login";
        }
		return "api/grzl";
	}

	/**
	 * 发布行程
	 * @return
	 */
	@RequestMapping(value = "/api/fbxc", method = {RequestMethod.GET})
	public String fbxc() {
		return "api/fbxc";
	}



    /**
     * 车队入驻
     * @return
     */
    @RequestMapping(value = "/api/cdrz", method = {RequestMethod.GET})
    public String cdrz() {
        return "api/cdrz";
    }



	/**
	 * 关于我们
	 * @return
	 */
	@RequestMapping(value = "/api/gywm", method = {RequestMethod.GET})
	public String gywm() {
		return "api/gywm";
	}


	/**
	 * 在线客服
	 * @return
	 */
	@RequestMapping(value = "/api/zxkf", method = {RequestMethod.GET})
	public String zxkf() {
		return "api/zxkf";
	}

	/**
	 * 退出
	 * @return
	 */
	@RequestMapping(value = "/api/loginout", method = {RequestMethod.GET})
	public String loginout(HttpSession httpSession) {
		httpSession.removeAttribute("uuid");
		httpSession.removeAttribute("tel");
		httpSession.removeAttribute("nickname");
		httpSession.removeAttribute("headerUrl");
		return "redirect:busindex";
	}

    /**
     * 个人中心页
     */
    @RequestMapping(value="/api/busown")
    public String busown(HttpSession session) {
        if(session.getAttribute("uuid") == null){
            return "redirect:login";
        }
        return "/api/busown";
    }

	/**
	 * 个人订单
	 * @return
	 */
	@RequestMapping(value = "/api/wddd", method = {RequestMethod.GET})
	public String orders(HttpSession session) {
        if(session.getAttribute("uuid") == null){
            return "redirect:login";
        }
		return "api/wddd";
	}


	/**
	 * 反馈建议
	 * @return
	 */
	@RequestMapping(value = "/api/feedback", method = {RequestMethod.GET})
	public String feedback(HttpSession session) {
        if(session.getAttribute("uuid") == null){
            return "redirect:login";
        }
		return "api/feedback";
	}

    /**
     * 帮助中心
     * @return
     */
    @RequestMapping(value = "/api/bzzx", method = {RequestMethod.GET})
    public String bzzx(HttpSession session) {
        if(session.getAttribute("uuid") == null){
            return "redirect:login";
        }
        return "api/bzzx";
    }

	/**
	 * 常用信息
	 * @return
	 */
	@RequestMapping(value = "/api/cyxx", method = {RequestMethod.GET})
	public String cyxx(HttpSession session) {
        if(session.getAttribute("uuid") == null){
            return "redirect:login";
        }
		return "api/cyxx";
	}


	//============================================app下面==========================================

	/**
	 * 登录
	 * @return
	 */
	@RequestMapping(value = "/api/app_login", method = {RequestMethod.GET})
	public String app_login(HttpSession session) {
		return "api/app_login";
	}

	/**
	 * 首页
	 * @return
	 */
	@RequestMapping(value = "/api/app_index", method = {RequestMethod.GET})
	public String app_index(HttpSession session) {
		return "api/app_index";
	}

    /**
     * 快速注册
     * @return
     */
    @RequestMapping(value = "/api/app_kszc", method = {RequestMethod.GET})
    public String app_kszc(HttpSession session) {
        return "api/app_kszc";
    }

    /**
     * 忘记密码
     * @return
     */
    @RequestMapping(value = "/api/app_wjmm", method = {RequestMethod.GET})
    public String app_wjmm(HttpSession session) {
        return "api/app_wjmm";
    }


	/**
	 * 个人中心
	 * @return
	 */
	@RequestMapping(value = "/api/app_grzx", method = {RequestMethod.GET})
	public String app_grzx(HttpSession session) {
		if(session.getAttribute("uuid") == null){
			return "redirect:app_index";
		}
		return "api/app_grzx";
	}

	/**
	 * 详细信息
	 * @return
	 */
	@RequestMapping(value = "/api/app_xxxx", method = {RequestMethod.GET})
	public String app_xxxx(HttpSession session) {
		if(session.getAttribute("uuid") == null){
			return "redirect:app_index";
		}
		return "api/app_xxxx";
	}

	/**
	 * 我的订单
	 * @return
	 */
	@RequestMapping(value = "/api/app_wddd", method = {RequestMethod.GET})
	public String app_wddd(HttpSession session) {
		if(session.getAttribute("uuid") == null){
			return "redirect:app_index";
		}
		return "api/app_wddd";
	}

	/**
	 * 退出
	 * @return
	 */
	@RequestMapping(value = "/api/app_loginout", method = {RequestMethod.GET})
	public String app_loginout(HttpSession httpSession) {
		httpSession.removeAttribute("uuid");
		httpSession.removeAttribute("tel");
		httpSession.removeAttribute("nickname");
		httpSession.removeAttribute("headerUrl");
		return "redirect:app_index";
	}

}