/*Do file for creating height as recorded before Jan 2017*/
/*Do file author Sarah Cook*/
/*creation date 21/10/21*/
/*Do file for use in ABC CKD project*/
/*Database CPRD AURUM*/


clear


forvalues f=1/150 {
	local c=string(`f',"%03.0f") /*converting number f to 3 digit string so we get the correct number of preceeding zeros */

use "Z:\Group_work\ABC_CKD\new_data\unzipped_2\AURUM\STATA_files\ckd2ob_observation_`c'.dta"


format medcodeid %20.0g

/*keep records with observations "height"*/ 

keep if (medcodeid==1910921000006114 | medcodeid==1910931000006112 |medcodeid==253676017 | medcodeid==5256151000006111 | medcodeid==923831000006115 | medcodeid==253669010 )

tab numunitid


/*keep most recent height values at start of study 1st Jan 2017*/
gen height_1=value

replace height_1=. if obsdate>td(01jan2017)

drop if height_1==.

gsort patid -obsdate
egen keepme=tag(patid)

keep if keepme==1


keep patid obsdate medcodeid numunitid obstypeid numrangelow numrangehigh height_1
rename obsdate height_measurement_date
rename medcodeid height_measurement_code
rename numunitid units_height
rename obstypeid obstypeid_height
rename numrangelow numrangelow_height
rename numrangehigh numrangehigh_height
 

label variable height_1 "most recent valid height measurement prior to 1st Jan 2017"

merge 1:1 patid using "Z:\Group_work\ABC_CKD\new_data\unzipped_2\AURUM\STATA_files\abc_ckd_cohort_all.dta"

drop _merge
save "Z:\Group_work\ABC_CKD\new_data\unzipped_2\AURUM\STATA_files\abc_ckd_cohort_all.dta", replace

}


/*units 
122=cm
156=kg
173=m
209=mm
408=cms
432=metres
*/

/*convert cm to m*/
replace height_1=height_1/100 if (units_height==122 | units_height==408)

/*replace kg/mm as missing*/
replace height_1 =. if (units_height==156 | units_height==209)

/* replace missing if height<0.5m or height>3m*/
replace height_1=.  if height_1<1 | height_1>3