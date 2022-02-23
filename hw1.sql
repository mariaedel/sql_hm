-- названия ключей
select table_name, constraint_name
from information_schema.table_constraints 
where constraint_type = 'PRIMARY KEY' and constraint_schema = 'public'

-- названия колнок
select table_name, column_name 
from INFORMATION_SCHEMA.KEY_COLUMN_USAGE 
where constraint_schema = 'public' and constraint_name like('%pkey')
