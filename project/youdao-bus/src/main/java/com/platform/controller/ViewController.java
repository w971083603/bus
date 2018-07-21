package com.platform.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


/**
 * 视图
 * @author wuyudong
 *
 */
@Controller
public class ViewController {

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
	public String zhsz() {
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
    public String messages() {
        return "api/mymessage";
    }

	/**
	 * 个人资料
	 * @return
	 */
	@RequestMapping(value = "/api/grzl", method = {RequestMethod.GET})
	public String grzl() {
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
	 * 个人中心页
	 * @return
	 */
	@RequestMapping(value = "/api/busown", method = {RequestMethod.GET})
	public String busown() {
		return "api/busown";
	}

	/**
	 * 个人订单
	 * @return
	 */
	@RequestMapping(value = "/api/wddd", method = {RequestMethod.GET})
	public String orders() {
		return "api/wddd";
	}


	/**
	 * 反馈建议
	 * @return
	 */
	@RequestMapping(value = "/api/feedback", method = {RequestMethod.GET})
	public String feedback() {
		return "api/feedback";
	}



	/**
	 * 常用信息
	 * @return
	 */
	@RequestMapping(value = "/api/cyxx", method = {RequestMethod.GET})
	public String cyxx() {
		return "api/cyxx";
	}
}