package com.${package_name}.${module_name}.service.command.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import lombok.extern.slf4j.Slf4j;

import com.guns21.data.assembler.AssemblerFactory;
import com.${package_name}.${module_name}.api.dto.${entity_name};
import com.${package_name}.${module_name}.service.entity.${class_name}DO;
import com.${package_name}.${module_name}.service.command.${class_name}CommandService;
import com.${package_name}.${module_name}.service.repository.${class_name}Repository;

import java.util.Optional;

@Service
@Slf4j
public class ${class_name}CommandServiceImpl implements ${class_name}CommandService {

 	@Autowired
	private ${class_name}Repository repository;

	@Override
	public 	void save(${entity_name} dto) {
	    Optional<${class_name}DO> doOptional = AssemblerFactory.toOptional(dto, ${class_name}DO.class);
		doOptional.ifPresent(doo -> {
			repository.save(doo);
		});
	}

	@Override
	public 	void update(${entity_name} dto) {
	    Optional<${class_name}DO> doOptional = AssemblerFactory.toOptional(dto, ${class_name}DO.class);
		doOptional.ifPresent(doo -> {
			repository.update(doo);
		});
	}
}