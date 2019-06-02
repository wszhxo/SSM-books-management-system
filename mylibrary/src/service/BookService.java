package service;

import pojo.Bookinfo;
import pojo.Category;
import pojo.PageBean;

import java.util.List;

public interface BookService {
	//根据搜索分页条件列出所有数据
	 List<Bookinfo> listAllBook(PageBean pageBean);
	//返回总条数
	 int bookCount(PageBean pageBean);
	//列出所有类别
	 List<Category> listCategory();
	//获取分页类
	 PageBean getPb();
	//添加图书
	 void addBook(Bookinfo bookinfo);
	 void updateBook(Bookinfo bookinfo);
	 void delBook(Integer id);
	 void updateBookType(Category category);
	 void addBookType(Category ctCategory);
	 void delBookType(Category ctCategory);
	void reduceStock(Integer book_id);
}
