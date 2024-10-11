use hr_database;

# 1.Average Attrition rate for all Departments

select Department,round((sum(case Attrition when 'yes' then 1 else 0 end)/count(*))*100,2) as avg_attrition 
from hr_1
group by department
order by avg_attrition desc;

# 2.Average Hourly rate of Male Research Scientist

select Gender, JobRole, round(avg(HourlyRate),2) as avg_hourlyrate FROM hr_1 
where gender='male'and jobrole="research scientist";

# 3.Attrition rate Vs Monthly income stats 

select floor(monthlyincome/10000)*10000 as income_bin , 
Round(sum(case attrition when 'yes' then 1 else 0 end)/count(employeecount)*100,2) as Atr_rate 
from  hr_1
inner join hr_2
on hr_1.EmployeeNumber = hr_2.`EmployeeID`
group by income_bin
order by income_bin;

# 4.Average working years for each Department

select hr_1.Department ,round(avg(hr_2.TotalWorkingYears),2) as avg_work_year 
from  hr_1
inner join hr_2
on hr_1.EmployeeNumber = hr_2.`EmployeeID`
group by hr_1.Department;

# 5.Job Role Vs Work life balance

select JobRole,
round(avg(WorkLifeBalance),2) as WLB
 from hr_1
 inner join hr_2
 on hr_1.EmployeeNumber = hr_2.`EmployeeID`
 group by JobRole
 order by WLB desc;
 
  # 6.Attrition rate Vs Year since last promotion relation
 
  select YearsSinceLastPromotion, 
 round(sum(case attrition when 'yes' then 1 else 0 end)/count(employeecount)*100,2) as atr_rate 
 from hr_1
 join hr_2 
 on hr_1.EmployeeNumber= hr_2.`EmployeeID`
group by YearsSinceLastPromotion
  order by YearsSinceLastPromotion;
 
 