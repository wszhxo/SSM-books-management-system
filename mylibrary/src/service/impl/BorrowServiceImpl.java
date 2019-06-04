package service.impl;

import mapper.BookDao;
import mapper.BorrowDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import pojo.LeadInfo;
import pojo.PageBean;
import service.BorrowService;

import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Map;

/**
* @author 作者 E-mail:cuber.zhx@qq.com
* @version 创建时间：2019年5月26日 下午4:07:04
* 类说明
*/
@Service
public class BorrowServiceImpl implements BorrowService{
	@Autowired
	private BorrowDao borrowDao;
	@Autowired
	private BookDao bookDao;
	private PageBean pb;
	@Override
	public void lendBook(LeadInfo leadInfo) {
		//添加借阅记录
		//借阅时间
		Date date=new Date();
		leadInfo.setLend_date(date);
		//工具类java.util.Calender
		Calendar cal = Calendar.getInstance();
		//设置起时间
	    cal.setTime(date);
	    //归还时间28天后
	    cal.add(Calendar.DATE, 28);
	    //最晚归还时间
	    Date newdate=cal.getTime();
		leadInfo.setBack_date(newdate);
		borrowDao.addLead(leadInfo);
		//使库存-1
		bookDao.reduceStock(leadInfo.getBook_id());
		
	}

	@Override
	public List<LeadInfo> listDisBackBook(PageBean pageBean) {
		//执行罚金设置的存储过程,再展示
		borrowDao.addFine();
		//获得总页数
		int borrowcount=countDisBook(pageBean);
		//设置分页相关属性数据
		PageBean pageBean2=new PageBean(pageBean.getCurrentPage(),borrowcount,pageBean.getPageSize());
		pageBean2.setBname(pageBean.getBname());
		pageBean2.setRname(pageBean.getRname());
		pageBean2.setState(pageBean.getState());
		pageBean2.setIndex(pageBean.getIndex());
		pb=pageBean2;
		List<LeadInfo> leadInfosbookDao=borrowDao.listDisBackBook(pageBean2);
		return leadInfosbookDao;
	}

	@Override
	public int countDisBook(PageBean pageBean) {
		return borrowDao.countDisBook(pageBean);
	}

	@Override
	public void backBook(Map<String, Object> ret) {
		borrowDao.backBook(ret);
	}

    @Override
    public Boolean isLended(LeadInfo leadInfo) {

        return borrowDao.isLended(leadInfo)>0?true:false;
    }

	@Override
	public Boolean cardState(LeadInfo leadInfo) {
		return borrowDao.cardState(leadInfo)-borrowDao.disBack(leadInfo)>0?true:false;
	}

	@Override
	public PageBean getPb() {
		return pb;
	}
}
