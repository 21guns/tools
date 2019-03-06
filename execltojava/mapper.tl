package com.sifangting.${module_name}.service.repository.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import tk.mybatis.mapper.common.BaseMapper;

import com.sifangting.${module_name}.service.entity.${entity_name};

public interface ${class_name}Mapper extends BaseMapper<${entity_name}> {

    List<${entity_name}> pages(@Param("query") ${entity_name} queryDTO, @Param("pageNum") int pageNum, @Param("pageSize") int pageSize);
}