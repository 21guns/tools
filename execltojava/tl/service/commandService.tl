package com.${package_name}.${module_name}.service.service;
<%!
	import utils
%>
import com.guns21.data.domain.result.MessageResult;
% for a in actions:
	% if a.has_request() and not a.is_get_method():
import com.${package_name}.${module_name}.api.dto.${a.class_name}DTO;
	% endif
% endfor

public interface ${utils.firstUpower(module_name)}CommandService {

	% for a in actions:
		% if not a.is_get_method() :
	<%
		params = ''
		for n in a.get_path_variable_name():
			params += 'Long ' + n +', '
		if a.has_request():
			params += a.class_name + 'DTO dto'
		if params.endswith(', '):
			params = params[:-2]
	%>
	/**
 	 * ${a.comment}
	 */
    MessageResult ${a.get_method_name()}(${params});
    	% endif 
	% endfor

}