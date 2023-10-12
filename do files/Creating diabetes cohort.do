/*Do file for creating the cohort of patients with diabetes*/

forvalues f=1/150 {
	local c=string(`f',"%03.0f") /*converting number f to 3 digit string so we get the correct number of preceeding zeros */


use "Z:\Group_work\ABC_CKD\new_data\unzipped_2\AURUM\STATA_files\ckd2ob_observation_`c'.dta"


format medcodeid %20.0g

merge m:1 medcodeid using "Z:\Group_work\ABC_CKD\Code_Lists\type2_neuro_retino_JKQ_SC.dta"


sort patid obsdate
gen diabetes=1 if (SC==1) & _merge==3
label variable diabetes "extraction code for type 2 diabetes"


keep if diabetes==1
by patid: gen diabetes_n=_n if diabetes==1
by patid: gen diabetes_N=_N if diabetes==1


count if diabetes_N==1

gsort patid obsdate
egen keepme=tag(patid)

keep if keepme==1

keep patid obsdate diabetes medcodeid desc diabetes_n diabetes_N SC

rename obsdate date_diabetes 
rename diabetes_N no_diabetes_codes


label variable date_diabetes "date first diabetes code"
label variable no_diabetes_code "Number of type 2 diabetes codes"

save "Z:\Group_work\ABC_CKD\new_data\unzipped_2\AURUM\STATA_files\abc_ckd_cohort_`c'.dta", replace 

}



**Combine cohorts to make one file with all patient IDs*/
use "Z:\Group_work\ABC_CKD\new_data\unzipped_2\AURUM\STATA_files\abc_ckd_cohort_001.dta", clear
	forval i = 2/9 {
	append using "Z:\Group_work\ABC_CKD\new_data\unzipped_2\AURUM\STATA_files\abc_ckd_cohort_00`i'.dta"
}

save "Z:\Group_work\ABC_CKD\new_data\unzipped_2\AURUM\STATA_files\abc_ckd_cohort_all.dta", replace

use "Z:\Group_work\ABC_CKD\new_data\unzipped_2\AURUM\STATA_files\abc_ckd_cohort_all.dta", clear 

	forval i = 10/99 {
	append using "Z:\Group_work\ABC_CKD\new_data\unzipped_2\AURUM\STATA_files\abc_ckd_cohort_0`i'.dta"
}

save "Z:\Group_work\ABC_CKD\new_data\unzipped_2\AURUM\STATA_files\abc_ckd_cohort_all.dta", replace

use "Z:\Group_work\ABC_CKD\new_data\unzipped_2\AURUM\STATA_files\abc_ckd_cohort_all.dta", clear 

	forval i = 100/150 {
	append using "Z:\Group_work\ABC_CKD\new_data\unzipped_2\AURUM\STATA_files\abc_ckd_cohort_`i'.dta"
}

save "Z:\Group_work\ABC_CKD\new_data\unzipped_2\AURUM\STATA_files\abc_ckd_cohort_all.dta", replace

rename medcodeid diabetes_medcode_1
label variable diabetes_medcode_1 "medcode id for first diabetes code"
rename desc diabetes_desc
label variable diabetes_desc "Description of first diabetes code"



/*remove duplicate patids after appending files*/

gsort patid date_diabetes
egen keepme=tag(patid)

keep if keepme==1

bysort patid: gen N=_N
bysort patid: gen n=_n


save "Z:\Group_work\ABC_CKD\new_data\unzipped_2\AURUM\STATA_files\abc_ckd_cohort_all.dta", replace
