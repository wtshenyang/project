package ${package};

import java.util.List;
import java.math.BigDecimal;
import cn.comingnet.common.vo.PageUtil;
import cn.comingnet.common.vo.PageVo;
import cn.comingnet.common.vo.ResultDO;
import cn.comingnet.common.vo.ResultDO;
import ${tableBeanPath}.${tableBeanName};
import ${tableBeanPath}.${tableBeanAllName};

/**
 * ${tableDesc}服务接口
 * @author guobz
 *
 * 2015年6月12日
 */
public interface ${tableName}Service {
	/**
	 * 分页获取 ${tableDesc}列表数据 .
	 * 
	 * @param queryDO
	 *            分页参数以及检索参数
	 * @return ResultDO 分页数据
	 */
	public ResultDO<PageUtil<${tableBeanName}>> get${tableName}List(PageVo<${tableBeanAllName}> queryDO);
	/**
	 * 根据主键查询 ${tableDesc}详细
	 * @param: @param loginId 登录号（不能为空）
	 * @param: @return
	 * @return: ResultDO<BUserInfoBean>      
	 */
	ResultDO<${tableBeanAllName}> get${tableName}By${tableKeyName}( ${tableKeyAppendName});
	/**
	 * 新增 ${tableDesc}
	 * @param bean
	 * @return
	 */
	public ResultDO<Boolean> insert${tableName}(${tableBeanAllName} bean);
	/**
	 * 修改 ${tableDesc}信息
	 * @param bean
	 * @return
	 * @throws BusinessException
	 */
	public ResultDO<Boolean> update${tableName}(${tableBeanAllName} bean) ;
	/**
	 * 逻辑删除 ${tableDesc}
	 * @param map
	 * @return
	 * @throws BusinessException
	 */
	public ResultDO<Boolean> logicDelete${tableName}(${tableKeyAppendName});
}
