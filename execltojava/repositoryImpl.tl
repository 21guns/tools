package com.${package_name}.${module_name}.service.repository.impl;

import org.springframework.stereotype.Repository;
import org.springframework.beans.factory.annotation.Autowired;

import com.${package_name}.${module_name}.service.repository.${class_name}Repository;
import com.${package_name}.${module_name}.service.repository.mapper.${class_name}Mapper;
import com.${package_name}.${module_name}.service.entity.${class_name}DO;

@Repository
public class ${class_name}RepositoryImpl implements ${class_name}Repository {
	
	@Autowired
	private ${class_name}Mapper mapper;

	@Override
    public Integer save(${class_name}DO data) {
        data.preCreate();
        return mapper.insert(data);
    }

	@Override
    public Integer update(${class_name}DO data) {
        data.preUpdate();
    	return mapper.update(data);
    }

	@Override
    public Integer deleteById(String id) {
    	return mapper.deleteById(id);
    }

}