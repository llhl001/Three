package light.mvc.model.sale;

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
@Table(name = "sale_category")
@DynamicInsert(true)
@DynamicUpdate(true)
public class Tcategory extends IdEntity implements java.io.Serializable {

	private String name;
	private Tcategory category;
	private Integer seq;

	@NotBlank
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	@NotNull
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "pid")
	public Tcategory getCategory() {
		return category;
	}

	public void setCategory(Tcategory category) {
		this.category = category;
	}

	@NotBlank
	public Integer getSeq() {
		return seq;
	}

	public void setSeq(Integer seq) {
		this.seq = seq;
	}

}
