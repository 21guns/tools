package com.${package_name}.${module_name}.service.service;
<%!
    import utils
%>
import java.util.List;
import java.util.Optional;

import com.guns21.data.domain.result.MessageResult;
import com.guns21.data.domain.result.PageData;
% for a in actions:
	% if a.has_request() and a.is_get_method():
import com.${package_name}.${module_name}.api.dto.${a.class_name}DTO;
	% endif
% endfor

public interface ${utils.firstUpower(module_name)}QueryService {

	% for a in actions:
		% if a.is_get_method() :
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
    public MessageResult ${method_name}(${params_type}) ;
    	% endif 
	% endfor

}