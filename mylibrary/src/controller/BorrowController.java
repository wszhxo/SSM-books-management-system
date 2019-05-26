package controller;
/**
* @author 作者 E-mail: cuber.zhx@qq.com
* @version 创建时间：2019年5月25日 下午2:25:06
* 类说明
*/

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import pojo.Admin;
import pojo.Bookinfo;
import pojo.LeadInfo;
import service.BorrowService;
@Controller
public class BorrowController {
	@Autowired
	BorrowService borrowService;
	//用于跳转,ajax返回成功跳转到index.jsp
	@RequestMapping(value = "/library/lendBook")
	public @ResponseBody String borrowBook(Bookinfo bookinfo,HttpSession session) {
		Admin admin=(Admin) session.getAttribute("admin2");
		LeadInfo leadInfo=new LeadInfo();
		leadInfo.setBookinfo(bookinfo);
		leadInfo.setAdmin(admin);
		leadInfo.setAdminId(admin.getAdminId());
		leadInfo.setBook_id(bookinfo.getBook_id());
		borrowService.lendBook(leadInfo);
		return "1";
	}
}
