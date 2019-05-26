package service;

import pojo.Admin;
import pojo.Bookinfo;
import pojo.LeadInfo;

/**
* @author 作者 E-mail:
* @version 创建时间：2019年5月26日 下午1:25:37
* 类说明
*/
public interface BorrowService {

	void lendBook(LeadInfo leadInfo);

}
