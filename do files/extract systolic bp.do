/*Do file for creating Systolic blood pressure as recorded before Jan 2017*/
/*Do file author Sarah Cook*/
/*creation date 29/10/21*/
/*Do file for use in ABC CKD project*/
/*Database CPRD AURUM*/


clear


forvalues f=1/150 {
	local c=string(`f',"%03.0f") /*converting number f to 3 digit string so we get the correct number of preceeding zeros */

use "Z:\Group_work\ABC_CKD\new_data\unzipped_2\AURUM\STATA_files\ckd2ob_observation_`c'.dta"


format medcodeid %20.0g

/*keep records with observations "sbp"*/ 

keep if (medcodeid==458803012 | medcodeid==1808011000006111 | medcodeid==1808041000006110 | medcodeid==1994021000006115 | medcodeid==2418961000000111 | medcodeid==1928511000006116| medcodeid==2533615017 | medcodeid==3676271000006117 |medcodeid==2159155011 | medcodeid==114311000006111)

tab numunitid


/*keep most recent SBP values at start of study 1st Jan 2017*/
gen sbp_1=value

replace sbp_1=. if obsdate>td(01jan2017)

drop if sbp_1==.

gsort patid -obsdate
egen keepme=tag(patid)

keep if keepme==1


keep patid obsdate medcodeid numunitid obstypeid numrangelow numrangehigh sbp_1
rename obsdate sbp_measurement_date
rename medcodeid sbp_measurement_code
rename numunitid units_sbp
rename obstypeid obstypeid_sbp
rename numrangelow numrangelow_sbp
rename numrangehigh numrangehigh_sbp
 

label variable sbp_1 "most recent valid sbp measurement prior to 1st Jan 2017"

merge 1:1 patid using "Z:\Group_work\ABC_CKD\new_data\unzipped_2\AURUM\STATA_files\abc_ckd_cohort_all.dta"

drop _merge
save "Z:\Group_work\ABC_CKD\new_data\unzipped_2\AURUM\STATA_files\abc_ckd_cohort_all.dta", replace

}

tab units_sbp

/*
210= mm Hg
212= mm/Hg
215=mm [Hg]
216=mmHG
1207=systolic
2391=mm hh
2953=mol/litre
3759=BP
*/

/*replace as missing if wrong unit*/
replace sbp_1=. if units_sbp==2953 
*9 changes made

/*replace as missing if in implausible range >300 or <30*/
replace sbp_1=. if sbp_1>300
*36 changes

replace sbp_1=. if sbp_1<30
*44 changes

/*replace if measurement date before 1st  July 2015*/
replace sbp_1=. if sbp_measurement_date<td(01july2015)
