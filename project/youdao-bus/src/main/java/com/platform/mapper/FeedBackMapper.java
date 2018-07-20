package com.platform.mapper;


import com.platform.commons.utils.PageData;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

/**
 * Created by Administrator on 2017/4/28.
 */
public interface FeedBackMapper {

    int save(PageData pd);
}
