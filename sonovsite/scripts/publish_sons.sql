update sonovsite_son 
set is_visible=true 
where 
	created_date<current_timestamp 
	and is_visible=false
;
