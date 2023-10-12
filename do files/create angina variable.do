/*Create codes to indicate  angina*/
/*Do file author Sarah*/
/*creation date 21/02/21*/
forvalues f=1/150 {
	local c=string(`f',"%03.0f") /*converting number f to 3 digit string so we get the correct number of preceeding zeros */


use "Z:\Group_work\ABC_CKD\new_data\unzipped_2\AURUM\STATA_files\ckd2ob_observation_`c'.dta"


format medcodeid %20.0g


/*merge using Angina codelist from Laura*/
merge m:1 medcodeid using  "Z:\Group_work\ABC_CKD\Code_Lists\angina.dta"

gen angina=1 if _merge==3


sort patid obsdate

keep if angina==1
by patid: gen angina_n=_n if angina==1
by patid: gen angina_N=_N if angina==1


count if angina_N==1

gsort patid obsdate
egen keepme=tag(patid)

keep if keepme==1

rename medcodeid angina_medcodeid
rename readterm angina_desc
rename obsdate angina_diagnosis_date


label variable angina "has 1 or more angina medcodes"
label variable angina_medcodeid "medcodeid first angina code"
label variable angina_desc "desc of first angina medcode"
label variable angina_diagnosis_date "date of first record angina"
label variable  angina_N "number of angina codes"

keep patid angina angina_medcodeid angina_desc angina_diagnosis_date angina_N

count

merge 1:1 patid using "Z:\Group_work\ABC_CKD\new_data\unzipped_2\AURUM\STATA_files\abc_ckd_cohort_all.dta"

drop _merge
save "Z:\Group_work\ABC_CKD\new_data\unzipped_2\AURUM\STATA_files\abc_ckd_cohort_all.dta", replace

}

