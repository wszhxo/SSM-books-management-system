package pojo;

import java.io.Serializable;
import java.util.Date;

public class LeadInfo implements Serializable{
	private Integer sernum	;//借阅号
	private Integer book_id;//书
	private Integer reader_id	;//借阅人
	private Date lend_date	;//借阅日期
	private Date back_date	;//归还日期
	private Double fine;//罚款
	
	public Integer getSernum() {
		return sernum;
	}
	public void setSernum(Integer sernum) {
		this.sernum = sernum;
	}
	public Integer getBook_id() {
		return book_id;
	}
	public void setBook_id(Integer book_id) {
		this.book_id = book_id;
	}
	public Integer getReader_id() {
		return reader_id;
	}
	public void setReader_id(Integer reader_id) {
		this.reader_id = reader_id;
	}
	public Date getLend_date() {
		return lend_date;
	}
	public void setLend_date(Date lend_date) {
		this.lend_date = lend_date;
	}
	public Date getBack_date() {
		return back_date;
	}
	public void setBack_date(Date back_date) {
		this.back_date = back_date;
	}
	public Double getFine() {
		return fine;
	}
	public void setFine(Double fine) {
		this.fine = fine;
	}
}
