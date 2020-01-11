

class Field(object):

	def __init__(self, name, jdbcType, type, comment, note, isId):
		self.name = convert(name,'_',False)
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
		return 'Field:name=%s field=%s isId=%s' % (self.name, self.field, self.isId)
	__repr__ = __str__

def read_field(name, jdbcType, comment, note, isId):
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

class Table(object):
	def __init__(self, name, comment):
		self.name = name
		self.comment = comment
		self.entity_name = convert(name,'_',True)
		self.fields = []
		self.module_name = None
		self.id_field = None

	def set_module_name(self, module_name):
		self.module_name = module_name

	def get_id_field(self):
		return self.id_field

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

def convert(one_string, space_character, firstUpower = False):    #one_string:输入的字符串；space_character:字符串的间隔符，以其做为分隔标志
	string_list = str(one_string).split(space_character)    #将字符串转化为list
	if not firstUpower:
		first = string_list[0].lower()
	else:
		first = string_list[0].capitalize()
	# print(first)
	others = string_list[1:] 
	others_capital = [word.capitalize() for word in others]      #str.capitalize():将字符串的首字母转化为大写
	others_capital[0:0] = [first]
	hump_string = ''.join(others_capital)     #将list组合成为字符串，中间无连接符。
	return hump_string