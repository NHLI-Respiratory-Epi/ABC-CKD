/*Create codes to indicate  smoking*/
/*Do file author Sarah*/
/*creation date 10/05/21*/
forvalues f=1/150 {
	local c=string(`f',"%03.0f") /*converting number f to 3 digit string so we get the correct number of preceeding zeros */


use "Z:\Group_work\ABC_CKD\new_data\unzipped_2\AURUM\STATA_files\ckd2ob_observation_`c'.dta"


format medcodeid %20.0g


/*merge using smoking codelist from Hannah*/
merge m:1 medcodeid using  "Z:\Group_work\ABC_CKD\Code_Lists\smoking.dta"

gen smoking=1 if _merge==3


sort patid obsdate

keep if smoking==1
by patid: gen smoking_n=_n if smoking==1
by patid: gen smoking_N=_N if smoking==1


count if smoking_N==1

gsort patid -obsdate
egen keepme=tag(patid)

keep if keepme==1

rename medcodeid smoking_medcodeid
rename term smoking_desc
rename obsdate smoking_diagnosis_date


label variable smoking "has 1 or more smoking medcodes"
label variable smoking_medcodeid "medcodeid most recent smoking code"
label variable smoking_desc "desc of first smoking medcode"
label variable smoking_diagnosis_date "date of most recent record smoking"
label variable  smoking_N "number of smoking codes"

keep patid smoking smoking_medcodeid smoking_desc smoking_diagnosis_date smoking_N smokstatus

count

merge 1:1 patid using "Z:\Group_work\ABC_CKD\new_data\unzipped_2\AURUM\STATA_files\abc_ckd_cohort_all.dta"

drop _merge
save "Z:\Group_work\ABC_CKD\new_data\unzipped_2\AURUM\STATA_files\abc_ckd_cohort_all.dta", replace

}