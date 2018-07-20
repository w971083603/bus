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
public interface SystemMapper {
    List<PageData> dataGridMessage(Map<String, String> whereMap);
    List<PageData> dataGridProblem(Map<String, String> whereMap);
}
