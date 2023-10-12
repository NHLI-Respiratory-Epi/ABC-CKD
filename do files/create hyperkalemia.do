/*Create codes to indicate  hyperkalemia*/
/*Do file author Sarah*/
/*creation date 21/02/21*/
forvalues f=1/150 {
	local c=string(`f',"%03.0f") /*converting number f to 3 digit string so we get the correct number of preceeding zeros */


use "Z:\Group_work\ABC_CKD\new_data\unzipped_2\AURUM\STATA_files\ckd2ob_observation_`c'.dta"


format medcodeid %20.0g


/*merge using hyperkalemia codelist from Laura*/
merge m:1 medcodeid using  "Z:\Group_work\ABC_CKD\Code_Lists\hyperkalemia.dta"

gen hyperkalemia=1 if _merge==3


sort patid obsdate

keep if hyperkalemia==1
by patid: gen hyperkalemia_n=_n if hyperkalemia==1
by patid: gen hyperkalemia_N=_N if hyperkalemia==1


count if hyperkalemia_N==1

gsort patid obsdate
egen keepme=tag(patid)

keep if keepme==1

rename medcodeid hyperkalemia_medcodeid
rename readterm hyperkalemia_desc
rename obsdate hyperkalemia_diagnosis_date


label variable hyperkalemia "has 1 or more hyperkalemia medcodes"
label variable hyperkalemia_medcodeid "medcodeid first hyperkalemia code"
label variable hyperkalemia_desc "desc of first hyperkalemia medcode"
label variable hyperkalemia_diagnosis_date "date of first record hyperkalemia"
label variable  hyperkalemia_N "number of hyperkalemia codes"

keep patid hyperkalemia hyperkalemia_medcodeid hyperkalemia_desc hyperkalemia_diagnosis_date hyperkalemia_N

count

merge 1:1 patid using "Z:\Group_work\ABC_CKD\new_data\unzipped_2\AURUM\STATA_files\abc_ckd_cohort_all.dta"

drop _merge
save "Z:\Group_work\ABC_CKD\new_data\unzipped_2\AURUM\STATA_files\abc_ckd_cohort_all.dta", replace

}