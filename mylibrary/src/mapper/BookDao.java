package mapper;

import pojo.*;

import java.util.List;

public interface BookDao {
	 List<Bookinfo>  listAllBook(PageBean pageBean);
	 List<Category> listCategory();
	 int bookCount(PageBean pageBean);
	 void addBook(Bookinfo bookinfo);
	 void updateBook(Bookinfo bookinfo);
	 void delBook(Integer id);
	 void updateBookType(Category category);
	 void addBookType(Category category);
	 void delBookType(Category category);
	//减少库存
	 void reduceStock(Integer book_id);

}
