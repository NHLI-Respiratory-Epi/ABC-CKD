/*Create codes to indicate  sleep_apnoea*/
/*Do file author Sarah*/
/*creation date 21/02/21*/
forvalues f=1/150 {
	local c=string(`f',"%03.0f") /*converting number f to 3 digit string so we get the correct number of preceeding zeros */


use "Z:\Group_work\ABC_CKD\new_data\unzipped_2\AURUM\STATA_files\ckd2ob_observation_`c'.dta"


format medcodeid %20.0g


/*merge using sleep_apnoea codelist from Laura*/
merge m:1 medcodeid using  "Z:\Group_work\ABC_CKD\Code_Lists\sleep_apnoea.dta"

gen sleep_apnoea=1 if _merge==3


sort patid obsdate

keep if sleep_apnoea==1
by patid: gen sleep_apnoea_n=_n if sleep_apnoea==1
by patid: gen sleep_apnoea_N=_N if sleep_apnoea==1


count if sleep_apnoea_N==1

gsort patid obsdate
egen keepme=tag(patid)

keep if keepme==1

rename medcodeid sleep_apnoea_medcodeid
rename readterm sleep_apnoea_desc
rename obsdate sleep_apnoea_diagnosis_date


label variable sleep_apnoea "has 1 or more sleep_apnoea medcodes"
label variable sleep_apnoea_medcodeid "medcodeid first sleep_apnoea code"
label variable sleep_apnoea_desc "desc of first sleep_apnoea medcode"
label variable sleep_apnoea_diagnosis_date "date of first record sleep_apnoea"
label variable  sleep_apnoea_N "number of sleep_apnoea codes"

keep patid sleep_apnoea sleep_apnoea_medcodeid sleep_apnoea_desc sleep_apnoea_diagnosis_date sleep_apnoea_N

count

merge 1:1 patid using "Z:\Group_work\ABC_CKD\new_data\unzipped_2\AURUM\STATA_files\abc_ckd_cohort_all.dta"

drop _merge
save "Z:\Group_work\ABC_CKD\new_data\unzipped_2\AURUM\STATA_files\abc_ckd_cohort_all.dta", replace

}
