package com.${package_name}.${module_name}.service.query;

import java.util.List;
import java.util.Optional;

import com.guns21.data.domain.result.PageData;

import com.${package_name}.${module_name}.api.dto.${class_name}DTO;
import com.${package_name}.${module_name}.api.query.${class_name}Query;

public interface ${class_name}QueryService {

    List<${class_name}DTO> page(${class_name}Query query, PageData pagerParams);

    Optional<${class_name}DTO> getById(String id);
}