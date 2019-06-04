package controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import pojo.Admin;
import service.AdminService;

import javax.servlet.http.HttpSession;

@Controller
@SessionAttributes(value={"admin2"})
public class LoginController {
	@Autowired
	private AdminService adminService;
	//用于跳转,ajax返回成功跳转到管理员界面index.jsp
	@RequestMapping(value = "/index")
	public String login() {
		return "index";
	}
	//读者借阅界面readerIndex.jsp
	@RequestMapping(value = "/frontIndex")
	public String login2() {
		return "frontIndex";
	}
	
	//ajax请求过来
	@RequestMapping(value = "/library/list")
	public  @ResponseBody
		String list(Admin admin,Model model){
		Admin admin2=adminService.login(admin);
		//返回视图index.jsp
		//权限标志0或1
		model.addAttribute("admin2",admin2);
		return admin2.getAccess();
		
	}
	//检查原密码
	@RequestMapping(value = "/checkPwd")
	public  @ResponseBody
	String checkPwd(@RequestParam(value = "password",defaultValue = "0") String password, HttpSession session){
		Admin admin=(Admin) session.getAttribute("admin2");
		//直接获取session中的密码进行比较
		return admin.getPassword().equals(password)?"1":"0";
	}
	//跳转到修改密码界面
	@RequestMapping(value = "/toAlterpwdPage")
	public String toAlterpwdPage() {
		return "alterPwd";
	}
	//修改密码
	@RequestMapping(value = "/alterpwd")
	public  @ResponseBody
	String alterpwd(Admin admin,HttpSession session){
		Admin admin1=(Admin) session.getAttribute("admin2");
		admin1.setPassword(admin.getPassword());
		adminService.alterpwd(admin1);
		return "1";
	}

	//注销
	@RequestMapping(value = "/loginout")
	public  String loginout(HttpSession session){
		session.invalidate();
		return "redirect:login.jsp";
	}
}
