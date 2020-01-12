package com.${package_name}.${module_name}.service.command;
<%!
	import utils
%>
import com.guns21.data.domain.result.MessageResult;
% for a in actions:
	% if a.has_request():
import com.${package_name}.${module_name}.api.dto.${a.class_name}DTO;
	% endif
% endfor

public interface ${utils.firstUpower(module_name)}CommandService {

	% for a in actions:
	<%
		params_type = a.class_name + 'DTO dto'
		method_name = a.get_method_name()
		if not a.has_request():
			params_type = ''
		if a.is_get_id_method():
			params_type = '@PathVariable String id'
			method_name = 'get'
	%>
	/**
 	 * ${a.comment}
	 */
    public MessageResult ${method_name}(${params_type}) ;
	% endfor

}