package com.${package_name}.${module_name}.admin.controller;

import java.util.Objects;

import com.guns21.data.domain.result.MessageResult;
import com.guns21.data.domain.result.PageData;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import lombok.extern.slf4j.Slf4j;
<%!
	import utils
%>
% for a in actions:
import com.${package_name}.${module_name}.api.dto.${a.class_name}DTO;
% endfor

/**
 * 
 */
@RestController
@RequestMapping("/op/v1/${module_name}")
@Slf4j
public class ${utils.firstUpower(module_name)}AdminController {

	% for a in actions:
	<%
		params_type = a.class_name + 'DTO dto'
		method_name = a.get_method_name()
		if a.is_get_id_method():
			params_type = '@PathVariable String id'
			method_name = 'get'
	%>
	/**
 	 * ${a.comment}
	 */
	@${utils.firstUpower(a.http_method)}Mapping("${a.url}")
    public MessageResult ${method_name}(${params_type}) {
  		return commandService.update(dto);
	} 
	% endfor

}