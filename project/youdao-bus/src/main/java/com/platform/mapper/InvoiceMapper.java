package com.platform.mapper;


import com.platform.commons.utils.PageData;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import java.util.List;

/**
 * Created by Administrator on 2017/4/28.
 */
public interface InvoiceMapper {

    int insert(PageData pd);

    @Select("select invoice_header as invoiceHeader,invoice_contact as invoiceContact," +
            "invoice_phone as invoicePhone,invoice_address as invoiceAddress,invoice_duty as invoiceDuty," +
            "id ,user_uuid as uuid from t_invoice where user_uuid = #{uuid}")
    List<PageData> selectByUuid(@Param("uuid") String uuid);

    @Delete("delete from t_invoice where id = #{id}")
    int delete(@Param("id") String id);

    @Update("update t_invoice set invoice_header = #{invoiceHeader} , invoice_contact = #{invoiceContact},"
            +" invoice_phone = #{invoicePhone}, invoice_address = #{invoiceAddress}, invoice_duty = #{invoiceDuty} where id = #{id}")
    int update(@Param("id") String id,@Param("invoiceHeader") String invoiceHeader,@Param("invoiceContact") String invoiceContact,
               @Param("invoicePhone") String invoicePhone,@Param("invoiceAddress") String invoiceAddress,@Param("invoiceDuty") String invoiceDuty);
}
