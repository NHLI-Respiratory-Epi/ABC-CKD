/*Create codes to indicate diabetic neuropathy*/
/*Do file author Sarah*/
/*creation date 01/09/21*/
clear

forvalues f=1/150 {
	local c=string(`f',"%03.0f") /*converting number f to 3 digit string so we get the correct number of preceeding zeros */


use "Z:\Group_work\ABC_CKD\new_data\unzipped_2\AURUM\STATA_files\ckd2ob_observation_`c'.dta"


format medcodeid %20.0g


/*merge using diabetic neuropathy codes*/
merge m:1 medcodeid using  "Z:\Group_work\ABC_CKD\Code_Lists\diabetic_neuropathy.dta"

gen diabetic_neuro=1 if _merge==3


sort patid obsdate

keep if diabetic_neuro==1
by patid: gen diabetic_neuro_n=_n if diabetic_neuro==1
by patid: gen diabetic_neuro_N=_N if diabetic_neuro==1


count if diabetic_neuro_N==1

gsort patid obsdate
egen keepme=tag(patid)

keep if keepme==1

rename medcodeid diabetic_neuro_medcodeid
rename desc diabetic_neuro_desc
rename obsdate diabetic_neuro_diagnosis_date


label variable diabetic_neuro "has 1 or more diabetic_neuro medcodes"
label variable diabetic_neuro_medcodeid "medcodeid first diabetic_neuro code"
label variable diabetic_neuro_desc "desc of first diabetic_neuro medcode"
label variable diabetic_neuro_diagnosis_date "date of first record diabetic_neuro"
label variable  diabetic_neuro_N "number of diabetic_neuro codes"

keep patid diabetic_neuro diabetic_neuro_medcodeid diabetic_neuro_desc diabetic_neuro_diagnosis_date diabetic_neuro_N

merge 1:1 patid using "Z:\Group_work\ABC_CKD\new_data\unzipped_2\AURUM\STATA_files\abc_ckd_cohort_all.dta"

drop _merge
save "Z:\Group_work\ABC_CKD\new_data\unzipped_2\AURUM\STATA_files\abc_ckd_cohort_all.dta", replace

}