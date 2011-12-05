#header usu 8 lines
head -9 Human610-Quadv1_H.csv |tee sample.csv
head -8 Human610-Quadv1_H.csv > Human610-Quadv1_H.csv.head


#footer have to manually chk
tail -25 Human610-Quadv1_H.csv >> sample.csv
tail -24 Human610-Quadv1_H.csv |tee Human610-Quadv1_H.csv.tail


time grep -n '\[Controls\]' Human610-Quadv1_H.csv

grep 'cnvi' Human610-Quadv1_H.csv > Human610-Quadv1_H.csv.cnvi.csv

#summary stats
wc -l Human610-Quadv1_H.csv* |tee summary.csv

#prints only data rows last line was 730562, 9 header rows, 24 footer rows
sed -n '9,616802p' Human610-Quadv1_H.csv > Human610-Quadv1_H.csv.data.csv
sed -n '8,616802p' Human610-Quadv1_H.csv > Human610-Quadv1_H.csv.data.xls.csv

#print breakdown of no of snps by chr 
awk -F ',' '{print $10}' Human610-Quadv1_H.csv.data.csv | sort |uniq -c |sort -n -k 2|awk '{print $1,"\t",$2}'|sed s/\ //g| tee Human610-Quadv1_H.csv.data.csv.snp_nos_by_chr.csv

#remove cnvi ONLY IF CNV FOUND
grep -v 'cnvi' Human610-Quadv1_H.csv.data.csv > cleaned
wc -l Human610-Quadv1_H.csv.data.csv Human610-Quadv1_H.csv.cnvi.csv cleaned |tee summary2.csv
mv Human610-Quadv1_H.csv.data.csv{,b4removeCNV.csv}
mv cleaned Human610-Quadv1_H.csv.data.csv

#summary stats run this again
wc -l Human610-Quadv1_H.csv* |tee summary.csv

#print breakdown of no of snps by chr 
awk -F ',' '{print $10}' Human610-Quadv1_H.csv.data.csv | sort |uniq -c |sort -n -k 2|awk '{print $1,"\t",$2}'|sed s/\ //g| tee Human610-Quadv1_H.csv.data.csv.snp_nos_by_chr.csv
