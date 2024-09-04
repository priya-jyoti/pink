/*List the distributor with most installations in domestic places*/

	
SELECT name, COUNT(usg) AS cnt 
FROM vendor v 
LEFT JOIN install i 
	ON v.tin = i.tin 
WHERE usg = 'Dom' 
GROUP BY name 
HAVING cnt >= ALL (     
	SELECT COUNT(usg) AS cnt     
	FROM vendor v     
	LEFT JOIN install i 
		ON v.tin = i.tin     
	WHERE usg = 'Dom'     
	GROUP BY name 
);


/*List the place name with highest capacity panel installed*/
SELECT u.hno,address,sum(cap) as cap 
FROM user u 
left join install i 
	on u.hno=i.hno  
group by u.hno 
having cap>=(
	SELECT max(cap) as cap 
	FROM user u 
	left join install i 
		on u.hno=i.hno
);


/*Display the area where monocrystalline panels are installed*/
select distinct(address) 
from install i 
left join panel p 
	on i.pvm=p.pvm 
left join user u 
	on i.hno=u.hno 
where type='m';


/*For the specific area display the total installation charges for both type of PV modules*/
select address,type,sum(cost) 
from install i 
left join user u 
	on i.hno=u.hno 
left join panel p 
	on i.pvm=p.pvm 
group by address,type ;



/*List the details of distributors and panel that is the oldest installation*/
select i.tin,i.pvm,i.hno,cap,usg,warr,insdate,type,cost 
from install i 
left join panel  p 
	on i.pvm=p.pvm 
left join dist d 
	on i.tin=d.tin 
where insdate=(
	select min(insdate) 
	from install
);


/*Find the average sales of both type of panels in only commercial places*/

select type,avg(cost) 
from install i 
left join panel p 
	on i.pvm=p.pvm 
where usg='Com' 
group by type ;

