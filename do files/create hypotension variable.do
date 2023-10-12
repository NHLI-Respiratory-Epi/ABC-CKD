/*Create codes to indicate  hypotension*/
/*Do file author Sarah*/
/*creation date 21/02/21*/
forvalues f=1/150 {
	local c=string(`f',"%03.0f") /*converting number f to 3 digit string so we get the correct number of preceeding zeros */


use "Z:\Group_work\ABC_CKD\new_data\unzipped_2\AURUM\STATA_files\ckd2ob_observation_`c'.dta"


format medcodeid %20.0g


/*merge using hypotension codelist from Laura*/
merge m:1 medcodeid using  "Z:\Group_work\ABC_CKD\Code_Lists\hypotension.dta"

gen hypotension=1 if _merge==3


sort patid obsdate

keep if hypotension==1
by patid: gen hypotension_n=_n if hypotension==1
by patid: gen hypotension_N=_N if hypotension==1


count if hypotension_N==1

gsort patid obsdate
egen keepme=tag(patid)

keep if keepme==1

rename medcodeid hypotension_medcodeid
rename readterm hypotension_desc
rename obsdate hypotension_diagnosis_date


label variable hypotension "has 1 or more hypotension medcodes"
label variable hypotension_medcodeid "medcodeid first hypotension code"
label variable hypotension_desc "desc of first hypotension medcode"
label variable hypotension_diagnosis_date "date of first record hypotension"
label variable  hypotension_N "number of hypotension codes"

keep patid hypotension hypotension_medcodeid hypotension_desc hypotension_diagnosis_date hypotension_N

count

merge 1:1 patid using "Z:\Group_work\ABC_CKD\new_data\unzipped_2\AURUM\STATA_files\abc_ckd_cohort_all.dta"

drop _merge
save "Z:\Group_work\ABC_CKD\new_data\unzipped_2\AURUM\STATA_files\abc_ckd_cohort_all.dta", replace

}
