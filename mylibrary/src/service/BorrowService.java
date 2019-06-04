package service;

import pojo.LeadInfo;
import pojo.PageBean;

import java.util.List;
import java.util.Map;

/**
* @author 作者 E-mail:
* @version 创建时间：2019年5月26日 下午1:25:37
* 类说明
*/
public interface BorrowService {

	void lendBook(LeadInfo leadInfo);
    PageBean getPb();
    List<LeadInfo> listDisBackBook(PageBean pageBean);
    int countDisBook(PageBean pageBean);
    void backBook(Map<String, Object> ret);
    Boolean isLended(LeadInfo leadInfo);
    Boolean cardState(LeadInfo leadInfo);
}
