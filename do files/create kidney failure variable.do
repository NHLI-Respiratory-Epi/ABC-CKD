/*Create codes to indicate  kidney_failure*/
/*Do file author Sarah*/
/*creation date 21/02/21*/
forvalues f=1/150 {
	local c=string(`f',"%03.0f") /*converting number f to 3 digit string so we get the correct number of preceeding zeros */


use "Z:\Group_work\ABC_CKD\new_data\unzipped_2\AURUM\STATA_files\ckd2ob_observation_`c'.dta"


format medcodeid %20.0g


/*merge using kidney_failure codelist from Laura*/
merge m:1 medcodeid using  "Z:\Group_work\ABC_CKD\Code_Lists\kidney_failure.dta"

gen kidney_failure=1 if _merge==3


sort patid obsdate

keep if kidney_failure==1
by patid: gen kidney_failure_n=_n if kidney_failure==1
by patid: gen kidney_failure_N=_N if kidney_failure==1


count if kidney_failure_N==1

gsort patid obsdate
egen keepme=tag(patid)

keep if keepme==1

rename medcodeid kidney_failure_medcodeid
rename readterm kidney_failure_desc
rename obsdate kidney_failure_diagnosis_date


label variable kidney_failure "has 1 or more kidney_failure medcodes"
label variable kidney_failure_medcodeid "medcodeid first kidney_failure code"
label variable kidney_failure_desc "desc of first kidney_failure medcode"
label variable kidney_failure_diagnosis_date "date of first record kidney_failure"
label variable  kidney_failure_N "number of kidney_failure codes"

keep patid kidney_failure kidney_failure_medcodeid kidney_failure_desc kidney_failure_diagnosis_date kidney_failure_N

count

merge 1:1 patid using "Z:\Group_work\ABC_CKD\new_data\unzipped_2\AURUM\STATA_files\abc_ckd_cohort_all.dta"

drop _merge
save "Z:\Group_work\ABC_CKD\new_data\unzipped_2\AURUM\STATA_files\abc_ckd_cohort_all.dta", replace

}
