package service.impl;

import mapper.BookDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import pojo.Bookinfo;
import pojo.Category;
import pojo.PageBean;
import service.BookService;

import java.util.List;
@Service
public class BookServiceImpl implements BookService{

	@Autowired
	private BookDao bookDao;
	private PageBean pb;
	@Override
	public List<Bookinfo> listAllBook(PageBean pageBean) {
		//获得总页数
		int bookcount=bookCount(pageBean);
		//设置分页相关属性数据
		PageBean pageBean2=new PageBean(pageBean.getCurrentPage(),bookcount,pageBean.getPageSize());
		pageBean2.setBname(pageBean.getBname());
		pageBean2.setAuthor(pageBean.getAuthor());
		pageBean2.setCname(pageBean.getCname());
		pageBean2.setIndex(pageBean.getIndex());
		pb=pageBean2;
		
		return bookDao.listAllBook(pageBean2);
	}
	@Override
	public int bookCount(PageBean pageBean) {
		return bookDao.bookCount(pageBean);
	}
	public PageBean getPb() {
		return pb;
	}
	@Override
	public List<Category> listCategory() {
		return bookDao.listCategory();
	}
	@Override
	public void addBook(Bookinfo bookinfo) {
		 bookDao.addBook(bookinfo);
	}
	@Override
	public void updateBook(Bookinfo bookinfo) {
		bookDao.updateBook(bookinfo);
	}
	@Override
	public void delBook(Integer id) {
		bookDao.delBook(id);
	}
	@Override
	public void updateBookType(Category category) {
		bookDao.updateBookType(category);
	}
	@Override
	public void addBookType(Category category) {
		bookDao.addBookType(category);
		
	}
	@Override
	public void delBookType(Category category) {
		bookDao.delBookType(category);
		
	}

	@Override
	public void reduceStock(Integer book_id) {
		bookDao.reduceStock(book_id);
	}

}
