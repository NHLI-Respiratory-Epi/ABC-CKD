/*Do file author Sarah Cook*/
/*creation date 13/05/21*/

/*Do file for extracting serum creatinine and calculating egfr at  2nd time point 1st July 2017*/

forvalues f=1/150 {
	local c=string(`f',"%03.0f") /*converting number f to 3 digit string so we get the correct number of preceeding zeros */

use "Z:\Group_work\ABC_CKD\new_data\unzipped_2\AURUM\STATA_files\ckd2ob_observation_`c'.dta"


format medcodeid %20.0g

/*keep records with observations "serum creatinine NOS", "serum creatinine" or "corrected serum creatinine" */
/* "creatinine level" medcodeid*/ 

keep if (medcodeid==259054018 | medcodeid==380389013 | medcodeid==457927010 | medcodeid==977071000006116)

tab numunitid




/*using most recent serum creatinine measurement in the past 24 months therefore remove measurements before 24 months of the study period 1st Jan 2017 */

drop if obsdate<td(01jan2015)


/*keep most recent serum creatinine record at study period 1st July 2017*/
gen serum_creatine_2=value

replace serum_creatine_2=. if obsdate>td(01july2017)

/*exclude values with incorrect unit
UNIT 13102 = ??mmol/L
UNIT 332 - mmol
UNIT 18265=mcmcl/L*/

replace serum_creatine_2=. if numunitid==13102
replace serum_creatine_2=. if numunitid==332
replace serum_creatine_2=. if numunitid==186
replace serum_creatine_2=. if numunitid==18265

/*4 values coded as missing*/




drop if serum_creatine_2==.

gsort patid -obsdate
egen keepme=tag(patid)

keep if keepme==1


keep patid obsdate medcodeid value numunitid obstypeid numrangelow numrangehigh serum_creatine_2
rename obsdate creatinine_measurement_date_2
rename medcodeid creatinine_measurement_code_2
rename value serum_creatinine_2
rename numunitid units_sCr_2
rename obstypeid obstypeid_cr_2
rename numrangelow numrangelow_sCR_2
rename numrangehigh numrangehigh_sCR_2
 

label variable serum_creatine_2 "most recent valid serum creatinine measurement prior to 1st July 2017"

merge 1:1 patid using "Z:\Group_work\ABC_CKD\new_data\unzipped_2\AURUM\STATA_files\abc_ckd_cohort_all.dta"

drop _merge
save "Z:\Group_work\ABC_CKD\new_data\unzipped_2\AURUM\STATA_files\abc_ckd_cohort_all.dta", replace

}



/*remove duplicate Patids keeping most recent measurement*/
drop keepme
sort patid -creatinine_measurement_date_2
egen keepme=tag(patid)
keep if keepme==1

/*Moved higher to select only valid measurements initially*
/*exclude values with incorrect unit
UNIT 13102 = ??mmol/L
UNIT 332 - mmol*/

replace serum_creatine_2=. if units_sCr==13102
replace serum_creatine_2=. if units_sCr==332
replace serum_creatine_2=. if units_sCr==186

/*4 values coded as missing*/
*/

/*convert to mg/DL for all values*/
*176= micromol/l
*186 =mg/mmol
*191 = micromol/l
*218 = mmol/L
*285 = micromol/L 
*17491=umol/L
*18265=mcmcl/L

replace serum_creatine_2=(serum_creatine_2/88.4) if (units_sCr_2==176 | units_sCr_2==191 | units_sCr_2==285 |units_sCr_2==17491)

replace serum_creatine_2=(serum_creatine_2/0.0884) if (units_sCr_2==218)

sum serum_creatine_2

/*exclude implausible values - cannot do earlier as do not know all units which may be picked up*/
/*using values from prog_getSCr do file converted to mg/dl*/
replace serum_creatine_2=.c if serum_creatine_2>34 /*147,403*/
replace serum_creatine_2=.c if serum_creatine_2<0.2 /*114*/


/*generate age at serum creatinine measurement*/

generate eventyr_2 = year(creatinine_measurement_date_2)
	count if eventyr_2==yob /*0*/
	drop if eventyr_2==yob // drop if test result is in the same year as patient born

	* make an age at event
	gen ageAtEvent_2=0
	replace ageAtEvent_2=eventyr_2 - yob - 1 if creatinine_measurement_date_2<mdy(07,01,eventyr_2) // round down if eventdate in first half of year
	replace ageAtEvent_2=eventyr_2 - yob if creatinine_measurement_date_2>=mdy(07,01,eventyr_2)	


/*estimate egfr_2 from CKD EPI equation*/
/**************************************************************************
	#B4. Calculate egfr_2
	**************************************************************************/
	* calculate egfr_2 using ckd-epi
	* first multiply by 0.95 (for assay - fudge factor) 
	* DN "fudge factor"
	gen SCr_adj_2=(serum_creatine_2*0.95)

	gen min_2=.
	replace min_2=SCr_adj_2/0.7 if gender==2
	replace min_2=SCr_adj_2/0.9 if gender==1
	replace min_2=min_2^-0.329 if gender==2
	replace min_2=min_2^-0.411 if gender==1
	replace min_2=1 if min_2<1

	gen max_2=.
	replace max_2=SCr_adj_2/0.7 if gender==2
	replace max_2=SCr_adj_2/0.9 if gender==1
	replace max_2=max_2^-1.209
	replace max_2=1 if max_2>1

	gen egfr_2=min_2*max_2*141
	replace egfr_2=egfr_2*(0.993^ageAtEvent_2)
	replace egfr_2=egfr_2*1.018 if gender==2
	label var egfr_2 "egfr_2 calculated using CKD-EPI formula with no eth + fudge"
	
	* categorise into ckd stages
	egen egfr_2_cat= cut(egfr_2), at(0, 15, 30, 45, 60, 5000)
	label define egfr_2 0"stage 5" 15"stage 4" 30"stage 3b" 45"stage 3a" 60"no CKD"
	label values egfr_2_cat egfr_2
	label var egfr_2_cat "egfr_2 category calc without eth + DN fudge factor"
	
	
		* categorise into KIDGO ckd stages
	egen egfr_kidgo_2= cut(egfr_2), at(0, 15, 30, 45, 60, 90, 5000)
	label define egfr_kidgo 0"stage 5" 15"stage 4" 30"stage 3b" 45"stage 3a" 60"stage 2" 90"stage 1"
	label values egfr_kidgo_2 egfr_kidgo
	label var egfr_kidgo_2 "egfr_2 category calc without eth + DN fudge factor"
	
	* * recode with appropriate category as reference
	recode egfr_2_cat 0=5 15=4 30=3 45=2 60=0, generate(ckd_2)
	label define ckd_2 0"no CKD" 2"stage 3a" 3"stage 3b" 4"stage 4" 5"stage 5"
	label values ckd_2 ckd_2
	label var ckd_2 "CKD stage calc without eth + DN fudge factor"

	gen egfr_bin_2=0 if egfr_2>=60 & egfr_2<.
	replace egfr_bin_2=1 if egfr_2<60

	
		
		* categorise into ckd stages breaking up stage 4 15-25 25-29
	egen egfr_cat_25_2= cut(egfr_2), at(0, 15, 25 30, 45, 60, 5000)
	label values egfr_cat_25_2 EGFR_25
	label var egfr_cat_25_2 "eGFR category calc without eth + DN fudge factor_ stage 4 broken down"
	
	
	save"Z:\Group_work\ABC_CKD\new_data\unzipped_2\AURUM\STATA_files\abc_ckd_cohort_all.dta", replace