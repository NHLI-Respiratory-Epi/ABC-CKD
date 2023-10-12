/*Create codes to indicate  COPD*/
/*Do file author Sarah*/
/*creation date 18/02/21*/
forvalues f=1/150 {
	local c=string(`f',"%03.0f") /*converting number f to 3 digit string so we get the correct number of preceeding zeros */


use "Z:\Group_work\ABC_CKD\new_data\unzipped_2\AURUM\STATA_files\ckd2ob_observation_`c'.dta"


format medcodeid %20.0g


/*merge using COPD codelist provided by Alicia COPD codes in Aurum_JQ*/
merge m:1 medcodeid using  "Z:\Group_work\ABC_CKD\Code_Lists\COPD.dta"

gen copd=1 if _merge==3


sort patid obsdate

keep if copd==1
by patid: gen copd_n=_n if copd==1
by patid: gen copd_N=_N if copd==1


count if copd_N==1

gsort patid obsdate
egen keepme=tag(patid)

keep if keepme==1

rename medcodeid copd_medcodeid
rename desc copd_desc
rename obsdate copd_diagnosis_date


label variable copd "has 1 or more copd medcodes"
label variable copd_medcodeid "medcodeid first COPD code"
label variable copd_desc "desc of first COPD medcode"
label variable copd_diagnosis_date "date of first record COPD"
label variable  copd_N "number of COPD codes"

keep patid copd copd_medcodeid copd_desc copd_diagnosis_date copd_N

merge 1:1 patid using "Z:\Group_work\ABC_CKD\new_data\unzipped_2\AURUM\STATA_files\abc_ckd_cohort_all.dta"

drop _merge
save "Z:\Group_work\ABC_CKD\new_data\unzipped_2\AURUM\STATA_files\abc_ckd_cohort_all.dta", replace

}


