package mapper;

import java.util.List;

import pojo.Bookinfo;
import pojo.Category;
import pojo.PageBean;

public interface BookDao {
	public List<Bookinfo>  listAllBook(PageBean pageBean);
	public List<Category> listCategory();
	public int bookCount(PageBean pageBean);
	public void addBook(Bookinfo bookinfo);
	public void updateBook(Bookinfo bookinfo);
	public void delBook(Integer id);
	public void updateBookType(Category category);
	public void addBookType(Category category);
	public void delBookType(Category category);
}
