package ${serviceImplPath};

import java.util.List;
import java.math.BigDecimal;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import cn.comingnet.common.constants.ResCode;
import cn.comingnet.common.exception.BusinessException;
import cn.comingnet.common.log4j.BaseLogger;
import cn.comingnet.common.service.BaseService;
import cn.comingnet.common.util.ConvertUtil;
import cn.comingnet.common.vo.PageUtil;
import cn.comingnet.common.vo.PageVo;
import cn.comingnet.common.vo.ResultDO;
import ${tableBeanPath}.${tableBeanName};
import ${tableBeanPath}.${tableBeanAllName};

import ${package}.${tableName}Service;
import ${daoImplPath}.T${tableName}Dao;
/**
 * ${tableDesc}服务接口
 * @author guobz
 *
 * 2015年6月12日
 */
 @Service("${_tableName}Service")
public class ${tableName}ServiceImpl extends BaseService implements ${tableName}Service {
	@Autowired
	private T${tableName}Dao ${_tableName}Dao;
	/**
	 * 分页获取 ${tableDesc}列表数据 .
	 * 
	 * @param queryDO
	 *            分页参数以及检索参数
	 * @return ResultDO 分页数据
	 */
	  @Override
	public ResultDO<PageUtil<${tableBeanName}>> get${tableName}List(PageVo<${tableBeanAllName}> queryDO){
		PageUtil<${tableBeanName}> pager = 
				queryDO.getPageInfo();
		try{
			pager.setDataList(${_tableName}Dao.listPage${tableBeanName}list(queryDO));
			return new ResultDO<PageUtil<${tableBeanName}>>(pager);
		}catch (Exception e){
			BaseLogger.error("查询内容列表出错", e);
			return new ResultDO<PageUtil<${tableBeanName}>>(ResCode.COM_OTHERERROR.getResCode()
					,"查询内容列表出错");
		}
	}
	/**
	 * 根据主键查询 ${tableDesc}详细
	 * @param: @param loginId 登录号（不能为空）
	 * @param: @return
	 * @return: ResultDO<BUserInfoBean>      
	 */
	 @Override
	public ResultDO<${tableBeanAllName}> get${tableName}By${tableKeyName}( ${tableKeyAppendName}){
			${tableBeanAllName} bean = ${_tableName}Dao.selectByKey(id);
		if(bean==null){
			return new ResultDO<${tableBeanAllName}>(ResCode.S_DATANOTEXIST.getResCode(), "信息不存在或已删除");
		}
		return new ResultDO<${tableBeanAllName}>(bean);
	}
	/**
	 * 新增 ${tableDesc}
	 * @param bean
	 * @return
	 */
	 @Override
	@Transactional(propagation = Propagation.REQUIRES_NEW, isolation = Isolation.DEFAULT, rollbackFor = { Exception.class })
	public ResultDO<Boolean> insert${tableName}(${tableBeanAllName} bean){
		try{
			bean.setId(UUID.randomUUID().toString());
			int i  = ${_tableName}Dao.insertSelective(bean);
			if(i!=1){
				throw new BusinessException(ResCode.S_CUDERRORNUM);
			}
		}catch(Exception e){
			BaseLogger.error("新增${tableDesc}失败，程序异常...Exception Message:", e, bean.toString());
			rollBack();
			return new ResultDO<Boolean>(ResCode.COM_EXCEPTION.getResCode(),"新增${tableDesc}失败");
		}
		return new ResultDO<Boolean>(true);
	}
	/**
	 * 修改 ${tableDesc}信息
	 * @param bean
	 * @return
	 * @throws BusinessException
	 */
	 @Override
	@Transactional(propagation = Propagation.REQUIRES_NEW, isolation = Isolation.DEFAULT, rollbackFor = { Exception.class })
	public ResultDO<Boolean> update${tableName}(${tableBeanAllName} bean){
		 try{
			int i  = ${_tableName}Dao.updateByKeySelective(bean);
			if(i!=1){
				throw new BusinessException(ResCode.S_CUDERRORNUM);
			}
		}catch(Exception e){
			BaseLogger.error("编辑${tableDesc}失败，程序异常...Exception Message:", e, bean.toString());
			rollBack();
			return new ResultDO<Boolean>(ResCode.COM_EXCEPTION.getResCode(),"编辑${tableDesc}失败");
		}
		return new ResultDO<Boolean>(true);
	}
	/**
	 * 逻辑删除 ${tableDesc}
	 * @param map
	 * @return
	 * @throws BusinessException
	 */
	 @Override
	@Transactional(propagation = Propagation.REQUIRES_NEW, isolation = Isolation.DEFAULT, rollbackFor = { Exception.class })
	public ResultDO<Boolean> logicDelete${tableName}(${tableKeyAppendName}){
		 try{
		 	int i  = ${_tableName}Dao.deleteByKey(${tableKeyLName});
			if(i!=1){
				throw new BusinessException(ResCode.S_CUDERRORNUM);
			}
		}catch(Exception e){
			BaseLogger.error("删除${tableDesc}失败，程序异常...Exception Message:", e, ${tableKeyLName});
			rollBack();
			return new ResultDO<Boolean>(ResCode.COM_EXCEPTION.getResCode(),"删除${tableDesc}失败");
		}
		return new ResultDO<Boolean>(true);
	}
}
