package com.platform.commons.utils;

import com.google.common.collect.Maps;

import java.util.Comparator;
import java.util.Map;

/**
 *
 *
 *
 * 杭州猜一猜网络科技有限公司
 * 浪子
 * 2018/5/1718:30
 */
public final class SortMap {
    private SortMap() {

    }
    /**
     * 使用 Map按key进行排序
     *
     * @param map map
     * @return Map
     */
    public static Map<String, Object> sortMapByKey(Map<String, Object> map) {
        if (map == null || map.isEmpty()) {
            return null;
        }
        Map<String, Object> sortMap = Maps.newTreeMap(new MapKeyComparator());
        sortMap.putAll(map);
        return sortMap;
    }

    /**
     * 使用 Map按key进行排序
     *
     * @param map map
     * @return Map
     */
    public static Map<String, Object> sortMapByAscKey(Map<String, Object> map) {
        if (map == null || map.isEmpty()) {
            return null;
        }
        Map<String, Object> sortMap = Maps.newTreeMap(new MapKeyAscComparator());
        sortMap.putAll(map);
        return sortMap;
    }
}

/**
 * 内部类
 */
class MapKeyComparator implements Comparator<String> {

    @Override
    public int compare(String str1, String str2) {

        return str2.compareTo(str1);
    }
}

/**
 * 内部类
 */
class MapKeyAscComparator implements Comparator<String> {

    @Override
    public int compare(String str1, String str2) {
        return str1.compareTo(str2);
    }
}
