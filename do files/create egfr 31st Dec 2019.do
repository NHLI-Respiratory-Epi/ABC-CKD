/*Do file author Sarah Cook*/
/*creation date 18/05/21*/
clear

/*Do file for extracting serum creatinine and calculating egfr at  7th time point 31st Dec 2019*/

forvalues f=1/150 {
	local c=string(`f',"%03.0f") /*converting number f to 3 digit string so we get the correct number of preceeding zeros */

use "Z:\Group_work\ABC_CKD\new_data\unzipped_2\AURUM\STATA_files\ckd2ob_observation_`c'.dta"


format medcodeid %20.0g

/*keep records with observations "serum creatinine NOS", "serum creatinine" or "corrected serum creatinine" */
/* "creatinine level" medcodeid*/ 

keep if (medcodeid==259054018 | medcodeid==380389013 | medcodeid==457927010 | medcodeid==977071000006116)

tab numunitid




/*using most recent serum creatinine measurement in the past 24 months therefore remove measurements before 24 months of the study period 31st Dec 2019 */

drop if obsdate<td(31dec2017)


/*keep most recent serum creatinine record at study period 31st Dec 2019*/
gen serum_creatine_7=value

replace serum_creatine_7=. if obsdate>td(31dec2019)

/*exclude values with incorrect unit
UNIT 13102 = ??mmol/L
UNIT 332 - mmol
UNIT 18265=mcmcl/L*/

replace serum_creatine_7=. if numunitid==13102
replace serum_creatine_7=. if numunitid==332
replace serum_creatine_7=. if numunitid==186
replace serum_creatine_7=. if numunitid==18265
replace serum_creatine_7=. if numunitid==421
replace serum_creatine_7=. if numunitid==156
replace serum_creatine_7=. if numunitid==4553
replace serum_creatine_7=. if numunitid==11254
replace serum_creatine_7=. if numunitid==256
replace serum_creatine_7=. if numunitid==816
replace serum_creatine_7=. if numunitid==202
replace serum_creatine_7=. if numunitid==12959

/*4 values coded as missing*/




drop if serum_creatine_7==.

gsort patid -obsdate
egen keepme=tag(patid)

keep if keepme==1


keep patid obsdate medcodeid value numunitid obstypeid numrangelow numrangehigh serum_creatine_7
rename obsdate creatinine_measurement_date_7
rename medcodeid creatinine_measurement_code_7
rename value serum_creatinine_7
rename numunitid units_sCr_7
rename obstypeid obstypeid_cr_7
rename numrangelow numrangelow_sCR_7
rename numrangehigh numrangehigh_sCR_7
 

label variable serum_creatine_7 "most recent valid serum creatinine measurement prior to 31st Dec 2019"

merge 1:1 patid using "Z:\Group_work\ABC_CKD\new_data\unzipped_2\AURUM\STATA_files\abc_ckd_cohort_all.dta"

drop _merge
save "Z:\Group_work\ABC_CKD\new_data\unzipped_2\AURUM\STATA_files\abc_ckd_cohort_all.dta", replace

}

/*remove duplicate Patids keeping most recent measurement*/
drop keepme
sort patid -creatinine_measurement_date_7
egen keepme=tag(patid)
keep if keepme==1

/*Moved higher to select only valid measurements initially*
/*exclude values with incorrect unit
UNIT 13102 = ??mmol/L
UNIT 332 - mmol*/

replace serum_creatine_7=. if units_sCr==13102
replace serum_creatine_7=. if units_sCr==332
replace serum_creatine_7=. if units_sCr==186

/*4 values coded as missing*/
*/

/*convert to mg/DL for all values*/
*176= micromol/l
*182=mg/dl
*186 =mg/mmol
*191 = micromol/l
*197=micromol/L
*218 = mmol/L
*285 = micromol/L 
*17491=umol/L
*18265=mcmcl/L
*139=g/L
*229=mu/L

replace serum_creatine_7=(serum_creatine_7/88.4) if (units_sCr_7==176 | units_sCr_7==191 | units_sCr_7==285 |units_sCr_7==17491 |units_sCr_7==197)

replace serum_creatine_7=(serum_creatine_7/0.0884) if (units_sCr_7==218)

replace serum_creatine_7=(serum_creatine_7*100) if units_sCr_7==139

sum serum_creatine_7

/*exclude implausible values - cannot do earlier as do not know all units which may be picked up*/
/*using values from prog_getSCr do file converted to mg/dl*/
replace serum_creatine_7=.c if serum_creatine_7>34 
replace serum_creatine_7=.c if serum_creatine_7<0.2 


/*generate age at serum creatinine measurement*/

generate eventyr_7 = year(creatinine_measurement_date_7)
	count if eventyr_7==yob /*0*/
	drop if eventyr_7==yob // drop if test result is in the same year as patient born

	* make an age at event
	gen ageAtEvent_7=0
	replace ageAtEvent_7=eventyr_7 - yob - 1 if creatinine_measurement_date_7<mdy(07,01,eventyr_7) // round down if eventdate in first half of year
	replace ageAtEvent_7=eventyr_7 - yob if creatinine_measurement_date_7>=mdy(07,01,eventyr_7)	


/*estimate egfr_7 from CKD EPI equation*/
/**************************************************************************
	#B4. Calculate egfr_7
	**************************************************************************/
	* calculate egfr_7 using ckd-epi
	* first multiply by 0.95 (for assay - fudge factor) 
	* DN "fudge factor"
	gen SCr_adj_7=(serum_creatine_7*0.95)

	gen min_7=.
	replace min_7=SCr_adj_7/0.7 if gender==2
	replace min_7=SCr_adj_7/0.9 if gender==1
	replace min_7=min_7^-0.329 if gender==2
	replace min_7=min_7^-0.411 if gender==1
	replace min_7=1 if min_7<1

	gen max_7=.
	replace max_7=SCr_adj_7/0.7 if gender==2
	replace max_7=SCr_adj_7/0.9 if gender==1
	replace max_7=max_7^-1.209
	replace max_7=1 if max_7>1

	gen egfr_7=min_7*max_7*141
	replace egfr_7=egfr_7*(0.993^ageAtEvent_7)
	replace egfr_7=egfr_7*1.018 if gender==2
	label var egfr_7 "egfr_7 calculated using CKD-EPI formula with no eth + fudge"
	
	* categorise into ckd stages
	egen egfr_7_cat= cut(egfr_7), at(0, 15, 30, 45, 60, 5000)
	label define egfr_7 0"stage 5" 15"stage 4" 30"stage 3b" 45"stage 3a" 60"no CKD"
	label values egfr_7_cat egfr_7
	label var egfr_7_cat "egfr_7 category calc without eth + DN fudge factor"
	
		* categorise into KIDGO ckd stages
	egen egfr_kidgo_7= cut(egfr_7), at(0, 15, 30, 45, 60, 90, 5000)
	label define egfr_kidgo_7 0"stage 5" 15"stage 4" 30"stage 3b" 45"stage 3a" 60"stage 2" 90"stage 1"
	label values egfr_kidgo_7 egfr_kidgo_7
	label var egfr_kidgo_7 "egfr_4 category calc without eth + DN fudge factor"
	
	* * recode with appropriate category as reference
	recode egfr_7_cat 0=5 15=4 30=3 45=2 60=0, generate(ckd_7)
	label define ckd_7 0"no CKD" 2"stage 3a" 3"stage 3b" 4"stage 4" 5"stage 5"
	label values ckd_7 ckd_7
	label var ckd_7 "CKD stage calc without eth + DN fudge factor"
	
	gen egfr_bin_7=0 if egfr_7>=60 & egfr_7<.
	replace egfr_bin_7=1 if egfr_7<60
	
	
						* categorise into ckd stages breaking up stage 4 15-25 25-29
	egen egfr_cat_25_7= cut(egfr_7), at(0, 15, 25 30, 45, 60, 90 5000)
	label values egfr_cat_25_7 EGFR_25
	label var egfr_cat_25_7 "eGFR category calc without eth + DN fudge factor_ stage 4 broken down"