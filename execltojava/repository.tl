package com.${package_name}.${module_name}.service.repository;

import com.${package_name}.${module_name}.service.entity.${class_name}DO;

public interface ${class_name}Repository {

    Integer save(${class_name}DO data);

    Integer update(${class_name}DO data);

    Integer deleteById(String id);

}