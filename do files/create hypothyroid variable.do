/*Create codes to indicate  hypothyroid*/
/*Do file author Sarah*/
/*creation date 21/02/21*/
forvalues f=1/150 {
	local c=string(`f',"%03.0f") /*converting number f to 3 digit string so we get the correct number of preceeding zeros */


use "Z:\Group_work\ABC_CKD\new_data\unzipped_2\AURUM\STATA_files\ckd2ob_observation_`c'.dta"


format medcodeid %20.0g


/*merge using hypothyroid codelist from Laura*/
merge m:1 medcodeid using  "Z:\Group_work\ABC_CKD\Code_Lists\hypothyroid.dta"

gen hypothyroid=1 if _merge==3


sort patid obsdate

keep if hypothyroid==1
by patid: gen hypothyroid_n=_n if hypothyroid==1
by patid: gen hypothyroid_N=_N if hypothyroid==1


count if hypothyroid_N==1

gsort patid obsdate
egen keepme=tag(patid)

keep if keepme==1

rename medcodeid hypothyroid_medcodeid
rename readterm hypothyroid_desc
rename obsdate hypothyroid_diagnosis_date


label variable hypothyroid "has 1 or more hypothyroid medcodes"
label variable hypothyroid_medcodeid "medcodeid first hypothyroid code"
label variable hypothyroid_desc "desc of first hypothyroid medcode"
label variable hypothyroid_diagnosis_date "date of first record hypothyroid"
label variable  hypothyroid_N "number of hypothyroid codes"

keep patid hypothyroid hypothyroid_medcodeid hypothyroid_desc hypothyroid_diagnosis_date hypothyroid_N

count

merge 1:1 patid using "Z:\Group_work\ABC_CKD\new_data\unzipped_2\AURUM\STATA_files\abc_ckd_cohort_all.dta"

drop _merge
save "Z:\Group_work\ABC_CKD\new_data\unzipped_2\AURUM\STATA_files\abc_ckd_cohort_all.dta", replace

}
