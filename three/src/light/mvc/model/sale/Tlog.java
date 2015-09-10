package light.mvc.model.sale;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.Table;

import light.mvc.model.base.IdEntity;

import org.hibernate.annotations.DynamicInsert;
import org.hibernate.annotations.DynamicUpdate;
import org.hibernate.validator.constraints.NotBlank;

@Entity
@Table(name = "sale_log")
@DynamicInsert(true)
@DynamicUpdate(true)
public class Tlog extends IdEntity implements java.io.Serializable {

	private Integer type;// tinyint(1) not null COMMENT '日志类型：0添加商品1商品入库2商品出库',
	private Long goods_id;// int not null COMMENT '商品ID',
	private String content;// text not null,
	private Long user_id;// int(10) not null,
	private String username;// int(10) not null,
	private Date dateymd;// date not null,

	@NotBlank
	public Integer getType() {
		return type;
	}

	public void setType(Integer type) {
		this.type = type;
	}

	@NotBlank
	public Long getGoods_id() {
		return goods_id;
	}

	public void setGoods_id(Long goods_id) {
		this.goods_id = goods_id;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	@NotBlank
	public Long getUser_id() {
		return user_id;
	}

	public void setUser_id(Long user_id) {
		this.user_id = user_id;
	}

	@NotBlank
	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public Date getDateymd() {
		return dateymd;
	}

	public void setDateymd(Date dateymd) {
		this.dateymd = dateymd;
	}

}
