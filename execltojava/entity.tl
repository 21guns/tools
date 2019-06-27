package com.${package_name}.${module_name}.service.entity;

<%
	hasId = True
	if id_Field is None :
		hasId = False
%>

% if hasId:
	% if id_Field.type == "String" :
import com.guns21.support.entity.StringIDEntity;
	% elif id_Field.type == "Long":
import com.guns21.support.entity.LongIDEntity;
	% else :
import com.guns21.support.entity.StringIDEntity;
	% endif
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
	% if id_Field.type == "String" :
public class ${class_name}DO extends StringIDEntity {
	% elif id_Field.type == "Long":
public class ${class_name}DO extends LongIDEntity {
	% else :
public class ${class_name}DO extends StringIDEntity {
	% endif
% else:
public class ${class_name}DO implements Serializable {
% endif 

	% for a in fields:
	% if hasId:
		% if a.name not in ["id","gmt_created","gmt_modified"]:

	/**
 	 * ${a.comment}
 	 * ${a.note}
	 */
	private ${a.type} ${a.name};
		% endif
	%endif
	% endfor


}