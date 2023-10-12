/*create codes for ddp4*/
/*created by Sarah Cook*/
/*24.04.21*/
clear

forvalues f=1/135 {
	local c=string(`f',"%03.0f") /*converting number f to 3 digit string so we get the correct number of preceeding zeros */

use "Z:\Group_work\ABC_CKD\new_data\unzipped_2\AURUM\STATA_files\ckd2_drugissue_`c'.dta"


format prodcodeid %20.0g


merge m:1 prodcodeid using  "Z:\Group_work\ABC_CKD\Code_Lists\ddp4.dta"


gen ddp4=1 if _merge==3

drop _merge

keep if ddp4==1


/*generate indicator for taking ddp4 on 31st Jan 2018 - using codelist developed by Sarah Cook*/
/*use 3 month window -if prescribed ddp4 in 3 month period before 1st Jan 2018 count as on ddp4*/

gen ddp4_jan18=1 if ddp4==1 & issuedate<td(01jan2018) & issuedate>=td(01oct2017)

label variable ddp4 "ever prescribed ddp4"
label variable ddp4_jan18 "using ddp4 on 1st jan 2018"

keep if ddp4_jan18==1

egen keepme=tag(patid)

keep if keepme==1

keep patid ddp4_jan18 



merge 1:1 patid using "Z:\Group_work\ABC_CKD\new_data\unzipped_2\AURUM\STATA_files\abc_ckd_cohort_all.dta"

drop _merge
save "Z:\Group_work\ABC_CKD\new_data\unzipped_2\AURUM\STATA_files\abc_ckd_cohort_all.dta", replace 
}

