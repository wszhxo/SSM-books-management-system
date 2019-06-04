package service;

import pojo.Admin;

public interface AdminService {
	public Admin login(Admin admin);
    void alterpwd(Admin admin2);
}
