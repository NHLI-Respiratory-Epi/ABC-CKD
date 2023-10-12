/*Create codes to indicate  alcohol_intake*/
/*Do file author Sarah*/
/*creation date 21/02/21*/
forvalues f=1/150 {
	local c=string(`f',"%03.0f") /*converting number f to 3 digit string so we get the correct number of preceeding zeros */


use "Z:\Group_work\ABC_CKD\new_data\unzipped_2\AURUM\STATA_files\ckd2ob_observation_`c'.dta"


format medcodeid %20.0g


/*merge using alcohol_intake codelist from Laura*/
merge m:1 medcodeid using  "Z:\Group_work\ABC_CKD\Code_Lists\alcohol_intake.dta"

gen alcohol_intake=1 if _merge==3


sort patid obsdate

keep if alcohol_intake==1
by patid: gen alcohol_intake_n=_n if alcohol_intake==1
by patid: gen alcohol_intake_N=_N if alcohol_intake==1


count if alcohol_intake_N==1

gsort patid -obsdate
egen keepme=tag(patid)

keep if keepme==1

rename medcodeid alcohol_intake_medcodeid
rename readterm alcohol_intake_desc
rename obsdate alcohol_intake_diagnosis_date


label variable alcohol_intake "has 1 or more alcohol_intake medcodes"
label variable alcohol_intake_medcodeid "medcodeid most recent alcohol_intake code"
label variable alcohol_intake_desc "desc of first alcohol_intake medcode"
label variable alcohol_intake_diagnosis_date "date of most recent record alcohol_intake"
label variable  alcohol_intake_N "number of alcohol_intake codes"

keep patid alcohol_intake alcohol_intake_medcodeid alcohol_intake_desc alcohol_intake_diagnosis_date alcohol_intake_N alcohol_status alcohol_level

count

merge 1:1 patid using "Z:\Group_work\ABC_CKD\new_data\unzipped_2\AURUM\STATA_files\abc_ckd_cohort_all.dta"

drop _merge
save "Z:\Group_work\ABC_CKD\new_data\unzipped_2\AURUM\STATA_files\abc_ckd_cohort_all.dta", replace

}