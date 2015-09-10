package light.mvc.model.sale;

import java.math.BigDecimal;
import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.Table;

import light.mvc.model.base.IdEntity;

import org.hibernate.annotations.DynamicInsert;
import org.hibernate.annotations.DynamicUpdate;

@Entity
@Table(name = "sale_sales")
@DynamicInsert(true)
@DynamicUpdate(true)
public class Tsales extends IdEntity implements java.io.Serializable {
	private Integer goods_id;// int(10) not null,
	private String goods_sn;// varchar(16) not null,
	private String goods_name;// varchar(100) not null,
	private Integer cat_id;// int(10) not null,
	private String order_id;// varchar(14) not null,
	private Integer mid;// int(10) not null,
	private String membercardid;// varchar(16) not null COMMENT '会员卡卡号',
	private String realname;// varchar(32) not null,
	private Float num;// float not null,
	private BigDecimal price;// decimal(8,2) not null COMMENT '实际售价(优惠后的金额)',
	private BigDecimal out_price;// decimal(8,2) not null COMMENT
									// '商品表的售价(未优惠的价格)',
	private BigDecimal in_price;// decimal(8,2) not null COMMENT '销售时的平均进价',
	private Date dateymd;// date not null,
	private Float m_discount;// float(10,2) unsigned not null '0.00' COMMENT
								// '会员优惠金额',
	private Float p_discount;// float(10,2) unsigned not null '0.00' COMMENT
								// '促销优惠的金额',
	private Integer refund_type;// tinyint(1) not null '0' COMMENT '退款类型 0无退款
								// 1全额退款 2部分退款',
	private Float refund_num;// float not null '0' COMMENT '退货数量',
	private BigDecimal refund_amount;// decimal(8,2) not null '0.00' COMMENT
										// '退款金额',
	private Integer sales_type;// tinyint(4) not null '0' COMMENT '销售类型
								// 0正常销售1退货销售',

	public Integer getGoods_id() {
		return goods_id;
	}

	public void setGoods_id(Integer goods_id) {
		this.goods_id = goods_id;
	}

	public String getGoods_sn() {
		return goods_sn;
	}

	public void setGoods_sn(String goods_sn) {
		this.goods_sn = goods_sn;
	}

	public String getGoods_name() {
		return goods_name;
	}

	public void setGoods_name(String goods_name) {
		this.goods_name = goods_name;
	}

	public Integer getCat_id() {
		return cat_id;
	}

	public void setCat_id(Integer cat_id) {
		this.cat_id = cat_id;
	}

	public String getOrder_id() {
		return order_id;
	}

	public void setOrder_id(String order_id) {
		this.order_id = order_id;
	}

	public Integer getMid() {
		return mid;
	}

	public void setMid(Integer mid) {
		this.mid = mid;
	}

	public String getMembercardid() {
		return membercardid;
	}

	public void setMembercardid(String membercardid) {
		this.membercardid = membercardid;
	}

	public String getRealname() {
		return realname;
	}

	public void setRealname(String realname) {
		this.realname = realname;
	}

	public Float getNum() {
		return num;
	}

	public void setNum(Float num) {
		this.num = num;
	}

	public BigDecimal getPrice() {
		return price;
	}

	public void setPrice(BigDecimal price) {
		this.price = price;
	}

	public BigDecimal getOut_price() {
		return out_price;
	}

	public void setOut_price(BigDecimal out_price) {
		this.out_price = out_price;
	}

	public BigDecimal getIn_price() {
		return in_price;
	}

	public void setIn_price(BigDecimal in_price) {
		this.in_price = in_price;
	}

	public Date getDateymd() {
		return dateymd;
	}

	public void setDateymd(Date dateymd) {
		this.dateymd = dateymd;
	}

	public Float getM_discount() {
		return m_discount;
	}

	public void setM_discount(Float m_discount) {
		this.m_discount = m_discount;
	}

	public Float getP_discount() {
		return p_discount;
	}

	public void setP_discount(Float p_discount) {
		this.p_discount = p_discount;
	}

	public Integer getRefund_type() {
		return refund_type;
	}

	public void setRefund_type(Integer refund_type) {
		this.refund_type = refund_type;
	}

	public Float getRefund_num() {
		return refund_num;
	}

	public void setRefund_num(Float refund_num) {
		this.refund_num = refund_num;
	}

	public BigDecimal getRefund_amount() {
		return refund_amount;
	}

	public void setRefund_amount(BigDecimal refund_amount) {
		this.refund_amount = refund_amount;
	}

	public Integer getSales_type() {
		return sales_type;
	}

	public void setSales_type(Integer sales_type) {
		this.sales_type = sales_type;
	}

}
