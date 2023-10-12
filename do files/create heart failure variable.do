/*Create codes to indicate  heart failure*/
/*Do file author Sarah*/
/*creation date 21/02/21*/
forvalues f=1/150 {
	local c=string(`f',"%03.0f") /*converting number f to 3 digit string so we get the correct number of preceeding zeros */


use "Z:\Group_work\ABC_CKD\new_data\unzipped_2\AURUM\STATA_files\ckd2ob_observation_`c'.dta"


format medcodeid %20.0g


/*merge using Heart failure codelist from Laura*/
merge m:1 medcodeid using  "Z:\Group_work\ABC_CKD\Code_Lists\Heart_failure.dta"

gen hf=1 if _merge==3


sort patid obsdate

keep if hf==1
by patid: gen hf_n=_n if hf==1
by patid: gen hf_N=_N if hf==1


count if hf_N==1

gsort patid obsdate
egen keepme=tag(patid)

keep if keepme==1

rename medcodeid hf_medcodeid
rename readterm hf_desc
rename obsdate hf_diagnosis_date


label variable hf "has 1 or more heart failure medcodes"
label variable hf_medcodeid "medcodeid first heart failure code"
label variable hf_desc "desc of first heart failure medcode"
label variable hf_diagnosis_date "date of first record heart failure"
label variable  hf_N "number of heart failure codes"

keep patid hf hf_medcodeid hf_desc hf_diagnosis_date hf_N

count

merge 1:1 patid using "Z:\Group_work\ABC_CKD\new_data\unzipped_2\AURUM\STATA_files\abc_ckd_cohort_all.dta"

drop _merge
save "Z:\Group_work\ABC_CKD\new_data\unzipped_2\AURUM\STATA_files\abc_ckd_cohort_all.dta", replace

}

