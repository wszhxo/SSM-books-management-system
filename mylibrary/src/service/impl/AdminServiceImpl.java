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
		Admin admin0=adminDao.login(admin);//管理员
		Admin admin1=adminDao.readerLogin(admin);//读者
		if ((admin.getAccess().equals("1")&&admin0!=null)||(admin.getAccess().equals("0")&&admin1!=null)) {
			//  读者选择了管理员权限   || 管理员选择了读者权限 
			a.setAccess("2");
		}else if (admin0==null&&admin1==null){
			//说明帐号密码错误
			a.setAccess("3");
		}else{
			a.setName(admin0==null?admin1.getName():admin0.getName());
		}
		return a;
	}

	@Override
	public void alterpwd(Admin admin2) {
		System.out.println(admin2.getAccess());
		if (admin2.getAccess().equals("0")){
			adminDao.alterpwdAdmin(admin2);
		}else{
			adminDao.alterpwd(admin2);
		}
	}

}
