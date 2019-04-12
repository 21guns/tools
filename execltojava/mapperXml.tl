<?xml version="1.0" encoding="UTF-8" ?>
<!DOCTYPE mapper PUBLIC "-//mybatis.org//DTD Mapper 3.0//EN" "http://mybatis.org/dtd/mybatis-3-mapper.dtd" >
<mapper namespace="com.${package_name}.${module_name}.service.repository.mapper.${class_name}Mapper" >
	<%
		COLUMNS_LINE_MAX = 80
		colums = []
		colums_line = ""

		colums_as = []
		colums_as_line = ""

		values = []
		values_line = ""
		for index in  range(len(fields)):

			colums_line += fields[index].field
			values_line += "#{" + fields[index].name +", jdbcType=" + fields[index].jdbcType + "}"
			# values_line += "#{" + fields[index].name + "}"
			if (fields[index].field != fields[index].name) :
				colums_as_line += fields[index].field + " AS " + fields[index].name
			else :
				colums_as_line += fields[index].field

			if index < len(fields)-1 :
				colums_as_line += ", "
				colums_line += ", "
				values_line += ", "

			if len(colums_as_line) > COLUMNS_LINE_MAX :
				colums_as_line += "\n" 
				colums_as.append(colums_as_line)
				colums_as_line = ""

			if len(colums_line) > COLUMNS_LINE_MAX :
				colums_line += "\n" 
				colums.append(colums_line)
				colums_line = ""

			if len(values_line) > COLUMNS_LINE_MAX :
				values_line += "\n" 
				values.append(values_line)
				values_line = ""

		if (len(colums_as_line)) > 0:
			colums_as.append(colums_as_line)
		if (len(colums_line)) > 0:
			colums.append(colums_line)
		if (len(values_line)) > 0:
			values.append(values_line)
	%>
	<sql id="columns">
		${'\t\t'.join(colums) }
  	</sql>

	<sql id="columns_as">
		${'\t\t'.join(colums_as) }
  	</sql>

    <select id="pageList" resultType="com.${package_name}.${module_name}.service.entity.${class_name}DO">
    	SELECT <include refid="columns_as" /> FROM ${table_name}
    </select>

    <select id="selectById" resultType="com.${package_name}.${module_name}.service.entity.${class_name}DO" parameterType="java.lang.String">
        SELECT
        <include refid="columns_as" />
        FROM ${table_name}
        WHERE id = #{id}
    </select>

    <insert id="insert" parameterType="com.${package_name}.${module_name}.service.entity.${class_name}DO">
        INSERT INTO ${table_name} (<include refid="columns" />)
        VALUES
        (${'\t\t'.join(values)})
    </insert>

    <update id="update" parameterType="com.${package_name}.${module_name}.service.entity.${class_name}DO">
        UPDATE ${table_name}
        <set>
        	% for index in  range(len(fields)):
            <if test="${fields[index].name} != null">
                ${fields[index].field }= #{${fields[index].field}, jdbcType=${fields[index].jdbcType}},
            </if>
			% endfor
        </set>
        WHERE id = #{id}
    </update>
</mapper>