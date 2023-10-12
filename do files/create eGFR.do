/*Do file for extracting serum creatinine and calculating eGFR*/
/*Do file author Sarah Cook*/
/*creation date 23/3/21*/
/*Do file for use in ABC CKD project - designed to pick up valid measurements taken in 24 months prior to Jan 1st 2017*/
/*Database CPRD AURUM*/


clear


forvalues f=1/150 {
	local c=string(`f',"%03.0f") /*converting number f to 3 digit string so we get the correct number of preceeding zeros */

use "Z:\Group_work\ABC_CKD\new_data\unzipped_2\AURUM\STATA_files\ckd2ob_observation_`c'.dta"


format medcodeid %20.0g

/*keep records with observations "serum creatinine NOS", "serum creatinine" or "corrected serum creatinine" */
/* "creatinine level" medcodeid*/ 

keep if (medcodeid==259054018 | medcodeid==380389013 | medcodeid==457927010 | medcodeid==977071000006116)

tab numunitid




/*using most recent serum creatinine measurement in the past 24 months therefore remove measurements before 24 months of start date of the study (1st January 2017) i.e. older than 1st Jan 2015*/

drop if obsdate<td(01jan2015)


/*keep most recent serum creatinine record on start of study 1st Jan 2017*/
gen serum_creatine_1=value

replace serum_creatine_1=. if obsdate>td(01jan2017)

/*exclude values with incorrect unit
UNIT 13102 = ??mmol/L
UNIT 332 - mmol*/

replace serum_creatine_1=. if numunitid==13102
replace serum_creatine_1=. if numunitid==332
replace serum_creatine_1=. if numunitid==186

/*4 values coded as missing*/




drop if serum_creatine_1==.

gsort patid -obsdate
egen keepme=tag(patid)

keep if keepme==1


keep patid obsdate medcodeid value numunitid obstypeid numrangelow numrangehigh serum_creatine_1
rename obsdate creatinine_measurement_date
rename medcodeid creatinine_measurement_code
rename value serum_creatinine
rename numunitid units_sCr
rename obstypeid obstypeid_cr
rename numrangelow numrangelow_sCR
rename numrangehigh numrangehigh_sCR
 

label variable serum_creatine_1 "most recent valid serum creatinine measurement prior to 1st Jan 2017"

merge 1:1 patid using "Z:\Group_work\ABC_CKD\new_data\unzipped_2\AURUM\STATA_files\abc_ckd_cohort_all.dta"

drop _merge
save "Z:\Group_work\ABC_CKD\new_data\unzipped_2\AURUM\STATA_files\abc_ckd_cohort_all.dta", replace

}

/*remove duplicate Patids keeping most recent measurement*/
drop keepme
sort patid -creatinine_measurement_date
egen keepme=tag(patid)
keep if keepme==1

/*Moved higher to select only valid measurements initially*
/*exclude values with incorrect unit
UNIT 13102 = ??mmol/L
UNIT 332 - mmol*/

replace serum_creatine_1=. if units_sCr==13102
replace serum_creatine_1=. if units_sCr==332
replace serum_creatine_1=. if units_sCr==186

/*4 values coded as missing*/
*/

/*convert to mg/DL for all values*/
*176= micromol/l
*186 =mg/mmol
*191 = micromol/l
*218 = mmol/L
*285 = micromol/L 
*816 = mol/L

replace serum_creatine_1=(serum_creatine_1/88.4) if (units_sCr==176 | units_sCr==191 | units_sCr==285)

replace serum_creatine_1=(serum_creatine_1/0.0884) if (units_sCr==218)

replace serum_creatine_1= 

sum serum_creatine_1

/*exclude implausible values - cannot do earlier as do not know all units which may be picked up*/
/*using values from prog_getSCr do file converted to mg/dl*/
replace serum_creatine_1=.c if serum_creatine_1>34 /*147,403*/
replace serum_creatine_1=.c if serum_creatine_1<0.2 /*114*/

*/

/*generate age at serum creatinine measurement*/

generate eventyr = year(creatinine_measurement_date)
	count if eventyr==yob /*0*/
	drop if eventyr==yob // drop if test result is in the same year as patient born

	* make an age at event
	gen ageAtEvent=0
	replace ageAtEvent=eventyr - yob - 1 if creatinine_measurement_date<mdy(07,01,eventyr) // round down if eventdate in first half of year
	replace ageAtEvent=eventyr - yob if creatinine_measurement_date>=mdy(07,01,eventyr)	


/*estimate eGFR from CKD EPI equation*/
/**************************************************************************
	#B4. Calculate eGFR
	**************************************************************************/
	* calculate egfr using ckd-epi
	* first multiply by 0.95 (for assay - fudge factor) 
	* DN "fudge factor"
	gen SCr_adj=(serum_creatine_1*0.95)

	gen min=.
	replace min=SCr_adj/0.7 if gender==2
	replace min=SCr_adj/0.9 if gender==1
	replace min=min^-0.329 if gender==2
	replace min=min^-0.411 if gender==1
	replace min=1 if min<1

	gen max=.
	replace max=SCr_adj/0.7 if gender==2
	replace max=SCr_adj/0.9 if gender==1
	replace max=max^-1.209
	replace max=1 if max>1

	gen egfr=min*max*141
	replace egfr=egfr*(0.993^ageAtEvent)
	replace egfr=egfr*1.018 if gender==2
	label var egfr "egfr calculated using CKD-EPI formula with no eth + fudge"
	
	* categorise into ckd stages
	egen egfr_cat= cut(egfr), at(0, 15, 30, 45, 60, 5000)
	label define EGFR 0"stage 5" 15"stage 4" 30"stage 3b" 45"stage 3a" 60"no CKD"
	label values egfr_cat EGFR
	label var egfr_cat "eGFR category calc without eth + DN fudge factor"
	
	* * recode with appropriate category as reference
	recode egfr_cat 0=5 15=4 30=3 45=2 60=0, generate(ckd)
	label define ckd 0"no CKD" 2"stage 3a" 3"stage 3b" 4"stage 4" 5"stage 5"
	label values ckd ckd
	label var ckd "CKD stage calc without eth + DN fudge factor"
	
	gen egfr_bin=0 if egfr>=60 & egfr<.
	replace egfr_bin=1 if egfr<60
	
	
		* categorise into ckd stages breaking up stage 4 15-25 25-29
	egen egfr_cat_25= cut(egfr), at(0, 15, 25 30, 45, 60, 5000)
	label define EGFR_25 0"stage 5" 15"stage 4 15- <25" 25"stage 4 25-29" 30"stage 3b" 45"stage 3a" 60"no CKD"
	label values egfr_cat_25 EGFR_25
	label var egfr_cat "eGFR category calc without eth + DN fudge factor_ stage 4 broken down"
	

