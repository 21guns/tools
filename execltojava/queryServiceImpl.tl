package com.${package_name}.${module_name}.service.query.impl;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import lombok.extern.slf4j.Slf4j;

import com.guns21.data.domain.result.PageData;
import com.guns21.common.util.ObjectUtils;
import com.${package_name}.${module_name}.api.dto.${class_name}DTO;
import com.${package_name}.${module_name}.api.dto.query.${class_name}Query;
import com.${package_name}.${module_name}.service.entity.${class_name}DO;
import com.${package_name}.${module_name}.service.query.${class_name}QueryService;
import com.${package_name}.${module_name}.service.repository.mapper.${class_name}Mapper;

/**
 * @author jliu
 * @date
 */
@Service
@Slf4j
public class ${class_name}QueryServiceImpl implements ${class_name}QueryService {

    @Autowired
	private ${class_name}Mapper mapper;

    @Override
    public List<${class_name}DTO> page(${class_name}Query query, PageData pagerParams) {
    	return mapper.pageList(query, pagerParams.getPage(), pagerParams.getSize());
    }

    @Override
    public Optional<${class_name}DTO> getById(String id) {
        if (ObjectUtils.hasText(id)) {
            return mapper.selectById(id);
        }
        return Optional.empty();
    }


}