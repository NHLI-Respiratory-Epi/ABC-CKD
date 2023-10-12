/*Create code to indicate hypertension*/

*Create codes to indicate  hypertension*/
/*Do file author Sarah*/
/*creation date 18/02/21*/
forvalues f=1/150 {
	local c=string(`f',"%03.0f") /*converting number f to 3 digit string so we get the correct number of preceeding zeros */


use "Z:\Group_work\ABC_CKD\new_data\unzipped_2\AURUM\STATA_files\ckd2ob_observation_`c'.dta"


format medcodeid %20.0g

/*merge using Hypertension codelist provided by Laura*/
merge m:1 medcodeid using  "Z:\Group_work\ABC_CKD\Code_Lists\Hypertension.dta"


gen hypertension=1 if _merge==3


sort patid obsdate

keep if hypertension==1
by patid: gen hypertension_n=_n if hypertension==1
by patid: gen hypertension_N=_N if hypertension==1


count if hypertension_N==1

gsort patid obsdate
egen keepme=tag(patid)

keep if keepme==1

rename medcodeid hypertension_medcodeid
rename readterm hypertension_desc
rename obsdate hypertension_diagnosis_date


label variable hypertension "has 1 or more hypertension medcodes"
label variable hypertension_medcodeid "medcodeid first hypertension code"
label variable hypertension_desc "desc of first hypertension medcode"
label variable hypertension_diagnosis_date "date of first record hypertension"
label variable  hypertension_N "number of hypertension codes"

keep patid hypertension hypertension_medcodeid hypertension_desc hypertension_diagnosis_date hypertension_N

merge 1:1 patid using "Z:\Group_work\ABC_CKD\new_data\unzipped_2\AURUM\STATA_files\abc_ckd_cohort_all.dta"

drop _merge
save "Z:\Group_work\ABC_CKD\new_data\unzipped_2\AURUM\STATA_files\abc_ckd_cohort_all.dta", replace

}
