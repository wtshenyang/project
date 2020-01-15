package ${controllerImplPath};

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import ${PageUtilPath};
import ${PageVoPath};
import ${ResultDOPath};
import ${tableBeanPath}.${tableBeanName};
import ${package}.${tableName}Service;

/**
 * ${tableDesc}控制层
 * @author shenyang
 * ${dataTime}
 */
@Controller
@RequestMapping(value = "${_tableName}")
public class ${tableName}Controller  {
	@Autowired
	${tableName}Service ${_tableName}Service;
	/**
	 * 分页查询${tableDesc}数据，返回json格式
	 * @param pager
	 * @param bean
	 * @return
	 */
	@PostMapping(value = "/${_tableName}List.do")
	@ResponseBody
	public  ResultDO<?> ${_tableName}ListData(${tableBeanAllName} bean,@RequestParam("pager") PageUtil<${tableBeanName}> pager) {
		ResultDO<PageUtil<${tableBeanName}>> rdo = ${_tableName}Service.get${tableName}List(new PageVo<${tableBeanAllName}>(pager, bean));
		return rdo;
	}

	/**
	 * ${tableDesc}详细页面
	 * @param ${tableKeyLName}
	 * @return
	 */
	@PostMapping(value = "/${_tableName}Detail.do")
	@ResponseBody
	public ResultDO<?>  ${_tableName}infoPage(@RequestParam(value="${tableKeyLName}", required=true) ${tableKeyAppendName}) {
		ResultDO<${tableBeanAllName}> rdo=${_tableName}Service.get${tableName}By${tableKeyName}(${tableKeyLName});
		return rdo;
	}


	/**
	 * ${tableDesc}新增方法
	 * @param bean
	 * @return
	 */
	@PostMapping(value = "/${_tableName}Add.do")
	@ResponseBody
	public  ResultDO<?>  ${_tableName}AddMethod(${tableBeanAllName} bean){
		ResultDO<?> rdo=  ${_tableName}Service.insert${tableName}(bean);
	    return  rdo;
	}

	/**
	 * ${tableDesc}编辑方法
	 * @param bean
	 * @return
	 */
	@PostMapping(value = "/${_tableName}Edit.do")
	@ResponseBody
	public  ResultDO<?>  ${_tableName}EditMethod(${tableBeanAllName} bean){
		ResultDO<?> rdo= ${_tableName}Service.update${tableName}( bean);
	    return  rdo;
	}

}