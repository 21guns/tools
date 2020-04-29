package com.${package_name}.${table.module_name}.api.enums;

import lombok.Getter;

@Getter
public enum ${class_name}Enum {
	% if len(enums)==0 :
	;
	% endif 
	% for index in  range(len(enums)):
	% if index < len(enums)-1 :
 		<% spl=',' %>
 	% else:
 		<% spl=';' %>
 	% endif 
 	${class_name}Enum${enums[index].name}(Byte.parseByte("${enums[index].name}"),"${enums[index].comment}")${spl}
	% endfor

	private Byte value;
    private String desc;

    ${class_name}Enum(Byte value, String desc) {
        this.value = value;
        this.desc = desc;
    }


}