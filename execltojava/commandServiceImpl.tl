package com.sifangting.${module_name}.service.command.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import lombok.extern.slf4j.Slf4j;

import com.guns21.data.assembler.AssemblerFactory;
import com.sifangting.${module_name}.api.dto.${entity_name};
import com.sifangting.${module_name}.service.entity.${class_name}DO;
import com.sifangting.${module_name}.service.command.${class_name}CommandService;
import com.sifangting.${module_name}.service.repository.mapper.${class_name}Mapper;

import java.util.Objects;

@Service
@Slf4j
public class ${class_name}CommandServiceImpl implements ${class_name}CommandService {

 	@Autowired
	private ${class_name}Mapper mapper;

	@Override
	public 	void save(${entity_name} dto) {
	    ${class_name}DO doo = AssemblerFactory.to(dto, ${class_name}DO.class);
		if (Objects.isNull(dto.getId())) {
			mapper.insert(doo);
		} else {
			mapper.update(doo);
		}	}
}