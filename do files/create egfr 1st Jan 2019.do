/*Do file author Sarah Cook*/
/*creation date 18/05/21*/
clear

/*Do file for extracting serum creatinine and calculating egfr at  5th time point 1st Jan 2019*/

forvalues f=1/150 {
	local c=string(`f',"%03.0f") /*converting number f to 3 digit string so we get the correct number of preceeding zeros */

use "Z:\Group_work\ABC_CKD\new_data\unzipped_2\AURUM\STATA_files\ckd2ob_observation_`c'.dta"


format medcodeid %20.0g

/*keep records with observations "serum creatinine NOS", "serum creatinine" or "corrected serum creatinine" */
/* "creatinine level" medcodeid*/ 

keep if (medcodeid==259054018 | medcodeid==380389013 | medcodeid==457927010 | medcodeid==977071000006116)

tab numunitid




/*using most recent serum creatinine measurement in the past 24 months therefore remove measurements before 24 months of the study period 1st July 2018 */

drop if obsdate<td(01jan2015)


/*keep most recent serum creatinine record at study period 1st Jan 2019*/
gen serum_creatine_5=value

replace serum_creatine_5=. if obsdate>td(01jan2019)

/*exclude values with incorrect unit
UNIT 13102 = ??mmol/L
UNIT 332 - mmol
UNIT 18265=mcmcl/L*/
*UNIT 202=ml/min*/

replace serum_creatine_5=. if numunitid==13102
replace serum_creatine_5=. if numunitid==332
replace serum_creatine_5=. if numunitid==186
replace serum_creatine_5=. if numunitid==18265
replace serum_creatine_5=. if numunitid==156
replace serum_creatine_5=. if numunitid==216
replace serum_creatine_5=. if numunitid==4553
replace serum_creatine_5=. if numunitid==11254
replace serum_creatine_5=. if numunitid==256
replace serum_creatine_5=. if numunitid==816
replace serum_creatine_5=. if numunitid==202
replace serum_creatine_5=. if numunitid==421

/*4 values coded as missing*/




drop if serum_creatine_5==.

gsort patid -obsdate
egen keepme=tag(patid)

keep if keepme==1


keep patid obsdate medcodeid value numunitid obstypeid numrangelow numrangehigh serum_creatine_5
rename obsdate creatinine_measurement_date_5
rename medcodeid creatinine_measurement_code_5
rename value serum_creatinine_5
rename numunitid units_sCr_5
rename obstypeid obstypeid_cr_5
rename numrangelow numrangelow_sCR_5
rename numrangehigh numrangehigh_sCR_5
 

label variable serum_creatine_5 "most recent valid serum creatinine measurement prior to 1st Jan 2019"

merge 1:1 patid using "Z:\Group_work\ABC_CKD\new_data\unzipped_2\AURUM\STATA_files\abc_ckd_cohort_all.dta"

drop _merge
save "Z:\Group_work\ABC_CKD\new_data\unzipped_2\AURUM\STATA_files\abc_ckd_cohort_all.dta", replace

}

/*remove duplicate Patids keeping most recent measurement*/
drop keepme
sort patid -creatinine_measurement_date_5
egen keepme=tag(patid)
keep if keepme==1

/*Moved higher to select only valid measurements initially*
/*exclude values with incorrect unit
UNIT 13102 = ??mmol/L
UNIT 332 - mmol*/

replace serum_creatine_5=. if units_sCr==13102
replace serum_creatine_5=. if units_sCr==332
replace serum_creatine_5=. if units_sCr==186

/*4 values coded as missing*/
*/

/*convert to mg/DL for all values*/
*176= micromol/l
*186 =mg/mmol
*191 = micromol/l
*197=micromol/l
*218 = mmol/L
*285 = micromol/L 
*17491=umol/L
*18265=mcmcl/L
*138=g/dl
*139=g/L
*229= mu/L
*256=pmol/l

replace serum_creatine_5=(serum_creatine_5/88.4) if (units_sCr_5==176 | units_sCr_5==191 | units_sCr_5==285 |units_sCr_5==17491 | units_sCr_5==197)

replace serum_creatine_5=(serum_creatine_5/0.0884) if (units_sCr_5==218)

replace serum_creatine_5=(serum_creatine_5*100) if units_sCr_5==139

sum serum_creatine_5

/*exclude implausible values - cannot do earlier as do not know all units which may be picked up*/
/*using values from prog_getSCr do file converted to mg/dl*/
replace serum_creatine_5=.c if serum_creatine_5>34 /*147,403*/
replace serum_creatine_5=.c if serum_creatine_5<0.2 /*114*/


/*generate age at serum creatinine measurement*/

generate eventyr_5 = year(creatinine_measurement_date_5)
	count if eventyr_5==yob /*0*/
	drop if eventyr_5==yob // drop if test result is in the same year as patient born

	* make an age at event
	gen ageAtEvent_5=0
	replace ageAtEvent_5=eventyr_5 - yob - 1 if creatinine_measurement_date_5<mdy(07,01,eventyr_5) // round down if eventdate in first half of year
	replace ageAtEvent_5=eventyr_5 - yob if creatinine_measurement_date_5>=mdy(07,01,eventyr_5)	


/*estimate egfr_5 from CKD EPI equation*/
/**************************************************************************
	#B4. Calculate egfr_5
	**************************************************************************/
	* calculate egfr_5 using ckd-epi
	* first multiply by 0.95 (for assay - fudge factor) 
	* DN "fudge factor"
	gen SCr_adj_5=(serum_creatine_5*0.95)

	gen min_5=.
	replace min_5=SCr_adj_5/0.7 if gender==2
	replace min_5=SCr_adj_5/0.9 if gender==1
	replace min_5=min_5^-0.329 if gender==2
	replace min_5=min_5^-0.411 if gender==1
	replace min_5=1 if min_5<1

	gen max_5=.
	replace max_5=SCr_adj_5/0.7 if gender==2
	replace max_5=SCr_adj_5/0.9 if gender==1
	replace max_5=max_5^-1.209
	replace max_5=1 if max_5>1

	gen egfr_5=min_5*max_5*141
	replace egfr_5=egfr_5*(0.993^ageAtEvent_5)
	replace egfr_5=egfr_5*1.018 if gender==2
	label var egfr_5 "egfr_5 calculated using CKD-EPI formula with no eth + fudge"
	
	* categorise into ckd stages
	egen egfr_5_cat= cut(egfr_5), at(0, 15, 30, 45, 60, 5000)
	label define egfr_5 0"stage 5" 15"stage 4" 30"stage 3b" 45"stage 3a" 60"no CKD"
	label values egfr_5_cat egfr_5
	label var egfr_5_cat "egfr_5 category calc without eth + DN fudge factor"
	
	* * recode with appropriate category as reference
	recode egfr_5_cat 0=5 15=4 30=3 45=2 60=0, generate(ckd_5)
	label define ckd_5 0"no CKD" 2"stage 3a" 3"stage 3b" 4"stage 4" 5"stage 5"
	label values ckd_5 ckd_5
	label var ckd_5 "CKD stage calc without eth + DN fudge factor"
	
		* categorise into KIDGO ckd stages
	egen egfr_kidgo_5= cut(egfr_5), at(0, 15, 30, 45, 60, 90, 5000)
	label define egfr_kidgo_5 0"stage 5" 15"stage 4" 30"stage 3b" 45"stage 3a" 60"stage 2" 90"stage 1"
	label values egfr_kidgo_5 egfr_kidgo_5
	label var egfr_kidgo_5 "egfr_4 category calc without eth + DN fudge factor"
	
	gen egfr_bin_5=0 if egfr_5>=60 & egfr_5<.
	replace egfr_bin_5=1 if egfr_5<60
	
	
				* categorise into ckd stages breaking up stage 4 15-25 25-29
	egen egfr_cat_25_5= cut(egfr_5), at(0, 15, 25 30, 45, 60, 5000)
	label values egfr_cat_25_5 EGFR_25
	label var egfr_cat_25_5 "eGFR category calc without eth + DN fudge factor_ stage 4 broken down"
	
	save "Z:\Group_work\ABC_CKD\new_data\unzipped_2\AURUM\STATA_files\abc_ckd_cohort_all.dta", replace