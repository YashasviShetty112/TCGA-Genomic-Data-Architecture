with overall_req as( select l.Class, avg(d.gene_0) as Average_of_class from "data.csv" as d 
inner join "labels.csv" as l 
on d.sample_id=l.sample_id group by l.class )
select l.sample_id,a.Average_of_class,a.class,d.gene_0 from "data.csv" d 
inner join "labels.csv" l 
on d.sample_id=l.sample_id 
inner join overall_req a 
on l.class=a.class 
where d.gene_0>a.Average_of_class;
------------------

select d.sample_id,l.class,d.gene_0, 
dense_rank()over(partition by l.class order by d.gene_0 desc) as gene_rank 
from "labels.csv" l 
inner join "data.csv" d 
on l.sample_id=d.sample_id;
----------------------

with stats as( select avg(gene_0) as mean_val, stddev_samp(gene_0) as std_val from "data.csv" )select d.sample_id, l.class, d.gene_0, 
round((d.gene_0-s.mean_val)/nullif(s.std_val,0),3) as z_score 
from "data.csv" d 
inner join "labels.csv" l 
on d.sample_id=l.sample_id 
cross join stats s 
where ABS((d.gene_0-s.mean_val)/nullif(s.std_val,0))>3;
-----------------------------

select d.sample_id, l.class, d.gene_1, 
case when d.gene_1>10.0 then 'High Expression' 
when d.gene_1 between 5.0 and 10.0 then 'Moderate Expresssion' 
else 'Low/Inactive' end as expression_tier from "data.csv" d 
inner join "labels.csv" l 
on d.sample_id=l.sample_id;
---------------------------------



select d.sample_id, l.class, 
greatest(d.gene_0,d.gene_1,d.gene_2,d.gene_3,d.gene_4) as peak_target_expression 
from "data.csv" d inner join "labels.csv" l 
on d.sample_id=l.sample_id;
-----------------------------------

select l.class, round(avg(d.gene_0),3) as Average_gene_0_Expression from "data.csv" d 
inner join "labels.csv" l on d.sample_id=l.sample_id 
group by l.class 
order by Average_gene_0_Expression desc;
-----------------------------

select l.class, round(avg(d.gene_0),3) as Average_gene_0_Expression from "data.csv" d 
inner join "labels.csv" l 
on d.sample_id=l.sample_id 
group by l.class 
order by Average_gene_0_Expression desc;
--------------------------------

----------------------------------END------------------------------
