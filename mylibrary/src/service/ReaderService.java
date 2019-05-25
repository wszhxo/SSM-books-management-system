package service;

import java.util.List;

import pojo.PageBean;
import pojo.Readers;

/**
* @author 作者 E-mail:
* @version 创建时间：2019年5月23日 下午1:09:30
* 类说明
*/
public interface ReaderService {
	//返回总条数
	int readerCount(PageBean pageBean);
	//增加读者
	void addReader(Readers readers);
	//删除读者
	void delReader(Integer id);
	//修改读者
	void updateReader(Readers readers);
	//查询读者
	List<Readers> findReader(PageBean pageBean);
	PageBean getPb();
	
	int checkReader(Integer reader_id);
}
