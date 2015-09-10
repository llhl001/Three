package light.mvc.model.sale;

import java.math.BigDecimal;
import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.Table;

import light.mvc.model.base.IdEntity;

import org.hibernate.annotations.DynamicInsert;
import org.hibernate.annotations.DynamicUpdate;

@Entity
@Table(name = "sale_purchase")
@DynamicInsert(true)
@DynamicUpdate(true)
public class Tpurchase extends IdEntity implements java.io.Serializable {
	private Integer goods_id;// int(10) not null,
	private String goods_sn;// varchar(32) not null,
	private String goods_name;// varchar(100) not null,
	private Integer cat_id;// int(10) not null,
	private Float in_num;// float not null COMMENT '进货数量',
	private Float out_num;// float not null '0' COMMENT '销售数量',
	private BigDecimal in_price;// decimal(8,2) not null COMMENT '进价',
	private Date dateymd;// date not null COMMENT '进货时间',
	private Integer isdel;// tinyint(1) not null '0' COMMENT '是否可用1不可用 0可用',

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

	public Float getIn_num() {
		return in_num;
	}

	public void setIn_num(Float in_num) {
		this.in_num = in_num;
	}

	public Float getOut_num() {
		return out_num;
	}

	public void setOut_num(Float out_num) {
		this.out_num = out_num;
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

	public Integer getIsdel() {
		return isdel;
	}

	public void setIsdel(Integer isdel) {
		this.isdel = isdel;
	}

}
