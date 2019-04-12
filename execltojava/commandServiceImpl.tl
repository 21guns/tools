package com.${package_name}.${module_name}.service.command.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import lombok.extern.slf4j.Slf4j;

import com.guns21.data.assembler.AssemblerFactory;
import com.${package_name}.${module_name}.api.dto.${entity_name};
import com.${package_name}.${module_name}.service.entity.${class_name}DO;
import com.${package_name}.${module_name}.service.command.${class_name}CommandService;
import com.${package_name}.${module_name}.service.repository.${class_name}Repository;

import java.util.Objects;

@Service
@Slf4j
public class ${class_name}CommandServiceImpl implements ${class_name}CommandService {

 	@Autowired
	private ${class_name}Repository repository;

	@Override
	public 	void save(${entity_name} dto) {
	    ${class_name}DO doo = AssemblerFactory.to(dto, ${class_name}DO.class);
		if (Objects.isNull(dto.getId())) {
			repository.save(doo);
		} else {
			repository.update(doo);
		}	
	}
}