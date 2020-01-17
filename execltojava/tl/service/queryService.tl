package com.${package_name}.${module_name}.service.service;
<%!
    import utils
%>
import java.util.List;
import java.util.Optional;

import com.guns21.data.domain.result.MessageResult;
import com.guns21.data.domain.result.PageData;
% for a in actions:
	% if a.is_get_method():
		% if a.has_request():
import com.${package_name}.${module_name}.api.dto.${a.class_name}DTO;
		% endif
		% if a.has_response():
import com.${package_name}.${module_name}.api.vo.${a.class_name}VO;
		% endif
	% endif
% endfor

public interface ${utils.firstUpower(module_name)}QueryService {

	% for a in actions:
		% if a.is_get_method() :
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
    ${a.response_type}${a.class_name}VO ${a.get_method_name()}(${params}) ;
    	% endif 
	% endfor

}