package controller;

import net.sf.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import pojo.Bookinfo;
import pojo.Category;
import pojo.PageBean;
import service.BookService;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

@Controller
@SessionAttributes(value={"category"})
public class BookController {

	@Autowired
	private BookService bookService;
	
	//用于跳转,ajax返回成功跳转到index.jsp
	@RequestMapping(value = "/find/index")
	public String findlogin() {
		return "index";
	}
	//用于添加按钮的页面跳转
	@RequestMapping(value = "/library/addBook")
	public String addbook() {
		return "/book/addBook";
	}
	//用于查看按钮的页面跳转
	@RequestMapping(value = "/library/findBook")
	public String findBook(Bookinfo bookinfo,Model model) {
		model.addAttribute("bookinfo",bookinfo);
		return "/book/addBook";
	}
	//用于编辑按钮的页面跳转
	@RequestMapping(value = "/library/editBook", produces = "text/plain;charset=UTF-8")
	public String editBook(Bookinfo bookinfo,Model model) {
		model.addAttribute("bookinfo",bookinfo);
		model.addAttribute("code",1);
		return "/book/addBook";
	}
	//修改
	@RequestMapping(value = "/library/updateBook", produces = "text/plain;charset=UTF-8")
	public @ResponseBody String updateBook(Bookinfo bookinfo,Model model) {
		//用于区分查看和修改
		bookService.updateBook(bookinfo);
		return "1";
	}
	
	//produces解决json乱码问题
	@RequestMapping(value = "/library/listBook", produces = "text/plain;charset=UTF-8")
	public @ResponseBody String listBook(@RequestParam(value = "page", defaultValue = "1") Integer page,
			@RequestParam(value = "limit", defaultValue = "6") Integer limit,
			PageBean pageBean,Model model) {
		pageBean.setCurrentPage(page);
		pageBean.setPageSize(limit);
		// 转化为json
		List<Bookinfo> list = bookService.listAllBook(pageBean);
		PageBean pb=bookService.getPb();
		// 讲json发送给浏览器
		// list转成json
		JSONObject obj = new JSONObject();
		// Layui table 组件要求返回的格式
		obj.put("code", 0);
		obj.put("msg", "");
		obj.put("count",pb.getTotalCount());
		obj.put("data", list);
		model.addAttribute("category",bookService.listCategory());
		return obj.toString();

	}
	
	//添加
	@RequestMapping(value = "library/submitAddBook")
	public @ResponseBody String submitAddBook(Bookinfo bookinfo) {
		 bookService.addBook(bookinfo);
		 return "1";
	}
	//删除
	@RequestMapping(value = "library/delBook")
	public  @ResponseBody String delBook(@RequestParam(value = "id") Integer id) {
		 bookService.delBook(id);
		 return "1";
	}
	//跳转到图书分类界面
	@RequestMapping(value = "/library/bookType")
	public String bookType() {
		return "/book/bookType";
	}
	//图书分类异步请求
	@RequestMapping(value = "/library/bookTypeList", produces = "text/plain;charset=UTF-8")
	public @ResponseBody String listCategory(HttpSession session) {
		ArrayList<Category> categorylist=(ArrayList<Category>) bookService.listCategory();
		JSONObject obj = new JSONObject();
		obj.put("code", 0);
		obj.put("msg", "");
		obj.put("count",categorylist.size());
		obj.put("data", categorylist);
		return obj.toString();
	}
	//修改图书类别
	@RequestMapping(value = "/library/editBookType")
	public @ResponseBody String editBookType(@ModelAttribute(value="ctCategory") Category ctCategory) {
		bookService.updateBookType(ctCategory);
		return "1";
	}
	//添加类别
	@RequestMapping(value = "/library/addBookType")
	public @ResponseBody String addBookType(@ModelAttribute(value="ctCategory") Category ctCategory) {
		bookService.addBookType(ctCategory);
		return "1";
	}
	
	//删除类别
	@RequestMapping(value = "/library/delBookType")
	public @ResponseBody String delBookType(@ModelAttribute(value="ctCategory") Category ctCategory) {
		bookService.delBookType(ctCategory);
		return "1";
	}
	
	
}
