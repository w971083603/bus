package com.platform.controller;

import com.alibaba.fastjson.JSONObject;
import com.google.common.base.Strings;
import com.platform.commons.utils.*;
import com.platform.commons.utils.sms.SendSmsUtil;
import com.platform.commons.utils.sms.response.SmsSendResponse;
import com.platform.mapper.*;
import com.platform.service.IOrderService;
import org.apache.commons.collections.CollectionUtils;
import org.joda.time.DateTime;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.Date;
import java.util.List;


/**
 * 前端接口
 * Description: *_*
 */

@RestController
@RequestMapping("/api")
public class ApiController extends BaseController {

    @Resource
    private SmsCodeMapper smsCodeMapper;
    @Resource
    private FeedBackMapper feedBackMapper;
    @Resource
    private AddressMapper addressMapper;

    @Resource
    private MessageMapper messageMapper;

    @Resource
    private ContractMapper contractMapper;

    @Resource
    private FleetMapper fleetMapper;
    @Resource
    private OrderMapper orderMapper;

    @Resource
    private InvoiceMapper invoiceMapper;

    @Resource
    private UserMapper userMapper;

    private String msgHeader = "【有道巴士】";

    /**
     * 发送验证码
     *
     * @param session
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/getCode", method = {RequestMethod.POST})
    public ResponseEntity getCode(HttpSession session) throws Exception {
        ResponseWrapper result;
        PageData pd = this.getPageData();
        String tel = pd.getString("tel");
        try {
            if (!RegUtil.IsMobile(tel)) {
                return ResponseEntity.ok(ResponseWrapper.failed(-1, "手机不能为空"));
            }
            String smsType = pd.getString("smsType");
            if (!smsType.equals("2")) {
                PageData userPd = userMapper.selectByTypeAndTel(pd.getString("type"), tel);
                if (!StringUtils.isEmpty(userPd)) {
                    return ResponseEntity.ok(ResponseWrapper.failed(-1, "该手机号已注册，请前往登录"));
                }
            }
            //验证码
            String messageCode = StringUtils.get4NUmber();
            String msg = msgHeader + "您的验证码是" + messageCode + "，如非本人操作，请忽略本短信。该验证码将在5分钟后失效。";
            //发送验证码;
            JSONObject sms = SendSmsUtil.sendSms(msg, tel);
            if (sms.getString("code").equals("0")) {
                smsCodeMapper.insert(tel, messageCode, smsType);
            } else {
                return ResponseEntity.ok(ResponseWrapper.failed(-1, "验证码发送失败"));
            }
            result = ResponseWrapper.succeed(true);
        } catch (Exception e) {
            e.printStackTrace();
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(e.getMessage());
        }
        return ResponseEntity.ok(result);
    }

    /**
     * 登录
     *
     * @param session
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/login", method = {RequestMethod.POST})
    public ResponseEntity login(HttpSession session) throws Exception {
        ResponseWrapper result;
        try {
            PageData pd = this.getPageData();
            String tel = pd.getString("tel");
            String password = pd.getString("password");
            String type = pd.getString("type");
            if (!RegUtil.IsMobile(tel)) {
                return ResponseEntity.ok(ResponseWrapper.failed(-1, "手机不能为空"));
            }
            if (Strings.isNullOrEmpty(password)) {
                return ResponseEntity.ok(ResponseWrapper.failed(-1, "密码不能为空"));
            }
            String md5Password = StringUtils.getMD5Str(password);
            PageData userPd = userMapper.selectByTypeAndTel(type, tel);
            if (StringUtils.isEmpty(userPd)) {
                return ResponseEntity.ok(ResponseWrapper.failed(-1, "该手机号未注册，请前往注册"));
            }
            String oldPassword = userPd.getString("password");
//            PageData userPd = userMapper.selectByLoginNameAndPassword(tel, md5Password, type);
            if (!oldPassword.equals(md5Password)) {
                return ResponseEntity.ok(ResponseWrapper.failed(-1, "用户名或密码错误"));
            }
            session.setAttribute("uuid", userPd.getString("uuid"));
            session.setAttribute("tel", userPd.getString("tel"));
            session.setAttribute("nickname", userPd.getString("nickname"));
            session.setAttribute("headerUrl", userPd.getString("headerUrl"));
            result = ResponseWrapper.succeed(true);
        } catch (Exception e) {
            e.printStackTrace();
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(e.getMessage());
        }
        return ResponseEntity.ok(result);
    }

    /**
     * 忘记密码
     *
     * @param session
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/forgetPassword", method = {RequestMethod.POST})
    public ResponseEntity forgetPassword(HttpSession session) throws Exception {
        ResponseWrapper result;
        try {
            PageData pd = this.getPageData();
            String tel = pd.getString("tel");
            String password = pd.getString("password");
            String type = pd.getString("type");
            String code = pd.getString("code");
            if (Strings.isNullOrEmpty(tel)) {
                return ResponseEntity.ok(ResponseWrapper.failed(-1, "手机不能为空"));
            }
            if (!RegUtil.IsMobile(tel)) {
                return ResponseEntity.ok(ResponseWrapper.failed(-1, "请输入正确的手机号"));
            }
            if (Strings.isNullOrEmpty(password)) {
                return ResponseEntity.ok(ResponseWrapper.failed(-1, "密码不能为空"));
            }
            PageData smsCodePd = smsCodeMapper.selectSmsCode("2", tel);
            String oldSms = smsCodePd.getString("code");
            if (!oldSms.equals(code)) {
                return ResponseEntity.ok(ResponseWrapper.failed(-1, "验证码错误"));
            }
            String sendTime = smsCodePd.getString("send_time");
            DateTime date = (new DateTime(sendTime)).plusSeconds(300);
            if (date.isBeforeNow()) {
                return ResponseEntity.ok(ResponseWrapper.failed(-1, "验证码已过期"));
            }
            PageData userPd = userMapper.selectByTelAndType(tel, type);
            if (StringUtils.isEmpty(userPd)) {
                return ResponseEntity.ok(ResponseWrapper.failed(-1, "该手机号未注册，请前往注册"));
            }
            String md5Password = StringUtils.getMD5Str(password);
            int n = userMapper.update(userPd.getLong("id"), md5Password);
            if (n == 0) {
                return ResponseEntity.ok(ResponseWrapper.failed(-1, "密码修改失败"));
            }
            result = ResponseWrapper.succeed(true);
        } catch (Exception e) {
            e.printStackTrace();
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(e.getMessage());
        }
        return ResponseEntity.ok(result);
    }

    /**
     * 更换手机号
     *
     * @param session
     * @return
     */
    @RequestMapping(value = "/updateTel", method = RequestMethod.POST)
    public ResponseEntity updateTel(HttpSession session) {
        ResponseWrapper result;
        try {
            PageData pd = this.getPageData();
            String tel = pd.getString("tel");
            String type = "1";
            if (Strings.isNullOrEmpty(tel)) {
                return ResponseEntity.ok(ResponseWrapper.failed(-1, "手机不能为空"));
            }
            if (!RegUtil.IsMobile(tel)) {
                return ResponseEntity.ok(ResponseWrapper.failed(-1, "请输入正确的手机号"));
            }
            PageData userPd = userMapper.selectByTypeAndTel(type, tel);
            if (!StringUtils.isEmpty(userPd)) return ResponseEntity.ok(ResponseWrapper.failed(-1, "该手机号已经注册"));
            String code = pd.getString("code");
            if (Strings.isNullOrEmpty(code)) {
                return ResponseEntity.ok(ResponseWrapper.failed(-1, "验证码不能为空"));
            }
            String password = pd.getString("password");
            if (Strings.isNullOrEmpty(password)) {
                return ResponseEntity.ok(ResponseWrapper.failed(-1, "密码不能为空"));
            }
            PageData smsCodePd = smsCodeMapper.selectSmsCode("3", tel);
            String oldSms = smsCodePd.getString("code");
            if (!oldSms.equals(code)) {
                return ResponseEntity.ok(ResponseWrapper.failed(-1, "验证码错误"));
            }
            String sendTime = smsCodePd.getString("send_time");
            DateTime date = (new DateTime(sendTime)).plusSeconds(300);
            if (date.isBeforeNow()) {
                return ResponseEntity.ok(ResponseWrapper.failed(-1, "验证码已过期"));
            }
            String uuid = (String) session.getAttribute("uuid");
            PageData userUuidPd = userMapper.selectByUuid(uuid);
            if (StringUtils.isEmpty(userUuidPd)) {
                return ResponseEntity.ok(ResponseWrapper.failed(-1, "该手机号未注册，请前往注册"));
            }
            String md5Password = StringUtils.getMD5Str(password);
            int n = userMapper.updateTelAndPassword(userUuidPd.getLong("id"), md5Password, tel);
            if (n == 0) {
                return ResponseEntity.ok(ResponseWrapper.failed(-1, "更换手机号失败"));
            }
            session.removeAttribute("uuid");
            session.removeAttribute("tel");
            session.removeAttribute("nickname");
            session.removeAttribute("headerUrl");
            result = ResponseWrapper.succeed(true);
        } catch (Exception e) {
            e.printStackTrace();
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(e.getMessage());
        }
        return ResponseEntity.ok(result);
    }

    /**
     * 修改密码
     *
     * @param session
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/updatePassword", method = {RequestMethod.POST})
    public ResponseEntity updatePassword(HttpSession session) throws Exception {
        ResponseWrapper result;
        try {
            PageData pd = this.getPageData();
            String oldPassword = pd.getString("oldPassword");
            String password = pd.getString("password");
            String newPassword = pd.getString("newPassword");
            if (Strings.isNullOrEmpty(oldPassword)) {
                return ResponseEntity.ok(ResponseWrapper.failed(-1, "旧密码不能为空"));
            }
            if (Strings.isNullOrEmpty(password)) {
                return ResponseEntity.ok(ResponseWrapper.failed(-1, "新密码不能为空"));
            }
            if (Strings.isNullOrEmpty(newPassword)) {
                return ResponseEntity.ok(ResponseWrapper.failed(-1, "确认新密码不能为空"));
            }
            if (!password.equals(newPassword)) {
                return ResponseEntity.ok(ResponseWrapper.failed(-1, "新密码和确认新密码不一致"));
            }
            String uuid = (String) session.getAttribute("uuid");
            PageData userPd = userMapper.selectByUuid(uuid);
            if (StringUtils.isEmpty(userPd)) {
                return ResponseEntity.ok(ResponseWrapper.failed(-1, "该手机号未注册，请前往注册"));
            }
            String md5Password = StringUtils.getMD5Str(password);
            int n = userMapper.update(userPd.getLong("id"), md5Password);
            if (n == 0) {
                return ResponseEntity.ok(ResponseWrapper.failed(-1, "密码修改失败"));
            }
            session.removeAttribute("uuid");
            session.removeAttribute("tel");
            session.removeAttribute("nickname");
            session.removeAttribute("headerUrl");
            result = ResponseWrapper.succeed(true);
        } catch (Exception e) {
            e.printStackTrace();
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(e.getMessage());
        }
        return ResponseEntity.ok(result);
    }


    /*
     * 创建订单
     *
     * @return
     * @throws IOException
     */
    @RequestMapping(value = "/create", method = RequestMethod.POST)
    public ResponseEntity create(HttpSession session) {
        ResponseWrapper result;
        try {
            PageData pd = this.getPageData();
            String type = pd.getString("type");
            String fromTime = pd.getString("fromTime");
            if (Strings.isNullOrEmpty(fromTime)) {
                return ResponseEntity.ok(ResponseWrapper.failed(-1, "出发时间不能为空"));
            }
            String toTime = pd.getString("toTime");
            if (type.equals("1")) {
                if (Strings.isNullOrEmpty(toTime)) {
                    return ResponseEntity.ok(ResponseWrapper.failed(-1, "结束时间不能为空"));
                }
            } else {
                pd.put("toTime", null);
            }
            String fromProvince = pd.getString("fromProvince");
            if (Strings.isNullOrEmpty(fromProvince)) {
                return ResponseEntity.ok(ResponseWrapper.failed(-1, "出发省份不能为空"));
            }
            String fromCity = pd.getString("fromCity");
            if (Strings.isNullOrEmpty(fromCity)) {
                return ResponseEntity.ok(ResponseWrapper.failed(-1, "出发城市不能为空"));
            }
            String fromAddress = pd.getString("fromAddress");
            if (Strings.isNullOrEmpty(fromAddress)) {
                return ResponseEntity.ok(ResponseWrapper.failed(-1, "出发详细地址不能为空"));
            }
            String toProvince = pd.getString("toProvince");
            if (Strings.isNullOrEmpty(toProvince)) {
                return ResponseEntity.ok(ResponseWrapper.failed(-1, "目的地省份不能为空"));
            }
            String toCity = pd.getString("toCity");
            if (Strings.isNullOrEmpty(toCity)) {
                return ResponseEntity.ok(ResponseWrapper.failed(-1, "目的地城市不能为空"));
            }
            String toAddress = pd.getString("toAddress");
            if (Strings.isNullOrEmpty(toAddress)) {
                return ResponseEntity.ok(ResponseWrapper.failed(-1, "目的地详细地址不能为空"));
            }
            String contactTel = pd.getString("contactTel");
            if (Strings.isNullOrEmpty(contactTel)) {
                return ResponseEntity.ok(ResponseWrapper.failed(-1, "联系人电话不能为空"));
            }
            if (!RegUtil.IsMobile(contactTel)) {
                return ResponseEntity.ok(ResponseWrapper.failed(-1, "请输入正确的联系人电话"));
            }
            String contactName = pd.getString("contactName");
            if (Strings.isNullOrEmpty(contactName)) {
                return ResponseEntity.ok(ResponseWrapper.failed(-1, "联系人姓名不能为空"));
            }
            String isInvoice = pd.getString("isInvoice");
            if (Strings.isNullOrEmpty(isInvoice)) {
                return ResponseEntity.ok(ResponseWrapper.failed(-1, "是否需要发票不能为空"));
            }
            if (isInvoice.equals("是")) {
                String invoiceHeader = pd.getString("invoiceHeader");
                if (Strings.isNullOrEmpty(invoiceHeader)) {
                    return ResponseEntity.ok(ResponseWrapper.failed(-1, "发票抬头不能为空"));
                }
                String invoiceContact = pd.getString("invoiceContact");
                if (Strings.isNullOrEmpty(invoiceContact)) {
                    return ResponseEntity.ok(ResponseWrapper.failed(-1, "收件人不能为空"));
                }
                String invoicePhone = pd.getString("invoicePhone");
                if (Strings.isNullOrEmpty(invoicePhone)) {
                    return ResponseEntity.ok(ResponseWrapper.failed(-1, "收件人电话不能为空"));
                }
                String invoiceAddress = pd.getString("invoiceAddress");
                if (Strings.isNullOrEmpty(invoiceAddress)) {
                    return ResponseEntity.ok(ResponseWrapper.failed(-1, "收件人地址不能为空"));
                }
                /*String invoiceDuty = pd.getString("invoiceDuty");
                if (Strings.isNullOrEmpty(invoiceDuty)) {
                    return ResponseEntity.ok(ResponseWrapper.failed(-1, "验证码不能为空"));
                }*/
            }

            String useNumber = pd.getString("useNumber");
            if (Strings.isNullOrEmpty(useNumber) || Integer.valueOf(useNumber) == 0) {
                return ResponseEntity.ok(ResponseWrapper.failed(-1, "用车人数不能为空"));
            }
            String busNumber = pd.getString("busNumber");
            if (Strings.isNullOrEmpty(busNumber) || Integer.valueOf(busNumber) == 0) {
                return ResponseEntity.ok(ResponseWrapper.failed(-1, "用车数量不能为空"));
            }
            int busNumber1 = StringUtils.isEmpty(pd.getString("busNumber1")) == true ? 0 : Integer.valueOf(pd.getString("busNumber1"));
            int busNumber2 = StringUtils.isEmpty(pd.getString("busNumber2")) == true ? 0 : Integer.valueOf(pd.getString("busNumber2"));
            int busNumber3 = StringUtils.isEmpty(pd.getString("busNumber3")) == true ? 0 : Integer.valueOf(pd.getString("busNumber3"));
            pd.put("busNumber1", busNumber1);
            pd.put("busNumber2", busNumber2);
            pd.put("busNumber3", busNumber3);
            if (Integer.valueOf(busNumber1) == 0) {
                return ResponseEntity.ok(ResponseWrapper.failed(-1, "用车座位不能为空"));
            }
            if (busNumber.equals("2")) {
                if (Integer.valueOf(busNumber2) == 0) {
                    return ResponseEntity.ok(ResponseWrapper.failed(-1, "用车座位不能为空"));
                }
            }
            if (busNumber.equals("3")) {
                if (Integer.valueOf(busNumber3) == 0) {
                    return ResponseEntity.ok(ResponseWrapper.failed(-1, "用车座位不能为空"));
                }
            }
            String uuid = (String) session.getAttribute("uuid");
            String orderUuid = DateUtil.getDayshmsS();
            pd.put("uuid", uuid);
            pd.put("orderUuid", orderUuid);
            pd.put("status", 0);
            int n = orderMapper.insert(pd);
            if (n == 0) {
                return ResponseEntity.ok(ResponseWrapper.failed(-1, "发布行程失败"));
            }
            String road = pd.getString("road");
            if (!Strings.isNullOrEmpty(road)) {
                String[] roads = road.split(",");
                for (int i = 0; i < roads.length; i++) {
                    String address = roads[i];
                    if (!StringUtils.isEmpty(address)) {
                        PageData addressPd = new PageData();
                        addressPd.put("orderUuid", orderUuid);
                        addressPd.put("address", roads[i]);
                        orderMapper.insertAddress(addressPd);
                    }
                }
            }
            PageData orderPdPara = new PageData();
            orderPdPara.put("uuid", uuid);
            orderPdPara.put("orderUuid", orderUuid);
            PageData orderPd = orderMapper.selectByOrderUuid(orderPdPara);
            List<PageData> list = addressMapper.selectByOrderUuid(orderUuid);
            orderPd.put("roadList", list);
            result = ResponseWrapper.succeed(orderPd);
            // TODO 添加短信发送，添加websocket推送后台
            StringBuffer stringBuffer = new StringBuffer();
            stringBuffer.append(msgHeader);
            stringBuffer.append("出发时间：" + fromTime + ",");
            stringBuffer.append("出发地址：" + fromAddress + ",");
            stringBuffer.append("目的地地址：" + toAddress + ",");
            //1-包车，2-单接送
            //1-出发时间、结束时间，出发地址、目的地地址，途径地址、联系，联系方式，用车人数，用车数量，用车数量是所有用车座位相加乘以用车数量
            //2-出发时间           出发地址、目的地地址，   、联系，联系方式，用车人数，用车数量，用车数量是所有用车座位相加乘以用车数量
            if (type.equals("1")) {
                stringBuffer.append("结束时间：" + toTime + ",");
                stringBuffer.append("途径地址：" + road + ",");
            }
            stringBuffer.append("联系人：" + contactName + ",");
            stringBuffer.append("联系方式：" + contactTel + ",");
            stringBuffer.append("用车人数：" + useNumber + ",");
            stringBuffer.append("用车数量：" + Integer.parseInt(useNumber)*Integer.parseInt(busNumber) + ",");
            String message = stringBuffer.toString();
            //获取审核通过车队的
            List<PageData> fleetList = fleetMapper.selectAllPassFleet();
            for (PageData fleetPd : fleetList) {
                String tel = fleetPd.getString("tel");
                JSONObject sms = SendSmsUtil.sendSms(message, tel);
                if (sms.getString("code").equals("0")) {
                    pd.put("message",message);
                    messageMapper.save(pd);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
            return ResponseEntity.ok(ResponseWrapper.failed(-1, "创建订单失败"));
        }
        return ResponseEntity.ok(result);
    }

    /**
     * 反馈建议
     *
     * @return
     * @throws IOException
     */
    @RequestMapping(value = "/feedback", method = RequestMethod.POST)
    public ResponseEntity feedback(HttpSession session) {
        ResponseWrapper result = ResponseWrapper.succeed(true);
        try {
            PageData pd = this.getPageData();
            String uuid = (String) session.getAttribute("uuid");
            pd.put("create_by", uuid);
            feedBackMapper.save(pd);
        } catch (Exception e) {
            e.printStackTrace();
            return ResponseEntity.ok(ResponseWrapper.failed(-1, "反馈建议失败"));
        }
        return ResponseEntity.ok(result);
    }

    /**
     * 添加联系人
     *
     * @return
     * @throws IOException
     */
    @RequestMapping(value = "/createContract", method = RequestMethod.POST)
    public ResponseEntity createContract(HttpSession session) {
        ResponseWrapper result = ResponseWrapper.succeed(true);
        try {
            PageData pd = this.getPageData();
            String uuid = (String) session.getAttribute("uuid");
            pd.put("user_uuid", uuid);
            contractMapper.save(pd);
        } catch (Exception e) {
            e.printStackTrace();
            return ResponseEntity.ok(ResponseWrapper.failed(-1, "添加联系人失败"));
        }
        return ResponseEntity.ok(result);
    }

    /**
     * 添加车队
     *
     * @return
     * @throws IOException
     */
    @RequestMapping(value = "/createFleet", method = RequestMethod.POST)
    public ResponseEntity createFleet(HttpSession session) {
        ResponseWrapper result = ResponseWrapper.succeed(true);
        try {
            PageData pd = this.getPageData();
            String tel = pd.getString("tel");
            if (Strings.isNullOrEmpty(tel)) {
                return ResponseEntity.ok(ResponseWrapper.failed(-1, "手机不能为空"));
            }
            if (!RegUtil.IsMobile(tel)) {
                return ResponseEntity.ok(ResponseWrapper.failed(-1, "请输入正确的手机号"));
            }
            pd.put("status", "1");
            int n = fleetMapper.save(pd);
            if (n == 0) {
                return ResponseEntity.ok(ResponseWrapper.failed(-1, "添加车队入住失败"));
            }
        } catch (Exception e) {
            e.printStackTrace();
            return ResponseEntity.ok(ResponseWrapper.failed(-1, "添加车队入住失败"));
        }
        return ResponseEntity.ok(result);
    }

    /**
     * 添加发票
     *
     * @return
     * @throws IOException
     */
    @RequestMapping(value = "/createInvoice", method = RequestMethod.POST)
    public ResponseEntity createInvoice(HttpSession session) {
        ResponseWrapper result = ResponseWrapper.succeed(true);
        try {
            PageData pd = this.getPageData();
            String uuid = (String) session.getAttribute("uuid");
            String invoiceHeader = pd.getString("invoiceHeader");
            if (Strings.isNullOrEmpty(invoiceHeader)) {
                return ResponseEntity.ok(ResponseWrapper.failed(-1, "发票抬头不能为空"));
            }
            String invoiceContact = pd.getString("invoiceContact");
            if (Strings.isNullOrEmpty(invoiceContact)) {
                return ResponseEntity.ok(ResponseWrapper.failed(-1, "收件人不能为空"));
            }
            String invoicePhone = pd.getString("invoicePhone");
            if (Strings.isNullOrEmpty(invoicePhone)) {
                return ResponseEntity.ok(ResponseWrapper.failed(-1, "收件人电话不能为空"));
            }
            String invoiceAddress = pd.getString("invoiceAddress");
            if (Strings.isNullOrEmpty(invoiceAddress)) {
                return ResponseEntity.ok(ResponseWrapper.failed(-1, "收件人地址不能为空"));
            }
            pd.put("uuid", uuid);
            int n = invoiceMapper.insert(pd);
            if (n == 0) {
                return ResponseEntity.ok(ResponseWrapper.failed(-1, "添加发票失败"));
            }
        } catch (Exception e) {
            e.printStackTrace();
            return ResponseEntity.ok(ResponseWrapper.failed(-1, "添加发票失败"));
        }
        return ResponseEntity.ok(result);
    }

    /**
     * 查询常用联系人
     *
     * @return
     * @throws IOException
     */
    @RequestMapping(value = "/listContract", method = RequestMethod.POST)
    public ResponseEntity listContract(HttpSession session) {
        ResponseWrapper result;
        try {
            String uuid = (String) session.getAttribute("uuid");
            List<PageData> list = contractMapper.selectByUuid(uuid);
            result = ResponseWrapper.succeed(list);
        } catch (Exception e) {
            e.printStackTrace();
            return ResponseEntity.ok(ResponseWrapper.failed(-1, "查询常用信息失败"));
        }
        return ResponseEntity.ok(result);
    }

    /**
     * 查询消息
     *
     * @return
     * @throws IOException
     */
    @RequestMapping(value = "/messageList", method = RequestMethod.POST)
    public ResponseEntity messageList(HttpSession session) {
        ResponseWrapper result;
        try {
            String uuid = (String) session.getAttribute("uuid");
            List<PageData> list = messageMapper.selectByUuid(uuid);
            PageData countMessagePd = messageMapper.countByUuid(uuid);
            countMessagePd.put("list", list);
            result = ResponseWrapper.succeed(countMessagePd);
        } catch (Exception e) {
            e.printStackTrace();
            return ResponseEntity.ok(ResponseWrapper.failed(-1, "查询消息失败"));
        }
        return ResponseEntity.ok(result);
    }

    /**
     * 更新消息为已读
     *
     * @return
     * @throws IOException
     */
    @RequestMapping(value = "/updateMessage", method = RequestMethod.POST)
    public ResponseEntity updateMessage(HttpSession session) {
        ResponseWrapper result;
        try {
            PageData pd = this.getPageData();
            String ids = pd.getString("ids");
            int n = messageMapper.updateIsYorn(ids);
            if (n == 0) {
                return ResponseEntity.ok(ResponseWrapper.failed(-1, "标记已读失败"));
            }
            result = ResponseWrapper.succeed(true);
        } catch (Exception e) {
            e.printStackTrace();
            return ResponseEntity.ok(ResponseWrapper.failed(-1, "更新消息为已读失败"));
        }
        return ResponseEntity.ok(result);
    }

    /**
     * 更新消息为删除
     *
     * @return
     * @throws IOException
     */
    @RequestMapping(value = "/updateDeleteMessage", method = RequestMethod.POST)
    public ResponseEntity updateDeleteMessage(HttpSession session) {
        ResponseWrapper result;
        try {
            PageData pd = this.getPageData();
            String ids = pd.getString("ids");
            int n = messageMapper.updateIsDelete(ids);
            if (n == 0) {
                return ResponseEntity.ok(ResponseWrapper.failed(-1, "删除消息失败"));
            }
            result = ResponseWrapper.succeed(true);
        } catch (Exception e) {
            e.printStackTrace();
            return ResponseEntity.ok(ResponseWrapper.failed(-1, "删除消息失败"));
        }
        return ResponseEntity.ok(result);
    }

    /**
     * 查询发票
     *
     * @return
     * @throws IOException
     */
    @RequestMapping(value = "/listInvoice", method = RequestMethod.POST)
    public ResponseEntity listInvoice(HttpSession session) {
        ResponseWrapper result;
        try {
            String uuid = (String) session.getAttribute("uuid");
            List<PageData> list = invoiceMapper.selectByUuid(uuid);
            result = ResponseWrapper.succeed(list);
        } catch (Exception e) {
            e.printStackTrace();
            return ResponseEntity.ok(ResponseWrapper.failed(-1, "查询发票失败"));
        }
        return ResponseEntity.ok(result);
    }

    /**
     * 删除联系人
     *
     * @return
     * @throws IOException
     */
    @RequestMapping(value = "/deleteContract", method = RequestMethod.POST)
    public ResponseEntity deleteContract(HttpSession session) {
        ResponseWrapper result = ResponseWrapper.succeed(true);
        try {
            PageData pd = this.getPageData();
            String id = pd.getString("id");
            contractMapper.delete(id);
        } catch (Exception e) {
            e.printStackTrace();
            return ResponseEntity.ok(ResponseWrapper.failed(-1, "删除联系人失败"));
        }
        return ResponseEntity.ok(result);
    }

    /**
     * 删除发票
     *
     * @return
     * @throws IOException
     */
    @RequestMapping(value = "/deleteInvoice", method = RequestMethod.POST)
    public ResponseEntity deleteInvoice(HttpSession session) {
        ResponseWrapper result = ResponseWrapper.succeed(true);
        try {
            PageData pd = this.getPageData();
            String id = pd.getString("id");
            int n = invoiceMapper.delete(id);
            if (n == 0) {
                return ResponseEntity.ok(ResponseWrapper.failed(-1, "删除发票失败"));
            }
        } catch (Exception e) {
            e.printStackTrace();
            return ResponseEntity.ok(ResponseWrapper.failed(-1, "删除发票失败"));
        }
        return ResponseEntity.ok(result);
    }

    /**
     * 修改联系人
     *
     * @return
     * @throws IOException
     */
    @RequestMapping(value = "/updateContract", method = RequestMethod.POST)
    public ResponseEntity updateContract(HttpSession session) {
        ResponseWrapper result = ResponseWrapper.succeed(true);
        try {
            PageData pd = this.getPageData();
            String id = pd.getString("id");
            String name = pd.getString("name");
            String phone = pd.getString("phone");
            contractMapper.update(id, name, phone);
        } catch (Exception e) {
            e.printStackTrace();
            return ResponseEntity.ok(ResponseWrapper.failed(-1, "修改联系人失败"));
        }
        return ResponseEntity.ok(result);
    }

    /**
     * 修改发票
     *
     * @return
     * @throws IOException
     */
    @RequestMapping(value = "/updateInvoice", method = RequestMethod.POST)
    public ResponseEntity updateInvoice(HttpSession session) {
        ResponseWrapper result = ResponseWrapper.succeed(true);
        try {
            PageData pd = this.getPageData();
            String id = pd.getString("id");
            String invoiceHeader = pd.getString("invoiceHeader");
            if (Strings.isNullOrEmpty(invoiceHeader)) {
                return ResponseEntity.ok(ResponseWrapper.failed(-1, "发票抬头不能为空"));
            }
            String invoiceContact = pd.getString("invoiceContact");
            if (Strings.isNullOrEmpty(invoiceContact)) {
                return ResponseEntity.ok(ResponseWrapper.failed(-1, "收件人不能为空"));
            }
            String invoicePhone = pd.getString("invoicePhone");
            if (Strings.isNullOrEmpty(invoicePhone)) {
                return ResponseEntity.ok(ResponseWrapper.failed(-1, "收件人电话不能为空"));
            }
            String invoiceAddress = pd.getString("invoiceAddress");
            if (Strings.isNullOrEmpty(invoiceAddress)) {
                return ResponseEntity.ok(ResponseWrapper.failed(-1, "收件人地址不能为空"));
            }
            String invoiceDuty = pd.getString("invoiceDuty");
            int n = invoiceMapper.update(id, invoiceHeader, invoiceContact, invoicePhone, invoiceAddress, invoiceDuty);
            if (n == 0) {
                return ResponseEntity.ok(ResponseWrapper.failed(-1, "修改发票失败"));
            }
        } catch (Exception e) {
            e.printStackTrace();
            return ResponseEntity.ok(ResponseWrapper.failed(-1, "修改发票失败"));
        }
        return ResponseEntity.ok(result);
    }


    /**
     * 确认订单发布
     *
     * @return
     * @throws IOException
     */
    @RequestMapping(value = "/updateOrder", method = RequestMethod.POST)
    public ResponseEntity updateOrder(HttpSession session) {
        ResponseWrapper result = ResponseWrapper.succeed(true);
        try {
            PageData pd = this.getPageData();
            String orderUuid = pd.getString("orderUuid");
            String uuid = (String) session.getAttribute("uuid");
            int n = orderMapper.update("1", uuid, orderUuid);
            if (n == 0) {
                return ResponseEntity.ok(ResponseWrapper.failed(-1, "确认发布失败"));
            }
//            PageData userPd = userMapper.selectByUuid(pd.getString("uuid"));
//            String tel = userPd.getString("tel");
//            String msg = msgHeader + "平台已对订单号【" + pd.getString("orderUuid") +"】进行报价，报价金额为" + pd.getString("auditMoney") + ",请前往网站进行查看。";
//            JSONObject sms = SendSmsUtil.sendSms(msg, tel);
//            if (sms.getString("code").equals("0")) {
//                pd.put("message",msg);
//                messageMapper.save(pd);
////                smsCodeMapper.insert(tel, messageCode, type);
//            } else {
//                return ResponseEntity.ok(ResponseWrapper.failed(-1, "短信发送失败"));
//            }
        } catch (Exception e) {
            e.printStackTrace();
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(e.getMessage());
        }
        return ResponseEntity.ok(result);
    }

    /**
     * 查看订单详情
     *
     * @return
     * @throws IOException
     */
    @RequestMapping(value = "/detailOrder", method = RequestMethod.POST)
    public ResponseEntity detailOrder(HttpSession session) {
        ResponseWrapper result;
        try {
            PageData pd = this.getPageData();
            String uuid = (String) session.getAttribute("uuid");
            pd.put("uuid", uuid);
            PageData orderPd = orderMapper.selectByOrderUuid(pd);
            result = ResponseWrapper.succeed(orderPd);
        } catch (Exception e) {
            e.printStackTrace();
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(e.getMessage());
        }
        return ResponseEntity.ok(result);
    }

    /**
     * 查询订单,根据状态status
     *
     * @return
     * @throws IOException
     */
    @RequestMapping(value = "/orderList", method = RequestMethod.POST)
    public ResponseEntity orderList(HttpSession session) {
        ResponseWrapper result;
        try {
            PageData pd = this.getPageData();
            String uuid = (String) session.getAttribute("uuid");
            pd.put("uuid", uuid);
            PageData orderList = new PageData();
            PageData countOrderPd = orderMapper.countOrder(pd);
            int createOrder = 0;
            int bjOrder = 0;
            int finishOrder = 0;
            int xszOrder = 0;
            int qrOrder = 0;
            if (countOrderPd != null) {
                createOrder = countOrderPd.getBigDecimal("createOrder").intValue();
                bjOrder = countOrderPd.getBigDecimal("bjOrder").intValue();
                finishOrder = countOrderPd.getBigDecimal("finishOrder").intValue();
                xszOrder = countOrderPd.getBigDecimal("xszOrder").intValue();
                qrOrder = countOrderPd.getBigDecimal("qrOrder").intValue();
            }
            orderList.put("createOrder", createOrder);
            orderList.put("bjOrder", bjOrder);
            orderList.put("finishOrder", finishOrder);
            orderList.put("xszOrder", xszOrder);
            orderList.put("qrOrder", qrOrder);
            List<PageData> list = orderMapper.selectByUuidAndStatus(pd);
            orderList.put("list", list);
            result = ResponseWrapper.succeed(orderList);
        } catch (Exception e) {
            e.printStackTrace();
            return ResponseEntity.ok(ResponseWrapper.failed(-1, "查询订单失败"));
        }
        return ResponseEntity.ok(result);
    }

    /**
     * 注册
     *
     * @param session
     * @return
     */
    @RequestMapping(value = "/ownRegister", method = RequestMethod.GET)
    public ResponseEntity register(HttpSession session) {
        ResponseWrapper result;
        try {
            PageData pd = this.getPageData();
            String tel = pd.getString("tel");
            String type = pd.getString("type");

            PageData userPd = userMapper.selectByTypeAndTel(type, tel);
            if (!StringUtils.isEmpty(userPd)) return ResponseEntity.ok(ResponseWrapper.failed(-1, "您已经注册，请前往登录"));
            if (Strings.isNullOrEmpty(tel)) {
                return ResponseEntity.ok(ResponseWrapper.failed(-1, "手机不能为空"));
            }
            if (!RegUtil.IsMobile(tel)) {
                return ResponseEntity.ok(ResponseWrapper.failed(-1, "请输入正确的手机号"));
            }
            String code = pd.getString("code");
            if (Strings.isNullOrEmpty(code)) {
                return ResponseEntity.ok(ResponseWrapper.failed(-1, "验证码不能为空"));
            }
            String password = pd.getString("password");
            if (Strings.isNullOrEmpty(password)) {
                return ResponseEntity.ok(ResponseWrapper.failed(-1, "密码不能为空"));
            }
            PageData smsCodePd = smsCodeMapper.selectSmsCode("1", tel);
            String oldSms = smsCodePd.getString("code");
            if (!oldSms.equals(code)) {
                return ResponseEntity.ok(ResponseWrapper.failed(-1, "验证码错误"));
            }
            String sendTime = smsCodePd.getString("sendTime");
            Date sendDate = DateUtil.string2date(sendTime, "yyyy-MM-dd HH:mm:ss");
            DateTime date = (new DateTime(sendDate)).plusSeconds(300);
            if (date.isBeforeNow()) {
                return ResponseEntity.ok(ResponseWrapper.failed(-1, "验证码已过期"));
            }
            String uuid = StringUtils.getUUId();
            pd.put("uuid", uuid);
            pd.put("nickname", tel);
            String md5Password = StringUtils.getMD5Str(password);
            pd.put("password", md5Password);
            int n = userMapper.saveClient(pd);
            if (n == 0) {
                return ResponseEntity.ok(ResponseWrapper.failed(-1, "注册失败"));
            }
            PageData newUserPd = userMapper.selectByTypeAndTel(type, tel);
            PageData messagePd = new PageData();
            messagePd.put("uuid", newUserPd.getString("uuid"));
            messagePd.put("message", "恭喜您注册成功，请尽快完善个人信息");
            messageMapper.save(messagePd);
            result = ResponseWrapper.succeed(true);
        } catch (Exception e) {
            e.printStackTrace();
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(e.getMessage());
        }
        return ResponseEntity.ok(result);
    }

    /**
     * 个人资料
     *
     * @return
     * @throws IOException
     */
    @RequestMapping(value = "/detailUser", method = RequestMethod.POST)
    public ResponseEntity detailUser(HttpSession session) {
        ResponseWrapper result;
        try {
            String uuid = (String) session.getAttribute("uuid");
            PageData userPd = userMapper.selectByUuid(uuid);
            if (StringUtils.isEmpty(userPd)) {
                return ResponseEntity.ok(ResponseWrapper.failed(-1, "该手机号未注册，请前往注册"));
            }
            result = ResponseWrapper.succeed(userPd);
        } catch (Exception e) {
            e.printStackTrace();
            return ResponseEntity.ok(ResponseWrapper.failed(-1, "获取个人资料失败"));
        }
        return ResponseEntity.ok(result);
    }

    /**
     * 修改个人资料
     *
     * @return
     * @throws IOException
     */
    @RequestMapping(value = "/updateUser", method = RequestMethod.POST)
    public ResponseEntity updateUser(HttpSession session) {
        ResponseWrapper result = ResponseWrapper.succeed(true);
        try {
            PageData pd = this.getPageData();
            String nickname = pd.getString("nickname");
            String birthday = pd.getString("birthday");
            String email = pd.getString("email");
            String sex = pd.getString("sex");
            String headerUrl = pd.getString("headerUrl");
            String uuid = (String) session.getAttribute("uuid");
            PageData userPd = userMapper.selectByUuid(uuid);
            if (StringUtils.isEmpty(userPd)) {
                return ResponseEntity.ok(ResponseWrapper.failed(-1, "该手机号未注册，请前往注册"));
            }
            int n = userMapper.updateUserData(uuid, nickname, birthday, email, sex, headerUrl);
            if (n == 0) {
                return ResponseEntity.ok(ResponseWrapper.failed(-1, "个人资料更新失败"));
            }
        } catch (Exception e) {
            e.printStackTrace();
            return ResponseEntity.ok(ResponseWrapper.failed(-1, "个人资料更新失败"));
        }
        return ResponseEntity.ok(result);
    }

}
