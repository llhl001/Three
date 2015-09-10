package light.mvc.model.mb;


import javax.persistence.Entity;
import javax.persistence.Table;

import light.mvc.model.base.IdEntity;

import org.hibernate.annotations.DynamicInsert;
import org.hibernate.annotations.DynamicUpdate;
import org.hibernate.validator.constraints.NotBlank;

@Entity
@Table(name = "mb_mbgroup")
@DynamicInsert(true)
@DynamicUpdate(true)
public class Tmbgroup extends IdEntity implements java.io.Serializable {

  	private String name;
  	private Integer credit; //'消费金额',
  	private Integer discount; //'折扣'

	@NotBlank
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	@NotBlank
	public Integer getCredit() {
		return credit;
	}

	public void setCredit(Integer credit) {
		this.credit = credit;
	}

	@NotBlank
	public Integer getDiscount() {
		return discount;
	}

	public void setDiscount(Integer discount) {
		this.discount = discount;
	}

}
