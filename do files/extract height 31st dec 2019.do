/*Do file for creating height as recorded before 31st Dec 2019*/
/*Do file author Sarah Cook*/
/*creation date 25/10/21*/
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


/*keep most recent height values at start of study 31st Dec 2019*/
gen height_7=value

replace height_7=. if obsdate>td(31dec2019)

drop if height_7==.

gsort patid -obsdate
egen keepme=tag(patid)

keep if keepme==1


keep patid obsdate medcodeid numunitid obstypeid numrangelow numrangehigh height_7
rename obsdate height_measurement_date_7
rename medcodeid height_measurement_code_7
rename numunitid units_height_7
rename obstypeid obstypeid_height_7
rename numrangelow numrangelow_height_7
rename numrangehigh numrangehigh_height_7
 

label variable height_7 "most recent valid height measurement prior to 31st Dec 2019"

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
2101=32
*/

/*convert cm to m*/
replace height_7=height_7/100 if (units_height_7==122 | units_height_7==408)

/*replace kg/mm as missing*/
replace height_7 =. if (units_height_7==156 | units_height_7==209 | units_height_7==2101)

/* replace missing if height<0.5m or height>3m*/
replace height_7=.  if height_7<1 | height_7>3

