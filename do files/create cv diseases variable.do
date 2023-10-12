/*Create codes to indicate  cvd*/
/*Do file author Sarah*/
/*creation date 21/02/21*/
forvalues f=1/150 {
	local c=string(`f',"%03.0f") /*converting number f to 3 digit string so we get the correct number of preceeding zeros */


use "Z:\Group_work\ABC_CKD\new_data\unzipped_2\AURUM\STATA_files\ckd2ob_observation_`c'.dta"


format medcodeid %20.0g


/*merge using cvd codelist from Laura*/
merge m:1 medcodeid using  "Z:\Group_work\ABC_CKD\Code_Lists\cv_diseases.dta"

gen cvd=1 if _merge==3


sort patid obsdate

keep if cvd==1
by patid: gen cvd_n=_n if cvd==1
by patid: gen cvd_N=_N if cvd==1


count if cvd_N==1

gsort patid obsdate
egen keepme=tag(patid)

keep if keepme==1

rename medcodeid cvd_medcodeid
rename readterm cvd_desc
rename obsdate cvd_diagnosis_date


label variable cvd "has 1 or more cvd medcodes"
label variable cvd_medcodeid "medcodeid first cvd code"
label variable cvd_desc "desc of first cvd medcode"
label variable cvd_diagnosis_date "date of first record cvd"
label variable  cvd_N "number of cvd codes"

keep patid cvd cvd_medcodeid cvd_desc cvd_diagnosis_date cvd_N

count

merge 1:1 patid using "Z:\Group_work\ABC_CKD\new_data\unzipped_2\AURUM\STATA_files\abc_ckd_cohort_all.dta"

drop _merge
save "Z:\Group_work\ABC_CKD\new_data\unzipped_2\AURUM\STATA_files\abc_ckd_cohort_all.dta", replace

}