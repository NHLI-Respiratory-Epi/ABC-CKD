/*Do file for creating weight as recorded before 31st Dec 201*/
/*Do file author Sarah Cook*/
/*creation date 26/10/21*/
/*Do file for use in ABC CKD project*/
/*Database CPRD AURUM*/


clear


forvalues f=1/150 {
	local c=string(`f',"%03.0f") /*converting number f to 3 digit string so we get the correct number of preceeding zeros */

use "Z:\Group_work\ABC_CKD\new_data\unzipped_2\AURUM\STATA_files\ckd2ob_observation_`c'.dta"


format medcodeid %20.0g

/*keep records with observations "weight"*/ 

keep if (medcodeid==2934311000006118 | medcodeid==2934311000006116 | medcodeid==3484791000006113 | medcodeid==923851000006110 | medcodeid==253677014)

tab numunitid


/*keep most recent height values at start of study 31st Dec 2019*/
gen weight_7=value

replace weight_7=. if obsdate>td(31dec2019)

drop if weight_7==.

gsort patid -obsdate
egen keepme=tag(patid)

keep if keepme==1


keep patid obsdate medcodeid numunitid obstypeid numrangelow numrangehigh weight_7
rename obsdate weight_measurement_date_7
rename medcodeid weight_measurement_code_7
rename numunitid units_weight_7
rename obstypeid obstypeid_weight_7
rename numrangelow numrangelow_weight_7
rename numrangehigh numrangehigh_weight_7
 

label variable weight_7 "most recent valid weight measurement prior to 31st Dec 2019"

merge 1:1 patid using "Z:\Group_work\ABC_CKD\new_data\unzipped_2\AURUM\STATA_files\abc_ckd_cohort_all.dta"

drop _merge
save "Z:\Group_work\ABC_CKD\new_data\unzipped_2\AURUM\STATA_files\abc_ckd_cohort_all.dta", replace

}


/*units of weight*/
/*41=/min
122=cm
156=kg
160=l
292= Unk UoM
432= metres
827=kgs
2318=stone
3283=kilograms
3381=st
6265=decimal stones
*/

replace weight_7=weight_7*6.35029318 if (units_weight_7==2318 | units_weight_7==3381)
*4 changes

replace weight_7=. if (units_weight_7==41 | units_weight_7==122 | units_weight_7==160 | units_weight_7==292 | units_weight_7==432 | units_weight_7==6265)
*10 changes


replace weight_7=. if weight_7<30
*870 changes

replace weight_7=. if weight_7>300
*183 changes

