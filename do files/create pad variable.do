/*Create codes to indicate Peripheral artery disease*/
/*Do file author Sarah*/
/*creation date 05/11/21*/
clear

forvalues f=1/150 {
	local c=string(`f',"%03.0f") /*converting number f to 3 digit string so we get the correct number of preceeding zeros */


use "Z:\Group_work\ABC_CKD\new_data\unzipped_2\AURUM\STATA_files\ckd2ob_observation_`c'.dta"


format medcodeid %20.0g


/*merge using pad codes from Laura*/
merge m:1 medcodeid using  "Z:\Group_work\ABC_CKD\Code_Lists\pad.dta"

gen pad=1 if _merge==3


sort patid obsdate

keep if pad==1
by patid: gen pad_n=_n if pad==1
by patid: gen pad_N=_N if pad==1


count if pad_N==1

gsort patid obsdate
egen keepme=tag(patid)

keep if keepme==1

rename medcodeid pad_medcodeid
rename desc pad_desc
rename obsdate pad_diagnosis_date


label variable pad "has 1 or more pad medcodes"
label variable pad_medcodeid "medcodeid first pad code"
label variable pad_desc "desc of first pad medcode"
label variable pad_diagnosis_date "date of first record pad"
label variable  pad_N "number of pad codes"

keep patid pad pad_medcodeid pad_desc pad_diagnosis_date pad_N

merge 1:1 patid using "Z:\Group_work\ABC_CKD\new_data\unzipped_2\AURUM\STATA_files\abc_ckd_cohort_all.dta"

drop _merge
save "Z:\Group_work\ABC_CKD\new_data\unzipped_2\AURUM\STATA_files\abc_ckd_cohort_all.dta", replace

}