package com.${package_name}.${module_name}.api.dto.query;

import lombok.AllArgsConstructor;
import lombok.experimental.SuperBuilder;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import com.${package_name}.${module_name}.api.dto.${class_name}DTO;

/**
 * ${class_comment}
 */
@SuperBuilder(toBuilder = true)
@ToString
@EqualsAndHashCode(callSuper = true)
@Setter
@Getter

public class ${class_name}Query extends ${class_name}DTO {

}