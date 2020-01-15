package com.${package_name}.${module_name}.service.impl;
<%!
	import utils
%>
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import lombok.extern.slf4j.Slf4j;

import com.guns21.data.domain.result.MessageResult;
import com.guns21.data.assembler.AssemblerFactory;
import com.${package_name}.${module_name}.service.service.${utils.firstUpower(module_name)}CommandService;
% for a in actions:
	% if a.has_request() and not a.is_get_method():
import com.${package_name}.${module_name}.api.dto.${a.class_name}DTO;
	% endif
% endfor

import java.util.Optional;

@Service
@Slf4j
public class ${utils.firstUpower(module_name)}CommandServiceImpl implements ${utils.firstUpower(module_name)}CommandService {

	% for a in actions:
		% if not a.is_get_method() :
	<%
		params_type = a.class_name + 'DTO dto'
		method_name = a.get_method_name()
		if not a.has_request():
			params_type = ''
		if a.is_get_id_method():
			params_type = 'String id'
			method_name = 'get'
	%>
	/**
 	 * ${a.comment}
	 */
    public MessageResult ${method_name}(${params_type}) {
    	return MessageResult.success();
	} 
    	% endif 
	% endfor
}