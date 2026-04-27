select
	name,
	substring(name, 0, 5),
	position(' ' in name),
	substring(name, 0, position(' ' in name)) as first_name,
	substring(name, position(' ' in name) + 1) as last_name,
	trim(substring(name, position(' ' in name))) as trimmed_last_name
from
	users;