package pojo;

public class PageBean {
	// 当前页数
	private Integer currentPage;
	// 总记录数
	private Integer totalCount;
	// 每页显示条数
	private Integer pageSize;
	// 总页数
	private Integer totalPage;
	// 起始索引
	private Integer index;
	// 图书搜索条件
	private String bname;// 书名字
	private String author;// 作者
	private String cname;// 类别
	//读者搜索条件
	private String reader_id;// 读者
	private String rname;// 读者名字
	private Integer adminId;

	//借阅搜索条件
	private Integer state;//归还状态

	public PageBean() {

	}
	public Integer getState() {
		return state;
	}

	public void setState(Integer state) {
		this.state = state;
	}
	public Integer getAdminId() {
		return adminId;
	}
	public void setAdminId(Integer adminId) {
		this.adminId = adminId;
	}
	public PageBean(Integer currentPage, Integer totalCount, Integer pageSize) {
		this.totalCount = totalCount;

		this.pageSize = pageSize;

		this.currentPage = currentPage;

		if (this.currentPage == null) {
			// 如页面没有指定显示那一页.显示第一页.
			this.currentPage = 1;
		}

		if (this.pageSize == null) {
			// 如果每页显示条数没有指定,默认每页显示3条
			this.pageSize = 3;
		}

		// 计算总页数
		this.totalPage = (this.totalCount + this.pageSize - 1) / this.pageSize;

		// 判断当前页数是否超出范围
		// 不能小于1
		if (this.currentPage < 1) {
			this.currentPage = 1;
		}
		// 不能大于总页数
		if (this.currentPage > this.totalPage) {
			this.currentPage = this.totalPage;
		}

	}

//	// 计算起始索引
//	public int getStart() {
//		return (this.currentPage - 1) * this.pageSize;
//	}
	public Integer getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(Integer currentPage) {
		this.currentPage = currentPage;
	}

	public Integer getTotalCount() {
		return totalCount;
	}

	public void setTotalCount(Integer totalCount) {
		this.totalCount = totalCount;
	}

	public Integer getPageSize() {
		return pageSize;
	}

	public void setPageSize(Integer pageSize) {
		this.pageSize = pageSize;
	}

	public Integer getTotalPage() {
		return totalPage;
	}

	public void setTotalPage(Integer totalPage) {
		this.totalPage = totalPage;
	}

	public String getAuthor() {
		return author;
	}

	public void setAuthor(String author) {
		this.author = author;
	}

	public String getCname() {
		return cname;
	}

	public void setCname(String cname) {
		this.cname = cname;
	}

	public String getBname() {
		return bname;
	}

	public void setBname(String bname) {
		this.bname = bname;
	}
	
	public Integer getIndex() {
		
		return (this.currentPage - 1) * this.pageSize;
	}
	public void setIndex(Integer index) {
		this.index = index;
	}
	public String getReader_id() {
		return reader_id;
	}
	public void setReader_id(String reader_id) {
		this.reader_id = reader_id;
	}
	public String getRname() {
		return rname;
	}
	public void setRname(String rname) {
		this.rname = rname;
	}

	@Override
	public String toString() {
		return "PageBean{" +
				"currentPage=" + currentPage +
				", totalCount=" + totalCount +
				", pageSize=" + pageSize +
				", totalPage=" + totalPage +
				", index=" + index +
				", bname='" + bname + '\'' +
				", author='" + author + '\'' +
				", cname='" + cname + '\'' +
				", reader_id='" + reader_id + '\'' +
				", rname='" + rname + '\'' +
				", adminId=" + adminId +
				", state=" + state +
				'}';
	}
}
