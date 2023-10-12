/*Do file author Sarah Cook*/
/*creation date 18/05/21*/
clear

/*Do file for extracting serum creatinine and calculating egfr at  4th time point 1st July 2019*/

forvalues f=1/150 {
	local c=string(`f',"%03.0f") /*converting number f to 3 digit string so we get the correct number of preceeding zeros */

use "Z:\Group_work\ABC_CKD\new_data\unzipped_2\AURUM\STATA_files\ckd2ob_observation_`c'.dta"


format medcodeid %20.0g

/*keep records with observations "serum creatinine NOS", "serum creatinine" or "corrected serum creatinine" */
/*query to include "creatinine level" medcodeid*/ 

keep if (medcodeid==259054018 | medcodeid==380389013 | medcodeid==457927010 | medcodeid==977071000006116)

tab numunitid




/*using most recent serum creatinine measurement in the past 24 months therefore remove measurements before 24 months of the study period 1st July 2018 */

drop if obsdate<td(01jan2015)


/*keep most recent serum creatinine record at study period 1st July 2019*/
gen serum_creatine_6=value

replace serum_creatine_6=. if obsdate>td(01july2019)

/*exclude values with incorrect unit
UNIT 13102 = ??mmol/L
UNIT 332 - mmol
UNIT 18265=mcmcl/L*/

replace serum_creatine_6=. if numunitid==13102
replace serum_creatine_6=. if numunitid==332
replace serum_creatine_6=. if numunitid==186
replace serum_creatine_6=. if numunitid==18265
replace serum_creatine_6=. if numunitid==421
replace serum_creatine_6=. if numunitid==156
replace serum_creatine_6=. if numunitid==4553
replace serum_creatine_6=. if numunitid==11254
replace serum_creatine_6=. if numunitid==256
replace serum_creatine_6=. if numunitid==816
replace serum_creatine_6=. if numunitid==202

/*4 values coded as missing*/




drop if serum_creatine_6==.

gsort patid -obsdate
egen keepme=tag(patid)

keep if keepme==1


keep patid obsdate medcodeid value numunitid obstypeid numrangelow numrangehigh serum_creatine_6
rename obsdate creatinine_measurement_date_6
rename medcodeid creatinine_measurement_code_6
rename value serum_creatinine_6
rename numunitid units_sCr_6
rename obstypeid obstypeid_cr_6
rename numrangelow numrangelow_sCR_6
rename numrangehigh numrangehigh_sCR_6
 

label variable serum_creatine_6 "most recent valid serum creatinine measurement prior to 1st July 2019"

merge 1:1 patid using "Z:\Group_work\ABC_CKD\new_data\unzipped_2\AURUM\STATA_files\abc_ckd_cohort_all.dta"

drop _merge
save "Z:\Group_work\ABC_CKD\new_data\unzipped_2\AURUM\STATA_files\abc_ckd_cohort_all.dta", replace

}

/*remove duplicate Patids keeping most recent measurement*/
drop keepme
sort patid -creatinine_measurement_date_6
egen keepme=tag(patid)
keep if keepme==1

/*Moved higher to select only valid measurements initially*
/*exclude values with incorrect unit
UNIT 13102 = ??mmol/L
UNIT 332 - mmol*/

replace serum_creatine_6=. if units_sCr==13102
replace serum_creatine_6=. if units_sCr==332
replace serum_creatine_6=. if units_sCr==186

/*4 values coded as missing*/
*/

/*convert to mg/DL for all values*/
*176= micromol/l
*182 MG/DL - no conversion
*186 =mg/mmol
*191 = micromol/l
*197= micromol/l
*218 = mmol/L
*285 = micromol/L 
*17491=umol/L
*18265=mcmcl/L
*229=mu/L
*235= nanomol/L

replace serum_creatine_6=(serum_creatine_6/88.4) if (units_sCr_6==176 | units_sCr_6==191 | units_sCr_6==285 |units_sCr_6==17491 | units_sCr_6==197)

replace serum_creatine_6=(serum_creatine_6/0.0884) if (units_sCr_6==218)

replace serum_creatine_6=(serum_creatine_6*100) if units_sCr_6==139

sum serum_creatine_6

/*exclude implausible values - cannot do earlier as do not know all units which may be picked up*/
/*using values from prog_getSCr do file converted to mg/dl*/
replace serum_creatine_6=.c if serum_creatine_6>34 /*147,403*/
replace serum_creatine_6=.c if serum_creatine_6<0.2 /*114*/


/*generate age at serum creatinine measurement*/

generate eventyr_6 = year(creatinine_measurement_date_6)
	count if eventyr_6==yob /*0*/
	drop if eventyr_6==yob // drop if test result is in the same year as patient born

	* make an age at event
	gen ageAtEvent_6=0
	replace ageAtEvent_6=eventyr_6 - yob - 1 if creatinine_measurement_date_6<mdy(07,01,eventyr_6) // round down if eventdate in first half of year
	replace ageAtEvent_6=eventyr_6 - yob if creatinine_measurement_date_6>=mdy(07,01,eventyr_6)	


/*estimate egfr_6 from CKD EPI equation*/
/**************************************************************************
	#B4. Calculate egfr_6
	**************************************************************************/
	* calculate egfr_6 using ckd-epi
	* first multiply by 0.95 (for assay - fudge factor) 
	* DN "fudge factor"
	gen SCr_adj_6=(serum_creatine_6*0.95)

	gen min_6=.
	replace min_6=SCr_adj_6/0.7 if gender==2
	replace min_6=SCr_adj_6/0.9 if gender==1
	replace min_6=min_6^-0.329 if gender==2
	replace min_6=min_6^-0.411 if gender==1
	replace min_6=1 if min_6<1

	gen max_6=.
	replace max_6=SCr_adj_6/0.7 if gender==2
	replace max_6=SCr_adj_6/0.9 if gender==1
	replace max_6=max_6^-1.209
	replace max_6=1 if max_6>1

	gen egfr_6=min_6*max_6*141
	replace egfr_6=egfr_6*(0.993^ageAtEvent_6)
	replace egfr_6=egfr_6*1.018 if gender==2
	label var egfr_6 "egfr_6 calculated using CKD-EPI formula with no eth + fudge"
	
	* categorise into ckd stages
	egen egfr_6_cat= cut(egfr_6), at(0, 15, 30, 45, 60, 5000)
	label define egfr_6 0"stage 5" 15"stage 4" 30"stage 3b" 45"stage 3a" 60"no CKD"
	label values egfr_6_cat egfr_6
	label var egfr_6_cat "egfr_6 category calc without eth + DN fudge factor"
	
	* * recode with appropriate category as reference
	recode egfr_6_cat 0=5 15=4 30=3 45=2 60=0, generate(ckd_6)
	label define ckd_6 0"no CKD" 2"stage 3a" 3"stage 3b" 4"stage 4" 5"stage 5"
	label values ckd_6 ckd_6
	label var ckd_6 "CKD stage calc without eth + DN fudge factor"
	
	gen egfr_bin_6=0 if egfr_6>=60 & egfr_6<.
	replace egfr_bin_6=1 if egfr_6<60
	
	
					* categorise into ckd stages breaking up stage 4 15-25 25-29
	egen egfr_cat_25_6= cut(egfr_6), at(0, 15, 25 30, 45, 60, 5000)
	label values egfr_cat_25_6 EGFR_25
	label var egfr_cat_25_6 "eGFR category calc without eth + DN fudge factor_ stage 4 broken down"