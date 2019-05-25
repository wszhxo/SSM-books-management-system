package service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import mapper.ReaderDao;
import pojo.PageBean;
import pojo.Readers;
import service.ReaderService;

/**
* @author 作者 E-mail:
* @version 创建时间：2019年5月23日 下午1:30:15
* 类说明
*/
@Service
public class ReaderServiceImpl implements ReaderService{
	@Autowired
	private ReaderDao readerDao;
	private PageBean pb;
	public PageBean getPb() {
		return pb;
	}
	@Override
	public void addReader(Readers readers) {
		readerDao.addReader(readers);
		
	}
	@Override
	public void delReader(Integer id) {
		readerDao.delReader(id);
		
	}
	@Override
	public void updateReader(Readers readers) {
		readerDao.updateReader(readers);
	}

	@Override
	public List<Readers> findReader(PageBean pageBean) {
		//获得总页数
		int readercount=readerCount(pageBean);
		//设置分页相关属性数据
		PageBean pageBean2=new PageBean(pageBean.getCurrentPage(),readercount,pageBean.getPageSize());
		pageBean2.setReader_id(pageBean.getReader_id());
		pageBean2.setRname(pageBean.getRname());
		pageBean2.setIndex(pageBean.getIndex());
		pb=pageBean2;
		return readerDao.findReader(pageBean2);
	}
	@Override
	public int readerCount(PageBean pageBean) {
		return readerDao.readerCount(pageBean);
	}
	@Override
	public int checkReader(Integer reader_id) {
		return readerDao.checkReader(reader_id);
	}

}
