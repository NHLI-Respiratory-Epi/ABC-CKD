/*Extract fev1_percent_pred % predicted measurement - most recent record prior to Jan2017 - in past 5 years*/
/*Do file author Sarah*/
/*creation date 21/06/2022*/
clear 
set more off

forvalues f=1/150 {
	local c=string(`f',"%03.0f") /*converting number f to 3 digit string so we get the correct number of preceeding zeros */


use "Z:\Group_work\ABC_CKD\new_data\unzipped_2\AURUM\STATA_files\ckd2ob_observation_`c'.dta"


format medcodeid %20.0g


/*merge using fev1_percent_pred % predicted codelist*/
merge m:1 medcodeid using  "Z:\Group_work\ABC_CKD\Code_Lists\spirometry_test.dta"
drop _merge



keep if fev1_percent_pred==1 

/*keep the most recent fev1_percent_pred % predicted measurement from the past 5 years prior to Jan 2017*/
replace fev1_percent_pred=. if obsdate>td(01jan2017)
replace fev1_percent_pred=. if obsdate<td(01jan2012)

keep if fev1_percent_pred==1 

sort patid -obsdate

egen keepme=tag(patid)

keep if keepme==1

keep patid medcodeid value numunitid obsdate term
rename medcodeid fev1_percent_pred_medcodeid
rename value fev1_percent_pred_value
rename  numunitid fev1_percent_pred_unit
rename obsdate fev1_percent_pred_date
rename term fev1_percent_pred_desc

label variable fev1_percent_pred_value "fev1_percent_pred - most recent measure in past 5 years prior to Jan 2017"



merge 1:1 patid using "Z:\Group_work\ABC_CKD\new_data\unzipped_2\AURUM\STATA_files\abc_ckd_cohort_all.dta"

drop _merge
save "Z:\Group_work\ABC_CKD\new_data\unzipped_2\AURUM\STATA_files\abc_ckd_cohort_all.dta", replace

}


