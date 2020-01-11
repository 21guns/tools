
#!/usr/bin/env python3
# -*- coding: utf-8 -*-
#生成文件

from mako.template import Template
from mako.runtime import Context
from io import StringIO
import os
import entity

java_src = '/src/main/java'
resource_src = '/src/main/resources/'

def generate_enum_class(class_name,class_comment,fields,module_name,table_name,package_name,api):
	for field in fields:
		if field.name in ['type','status']:
			enums = []
			string_list = str(field.note).split('、')
			if len(string_list) > 0:
				for n in string_list:
					# if  len(n) >0:
					string_list = str(n).split('：')
					if len(string_list) ==2: 
						f = entity.read_field(string_list[0], string_list[1], '', '',False)
						if f is not None:
							enums.append(f)
					else:
						print(string_list)

			enum_class_name = class_name+field.name[0].upper() + field.name[1:]
			mapperTemplate = Template(filename='./enum.tl')
			buf = StringIO()
			ctx = Context(buf, class_name=enum_class_name, class_comment=class_comment, enums=enums,module_name=module_name, package_name=package_name)
			mapperTemplate.render_context(ctx)
			# print(buf.getvalue())
			dto_dir = api+'enums/'
			if not os.path.exists(dto_dir):
				os.makedirs(dto_dir)
			f = open(dto_dir + enum_class_name+'Enum.java', 'w')
			f.write(buf.getvalue())
			f.close()

def generate_service_controller_repository(class_name,class_comment,fields,module_name,table_name,package_name,id_Field,service,admin_contoller):
	if id_Field is not None :
		mapperTemplate = Template(filename='./commandService.tl')
		buf = StringIO()
		ctx = Context(buf, class_name=class_name, entity_name=class_name+"DTO", module_name=module_name, package_name=package_name)
		mapperTemplate.render_context(ctx)
		# print(buf.getvalue())
		service_dir = service + 'command/'
		if not os.path.exists(service_dir):
			os.makedirs(service_dir)
		f = open(service_dir + class_name+'CommandService.java', 'w')
		f.write(buf.getvalue())
		f.close()

		mapperTemplate = Template(filename='./commandServiceImpl.tl')
		buf = StringIO()
		ctx = Context(buf, class_name=class_name, entity_name=class_name+"DTO", module_name=module_name, package_name=package_name)
		mapperTemplate.render_context(ctx)
		# print(buf.getvalue())
		service_dir = service+'command/impl/'
		if not os.path.exists(service_dir):
			os.makedirs(service_dir)
		f = open(service_dir + class_name+'CommandServiceImpl.java', 'w')
		f.write(buf.getvalue())
		f.close()

		mapperTemplate = Template(filename='./repository.tl')
		buf = StringIO()
		ctx = Context(buf, class_name=class_name, entity_name=class_name+"DTO", module_name=module_name, package_name=package_name)
		mapperTemplate.render_context(ctx)
		# print(buf.getvalue())
		service_dir = service + 'repository/'
		if not os.path.exists(service_dir):
			os.makedirs(service_dir)
		f = open(service_dir + class_name+'Repository.java', 'w')
		f.write(buf.getvalue())
		f.close()

		mapperTemplate = Template(filename='./repositoryImpl.tl')
		buf = StringIO()
		ctx = Context(buf, class_name=class_name, entity_name=class_name+"DTO", module_name=module_name, package_name=package_name)
		mapperTemplate.render_context(ctx)
		# print(buf.getvalue())
		service_dir = service+'repository/impl/'
		if not os.path.exists(service_dir):
			os.makedirs(service_dir)
		f = open(service_dir + class_name+'RepositoryImpl.java', 'w')
		f.write(buf.getvalue())
		f.close()

		mapperTemplate = Template(filename='./queryService.tl')
		buf = StringIO()
		ctx = Context(buf, class_name=class_name, entity_name=class_name+"DTO", module_name=module_name, package_name=package_name)
		mapperTemplate.render_context(ctx)
		# print(buf.getvalue())
		service_dir = service + 'query/'
		if not os.path.exists(service_dir):
			os.makedirs(service_dir)
		f = open(service_dir + class_name+'QueryService.java', 'w')
		f.write(buf.getvalue())
		f.close()

		mapperTemplate = Template(filename='./queryServiceImpl.tl')
		buf = StringIO()
		ctx = Context(buf, class_name=class_name, entity_name=class_name+"DTO", module_name=module_name, package_name=package_name)
		mapperTemplate.render_context(ctx)
		# print(buf.getvalue())
		service_dir = service+'query/impl/'
		if not os.path.exists(service_dir):
			os.makedirs(service_dir)
		f = open(service_dir + class_name+'QueryServiceImpl.java', 'w')
		f.write(buf.getvalue())
		f.close()


		mapperTemplate = Template(filename='./adminController.tl')
		buf = StringIO()
		ctx = Context(buf, class_name=class_name, rest_url=class_name.lower(), module_name=module_name, class_comment=class_comment, package_name=package_name)
		mapperTemplate.render_context(ctx)
		# print(buf.getvalue())
		service_dir = admin_contoller+'controller/'
		if not os.path.exists(service_dir):
			os.makedirs(service_dir)
		f = open(service_dir + class_name+'AdminController.java', 'w')
		f.write(buf.getvalue())
		f.close()

def generate_do_dto(class_name,class_comment,fields,id_Field,module_name,table_name,package_name,service,api):
	mapperTemplate = Template(filename='./entity.tl')
	buf = StringIO()
	ctx = Context(buf, class_name=class_name, class_comment=class_comment, fields=fields, id_Field=id_Field,module_name=module_name,table_name=table_name, package_name=package_name)
	mapperTemplate.render_context(ctx)
	# print(buf.getvalue())
	entity_dir = service+'entity/'
	if not os.path.exists(entity_dir):
		os.makedirs(entity_dir)
	f = open(entity_dir + class_name+'DO.java', 'w')
	f.write(buf.getvalue())
	f.close()

	# mapperTemplate = Template(filename='./dto.tl')
	# buf = StringIO()
	# ctx = Context(buf, class_name=class_name, class_comment=class_comment,fields=fields, module_name=module_name, package_name=package_name)
	# mapperTemplate.render_context(ctx)
	# # print(buf.getvalue())
	# dto_dir = api+'dto/'
	# if not os.path.exists(dto_dir):
	# 	os.makedirs(dto_dir)
	# f = open(dto_dir + class_name+'DTO.java', 'w')
	# f.write(buf.getvalue())
	# f.close()

	# mapperTemplate = Template(filename='./query.tl')
	# buf = StringIO()
	# ctx = Context(buf, class_name=class_name, class_comment=class_comment,fields=fields, module_name=module_name, package_name=package_name)
	# mapperTemplate.render_context(ctx)
	# # print(buf.getvalue())
	# dto_dir = api+'dto/query/'
	# if not os.path.exists(dto_dir):
	# 	os.makedirs(dto_dir)
	# f = open(dto_dir + class_name+'Query.java', 'w')
	# f.write(buf.getvalue())
	# f.close()

def generate_mapper_class(class_name,class_comment,fields,module_name,table_name,package_name,service):
	mapperTemplate = Template(filename='./mapper.tl')
	buf = StringIO()
	ctx = Context(buf, class_name=class_name, entity_name=class_name+"DO", module_name=module_name, package_name=package_name)
	mapperTemplate.render_context(ctx)
	# print(buf.getvalue())
	mapper_dir = service+'repository/mapper/'
	if not os.path.exists(mapper_dir):
		os.makedirs(mapper_dir)
	f = open(mapper_dir +class_name+'Mapper.java', 'w')
	f.write(buf.getvalue())
	f.close()

def generate_mapper_xml(class_name,class_comment,fields,module_name,table_name,package_name,service_resource):
	mapperTemplate = Template(filename='./mapperXml.tl')
	buf = StringIO()
	ctx = Context(buf, class_name=class_name, module_name=module_name,fields=fields, table_name=table_name, package_name=package_name)
	mapperTemplate.render_context(ctx)
	# print(buf.getvalue())
	mapper_dir = service_resource+'/com/'+package_name+'/'+module_name+'/service/repository/mapper/'
	if not os.path.exists(mapper_dir):
		os.makedirs(mapper_dir)
	f = open(mapper_dir +class_name+'Mapper.xml', 'w')
	f.write(buf.getvalue())
	f.close()


def write_parent(workspace_root, package_name):
	os.system('cp -r ./template/parent '+ workspace_root)
	parent_dir = workspace_root + 'parent/'
	if not os.path.exists(parent_dir):
		os.makedirs(parent_dir)
	mapperTemplate = Template(filename='./template/pom/parent.tl',input_encoding='utf-8')
	buf = StringIO()
	ctx = Context(buf, package_name=package_name)
	mapperTemplate.render_context(ctx)
	f = open(parent_dir+'pom.xml', 'w')
	f.write(buf.getvalue())
	f.close()

def write_api(workspace_root, package_name, table):
	generate_enum_class_flag = True
	generate_dto_flag = True

	class_name = table.entity_name
	class_comment = table.comment
	fields = table.fields

	table_name = table.name
	id_Field =table.get_id_field()
	module_name = table.module_name

	api_root_dir = workspace_root + module_name+'/api'
	api_dir = api_root_dir+java_src+'/com/'+package_name+'/'+module_name+'/api/'

	mapperTemplate = Template(filename='./template/pom/api.tl',input_encoding='utf-8')
	buf = StringIO()
	ctx = Context(buf, package_name=package_name, module_name=module_name)
	mapperTemplate.render_context(ctx)
	f = open(api_root_dir+'/pom.xml', 'w')
	f.write(buf.getvalue())
	f.close()

	dto_dir = api_dir+'dto/'
	if not os.path.exists(dto_dir):
		os.makedirs(dto_dir)
	vo_dir = api_dir+'vo/'

	if not os.path.exists(vo_dir):
		os.makedirs(vo_dir)

	package_name =package_name.replace('/', '.')
	if generate_enum_class_flag :
		generate_enum_class(class_name,class_comment,fields,module_name,table_name,package_name,api_dir)

	if generate_dto_flag :
		mapperTemplate = Template(filename='./dto.tl')
		buf = StringIO()
		ctx = Context(buf, class_name=class_name, class_comment=class_comment,fields=fields, module_name=module_name, package_name=package_name)
		mapperTemplate.render_context(ctx)
		# print(buf.getvalue())
		f = open(dto_dir + class_name+'DTO.java', 'w')
		f.write(buf.getvalue())
		f.close()

def writer_service(workspace_root, package_name, table):
	print(table)
	generate_mapper_class_flag = True
	generate_mapper_xml_flag = True

	class_name = table.entity_name
	class_comment = table.comment
	fields = table.fields
	table_name = table.name
	id_Field =table.get_id_field()
	module_name = table.module_name

	service_root_dir = workspace_root + module_name+'/service'
	service = service_root_dir+java_src+'/com/'+package_name+'/'+module_name+'/service/'
	service_resource = workspace_root + module_name+'/service'+resource_src

	mapperTemplate = Template(filename='./template/pom/service.tl',input_encoding='utf-8')
	buf = StringIO()
	ctx = Context(buf, package_name=package_name, module_name=module_name)
	mapperTemplate.render_context(ctx)
	f = open(service_root_dir+'/pom.xml', 'w')
	f.write(buf.getvalue())
	f.close()

	package_name =package_name.replace('/', '.')
	if generate_mapper_class_flag :
		generate_mapper_class(class_name,class_comment,fields,module_name,table_name,package_name,service)

	if generate_mapper_xml_flag :
		generate_mapper_xml(class_name,class_comment,fields,module_name,table_name,package_name,service_resource)

	if id_Field is not None :
		mapperTemplate = Template(filename='./commandService.tl')
		buf = StringIO()
		ctx = Context(buf, class_name=class_name, entity_name=class_name+"DTO", module_name=module_name, package_name=package_name)
		mapperTemplate.render_context(ctx)
		# print(buf.getvalue())
		service_dir = service + 'command/'
		if not os.path.exists(service_dir):
			os.makedirs(service_dir)
		f = open(service_dir + class_name+'CommandService.java', 'w')
		f.write(buf.getvalue())
		f.close()

		mapperTemplate = Template(filename='./commandServiceImpl.tl')
		buf = StringIO()
		ctx = Context(buf, class_name=class_name, entity_name=class_name+"DTO", module_name=module_name, package_name=package_name)
		mapperTemplate.render_context(ctx)
		# print(buf.getvalue())
		service_dir = service+'command/impl/'
		if not os.path.exists(service_dir):
			os.makedirs(service_dir)
		f = open(service_dir + class_name+'CommandServiceImpl.java', 'w')
		f.write(buf.getvalue())
		f.close()

		mapperTemplate = Template(filename='./repository.tl')
		buf = StringIO()
		ctx = Context(buf, class_name=class_name, entity_name=class_name+"DTO", module_name=module_name, package_name=package_name)
		mapperTemplate.render_context(ctx)
		# print(buf.getvalue())
		service_dir = service + 'repository/'
		if not os.path.exists(service_dir):
			os.makedirs(service_dir)
		f = open(service_dir + class_name+'Repository.java', 'w')
		f.write(buf.getvalue())
		f.close()

		mapperTemplate = Template(filename='./repositoryImpl.tl')
		buf = StringIO()
		ctx = Context(buf, class_name=class_name, entity_name=class_name+"DTO", module_name=module_name, package_name=package_name)
		mapperTemplate.render_context(ctx)
		# print(buf.getvalue())
		service_dir = service+'repository/impl/'
		if not os.path.exists(service_dir):
			os.makedirs(service_dir)
		f = open(service_dir + class_name+'RepositoryImpl.java', 'w')
		f.write(buf.getvalue())
		f.close()

		mapperTemplate = Template(filename='./queryService.tl')
		buf = StringIO()
		ctx = Context(buf, class_name=class_name, entity_name=class_name+"DTO", module_name=module_name, package_name=package_name)
		mapperTemplate.render_context(ctx)
		# print(buf.getvalue())
		service_dir = service + 'query/'
		if not os.path.exists(service_dir):
			os.makedirs(service_dir)
		f = open(service_dir + class_name+'QueryService.java', 'w')
		f.write(buf.getvalue())
		f.close()

		mapperTemplate = Template(filename='./queryServiceImpl.tl')
		buf = StringIO()
		ctx = Context(buf, class_name=class_name, entity_name=class_name+"DTO", module_name=module_name, package_name=package_name)
		mapperTemplate.render_context(ctx)
		# print(buf.getvalue())
		service_dir = service+'query/impl/'
		if not os.path.exists(service_dir):
			os.makedirs(service_dir)
		f = open(service_dir + class_name+'QueryServiceImpl.java', 'w')
		f.write(buf.getvalue())
		f.close()


def write_module(workspace_root, package_name, table):
	module_name = table.module_name
	# workspace_root='./code/'
	# workspace_root='/Volumes/data/Develop/workspace/ktjr/loan-collection1/'
	if not os.path.exists(workspace_root + module_name):
		os.makedirs(workspace_root + module_name)
	os.system('cp -r ./template/module/* '+ workspace_root + module_name)

	package_name = package_name.replace('.', '/')

	mapperTemplate = Template(filename='./template/pom/module.tl',input_encoding='utf-8')
	buf = StringIO()
	ctx = Context(buf, package_name=package_name, module_name=module_name)
	mapperTemplate.render_context(ctx)
	f = open(workspace_root + module_name+'/pom.xml', 'w')
	f.write(buf.getvalue())
	f.close()

	admin_contoller = workspace_root + module_name+'/admin-controller'+java_src+'/com/'+package_name+'/'+module_name+'/admin/'
	contoller = workspace_root + module_name+'/controller'+java_src+'/com/'+package_name+'/'+module_name+'/'


	write_api(workspace_root, package_name, table)
	writer_service(workspace_root, package_name, table)

	generate_service_controller_repository_flag = True

	class_name = table.entity_name
	class_comment = table.comment
	fields = table.fields
	table_name = table.name
	id_Field =table.get_id_field()

	# if generate_service_controller_repository_flag :
		# generate_service_controller_repository(class_name,class_comment,fields,module_name,table_name,package_name,id_Field,service,admin_contoller)

def write_projects(workspace_root, package_name, tables):
	write_parent(workspace_root,package_name )
	for t in tables:
		write_module(workspace_root, package_name, t)

def write_project(workspace_root, package_name, table):
	write_module(workspace_root, package_name, table)

	
