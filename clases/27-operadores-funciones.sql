select
	"id",
	upper(name) as upper_name,
	lower(name) as lower_name,
	length(name) as length,
	(20 * 2) as constante,
	'*' || "id" || '-' || name || '*' as barcode,
	concat('*', "id", '-', name, '*'),
	name
from
	users;