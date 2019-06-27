package com.${package_name}.${module_name}.api.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import java.io.*;
import java.math.BigDecimal;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.Objects;

/**
 * ${class_comment}
 */
@Builder(toBuilder = true)
@AllArgsConstructor
@NoArgsConstructor
@ToString
@EqualsAndHashCode
@Setter
@Getter

public class ${class_name}DTO implements Serializable {

	% for a in fields:
	/**
 	 * ${a.comment}
	 */
	private ${a.type} ${a.name};

	% endfor


}