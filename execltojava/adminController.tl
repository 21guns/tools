package com.sifangting.${module_name}.admin.controller;

import com.guns21.data.domain.result.MessageResult;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import lombok.extern.slf4j.Slf4j;

import com.sifangting.${module_name}.service.query.${class_name}QueryService;
import com.sifangting.${module_name}.api.dto.${class_name}DTO;
import com.sifangting.common.web.PagerParams;

@RestController
@RequestMapping("/op/v1/${rest_url}")
@Slf4j
public class ${class_name}AdminController {

    @Autowired
	private ${class_name}QueryService queryService;

    public MessageResult<${class_name}DTO> pages(${class_name}DTO dto, PagerParams pagerParams) {

		return MessageResult.successPage(queryService.pages(dto, pagerParams));   
	} 
}