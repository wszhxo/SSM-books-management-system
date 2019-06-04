package mapper;

import org.apache.ibatis.annotations.Param;
import pojo.LeadInfo;
import pojo.PageBean;

import java.util.List;
import java.util.Map;

/**
* @author 作者 E-mail:
* @version 创建时间：2019年5月26日 下午4:08:23
* 类说明
*/
public interface BorrowDao {
	//添加借阅记录
	void addLead(LeadInfo leadInfo);
	List<LeadInfo> listDisBackBook(PageBean pageBean);
	Integer countDisBook(PageBean pageBean);
    //设置罚金
    void addFine();
    //归还图书
    void backBook(@Param("params") Map<String, Object> ret);
    //是否已经借过
    Integer isLended(LeadInfo leadInfo);
    Integer cardState(LeadInfo leadInfo);
    Integer disBack(LeadInfo leadInfo);

}
