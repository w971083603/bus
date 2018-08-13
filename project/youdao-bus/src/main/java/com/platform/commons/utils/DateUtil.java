package com.platform.commons.utils;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;

/**
 * @Title: com.platform.commons.utils.
 * @Description：TODO
 * @Company：杭州猜一猜网络科技有限公司
 * @author： 智刚
 * @date：14:06 2018/4/18
 */
public class DateUtil {

    private final static SimpleDateFormat sdfTime = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

    private final static SimpleDateFormat sdfTime1 = new SimpleDateFormat("yyyy-MM-dd");

    private final static SimpleDateFormat sdfSTime = new SimpleDateFormat("yyyyMMddhhmmssSSS");

    /**
     * 获取yyyyMMddhhmmssSSS格式
     *
     * @return
     */
    public static String getDayshmsS(){
        return sdfSTime.format(new Date());
    }

    /**
     * 格式化日期  yyyy-MM-dd
     *
     * @return
     */
    public static Date fomatDate(String date) {
        DateFormat fmt = new SimpleDateFormat("yyyy-MM-dd");
        try {
            return fmt.parse(date);
        } catch ( Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    /**
     * 格式化日期  yyyy-MM-dd HH:mm:ss
     *
     * @return
     */
    public static Date fomatDate2(String date) {
        DateFormat fmt = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        try {
            return fmt.parse(date);
        } catch ( Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    /**
     * 获取YYYY-MM-DD HH:mm:ss格式
     *
     * @return
     */
    public static String getTime() {
        return sdfTime.format(new Date());
    }


    /**
     * 得到某年某周的第一天
     *
     * @param year
     * @param week
     * @return
     */
    public static Date getFirstDayOfWeek(int year, int week) {
        Calendar c = new GregorianCalendar();
        c.set(Calendar.YEAR, year);
        c.set (Calendar.MONTH, Calendar.JANUARY);
        c.set(Calendar.DATE, 1);

        Calendar cal = (GregorianCalendar) c.clone();
        cal.add(Calendar.DATE, week * 7);

        return getFirstDayOfWeek(cal.getTime());
    }

    /**
     * 得到某年某周的最后一天
     *
     * @param year
     * @param week
     * @return
     */
    public static Date getLastDayOfWeek(int year, int week) {
        Calendar c = new GregorianCalendar();
        c.set(Calendar.YEAR, year);
        c.set(Calendar.MONTH, Calendar.JANUARY);
        c.set(Calendar.DATE, 1);

        Calendar cal = (GregorianCalendar) c.clone();
        cal.add(Calendar.DATE , week * 7);

        return getLastDayOfWeek(cal.getTime());
    }

    /**
     * @param s
     * @param e
     * @return boolean
     * @throws
     * @Title: compareDate
     * @Description: TODO(时间比较 ， 如果s > = e 返回true 否则返回false)
     * @author luguosui
     */
    public static int compareDateTime(String s, String e) throws Exception {
        if (sdfTime.parse(s).getTime() > sdfTime.parse(e).getTime()) {
            return 1;
        } else if (sdfTime.parse(s).getTime() == sdfTime.parse(e).getTime()) {
            return 0;
        } else {
            return -1;
        }
    }

    public static int compareDateTime1(String s, String e) throws Exception {
        if (sdfTime1.parse(s).getTime() > sdfTime1.parse(e).getTime()) {
            return 1;
        } else if (sdfTime1.parse(s).getTime() == sdfTime1.parse(e).getTime()) {
            return 0;
        } else {
            return -1;
        }
    }

    /**
     * 获取时间差值
     * @param smdate
     * @param bdate
     * @return
     */
    public static Integer getDayDiff(String smdate,String bdate) {
        long between_days = 0L;
        try {
            SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
            Calendar cal = Calendar.getInstance();
            cal.setTime(sdf.parse(smdate));
            long time1 = cal.getTimeInMillis();
            cal.setTime(sdf.parse(bdate));
            long time2 = cal.getTimeInMillis();
            between_days=(time2-time1)/(1000*3600*24);
            System.out.println();
        }catch (Exception e) {
            e.printStackTrace();
        }
        return Integer.parseInt(String.valueOf(between_days));
    }

    /**
     * 取得指定日期所在周的第一天
     *
     * @param date
     * @return
     */
    public static Date getFirstDayOfWeek(Date date) {
        Calendar c = new GregorianCalendar();
        c.setFirstDayOfWeek(Calendar.MONDAY);
        c.setTime(date);
        c.set(Calendar.DAY_OF_WEEK, c.getFirstDayOfWeek()); // Monday
        return c.getTime ();
    }

    /**
     * 得到  n天  之后的日期 yyyy-MM-dd
     * @param days
     * @return
     */
    public static String getAfterDayDate(String beginDate,String days) {
        int daysInt = Integer.parseInt(days);

        Calendar calendar = new GregorianCalendar();
        calendar.setTime(fomatDate(beginDate));

        calendar.add(Calendar.DATE, daysInt); // 日期减 如果不够减会将月变动
        Date date = calendar.getTime();

        SimpleDateFormat sdfd = new SimpleDateFormat("yyyy-MM-dd");
        String dateStr = sdfd.format(date);

        return dateStr;
    }

    /**
     * 取得指定日期所在周的最后一天
     *
     * @param date
     * @return
     */
    public static Date getLastDayOfWeek(Date date) {
        Calendar c = new GregorianCalendar();
        c.setFirstDayOfWeek(Calendar.MONDAY);
        c.setTime(date);
        c.set(Calendar.DAY_OF_WEEK, c.getFirstDayOfWeek() + 6); // Sunday
        return c.getTime();
    }

    public static java.util.Date getMonthFstDay(java.util.Date now)
    {
        if (now == null) {
            now = new java.util.Date();
        }
        return string2date(date2string(now, "yyyy-MM") + "-01", "yyyy-MM-dd");
    }

    public static java.util.Date getMonthLstDay(java.util.Date now)
    {
        if (now == null) {
            now = new java.util.Date();
        }
        Calendar calendar = Calendar.getInstance();
        calendar.setTime(now);
        Integer[] days = { Integer.valueOf(31), Integer.valueOf(_isLeapYear(calendar.get(1)) ? 29 : 28), Integer.valueOf(31),
                Integer.valueOf(30), Integer.valueOf(31), Integer.valueOf(30), Integer.valueOf(31), Integer.valueOf(31), Integer.valueOf(30), Integer.valueOf(31), Integer.valueOf(30), Integer.valueOf(31) };
        return string2date(date2string(now, "yyyy-MM") + "-" + days[calendar.get(2)], "yyyy-MM-dd");
    }

    public static String date2string(java.util.Date date, String strdf)
    {
        if (date != null)
        {
            DateFormat df = new SimpleDateFormat(strdf);
            return df.format(date);
        }
        return null;
    }

    public static java.util.Date string2date(String strDate, String strdf)
    {
        try
        {
            if (strDate == null) {
                return null;
            }
            if ((strdf == null) || (strdf.trim().equals(""))) {
                strdf = "yyyy-MM-dd";
            }
            return new SimpleDateFormat(strdf).parse(strDate);
        }
        catch (Exception localException) {}
        return null;
    }

    private static boolean _isLeapYear(int year)
    {
        return ((year % 100 == 0) && (year % 400 == 0)) || (
                (year % 100 != 0) && (year % 4 == 0));
    }

    public static void main(String[] args) {
        int year = 2018;
        int week = 14;
        System.out.println("getFirstDayOfWeek = " + getFirstDayOfWeek(year, week));
        System.out.println("getLastDayOfWeek = " + getLastDayOfWeek(year, week));
    }
}
