/*create codes for sglt2 usage at seventh time point -31st Dec 2019*/
/*created by Sarah Cook*/
/*10.06.21*/
clear

forvalues f=1/135 {
	local c=string(`f',"%03.0f") /*converting number f to 3 digit string so we get the correct number of preceeding zeros */

use "Z:\Group_work\ABC_CKD\new_data\unzipped_2\AURUM\STATA_files\ckd2_drugissue_`c'.dta"


format prodcodeid %20.0g


merge m:1 prodcodeid using  "Z:\Group_work\ABC_CKD\Code_Lists\sglt2i.dta"


gen sglt2i=1 if _merge==3

drop _merge

keep if sglt2i==1


/*generate indicator for taking sglt2i on 31st December 2019*/
/*use 3 month window -if prescribed sglt2i in 3 month period before 31st December 2019 count as on sglt2i*/

gen sglt2i_dec19=1 if sglt2i==1 & issuedate<td(31dec2019) & issuedate>=td(30sept2019)

drop sglt2i

label variable sglt2i_dec19 "using sglt2i on Dec 2019"

keep if sglt2i_dec19==1

egen keepme=tag(patid)

keep if keepme==1

keep patid sglt2i_dec19 

merge 1:1 patid using "Z:\Group_work\ABC_CKD\new_data\unzipped_2\AURUM\STATA_files\abc_ckd_cohort_all.dta"

drop _merge
save "Z:\Group_work\ABC_CKD\new_data\unzipped_2\AURUM\STATA_files\abc_ckd_cohort_all.dta", replace 
}