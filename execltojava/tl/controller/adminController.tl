package com.${package_name}.${module_name}.controller;

import java.util.Objects;

import com.guns21.data.domain.result.MessageResult;
import com.guns21.data.domain.result.PageData;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import lombok.extern.slf4j.Slf4j;
<%!
	import utils
%>
% for a in actions:
	% if a.has_request():
import com.${package_name}.${module_name}.api.dto.${a.class_name}DTO;
	% endif
% endfor
import com.${package_name}.${module_name}.service.service.${utils.firstUpower(module_name)}QueryService;
/**
 * 
 */
@RestController
##@RequestMapping("/op/v1/${module_name}")
@Slf4j
public class ${utils.firstUpower(module_name)}AdminController {

	@Autowired
	private ${utils.firstUpower(module_name)}QueryService ${module_name}QueryService;

	@Autowired
	private ${utils.firstUpower(module_name)}QueryService ${module_name}CommandService;

	% for a in actions:
	<%
		params = ''
		for n in a.get_path_variable_name():
			params += '@PathVariable Long ' + n +', '
		if a.has_request():
			params += a.class_name + 'DTO dto'
		if params.endswith(', '):
			params = params[:-2]
	%>
	/**
 	 * ${a.comment}
	 */
	@${utils.firstUpower(a.http_method)}Mapping("${a.url}")
    public MessageResult ${a.get_method_name()}(${params}) {
    	return MessageResult.success();
	} 
	% endfor

}