package light.mvc.pageModel.mb;

import java.util.Date;


public class Member implements java.io.Serializable {

	private Long id;
	private String membercardid;// '会员卡ID',
	private String realname; // '真实名字',
	private String phone; // '座机',
	private String mobile; // '手机',
	private String email; // '邮箱',
	private Integer prov_id;// '省份ID',
	private String prov_name; // '省份名称',
	private Integer city_id;// '城市ID',
	private String city_name; // '城市名称',
	private String address; // '地址',
	private Integer zipcode;// '邮编',
	private String cardid; // '身份证',
	private Integer state;// '状态0停用 1可用',
	private Integer grade;// '会员等级',
	private Integer credit; // '购物积分',
	private Date regdateymd;// '注册时间YMD',
	private Date lastdateline;// '最后购物时间',
	
	private Long mbgroup_id;//所属会员组
	private String mbgroup_name;//组名称

	
	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
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

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getMobile() {
		return mobile;
	}

	public void setMobile(String mobile) {
		this.mobile = mobile;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public Integer getProv_id() {
		return prov_id;
	}

	public void setProv_id(Integer prov_id) {
		this.prov_id = prov_id;
	}

	public String getProv_name() {
		return prov_name;
	}

	public void setProv_name(String prov_name) {
		this.prov_name = prov_name;
	}

	public Integer getCity_id() {
		return city_id;
	}

	public void setCity_id(Integer city_id) {
		this.city_id = city_id;
	}

	public String getCity_name() {
		return city_name;
	}

	public void setCity_name(String city_name) {
		this.city_name = city_name;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public Integer getZipcode() {
		return zipcode;
	}

	public void setZipcode(Integer zipcode) {
		this.zipcode = zipcode;
	}

	public String getCardid() {
		return cardid;
	}

	public void setCardid(String cardid) {
		this.cardid = cardid;
	}

	public Integer getState() {
		return state;
	}

	public void setState(Integer state) {
		this.state = state;
	}

	public Integer getGrade() {
		return grade;
	}

	public void setGrade(Integer grade) {
		this.grade = grade;
	}

	public Integer getCredit() {
		return credit;
	}

	public void setCredit(Integer credit) {
		this.credit = credit;
	}

	public Date getRegdateymd() {
		return regdateymd;
	}

	public void setRegdateymd(Date regdateymd) {
		this.regdateymd = regdateymd;
	}

	public Date getLastdateline() {
		return lastdateline;
	}

	public void setLastdateline(Date lastdateline) {
		this.lastdateline = lastdateline;
	}

	public Long getMbgroup_id() {
		return mbgroup_id;
	}

	public void setMbgroup_id(Long mbgroup_id) {
		this.mbgroup_id = mbgroup_id;
	}

	public String getMbgroup_name() {
		return mbgroup_name;
	}

	public void setMbgroup_name(String mbgroup_name) {
		this.mbgroup_name = mbgroup_name;
	}
	
	
}
