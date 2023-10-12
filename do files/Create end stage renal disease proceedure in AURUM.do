/*Create codes to indicate End stage renal disease proceedure using CPRD Aurum*/
/*Do file author Sarah*/
/*creation date 22/10/21*/
clear


forvalues f=1/150 {
	local c=string(`f',"%03.0f") /*converting number f to 3 digit string so we get the correct number of preceeding zeros */


use "Z:\Group_work\ABC_CKD\new_data\unzipped_2\AURUM\STATA_files\ckd2ob_observation_`c'.dta"


format medcodeid %20.0g


/*merge using End stage renal disease proceedures codelist provided by Sarah Cook, checked Laurie Tomlinson*/
merge m:1 medcodeid using  "Z:\Group_work\ABC_CKD\Code_Lists\end_stage_renal_disease_proceedures_aurum.dta"

gen esrd_p_cprd=1 if _merge==3


sort patid obsdate

keep if esrd_p_cprd==1
by patid: gen esrd_p_cprd_n=_n if esrd_p_cprd==1
by patid: gen esrd_p_cprd_N=_N if esrd_p_cprd==1


count if esrd_p_cprd_N==1

gsort patid obsdate
egen keepme=tag(patid)

keep if keepme==1

rename medcodeid esrd_p_cprd_medcodeid
rename term esrd_p_cprd_desc
rename obsdate esrd_p_cprd_diagnosis_date


label variable esrd_p_cprd "has 1 or more medcodes for end stage renal disease procedure"
label variable esrd_p_cprd_medcodeid "medcodeid first esrd_p_cprd code"
label variable esrd_p_cprd_desc "desc of first esrd_p_cprd medcode"
label variable esrd_p_cprd_diagnosis_date "date of first record esrd_p_cprd"
label variable  esrd_p_cprd_N "number of esrd_p_cprd codes"

keep patid esrd_p_cprd esrd_p_cprd_medcodeid esrd_p_cprd_desc esrd_p_cprd_diagnosis_date esrd_p_cprd_N

merge 1:1 patid using "Z:\Group_work\ABC_CKD\new_data\unzipped_2\AURUM\STATA_files\abc_ckd_cohort_all.dta"

drop _merge
save "Z:\Group_work\ABC_CKD\new_data\unzipped_2\AURUM\STATA_files\abc_ckd_cohort_all.dta", replace

}


