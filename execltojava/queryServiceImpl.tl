package com.sifangting.${module_name}.service.query.impl;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import lombok.extern.slf4j.Slf4j;

import com.guns21.common.util.CollectionUtils;
import com.guns21.data.assembler.AssemblerFactory;
import com.sifangting.${module_name}.api.dto.${entity_name};
import com.sifangting.${module_name}.service.entity.${class_name}DO;
import com.sifangting.common.web.PagerParams;
import com.sifangting.${module_name}.service.query.${class_name}QueryService;
import com.sifangting.${module_name}.service.repository.mapper.${class_name}Mapper;

@Service
@Slf4j
public class ${class_name}QueryServiceImpl implements ${class_name}QueryService {

    @Autowired
	private ${class_name}Mapper mapper;

    @Override
    public List<${entity_name}> pages(${entity_name} dto, PagerParams pagerParams) {
        ${class_name}DO doo = AssemblerFactory.to(dto, ${class_name}DO.class);
    	List dos = mapper.pages(doo, pagerParams.getPage(), pagerParams.getPageSize());
    	CollectionUtils.replaceAll(dos, ddo->AssemblerFactory.to(ddo, ${entity_name}.class));
    	return dos;
    }

    @Override
    public Optional<${entity_name}> get${class_name}ById(String id) {
        ${class_name}DO doo = mapper.selectByPrimaryKey(id);
        ${class_name}DTO dto = AssemblerFactory.to(doo, ${class_name}DTO.class);
        return Optional.ofNullable(dto);
    }


}