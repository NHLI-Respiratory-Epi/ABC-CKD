/*Create codes to indicate MI*/
/*Do file author Sarah*/
/*creation date 21/02/21*/
forvalues f=1/150 {
	local c=string(`f',"%03.0f") /*converting number f to 3 digit string so we get the correct number of preceeding zeros */


use "Z:\Group_work\ABC_CKD\new_data\unzipped_2\AURUM\STATA_files\ckd2ob_observation_`c'.dta"


format medcodeid %20.0g


/*merge using mi codelist from Laura*/
merge m:1 medcodeid using  "Z:\Group_work\ABC_CKD\Code_Lists\myocardial_Infarction.dta"

gen mi=1 if _merge==3


sort patid obsdate

keep if mi==1
by patid: gen mi_n=_n if mi==1
by patid: gen mi_N=_N if mi==1


count if mi_N==1

gsort patid obsdate
egen keepme=tag(patid)

keep if keepme==1

rename medcodeid mi_medcodeid
rename readterm mi_desc
rename obsdate mi_diagnosis_date


label variable mi "has 1 or more mi medcodes"
label variable mi_medcodeid "medcodeid first mi code"
label variable mi_desc "desc of first mi medcode"
label variable mi_diagnosis_date "date of first record mi"
label variable  mi_N "number of mi codes"

keep patid mi mi_medcodeid mi_desc mi_diagnosis_date mi_N

count

merge 1:1 patid using "Z:\Group_work\ABC_CKD\new_data\unzipped_2\AURUM\STATA_files\abc_ckd_cohort_all.dta"

drop _merge
save "Z:\Group_work\ABC_CKD\new_data\unzipped_2\AURUM\STATA_files\abc_ckd_cohort_all.dta", replace

}
