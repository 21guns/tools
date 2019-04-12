package com.${package_name}.${module_name}.api.dto;

% if hasId:
import com.guns21.support.entity.AbstractEntity;
% endif 
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
% if hasId:
@ToString(callSuper = true)
% else:
@ToString
% endif
% if hasId:
@EqualsAndHashCode(callSuper = true)
% else:
@EqualsAndHashCode
% endif
@Setter
@Getter

% if hasId:
public class ${class_name}DTO extends AbstractEntity {
% else:
public class ${class_name}DTO implements Serializable {
% endif 

	% for a in fields:
	/**
 	 * ${a.comment}
	 */
	private ${a.type} ${a.name};

	% endfor


}