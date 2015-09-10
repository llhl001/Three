package light.mvc.model.sale;

import java.math.BigDecimal;
import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;

import light.mvc.model.base.IdEntity;

import org.hibernate.annotations.DynamicInsert;
import org.hibernate.annotations.DynamicUpdate;
import org.hibernate.validator.constraints.NotBlank;

@Entity
@Table(name = "sale_goods")
@DynamicInsert(true)
@DynamicUpdate(true)
public class Tgoods extends IdEntity implements java.io.Serializable {

	private String name;
	private String code;
	private Tcategory category;// cat_id
	private Float stock;// '库存',
	private Integer warn_stock;// '库存警告',
	private String weight;
	private String unit;// 单位
	private BigDecimal out_price;// decimal(8,2) not null COMMENT '销售价',
	private BigDecimal in_price;// decimal(8,2) not null COMMENT '进价-未使用',
	private BigDecimal market_price;// decimal(8,2) not null COMMENT '市场价',
	private BigDecimal promote_price;// decimal(8,2) not null COMMENT '促销价',
	private Integer ispromote;// tinyint(1) not null '0' COMMENT '是否启用',
	private Date promote_start_date;// date not null COMMENT '促销开始时间',
	private Date promote_end_date;// date not null COMMENT '促销结束时间',
	private Integer ismemberprice;// tinyint(1) not null '1' COMMENT '是否享受会员价',
	private Date creatymd;// date not null COMMENT '商品添加时间',
	private Date lastinymd;// date not null COMMENT '最后进货时间',
	private String goods_desc;// '商品简介',
	private Float countamount;// float(10,2) unsigned not null COMMENT '商品总进价',
	private Float salesamount;// float(10,2) unsigned not null COMMENT '销售总额',

	@NotBlank
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	@NotBlank
	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	@NotNull
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "cat_id")
	public Tcategory getCategory() {
		return category;
	}

	public void setCategory(Tcategory category) {
		this.category = category;
	}

	public Float getStock() {
		return stock;
	}

	public void setStock(Float stock) {
		this.stock = stock;
	}

	public Integer getWarn_stock() {
		return warn_stock;
	}

	public void setWarn_stock(Integer warn_stock) {
		this.warn_stock = warn_stock;
	}

	public String getWeight() {
		return weight;
	}

	public void setWeight(String weight) {
		this.weight = weight;
	}

	public String getUnit() {
		return unit;
	}

	public void setUnit(String unit) {
		this.unit = unit;
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

	public BigDecimal getMarket_price() {
		return market_price;
	}

	public void setMarket_price(BigDecimal market_price) {
		this.market_price = market_price;
	}

	public BigDecimal getPromote_price() {
		return promote_price;
	}

	public void setPromote_price(BigDecimal promote_price) {
		this.promote_price = promote_price;
	}

	public Integer getIspromote() {
		return ispromote;
	}

	public void setIspromote(Integer ispromote) {
		this.ispromote = ispromote;
	}

	public Date getPromote_start_date() {
		return promote_start_date;
	}

	public void setPromote_start_date(Date promote_start_date) {
		this.promote_start_date = promote_start_date;
	}

	public Date getPromote_end_date() {
		return promote_end_date;
	}

	public void setPromote_end_date(Date promote_end_date) {
		this.promote_end_date = promote_end_date;
	}

	public Integer getIsmemberprice() {
		return ismemberprice;
	}

	public void setIsmemberprice(Integer ismemberprice) {
		this.ismemberprice = ismemberprice;
	}

	public Date getCreatymd() {
		return creatymd;
	}

	public void setCreatymd(Date creatymd) {
		this.creatymd = creatymd;
	}

	public Date getLastinymd() {
		return lastinymd;
	}

	public void setLastinymd(Date lastinymd) {
		this.lastinymd = lastinymd;
	}

	public String getGoods_desc() {
		return goods_desc;
	}

	public void setGoods_desc(String goods_desc) {
		this.goods_desc = goods_desc;
	}

	public Float getCountamount() {
		return countamount;
	}

	public void setCountamount(Float countamount) {
		this.countamount = countamount;
	}

	public Float getSalesamount() {
		return salesamount;
	}

	public void setSalesamount(Float salesamount) {
		this.salesamount = salesamount;
	}

}
