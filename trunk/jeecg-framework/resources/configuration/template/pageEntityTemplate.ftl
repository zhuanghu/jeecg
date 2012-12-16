package ${bussiPackage}.page.${entityPackage};

import java.math.BigDecimal;
import java.util.Date;
import com.core.base.BasePage;

/**   
 * @Title: Page
 * @Description: ${ftl_description}
 * @author zhangdaihao
 * @date ${ftl_create_time}
 * @version V1.0   
 *
 */
 
 @SuppressWarnings("serial")
public class ${entityName}Page  extends BasePage implements java.io.Serializable {
	private String  obid;

	public String getObid() {
		return obid;
	}

	public void setObid(String obid) {
		this.obid = obid;
	}
}
