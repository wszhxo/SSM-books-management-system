package mapper;

import pojo.Admin;

public interface AdminDao {
	Admin login(Admin admin);
	Admin readerLogin(Admin admin);
	void alterpwd(Admin admin2);
	void alterpwdAdmin(Admin admin2);
}
