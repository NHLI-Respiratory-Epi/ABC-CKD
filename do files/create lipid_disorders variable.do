/*Create codes to indicate  lipid_disorders*/
/*Do file author Sarah*/
/*creation date 21/02/21*/
forvalues f=1/150 {
	local c=string(`f',"%03.0f") /*converting number f to 3 digit string so we get the correct number of preceeding zeros */


use "Z:\Group_work\ABC_CKD\new_data\unzipped_2\AURUM\STATA_files\ckd2ob_observation_`c'.dta"


format medcodeid %20.0g


/*merge using lipid_disorders codelist from Laura*/
merge m:1 medcodeid using  "Z:\Group_work\ABC_CKD\Code_Lists\lipid_disorders.dta"

gen lipid_disorders=1 if _merge==3


sort patid obsdate

keep if lipid_disorders==1
by patid: gen lipid_disorders_n=_n if lipid_disorders==1
by patid: gen lipid_disorders_N=_N if lipid_disorders==1


count if lipid_disorders_N==1

gsort patid obsdate
egen keepme=tag(patid)

keep if keepme==1

rename medcodeid lipid_disorders_medcodeid
rename readterm lipid_disorders_desc
rename obsdate lipid_disorders_diagnosis_date


label variable lipid_disorders "has 1 or more lipid_disorders medcodes"
label variable lipid_disorders_medcodeid "medcodeid first lipid_disorders code"
label variable lipid_disorders_desc "desc of first lipid_disorders medcode"
label variable lipid_disorders_diagnosis_date "date of first record lipid_disorders"
label variable  lipid_disorders_N "number of lipid_disorders codes"

keep patid lipid_disorders lipid_disorders_medcodeid lipid_disorders_desc lipid_disorders_diagnosis_date lipid_disorders_N

count

merge 1:1 patid using "Z:\Group_work\ABC_CKD\new_data\unzipped_2\AURUM\STATA_files\abc_ckd_cohort_all.dta"

drop _merge
save "Z:\Group_work\ABC_CKD\new_data\unzipped_2\AURUM\STATA_files\abc_ckd_cohort_all.dta", replace

}