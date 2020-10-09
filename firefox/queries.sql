-- History list by URL

select p.url, datetime(h.visit_date/1000/1000, 'unixepoch', 'localtime') vdate
from moz_places p join moz_historyvisits h on p.id=h.place_id
where p.url='http://site.com'
-- where p.url like '%site.com%'
order by vdate desc
