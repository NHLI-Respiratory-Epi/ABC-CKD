/*Create codes to indicate diabetic retinopathy*/
/*Do file author Sarah*/
/*creation date 01/09/21*/
clear

forvalues f=1/150 {
	local c=string(`f',"%03.0f") /*converting number f to 3 digit string so we get the correct number of preceeding zeros */


use "Z:\Group_work\ABC_CKD\new_data\unzipped_2\AURUM\STATA_files\ckd2ob_observation_`c'.dta"


format medcodeid %20.0g


/*merge using diabetic neuropathy codes*/
merge m:1 medcodeid using  "Z:\Group_work\ABC_CKD\Code_Lists\diabetic_retinopathy.dta"

gen diabetic_retino=1 if _merge==3


sort patid obsdate

keep if diabetic_retino==1
by patid: gen diabetic_retino_n=_n if diabetic_retino==1
by patid: gen diabetic_retino_N=_N if diabetic_retino==1


count if diabetic_retino_N==1

gsort patid obsdate
egen keepme=tag(patid)

keep if keepme==1

rename medcodeid diabetic_retino_medcodeid
rename desc diabetic_retino_desc
rename obsdate diabetic_retino_diagnosis_date


label variable diabetic_retino "has 1 or more diabetic_retino medcodes"
label variable diabetic_retino_medcodeid "medcodeid first diabetic_retino code"
label variable diabetic_retino_desc "desc of first diabetic_retino medcode"
label variable diabetic_retino_diagnosis_date "date of first record diabetic_retino"
label variable  diabetic_retino_N "number of diabetic_retino codes"

keep patid diabetic_retino diabetic_retino_medcodeid diabetic_retino_desc diabetic_retino_diagnosis_date diabetic_retino_N

merge 1:1 patid using "Z:\Group_work\ABC_CKD\new_data\unzipped_2\AURUM\STATA_files\abc_ckd_cohort_all.dta"

drop _merge
save "Z:\Group_work\ABC_CKD\new_data\unzipped_2\AURUM\STATA_files\abc_ckd_cohort_all.dta", replace

}