package service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import mapper.AdminDao;
import pojo.Admin;
import service.AdminService;

@Service
public class AdminServiceImpl implements AdminService{

	@Autowired
	private AdminDao adminDao;

	@Override
	public Admin login(Admin admin) {
		Admin a=new Admin();
		a.setAdminId(admin.getAdminId());
		a.setPassword(admin.getPassword());
		a.setAccess(admin.getAccess());
		Admin admin2=adminDao.login(admin);//有
		Admin admin3=adminDao.readerLogin(admin);//无
		if ((admin.getAccess().equals("1")&&admin2!=null)||(admin.getAccess().equals("0")&&admin3!=null)) {
			//  读者选择了管理员权限   || 管理员选择了读者权限 
			a.setAccess("2");
		}else if ((admin.getAccess().equals("1")&&admin3==null)||(admin.getAccess().equals("0")&&admin2==null)){
			//说明帐号密码错误
			a.setAccess("3");
		}
		a.setName(admin2==null?admin3.getName():admin2.getName());
		return a;
	}
	

}
