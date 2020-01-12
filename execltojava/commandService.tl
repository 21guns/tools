package com.${package_name}.${module_name}.service.command;

import com.guns21.data.domain.result.MessageResult;

import com.${package_name}.${module_name}.api.dto.${class_name}DTO;

public interface ${class_name}CommandService {

	MessageResult save(${class_name}DTO dto);

    MessageResult update(${class_name}DTO dto);

    MessageResult deleteById(String id);

}