* make an age at entry to cohort 1st Jan 2017 variable
	gen age_jan2017=0
	replace age_jan2017= 2017- yob 
	
egen age_group_jan2017=cut(age_jan2017), at (0, 18, 30, 40, 50, 60, 70, 80, 90, 120)

recode age_group_jan2017 0=0 18=1 30=2 40=3 50=4 60=5 70=6 80=7 90=8
label define age_group_10 0"<18" 1"18-29" 2"30-39" 3"40-49" 4"50-59" 5"60-69" 6"70-79" 7"80-89" 8"90+"
label values age_group_jan2017 age_group_10


* make an age at  1st Jan 2018 variable
	gen age_jan2018=0
	replace age_jan2018= 2018- yob 
	


* make an age at  1st Jan 2019 variable
	gen age_jan2019=0
	replace age_jan2019= 2019- yob 
