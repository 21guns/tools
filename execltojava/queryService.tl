package com.${package_name}.${module_name}.service.query;

import java.util.List;
import java.util.Optional;

import com.${package_name}.${module_name}.api.dto.${entity_name};
import com.${package_name}.common.web.PagerParams;

public interface ${class_name}QueryService {

    List<${entity_name}> page(${entity_name} dto, PagerParams pagerParams);

    Optional<${entity_name}> get${class_name}ById(String id);
}