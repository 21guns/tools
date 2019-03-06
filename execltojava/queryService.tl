package com.sifangting.${module_name}.service.query;

import java.util.List;
import java.util.Optional;

import com.sifangting.${module_name}.api.dto.${entity_name};
import com.sifangting.common.web.PagerParams;

public interface ${class_name}QueryService {

    List<${entity_name}> pages(${entity_name} dto, PagerParams pagerParams);

    Optional<${entity_name}> get${class_name}ById(String id);
}