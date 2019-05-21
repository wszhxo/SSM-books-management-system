package service;

import java.util.List;

import pojo.Bookinfo;
import pojo.Category;
import pojo.PageBean;

public interface BookService {
	//根据搜索分页条件列出所有数据
	public List<Bookinfo> listAllBook(PageBean pageBean);
	//返回总条数
	public int bookCount(PageBean pageBean);
	//列出所有类别
	public List<Category> listCategory();
	//获取分页类
	public PageBean getPb();
	//添加图书
	public void addBook(Bookinfo bookinfo);
	public void updateBook(Bookinfo bookinfo);
	public void delBook(Integer id);
	public void updateBookType(Category category);
	public void addBookType(Category ctCategory);
	public void delBookType(Category ctCategory);
}
