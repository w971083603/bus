package com.platform.commons.utils;

import lombok.Data;

/**
 * 系统参数
 * <p>
 * Created by Administrator on 2017/6/30.
 */
@Data
public class SystemConfig {

    /**
     * 获取系统参数配置的实例
     *
     * @return
     */
    public static SystemConfig getInstance() {
        SystemConfig config = (SystemConfig) SpringContextUtil.getBean("systemConfig");
        return config;
    }

    /**
     * 域名地址（视图）
     */
    private String ABSOLUTELY_URL;
    /**
     * 域名地址（视图）
     */
    private String URL_BASE_IMG;
    /**
     * 接口地址（CMS）
     */
    private String URL_BASE_CMS;
    /**
     * 接口地址（API）
     */
    private String URL_BASE_API;
    /**
     * 压缩包存放地址
     */
    private String URL_ZIP_URL;
    /**
     * 要压缩的文件存放地址
     */
    private String URL_ZIPFILE_URL;

}
