package pojo;

import java.io.Serializable;
import java.text.SimpleDateFormat;
import java.util.Date;

public class Bookinfo implements Serializable {
	private Integer book_id;// 书本编号
	private String name;
	private String author;
	private String publish;// 出版社
	private String ISBN;
	private String introduction;// 介绍
	private String language;
	private double price;
	private Date pubdate;// 出版时间
	private String pubdate2;// 用于添加出版时间

	private Integer class_id;// 书本编号
	private Category category;// 类别
	private Integer stock;// 库存

	public Category getCategory() {
		return category;
	}

	public void setCategory(Category category) {
		this.category = category;
	}

	public Integer getBook_id() {
		return book_id;
	}

	public void setBook_id(Integer book_id) {
		this.book_id = book_id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getAuthor() {
		return author;
	}

	public void setAuthor(String author) {
		this.author = author;
	}

	public String getPublish() {
		return publish;
	}

	public void setPublish(String publish) {
		this.publish = publish;
	}

	public String getISBN() {
		return ISBN;
	}

	public void setISBN(String iSBN) {
		ISBN = iSBN;
	}

	public String getIntroduction() {
		return introduction;
	}

	public void setIntroduction(String introduction) {
		this.introduction = introduction;
	}

	public String getLanguage() {
		return language;
	}

	public void setLanguage(String language) {
		this.language = language;
	}

	public double getPrice() {
		return price;
	}

	public void setPrice(double price) {
		this.price = price;
	}

	// 解决json返回字符串,把Date的转化为字符串
	public String getPubdate() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		return sdf.format(pubdate );
	}

	public void setPubdate(Date pubdate) {
		this.pubdate = pubdate;
	}

	public Integer getStock() {
		return stock;
	}

	public void setStock(Integer stock) {
		this.stock = stock;
	}

	public Integer getClass_id() {
		return class_id;
	}

	public void setClass_id(Integer class_id) {
		this.class_id = class_id;
	}

	public String getPubdate2() {
		return pubdate2;
	}

	public void setPubdate2(String pubdate2) {
		this.pubdate2 = pubdate2;
	}

	@Override
	public String toString() {
		return "Bookinfo [book_id=" + book_id + ", name=" + name + ", author=" + author + ", publish=" + publish
				+ ", ISBN=" + ISBN + ", introduction=" + introduction + ", language=" + language + ", price=" + price
				+ ", pubdate=" + pubdate + ", pubdate2=" + pubdate2 + ", class_id=" + class_id + ", category="
				+ category + ", stock=" + stock + "]";
	}

}
