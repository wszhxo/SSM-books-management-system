package mapper;

import pojo.LeadInfo;

/**
* @author 作者 E-mail:
* @version 创建时间：2019年5月26日 下午4:08:23
* 类说明
*/
public interface BorrowDao {
	//添加借阅记录
	void addLead(LeadInfo leadInfo);
}
