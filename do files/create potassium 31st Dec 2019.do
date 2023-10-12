/*Do file for extracting serum potassium 31 dec 2019*/
/*Do file author Sarah Cook*/
/*creation date 10/09/21*/
/*Do file for use in ABC CKD project*/
/*Database CPRD AURUM*/


clear


forvalues f=1/150 {
	local c=string(`f',"%03.0f") /*converting number f to 3 digit string so we get the correct number of preceeding zeros */

use "Z:\Group_work\ABC_CKD\new_data\unzipped_2\AURUM\STATA_files\ckd2ob_observation_`c'.dta"


format medcodeid %20.0g

/*keep records with observations "potassium K"*/ 

keep if (medcodeid==3937991000006112 | medcodeid==3937981000006114 | medcodeid==122321000033115 | medcodeid==1209521000033110 | medcodeid==977091000006115 | medcodeid==456186013 | medcodeid==144821000006115)

tab numunitid


/*keep most recent serum potassium record on start of study 31st Dec 2019*/
gen serum_potassium_7=value

replace serum_potassium_7=. if obsdate>td(31dec2019)




drop if serum_potassium_7==.

gsort patid -obsdate
egen keepme=tag(patid)

keep if keepme==1


keep patid obsdate medcodeid numunitid obstypeid numrangelow numrangehigh serum_potassium_7
rename obsdate potassium_measurement_date_7
rename medcodeid potassium_measurement_code_7
rename numunitid units_K_7
rename obstypeid obstypeid_K_7
rename numrangelow numrangelow_K_7
rename numrangehigh numrangehigh_K_7
 

label variable serum_potassium_7 "most recent valid serum potassium measurement prior to 31st Dec 2019"

merge 1:1 patid using "Z:\Group_work\ABC_CKD\new_data\unzipped_2\AURUM\STATA_files\abc_ckd_cohort_all.dta"

drop _merge
save "Z:\Group_work\ABC_CKD\new_data\unzipped_2\AURUM\STATA_files\abc_ckd_cohort_all.dta", replace

}

/*remove duplicate Patids keeping most recent measurement
drop keepme
sort patid -potassium_measurement_date_7
egen keepme=tag(patid)
keep if keepme==1
*/

/*Units 
218=mmol/L
283=mg/L
235= nmol/L
285=micromol/L
425=mEq/L (=1 mmol/L)
431= x10^9
1145=mmolL
1155=unknown
*/

/*replace as missing if unit not mmol/L*/
replace serum_potassium_7=. if units_K==235
replace serum_potassium_7=. if units_K==283
replace serum_potassium_7=. if units_K==431
replace serum_potassium_7=. if units_K==1155

/*replace if measurement date before 31st June 2018*/
replace serum_potassium_7=. if potassium_measurement_date_7<td(30jun2018)

/*gen hyperkalemia as categorical measurement*/
gen potassium_cat_7=.
replace potassium_cat_7=1 if serum_potassium_7<=5.5
replace potassium_cat_7=2 if serum_potassium_7>5.5 & serum_potassium_7<6.0
replace potassium_cat_7=3 if serum_potassium_7>=6.0 & serum_potassium_7<.

label define potassium_cat_7 1"<=5.5" 2">5.5 <6.0" 3">6.0"
label values potassium_cat_7 potassium_cat_7

label variable potassium_cat_7 "Most recent potassium level (category) as of 31st Dec 2019 "