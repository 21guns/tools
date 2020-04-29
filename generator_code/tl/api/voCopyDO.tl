package com.${package_name}.${module_name}.api.vo;

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
 * ${table.comment}
 */
@Builder(toBuilder = true)
@AllArgsConstructor
@NoArgsConstructor
@EqualsAndHashCode
@ToString
@Setter
@Getter
public class ${class_name} implements Serializable {
 

	% for a in table.fields:
	/**
 	 * ${a.comment}
 	 * ${a.note}
	 */
	private ${a.type} ${a.name};
	% endfor


}