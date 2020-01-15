

import re
import utils

class Field(object):

	def __init__(self, name, jdbcType, type, comment, note, isId):
		self.name = utils.convert(name,'_',False)
		self.comment = comment
		self.field = name
		self.note = note
		self.isId = isId
		self.jdbcType = jdbcType
		self.type = type
		if (self.jdbcType == "INT") :
			self.jdbcType = "INTEGER"
		elif (self.jdbcType == "BIGINT UNSIGNED"):
			self.jdbcType = "BIGINT"
		elif (self.jdbcType == "DATETIME"):
			self.jdbcType = "TIMESTAMP"

	def is_id(self):
		return self.isId

	def __str__(self):
		return 'Field:name=%s field=%s comment=%s isId=%s' % (self.name, self.field, self.comment, self.isId)
	__repr__ = __str__

def read_db_field(name, jdbcType, comment, note, isId):
	jdbcType = jdbcType.split('(')[0]
	type = None
	if "VARCHAR" in jdbcType:
		type = "String"
	elif "TINYINT" in jdbcType:
		type = "Byte"
	elif "DATETIME" in jdbcType:
		type = "LocalDateTime"
	elif "DATE" in jdbcType:
		type = "LocalDate"
	elif "DECIMAL" in jdbcType:
		type = "BigDecimal"
	elif "INT" == jdbcType:
		type = "Integer"
	elif "INT" == jdbcType:
		type = "Integer"
	elif "BIGINT UNSIGNED" == jdbcType:
		type = "Long"
	elif "BIGINT" == jdbcType:
		type = "Long"
	elif "JSON" == jdbcType:
		type = "HashMap"
	else:
		type = None
		print(name, jdbcType)
	if type is not None :
		return Field(name, jdbcType, type, comment, note, isId)
	return None

def read_interface_field(name, type, comment):
	if not type.isalnum() :
		return None
	if len(re.findall('[\u4e00-\u9fa5]',type)) > 0 :#检查是否包含汉字
		return None
	if type == 'Number':
		type = 'Integer'
	return Field(name, '', type, comment, '', False)

class Table(object):
	def __init__(self, name, comment):
		self.name = name
		self.comment = comment
		self.entity_name = utils.convert(name,'_',True)
		self.fields = []
		self.module_name = ''
		self.id_field = None

	def set_module_name(self, module_name):
		self.module_name = module_name

	def get_id_field(self):
		return self.id_field

	def has_id(self):
		return not self.id_field is None

	def add_fields(self, field):
		if field is not None :
			if field.is_id():
				self.id_field = field
			self.fields.append(field)

	def __str__(self):
		return 'Student:name=%s entity_name=%s fields=%s' % (self.name, self.entity_name, self.fields)
	__repr__ = __str__

def read_table(line, space_character):
	str = line.lstrip().rstrip().split(space_character)
	return Table(str[1],str[0])

class Action(object):
	def __init__(self, url, http_method,comment):
		self.url = url
		self.http_method =http_method
		self.request_params = []
		self.response = []
		self.is_request = False
		self.comment =comment
		self.module_name = ''
		self.class_name = ''

	def set_url(self,url, space_character):
		# print( url.lstrip().rstrip().split(space_character))
		self.url = url.lstrip().rstrip().split(space_character)[-1].replace('`', '')
		self.module_name = self.url.split('/')[3]

	def set_http_method(self,http_method, space_character):
		# print( url.lstrip().rstrip().split(space_character))
		self.http_method = http_method.lstrip().rstrip().split(space_character)[-1].replace('`', '')
		lastUrl = self.url.split('/')[-1]
		if lastUrl.startswith('{') :
			lastUrl =self.url.split('/')[-2]
		self.class_name = utils.firstUpower(self.http_method) + utils.firstUpower(lastUrl)

	def set_module_name(self, module_name):
		self.module_name = module_name

	def check(self):
		if not self.url.startswith('/') :
			return False
		if self.http_method not in ['POST','GET','PUT','DELETE']:
			return False
		return True
	def is_get_method(self):
		return self.http_method in ['GET'
		]
	def add_field(self,field):
		if field is not None :
			if self.is_request:
				self.request_params.append(field)
			else:
				self.response.append(field)
	def set_params_type(self, type):
		self.is_request = type

	def is_get_id_method(self):
		#get /ddd/{id}
		lastUrl = self.url.split('/')[-1]
		if lastUrl.startswith('{') and self.http_method == 'GET':
			if len(self.request_params) <= 1 :
				# print(self.http_method,self.url,self.request_params)
				return True
	def get_method_name(self):
		lastUrl = self.url.split('/')[-1]
		if lastUrl.startswith('{') :
			return self.http_method.lower() +utils.firstUpower(self.url.split('/')[-2])

		return self.url.split('/')[-1]

	def has_request(self):
		if self.is_get_id_method() :
			return False
		return len(self.request_params) >0 

	def has_response(self):
		return len(self.response) >0 

	def __str__(self):
		return '%s:%s request_params=%s response=%s' % ( self.http_method,self.url, self.request_params, self.response)
	__repr__ = __str__



