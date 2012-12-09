package sun.util.dbcommon;

import java.beans.PropertyDescriptor;
import java.util.Date;
import java.util.List;

import org.apache.commons.beanutils.PropertyUtils;
import org.apache.log4j.Logger;
import org.apache.struts2.ServletActionContext;

import sun.util.MyBeanUtils;
import sun.util.MyStringUtils;
import sy.pageModel.SessionInfo;
import sy.util.ResourceUtil;

public class DbEntityUtils {
	
	private static final String SUFFIX_COMMA = ",";
	private static final String SUFFIX_KG = " ";
	private static final String SUFFIX_ASTERISK = "*";
	private static final String SUFFIX_VAGUE = "%%";
	
	
	private static final Logger logger = Logger.getLogger(DbEntityUtils.class);
	
	/**
  	 * 给数据库实体赋值
  	 * 创建时间
  	 * 创建人
  	 * 创建人名称
  	 * @param bean
  	 */
	public static void setInsertMessage(Object bean){
		SessionInfo sessionInfo = (SessionInfo) ServletActionContext.getRequest().getSession().getAttribute(ResourceUtil.getSessionInfoName());
		try {
			//逻辑删除
			MyBeanUtils.setProperty(bean, "delflag",0);
			MyBeanUtils.setProperty(bean, "createDt",new Date());
			MyBeanUtils.setProperty(bean, "crtuser", sessionInfo.getUserId());
			MyBeanUtils.setProperty(bean, "crtuserName", sessionInfo.getRealName());
		} catch (Exception e) {
			e.printStackTrace();
			logger.error(e.toString());
;		}
	}
	
	/**
  	 * 给数据库实体赋值
  	 * 创建时间
  	 * 创建人
  	 * 创建人名称
  	 * @param bean
  	 */
	public static void setUpdateMessage(Object bean){
		SessionInfo sessionInfo = (SessionInfo) ServletActionContext.getRequest().getSession().getAttribute(ResourceUtil.getSessionInfoName());
		try {
			MyBeanUtils.setProperty(bean, "modifyDt",new Date());
			MyBeanUtils.setProperty(bean, "modifier", sessionInfo.getUserId());
			MyBeanUtils.setProperty(bean, "modifierName", sessionInfo.getRealName());
		} catch (Exception e) {
			e.printStackTrace();
			logger.error(e.toString());
		} 
	}
	
	/**
  	 * 给数据库实体赋值
  	 * 创建时间
  	 * 创建人
  	 * 创建人名称
  	 * @param bean
  	 */
	public static void setDelMessage(Object bean){
		try {
			MyBeanUtils.setProperty(bean, "delflag",1);
			MyBeanUtils.setProperty(bean, "delDt", new Date());
		} catch (Exception e) {
			e.printStackTrace();
			logger.error(e.toString());
		}
	}
	
	
	/**
  	 * 自动生成查询条件HQL
  	 * 模糊查询
  	 * 【只对Integer类型和String类型的字段自动生成查询条件】
  	 * @param hql
  	 * @param values
  	 * @param searchObj
  	 * @throws Exception
  	 */
  	public static void createSearchParamsHql(StringBuffer hqlbf,List<Object> values,Object searchObj){
  		PropertyDescriptor origDescriptors[] = PropertyUtils.getPropertyDescriptors(searchObj);
        for (int i = 0; i < origDescriptors.length; i++) {
            String name = origDescriptors[i].getName();
            String type = origDescriptors[i].getPropertyType().toString();
            if("class java.util.Date".equals(type)){
            	 continue; // No point in trying to set an object's class[不对时间类型处理，需要手工写]
            }
            if ("class".equals(name)||"ids".equals(name)||"page".equals(name)
            		||"rows".equals(name)||"sort".equals(name)||"order".equals(name)) {
                continue; // No point in trying to set an object's class
            }
            try {
            if (PropertyUtils.isReadable(searchObj, name)) {
               if("class java.lang.String".equals(type)){
            	   Object value = PropertyUtils.getSimpleProperty(searchObj, name);
            	   String searchValue = null;
            	   if(value!=null){
            		    searchValue = value.toString().trim();
            	   }else{
            		   continue;
            	   }
            	   if(searchValue!=null&&!"".equals(searchValue)){
            		   //[1].In 多个条件查询{逗号隔开参数}
            		   if(searchValue.indexOf(SUFFIX_COMMA)>=0){
            			   //页面输入查询条件，情况（取消字段的默认条件）
            			   if(searchValue.indexOf(SUFFIX_KG)>=0){
            				   String val = searchValue.substring(searchValue.indexOf(SUFFIX_KG));
            				   hqlbf.append(" and  "+name+" = ? ");
                   			   values.add(val.trim());
            			   }else{
            				   String[] vs = searchValue.split(SUFFIX_COMMA);
                			   hqlbf.append(" and  "+name+" in ("+MyStringUtils.getStringSplit(vs)+") ");
            			   }
            		   }
            		   //[2].模糊查询{带有* 星号的参数}
            		   else if(searchValue.indexOf(SUFFIX_ASTERISK)>=0){
            			   searchValue.replace(SUFFIX_ASTERISK, SUFFIX_VAGUE);
            			   hqlbf.append(" and  "+name+" like ? ");
               			   values.add(searchValue.replace(SUFFIX_ASTERISK, SUFFIX_VAGUE));
            		   }
            		   //[3].全匹配查询{没有特殊符号的参数}
            		   else{
            			   hqlbf.append(" and  "+name+" = ? ");
               			   values.add(value);
            		   }
            	   }
               }else if("class java.lang.Integer".equals(type)){
            	   Object value = PropertyUtils.getSimpleProperty(searchObj, name);
            	   if(value!=null&&!"".equals(value)){
            		   hqlbf.append(" and  "+name+" = ? ");
           			   values.add(value);
            	   }
               }
            }
            } catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
        }
  	}
  	
  	
//  	/**
//  	 * 自动生成查询条件HQL
//  	 * 【只对Integer类型和String类型的字段自动生成查询条件】
//  	 * 非模糊查询
//  	 * @param hql
//  	 * @param values
//  	 * @param searchObj
//  	 * @throws Exception
//  	 */
//  	@Deprecated
//  	public static void createSearchParamsHql_Equal(StringBuffer hqlbf,List<Object> values,Object searchObj){
//  		PropertyDescriptor origDescriptors[] = PropertyUtils.getPropertyDescriptors(searchObj);
//        for (int i = 0; i < origDescriptors.length; i++) {
//            String name = origDescriptors[i].getName();
//            String type = origDescriptors[i].getPropertyType().toString();
//            if("class java.util.Date".equals(type)){
//            	 continue; // No point in trying to set an object's class[不对时间类型处理，需要手工写]
//            }
//            if ("class".equals(name)||"ids".equals(name)||"page".equals(name)
//            		||"rows".equals(name)||"sort".equals(name)||"order".equals(name)) {
//                continue; // No point in trying to set an object's class
//            }
//            try {
//            if (PropertyUtils.isReadable(searchObj, name)) {
//            	   Object value = PropertyUtils.getSimpleProperty(searchObj, name);
//            	   if(value!=null&&!"".equals(value)){
//            		   hqlbf.append(" and  "+name+" = ? ");
//           			   values.add(value);
//            	   }
//            }
//            } catch (Exception e) {
//				// TODO Auto-generated catch block
//				e.printStackTrace();
//			}
//        }
//  	}
}
