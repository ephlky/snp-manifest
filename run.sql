#autosomal, missing pos
#select  count(*) from manifest where Chr in ('0','Y','X','XY')  limit 10;

#count SNPs remain after filter autosomal, missing pos
select  count(*) from manifest where Chr NOT in ('0','Y','X','XY')  limit 10;

#indels 1
select * from manifest where SNP='[D/I]';
select * from manifest where SNP in ('[D/I]','[I/D]');
select count(*) from manifest where SNP in ('[D/I]','[I/D]');

select  count(*) from manifest where Chr NOT in ('0','Y','X','XY') 


#wanted snps autosomal, not indels, 
select  count(*) from manifest where Chr NOT in ('0','Y','X','XY')  AND SNP  NOT in ('[D/I]','[I/D]');


#filtered SNPs
select  * from manifest where Chr NOT in ('0','Y','X','XY')  AND SNP  NOT in ('[D/I]','[I/D]');

#discarded snps
select  * from manifest where Chr  in ('0','Y','X','XY')  OR SNP   in ('[D/I]','[I/D]');

#copy number probes ID are like cnvi0008743-126_B_R_1860240710
select * from manifest where IlmnID like 'cnvi%' limit 2;
select count(*) from manifest where IlmnID NOT like 'cnvi%' limit 2;
#4301311

#wanted snps autosomal, not indels, not cnv 4171728 FOR Omni5
select  count(*) from manifest where Chr NOT in ('0','Y','X','XY')  AND SNP  NOT in ('[D/I]','[I/D]') AND IlmnID NOT like 'cnvi%';

