package controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import pojo.Admin;
import service.AdminService;

@Controller
@SessionAttributes(value={"admin2"})
public class LoginController {
	@Autowired
	private AdminService adminService;
	
	
	//用于跳转,ajax返回成功跳转到index.jsp
	@RequestMapping(value = "/index")
	public String login() {
		return "index";
	}
	
	//ajax请求过来
	@RequestMapping(value = "/library/list")
	public  @ResponseBody
		String list(Admin admin,Model model){	
		Admin admin2=adminService.login(admin);
		model.addAttribute("admin2",admin2);
		//返回视图index.jsp
		return admin2==null? "0":"1";
		
	}
	
	
}
