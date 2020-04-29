package com.${package_name}.${module_name}.service.repository.mapper;
<%
    hasId = True
    class_name =table.entity_name
    id_Field =table.get_id_field()
%>
import com.${package_name}.${module_name}.service.entity.${class_name}DO;
import com.${package_name}.${module_name}.api.vo.${class_name}VO;

import java.util.Optional;

public interface ${class_name}Mapper {

    int insert(${class_name}DO record);

    int insertSelective(${class_name}DO record);

    int updateByPrimaryKeySelective(${class_name}DO record);

    int updateByPrimaryKey(${class_name}DO record);
    
% if table.has_id() :
    Optional<${class_name}VO> selectByPrimaryKey(${id_Field.type} ${id_Field.name});

    int deleteByPrimaryKey(${id_Field.type} ${id_Field.name});
% endif

}