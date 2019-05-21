package pojo;

import java.io.Serializable;
import java.util.Date;


public class Readers implements Serializable{
	private Integer reader_id;//登陆名
	private String name;//姓名
	private String sex;
	private Date birth;
	private String address;
	private String telcode;//电话
	private Integer card_state;//读者等级
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
	public Date getBirth() {
		return birth;
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

}
