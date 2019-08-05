package com.${package_name}.${module_name}.service.query;

import java.util.List;
import java.util.Optional;

import com.guns21.data.domain.result.PageData;

import com.${package_name}.${module_name}.api.dto.${entity_name};

public interface ${class_name}QueryService {

    List<${entity_name}> page(${entity_name} dto, PageData pagerParams);

    Optional<${entity_name}> get${class_name}ById(String id);
}