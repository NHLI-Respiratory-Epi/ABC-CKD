/*Create codes to indicate  atrial fibrillation/flutter*/
/*Do file author Sarah*/
/*creation date 24/02/21*/
forvalues f=1/150 {
	local c=string(`f',"%03.0f") /*converting number f to 3 digit string so we get the correct number of preceeding zeros */


use "Z:\Group_work\ABC_CKD\new_data\unzipped_2\AURUM\STATA_files\ckd2ob_observation_`c'.dta"


format medcodeid %20.0g


/*merge using af codelist from Laura*/
merge m:1 medcodeid using  "Z:\Group_work\ABC_CKD\Code_Lists\atrial_fibrillation_flutter.dta"

gen af=1 if _merge==3


sort patid obsdate

keep if af==1
by patid: gen af_n=_n if af==1
by patid: gen af_N=_N if af==1


count if af_N==1

gsort patid obsdate
egen keepme=tag(patid)

keep if keepme==1

rename medcodeid af_medcodeid
rename readterm af_desc
rename obsdate af_diagnosis_date


label variable af "has 1 or more af medcodes"
label variable af_medcodeid "medcodeid first af code"
label variable af_desc "desc of first af medcode"
label variable af_diagnosis_date "date of first record af"
label variable  af_N "number of af codes"

keep patid af af_medcodeid af_desc af_diagnosis_date af_N

count

merge 1:1 patid using "Z:\Group_work\ABC_CKD\new_data\unzipped_2\AURUM\STATA_files\abc_ckd_cohort_all.dta"

drop _merge
save "Z:\Group_work\ABC_CKD\new_data\unzipped_2\AURUM\STATA_files\abc_ckd_cohort_all.dta", replace

}
