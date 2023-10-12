/*create codes for glp_1*/
/*created by Sarah Cook*/
/*12.05.21*/
clear

forvalues f=1/135 {
	local c=string(`f',"%03.0f") /*converting number f to 3 digit string so we get the correct number of preceeding zeros */

use "Z:\Group_work\ABC_CKD\new_data\unzipped_2\AURUM\STATA_files\ckd2_drugissue_`c'.dta"


format prodcodeid %20.0g


merge m:1 prodcodeid using  "Z:\Group_work\ABC_CKD\Code_Lists\glp_1.dta"


gen glp_1=1 if _merge==3

drop _merge

keep if glp_1==1


/*generate indicator for taking glp_1 on 1st jan 2018 - codelist developed by Sarah Cook*/
/*use 3 month window -if prescribed glp_1 in 3 month period before 1st jan 2018 count as on glp_1*/

gen glp_1_jan18=1 if glp_1==1 & issuedate<td(01jan2018) & issuedate>=td(01oct2017)

label variable glp_1 "ever prescribed glp_1"
label variable glp_1_jan18 "using glp_1 on 1 jan 2018"

keep if glp_1_jan18==1

egen keepme=tag(patid)

keep if keepme==1

keep patid glp_1_jan18 


merge 1:1 patid using "Z:\Group_work\ABC_CKD\new_data\unzipped_2\AURUM\STATA_files\abc_ckd_cohort_all.dta"

drop _merge
save "Z:\Group_work\ABC_CKD\new_data\unzipped_2\AURUM\STATA_files\abc_ckd_cohort_all.dta", replace 
}