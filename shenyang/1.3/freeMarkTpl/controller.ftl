package ${controllerImplPath};

import java.math.BigDecimal;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.comingnet.common.constants.ConstCode;
import cn.comingnet.common.constants.ResCode;
import cn.comingnet.common.util.BaseUserBean;
import cn.comingnet.common.util.ConvertUtil;
import cn.comingnet.common.vo.BaseEditBean;
import cn.comingnet.common.vo.PageUtil;
import cn.comingnet.common.vo.PageVo;
import cn.comingnet.common.vo.ResultDO;
import cn.comingnet.component.chat.controller.BaseController;
import ${tableBeanPath}.${tableBeanName};
import ${tableBeanPath}.${tableBeanAllName};

import ${package}.${tableName}Service;
/**
 * ${tableDesc}控制层
 * @author guobz
 *
 */
@Controller
@RequestMapping(value = "/component/esjyw")
public class ${tableName}Controller extends BaseController {
	@Autowired
	${tableName}Service ${_tableName}Service;
	/**
	 * 分页查询${tableDesc}数据，返回json格式
	 * @param bean
	 * @param pager
	 * @param map
	 * @return
	 */
	@RequestMapping(value = "/${_tableName}List",params="jsonListData")
	public @ResponseBody ResultDO<?> ${_tableName}ListData(${tableBeanAllName} searchbean,
			@ModelAttribute("pager") PageUtil<${tableBeanName}> pager, ModelMap map) {
		ResultDO<PageUtil<${tableBeanName}>> udo = ${_tableName}Service
				.get${tableName}List(new PageVo<${tableBeanAllName}>(pager, searchbean));
		return udo;
	}
	/**
	 *	${tableDesc}列表页面
	 * @param map
	 * @return
	 */
	@RequestMapping(value = "/${_tableName}List")
	public String ${_tableName}ListPage(@ModelAttribute("searchBean")${tableBeanAllName} searchBean,
			@ModelAttribute("pager") PageUtil<${tableBeanName}> pager, ModelMap map) {
		ResultDO<PageUtil<${tableBeanName}>> udo = ${_tableName}Service
				.get${tableName}List(new PageVo<${tableBeanAllName}>(pager, searchBean));
		if (udo.isOK()) {
			map.put("pager", udo.getObj());
		} else {
			map.put("errorMsg", toErrorResultString(udo));
			map.put("pager", new PageUtil<${tableBeanName}>());
		}
		return "component/ckgang/${_tableName}/${_tableName}List";
	}
	/**
	 * ${tableDesc}详细页面
	 * @param map
	 * @return
	 */
	@RequestMapping(value = "/${_tableName}List",params="infoPage")
	public String ${_tableName}infoPage(@RequestParam(value="${tableKeyLName}", required=true) ${tableKeyAppendName},ModelMap map) {
		ResultDO<${tableBeanAllName}> udo=${_tableName}Service.get${tableName}By${tableKeyName}(${tableKeyLName});
		if (udo.isOK()) {
			map.put("dataInfo", udo.getObj());
		} else {
			map.put("errorMsgBack", toErrorResultString(udo));
		}
		return "component/ckgang/${_tableName}/${_tableName}Info";
	}
	/**
	 * ${tableDesc}新增页面
	 * @param map
	 * @return
	 */
	@RequestMapping(value = "/${_tableName}Add") 
	public String ${_tableName}AddPage(ModelMap map) {
		return "component/ckgang/${_tableName}/${_tableName}Add";
	}
	/**
	 * ${tableDesc}新增方法
	 * @param map
	 * @return
	 */
	@RequestMapping(value = "/${_tableName}Add",params="addMethod",method = RequestMethod.POST)
	public @ResponseBody ResultDO<?>  ${_tableName}AddMethod(${tableBeanAllName} bean,HttpServletRequest request){
		//bean.setCreatorLoginName(getCurrentLoginName());
		ResultDO<Boolean> rdo=  ${_tableName}Service
				.insert${tableName}(bean);
		if(rdo.isOK()){
			insertLogger(ConstCode.LOG_OPR_TYPE_U.getKey(), "新增${tableDesc}");
		}
	    return  toSuccessResult();
	}
	/**
	 * ${tableDesc}编辑页面
	 * @param map
	 * @return
	 */
	@RequestMapping(value = "/${_tableName}Edit") 
	public String ${_tableName}EditPage(@RequestParam(value="${tableKeyLName}", required=true) ${tableKeyAppendName},ModelMap map) {
		ResultDO<${tableBeanAllName}> udo=${_tableName}Service.get${tableName}By${tableKeyName}(${tableKeyLName});
		if (udo.isOK()) {
			map.put("dataInfo", udo.getObj());
		} else {
			map.put("errorMsgBack", toErrorResultString(udo));
		}
		return "component/ckgang/${_tableName}/${_tableName}Edit";
	}
	/**
	 * ${tableDesc}编辑方法
	 * @param map
	 * @return
	 */
	@RequestMapping(value = "/${_tableName}Edit",params="editMethod",method = RequestMethod.POST)
	public @ResponseBody ResultDO<?>  ${_tableName}EditMethod(${tableBeanAllName} bean,HttpServletRequest request){
		//bean.setModifierLoginName(getCurrentLoginName());;
		ResultDO<Boolean> rdo= ${_tableName}Service.update${tableName}( bean);
		if(rdo.isOK()){
			insertLogger(ConstCode.LOG_OPR_TYPE_U.getKey(), "修改${tableDesc},参数为{"+ConvertUtil.toJsonString(bean)+"}");
		}
	    return  toSuccessResult();
	}
	
	
	
}