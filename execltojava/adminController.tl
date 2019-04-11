package com.sifangting.${module_name}.admin.controller;

import com.guns21.data.domain.result.MessageResult;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import lombok.extern.slf4j.Slf4j;

import com.sifangting.${module_name}.service.query.${class_name}QueryService;
import com.sifangting.${module_name}.service.command.${class_name}CommandService;
import com.sifangting.${module_name}.api.dto.${class_name}DTO;
import com.sifangting.common.web.PagerParams;

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

	@GetMapping("/page")
    public MessageResult page(${class_name}DTO dto, PagerParams pagerParams) {

		return MessageResult.successPage(queryService.page(dto, pagerParams));   
	} 

	@PostMapping("/save")
    public MessageResult save(@RequestBody ${class_name}DTO dto) {
    	commandService.save(dto);
		return MessageResult.success();   
	} 
}