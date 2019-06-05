package controller;
/**
* @author 作者 E-mail: cuber.zhx@qq.com
* @version 创建时间：2019年5月25日 下午2:25:06
* 类说明
*/

import net.sf.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import pojo.Admin;
import pojo.Bookinfo;
import pojo.LeadInfo;
import pojo.PageBean;
import service.BorrowService;

import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class BorrowController {
	@Autowired
	BorrowService borrowService;
	//用于跳转,ajax返回成功跳转到index.jsp
	@RequestMapping(value = "/library/lendBook")
	public @ResponseBody String borrowBook(Bookinfo bookinfo,HttpSession session) {
		Admin admin=(Admin) session.getAttribute("admin2");
		LeadInfo leadInfo=new LeadInfo();
		leadInfo.setAdminId(admin.getAdminId());
		leadInfo.setBook_id(bookinfo.getBook_id());
		//判断库存是否足够
        if (bookinfo.getStock()==0)return "2";
		//判断该读者是否已经借过该图书
        if (borrowService.isLended(leadInfo))return "0";
        //判断是否达到借书上限
        if (!borrowService.cardState(leadInfo))return "3";
		borrowService.lendBook(leadInfo);
		return "1";
	}
	//跳转到读者界面
	@RequestMapping(value = "/listDisBack")
	public  String listDisBack() {
		return "listDisBack";
	}
	//跳转到管理员管理未还图书界面
	@RequestMapping(value = "/listDisBackAdmin")
	public  String listDisBackAdmin() {
		return "listDisBackAdmin";
	}
	//列出未还图书
	@RequestMapping(value = "/listDisBackBook", produces = "text/plain;charset=UTF-8")
	public @ResponseBody String listDisBackBook(
			@RequestParam(value = "page", defaultValue = "1") Integer page,
			@RequestParam(value = "limit", defaultValue = "6") Integer limit,
			@RequestParam(value = "power",defaultValue = "0") Integer power,
			PageBean pageBean,HttpSession session) {
		pageBean.setCurrentPage(page);
		pageBean.setPageSize(limit);
		Admin admin=(Admin) session.getAttribute("admin2");
		//为0说明是读者,1说明是管理员点击未还图书
		if (power.equals(0)){
		    //读者号
		    pageBean.setAdminId(admin.getAdminId());
		    //读者姓名
		    pageBean.setRname(admin.getName());
		}
		List<LeadInfo> leadInfos = borrowService.listDisBackBook(pageBean);
		PageBean pb=borrowService.getPb();
		JSONObject obj = new JSONObject();
		// Layui table 组件要求返回的格式
		obj.put("code", 0);
		obj.put("msg", "");
		obj.put("count",pb.getTotalCount());
		obj.put("data", leadInfos);
		return obj.toString();
	}

	//管理员归还图书
	@RequestMapping(value = "/backBook")
	public @ResponseBody String backBook(@RequestParam(value = "reader_id" , defaultValue = "1") Integer reader_id,
										 @RequestParam(value = "book_id" , defaultValue = "1") Integer book_id) {
		Map<String, Object> ret = new HashMap<String, Object>();
		ret.put("reader_id",reader_id);
		ret.put("book_id",book_id);
		borrowService.backBook(ret);
		return "1";
	}
}
