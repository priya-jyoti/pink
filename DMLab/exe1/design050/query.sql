/*
List the f_Name, l_Name, dept_Name of the employer who draws a salary greater than the average salary of employees working for the Finance department.
*/
select * 
from emptbl e 
left join depttbl d 
	on e.dno=d.dno 
where salary < (
	select avg(salary) 
	from emptbl 
	where d.dname='Finance'
) ;



/*
List the name and department of the employee who is currently working on more than two project controlled by R&D department.
*/
select essn,count(*) 
from workon w 
left join (
	select pid,pname,p.dno,d.dname 
	from prgtbl p 
	left join depttbl d 
		on p.dno=d.dno 
	where dname='R&D' and p.pendate<curdate()
	) as prg 
	on w.pid=prg.pid 
where prg.pname is not null  
group by essn ;

/*
List all the ongoing projects controlled by all the departments.
*/
select * 
from prgtbl p 
left join depttbl d 
	on p.dno=d.dno 
where dname='R&D' and p.pendate<curdate();


/*
Give the details of the supervisor who is supervising more than 3 employees who have completed at least one project.
*/



/*
List the name of the dependents employee who has completed a total_projects worth 10L.
*/
select d.dname,e.fname,sum(p.cost)  
from deptbl d  
left join emptbl e  on d.essn=e.ssn  
left join workon w  on  e.ssn=w.essn  
left join prgtbl p  on w.pid=p.pid  
where 
	w.pid is not null and 
	(select curdate()) between p.pstdate and p.pendate   
group by d.dname,e.fname  
having sum(p.cost)>500000;




/*
List the department and employee details whose project is in more than one city.
*/
select pname,count(*) as count 
from prgtbl p 
left join proloc pl on p.pid=pl.pid 
where pl.ploc is not null 
group by pname 
having count >1;


