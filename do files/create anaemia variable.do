/*Create codes to indicate  anaemia*/
/*Do file author Sarah*/
/*creation date 31/08/21*/
clear

forvalues f=1/150 {
	local c=string(`f',"%03.0f") /*converting number f to 3 digit string so we get the correct number of preceeding zeros */


use "Z:\Group_work\ABC_CKD\new_data\unzipped_2\AURUM\STATA_files\ckd2ob_observation_`c'.dta"


format medcodeid %20.0g


/*merge using anaemia codes from Laura*/
merge m:1 medcodeid using  "Z:\Group_work\ABC_CKD\Code_Lists\anaemia.dta"

gen anaemia=1 if _merge==3


sort patid obsdate

keep if anaemia==1
by patid: gen anaemia_n=_n if anaemia==1
by patid: gen anaemia_N=_N if anaemia==1


count if anaemia_N==1

gsort patid obsdate
egen keepme=tag(patid)

keep if keepme==1

rename medcodeid anaemia_medcodeid
rename readterm anaemia_desc
rename obsdate anaemia_diagnosis_date


label variable anaemia "has 1 or more anaemia medcodes"
label variable anaemia_medcodeid "medcodeid first anaemia code"
label variable anaemia_desc "desc of first anaemia medcode"
label variable anaemia_diagnosis_date "date of first record anaemia"
label variable  anaemia_N "number of anaemia codes"

keep patid anaemia anaemia_medcodeid anaemia_desc anaemia_diagnosis_date anaemia_N

merge 1:1 patid using "Z:\Group_work\ABC_CKD\new_data\unzipped_2\AURUM\STATA_files\abc_ckd_cohort_all.dta"

drop _merge
save "Z:\Group_work\ABC_CKD\new_data\unzipped_2\AURUM\STATA_files\abc_ckd_cohort_all.dta", replace

}