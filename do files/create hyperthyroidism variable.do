/*Create codes to indicate  hyperthyroidism*/
/*Do file author Sarah*/
/*creation date 21/02/21*/
forvalues f=1/150 {
	local c=string(`f',"%03.0f") /*converting number f to 3 digit string so we get the correct number of preceeding zeros */


use "Z:\Group_work\ABC_CKD\new_data\unzipped_2\AURUM\STATA_files\ckd2ob_observation_`c'.dta"


format medcodeid %20.0g


/*merge using hyperthyroidism codelist from Laura*/
merge m:1 medcodeid using  "Z:\Group_work\ABC_CKD\Code_Lists\hyperthyroidism.dta"

gen hyperthyroidism=1 if _merge==3


sort patid obsdate

keep if hyperthyroidism==1
by patid: gen hyperthyroidism_n=_n if hyperthyroidism==1
by patid: gen hyperthyroidism_N=_N if hyperthyroidism==1


count if hyperthyroidism_N==1

gsort patid obsdate
egen keepme=tag(patid)

keep if keepme==1

rename medcodeid hyperthyroidism_medcodeid
rename readterm hyperthyroidism_desc
rename obsdate hyperthyroidism_diagnosis_date


label variable hyperthyroidism "has 1 or more hyperthyroidism medcodes"
label variable hyperthyroidism_medcodeid "medcodeid first hyperthyroidism code"
label variable hyperthyroidism_desc "desc of first hyperthyroidism medcode"
label variable hyperthyroidism_diagnosis_date "date of first record hyperthyroidism"
label variable  hyperthyroidism_N "number of hyperthyroidism codes"

keep patid hyperthyroidism hyperthyroidism_medcodeid hyperthyroidism_desc hyperthyroidism_diagnosis_date hyperthyroidism_N

count

merge 1:1 patid using "Z:\Group_work\ABC_CKD\new_data\unzipped_2\AURUM\STATA_files\abc_ckd_cohort_all.dta"

drop _merge
save "Z:\Group_work\ABC_CKD\new_data\unzipped_2\AURUM\STATA_files\abc_ckd_cohort_all.dta", replace

}