package com.${package_name}.${module_name}.admin.controller;

import java.util.Objects;

import com.guns21.data.domain.result.MessageResult;
import com.guns21.data.domain.result.PageData;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import lombok.extern.slf4j.Slf4j;

import com.${package_name}.${module_name}.service.query.${class_name}QueryService;
import com.${package_name}.${module_name}.service.command.${class_name}CommandService;
import com.${package_name}.${module_name}.api.dto.${class_name}DTO;
import com.${package_name}.common.web.PagerParams;

/**
 * ${class_comment}
 */
@RestController
@RequestMapping("/op/v1/${rest_url}")
@Slf4j
public class ${class_name}AdminController {

    @Autowired
	private ${class_name}QueryService queryService;

    @Autowired
	private ${class_name}CommandService commandService;

	@GetMapping("/{id}")
    public MessageResult<${class_name}DTO> get(@PathVariable String id) {

		return MessageResult.success(queryService.get${class_name}ById(id).orElse(null));   
	} 

	@GetMapping
    public MessageResult page(${class_name}DTO dto, PageData pagerParams) {

		return MessageResult.successPage(queryService.page(dto, pagerParams));   
	} 

	@PostMapping
    public MessageResult save(@RequestBody ${class_name}DTO dto) {
    	return commandService.save(dto);
	} 

	@PostMapping("/{id}")
    public MessageResult update(@PathVariable String id, @RequestBody ${class_name}DTO dto) {
  		return commandService.update(dto);
	} 

}