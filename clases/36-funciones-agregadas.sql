select
	count(*) as total_users,
	min("followers") as min_followers,
	max("followers") as max_followers,
	round(avg("followers")) as avg_followers,
	sum("followers") / count(*) as avg_manual
from
	users;
