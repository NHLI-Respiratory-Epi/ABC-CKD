/*Do file for creating weight as recorded before Jan 2017*/
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


/*keep most recent height values at start of study 1st Jan 2017*/
gen weight_1=value

replace weight_1=. if obsdate>td(01jan2017)

drop if weight_1==.

gsort patid -obsdate
egen keepme=tag(patid)

keep if keepme==1


keep patid obsdate medcodeid numunitid obstypeid numrangelow numrangehigh weight_1
rename obsdate weight_measurement_date
rename medcodeid weight_measurement_code
rename numunitid units_weight
rename obstypeid obstypeid_weight
rename numrangelow numrangelow_weight
rename numrangehigh numrangehigh_weight
 

label variable weight_1 "most recent valid weight measurement prior to 1st Jan 2017"

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

replace weight_1=weight_1*6.35029318 if (units_weight==2318 | units_weight==3381)
*0 changes

replace weight_1=. if (units_weight==41 | units_weight==122 | units_weight==160 | units_weight==292 | units_weight==432 | units_weight==6265)
*13 changes


replace weight_1=. if weight_1<30
*1431 changes

replace weight_1=. if weight_1>300
*166 changes