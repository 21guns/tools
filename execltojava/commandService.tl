package com.${package_name}.${module_name}.service.command;

import com.guns21.data.domain.result.MessageResult;

import com.${package_name}.${module_name}.api.dto.${entity_name};

public interface ${class_name}CommandService {

	MessageResult save(${entity_name} dto);

    MessageResult update(${entity_name} dto);

}