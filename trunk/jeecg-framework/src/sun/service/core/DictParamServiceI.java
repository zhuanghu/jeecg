package sun.service.core;

import sun.entity.core.DictParamEntity;
import sy.pageModel.DataGrid;
import sun.page.core.DictParamPage;
import sy.service.BaseServiceI;
import java.util.List;

/**   
 * @Title: Service
 * @Description: 数据字典
 * @author zhangdaihao
 * @date 2011-11-26 10:46:05
 * @version V1.0   
 *
 */
public interface DictParamServiceI extends BaseServiceI {

	/**
	 * 获得数据表格
	 * 
	 * @param bug
	 * @return
	 */
	public DataGrid datagrid(DictParamPage dictParamPage);

	/**
	 * 添加
	 * 
	 * @param dictParamPage
	 */
	public void add(DictParamPage dictParamPage);

	/**
	 * 修改
	 * 
	 * @param dictParamPage
	 */
	public void update(DictParamPage dictParamPage) throws Exception;

	/**
	 * 删除
	 * 
	 * @param ids
	 */
	public void delete(String ids);

	/**
	 * 获得
	 * 
	 * @param DictParam
	 * @return
	 */
	public DictParamEntity get(DictParamPage dictParamPage);
	
	
	/**
	 * 获得
	 * 
	 * @param obid
	 * @return
	 */
	public DictParamEntity get(String obid);
	
	/**
	 * 获取所有数据
	 */
	public List<DictParamEntity> listAll(DictParamPage dictParamPage);

}
