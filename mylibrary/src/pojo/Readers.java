package pojo;

import java.io.Serializable;
import java.text.SimpleDateFormat;
import java.util.Date;


public class Readers implements Serializable{
	private Integer reader_id;//登陆名
	private String name;//姓名
	private String sex;
	private Date birth;
	private String birth2;// 用于添加出生日期
	private String address;
	private String telcode;//电话
	private Integer card_state;//读者等级
	private String password="123456";//默认密码
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public Integer getReader_id() {
		return reader_id;
	}
	public void setReader_id(Integer reader_id) {
		this.reader_id = reader_id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
	// 解决json返回字符串,把Date的转化为字符串
	public String getBirth() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		return sdf.format(birth);
	}
	public void setBirth(Date birth) {
		this.birth = birth;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getTelcode() {
		return telcode;
	}
	public void setTelcode(String telcode) {
		this.telcode = telcode;
	}
	public Integer getCard_state() {
		return card_state;
	}
	public void setCard_state(Integer card_state) {
		this.card_state = card_state;
	}
	public String getBirth2() {
		return birth2;
	}
	public void setBirth2(String birth2) {
		this.birth2 = birth2;
	}
	@Override
	public String toString() {
		return "Readers [reader_id=" + reader_id + ", name=" + name + ", sex=" + sex + ", birth=" + birth + ", birth2="
				+ birth2 + ", address=" + address + ", telcode=" + telcode + ", card_state=" + card_state + "]";
	}
	
}
