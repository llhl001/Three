package light.mvc.pageModel.mb;


public class Mbgroup implements java.io.Serializable {

	private Long id;
  	private String name;
  	private Integer credit; //'消费金额',
  	private Integer discount; //'折扣'
  	

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Integer getCredit() {
		return credit;
	}

	public void setCredit(Integer credit) {
		this.credit = credit;
	}

	public Integer getDiscount() {
		return discount;
	}

	public void setDiscount(Integer discount) {
		this.discount = discount;
	}

}
