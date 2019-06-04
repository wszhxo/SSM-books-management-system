package controller;

import net.sf.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import pojo.PageBean;
import pojo.Readers;
import service.ReaderService;

import java.util.List;


/**
* @author 作者 E-mail:
* @version 创建时间：2019年5月23日 下午1:08:32
* 类说明
*/
@Controller
public class ReaderController {
	@Autowired
	private ReaderService readerService;
	
	//用于跳转,ajax返回成功跳转到index.jsp
	@RequestMapping(value = "/readerIndex")
	public String readerIndex() {
		return "readerIndex";
	}
	
	//用于跳转,ajax返回成功跳转到index.jsp
	@RequestMapping(value = "/find/readerIndex")
	public String findlogin() {
		return "readerIndex";
	}
	//用于添加按钮的页面跳转
	@RequestMapping(value = "/library/addReader")
	public String addreader() {
		return "/reader/addReader";
	}
	//用于查看按钮的页面跳转
	@RequestMapping(value = "/library/findReader")
	public String findreader(Readers readerinfo,Model model) {
		model.addAttribute("readerinfo",readerinfo); 
		return "/reader/addReader";
	}
	//用于编辑按钮的页面跳转
	@RequestMapping(value = "/library/editReader")
	public String editreader(Readers readerinfo,Model model) {
		model.addAttribute("readerinfo",readerinfo);
		model.addAttribute("code",1);
		return "/reader/addReader";
	}
	//修改
	@RequestMapping(value = "/library/updateReader")
	public @ResponseBody String updatereader(Readers readerinfo,Model model) {
		//用于区分查看和修改
		readerService.updateReader(readerinfo);
		return "1";
	}
	
	//produces解决json乱码问题
	@RequestMapping(value = "/library/listReader", produces = "text/plain;charset=UTF-8")
	public @ResponseBody String listreader(@RequestParam(value = "page", defaultValue = "1") Integer page,
			@RequestParam(value = "limit", defaultValue = "6") Integer limit,
			PageBean pageBean,Model model) {
		pageBean.setCurrentPage(page);
		pageBean.setPageSize(limit);
		// 转化为json
		List<Readers> list = readerService.findReader(pageBean);
		PageBean pb=readerService.getPb();
		// 讲json发送给浏览器
		// list转成json
		JSONObject obj = new JSONObject();
		// Layui table 组件要求返回的格式
		obj.put("code", 0);
		obj.put("msg", "");
		obj.put("count",pb.getTotalCount());
		obj.put("data", list);
		return obj.toString();

	}
	
	//添加
	@RequestMapping(value = "library/submitAddReader")
	public @ResponseBody String submitAddreader(Readers readerinfo) {
		 readerService.addReader(readerinfo);
		 return "1";
	}
	//删除
	@RequestMapping(value = "library/delReader")
	public  @ResponseBody String delreader( Integer id) {
		 readerService.delReader(id);
		 return "1";
	}
	
	//注册是查询是否存在该读者
	@RequestMapping(value = "library/checkUser")
	public  @ResponseBody String checkreader( Integer reader_id) {
		 int a=readerService.checkReader(reader_id);
		 return a>0?"0":"1";
	}
}
