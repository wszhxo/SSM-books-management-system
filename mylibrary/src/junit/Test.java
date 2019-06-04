package junit;

import java.awt.print.Book;

import pojo.PageBean;
import service.BookService;
import service.ReaderService;
import service.impl.BookServiceImpl;
import service.impl.ReaderServiceImpl;
/**
* @author 作者 E-mail:
* @version 创建时间：2019年5月23日 下午1:00:37
* 类说明
*/

public class Test {
	
	@org.junit.Test
	public void test() {
		ReaderService rs=new ReaderServiceImpl();
		PageBean pageBean=new PageBean();
		pageBean.setCurrentPage(1);
		pageBean.setPageSize(3);
		int a=rs.readerCount(pageBean);
	}
	
	@org.junit.Test
	public void test2() {
		BookService rs=new BookServiceImpl();
		PageBean pageBean=new PageBean();
		pageBean.setCurrentPage(1);
		pageBean.setPageSize(3);
		int a=rs.bookCount(pageBean);
	}
}
