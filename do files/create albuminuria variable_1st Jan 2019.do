/*Generate urine albumin: creatinine ratio at time point 5_ 1st Jan 2019*/
/*Do file created by Sarah Cook 20/05/21*/
clear

/*Do file for extracting urine albumin creatinine ratio*/

forvalues f=1/150 {
	local c=string(`f',"%03.0f") /*converting number f to 3 digit string so we get the correct number of preceeding zeros */

use "Z:\Group_work\ABC_CKD\new_data\unzipped_2\AURUM\STATA_files\ckd2ob_observation_`c'.dta"



format medcodeid %20.0g

/*keep records with medcode ids 7496100006113 (urine albumin creatinine ratio), 68971000006117 (urine micro albumin: creatinine ratio), 12681291000006100 (albumin/creatinine ratio in urine) */ 

keep if (medcodeid==74961000006113 | medcodeid==68971000006117  | medcodeid==12681291000006100)

tab numunitid

/*using most recent albumunuria in the past 24 months therefore remove measurements before 24 months of start date of the study (1st January 2017) i.e. older than 1st Jan 2015*/

drop if obsdate<td(01jan2015)

/*keep most recent urine albumin creatinine record  1st Jan 2019*/
gen albumin_creatine_5=value

replace albumin_creatine_5=. if obsdate>td(01jan2019)

drop if albumin_creatine_5==.

gsort patid -obsdate
egen keepme=tag(patid)

keep if keepme==1


keep patid obsdate medcodeid value numunitid obstypeid numrangelow numrangehigh albumin_creatine_5
rename obsdate ACR_measurement_date_5
rename medcodeid ACR_code_5
rename value ACR_value_5
rename numunitid units_ACR_5_5
rename obstypeid obstypeid_ACR_5
rename numrangelow numrangelow_ACR_5
rename numrangehigh numrangehigh_ACR_5
 

label variable albumin_creatine_5 "most recent urine ACR measurement prior to 1st Jan 2019"

merge 1:1 patid using "Z:\Group_work\ABC_CKD\new_data\unzipped_2\AURUM\STATA_files\abc_ckd_cohort_all.dta"

drop _merge
save "Z:\Group_work\ABC_CKD\new_data\unzipped_2\AURUM\STATA_files\abc_ckd_cohort_all.dta", replace

}


/*remove duplicate Patids keeping most recent measurement*/
drop keepme
sort patid -ACR_measurement_date_5
egen keepme=tag(patid)
keep if keepme==1

label define units_ACR_5   1"%" 42"/minute" 65"1/1" 139"g/L" 140"g/mol" 178"mg" 182"MG/DL" 183"mg/L" 185"mg/ml" 186"mg/mmol" 188"mg/mmol creat" 189"mg/mmol(creat)" 190"mg/mmolcreat" 202"ml/min" 218"mmol/L" 220"mmol/mol" 260"ratio" 261"s" 285"umol/L" 288"units" 332"mmol" 365"mg/mmol (creat)" 375"g/molC" 405"UNKNOWN UNITS" 421"." 521"R" 531"U" 800"mg/mmol CRT" 857"mg/mmol Creat." 923"Unknown" 1099"mg/mmol{creat}" 1155"(Unknown)" 1242"mg/mmol Cr" 1459"(bdsk u)" 1515"mg/mmolC" 1517"mg/mmolCr"  1550"mg/mmol/creat" 1577"GPL/ML" 1612"mg(Alb)/mmol(Creat)" 1644"g/mmol" 1695"mg/mmol creatinine" 1703"mg/mol" 1708"g/molCrt" 1866"mg/mmo" 2068"(ppm)"2273"mg/mmol Cre" 2280"mmol/mmol(creat)" 2355"mg/mmol creatinin" 2449"mmol/mmol{creat}"2524"/g(Hb)" 3123"ng/mmol" 3327"ug/mmol(creat)" 4059"mg/mM" 4284"N/A" 4529"mg/G"4655"mg/mmol Cr." 4698"MGMMCR" 6131"mgALB/mmolCREAT" 6585"mg/mmol (c" 6803"ug/mmol" 7175"gm/mmol" 8779"mg/mm Cr"  8977"mg/mmol Al/cr" 11430"mg/mmolCreat."12119"mg/mmol of creatinine" 13144"m/s2" 14586"mg/mmolCreatinine"

label values units_ACR_5 units_ACR_5

gen alb_creat_mg_mmol_5=albumin_creatine_5 if (units_ACR_5==186 | units_ACR_5==188 | units_ACR_5==186| units_ACR_5==188 | units_ACR_5==189 | units_ACR_5==190 | units_ACR_5==365 | units_ACR_5==800 | units_ACR_5==857 | units_ACR_5==1099 | units_ACR_5==1242 | units_ACR_5==1515 | units_ACR_5==1517 | units_ACR_5==1550 | units_ACR_5==1612 | units_ACR_5==1695 | units_ACR_5==1703 | units_ACR_5==1866 |units_ACR_5==2273 | units_ACR_5==2355 | units_ACR_5==4059 | units_ACR_5==4655 | units_ACR_5==4698 |units_ACR_5==6131 | units_ACR_5==6585 | units_ACR_5==8779 | units_ACR_5==8977 | units_ACR_5==11430 | units_ACR_5==12119 | units_ACR_5==14586)

/*acceptable units are mg/mmol OR mg/g*/

replace alb_creat_mg_mmol_5= (albumin_creatine_5/1000) if units_ACR_5==285 | units_ACR_5==3327 | units_ACR_5==6803

/*convert g/mmol to mg/mmol - values look too high?? - exclude*/
/*replace alb_creat_mg_mmol= (albumin_creatine_1*1000) if  units_ACR_5==1644 |  units_ACR_5==7175 */
/*ng/mmol - 3123? exclude??*/


*140=g/mol
*1708= g/molC
*375 = g/molCrt/
replace alb_creat_mg_mmol_5=albumin_creatine_5 if units_ACR_5==140 | units_ACR_5==1708 |  units_ACR_5==375


label variable alb_creat_mg_mmol_5 "urine albumin creatinine ratio in mg/mmol"
/*******************************************************************************
 Drop records with ACR values that are very low or very high
	*******************************************************************************/
	* drop improbable values for ACR i.e. <0 or >3000
replace alb_creat_mg_mmol_5=.c if alb_creat_mg_mmol_5<0 
replace alb_creat_mg_mmol_5=.c if alb_creat_mg_mmol_5>3000 & alb_creat_mg_mmol_5<.  

/*generate categorical variable UACR if  A1 (<3 mg/mmol albumin), A2 (3-30), A3 (>30)*/
gen uacr_5=1 if alb_creat_mg_mmol_5<3
replace uacr_5=2 if alb_creat_mg_mmol_5>=3 & alb_creat_mg_mmol_5<=30
replace uacr_5=3 if alb_creat_mg_mmol_5>=3 & alb_creat_mg_mmol_5>30 &  alb_creat_mg_mmol_5<.

label define uacr_5 1"A1 <3mg/mmol" 2"A2 3-30mg/mmol" 3"A3 >30mg/mmol"
label values uacr_5 uacr_5

/* gen albuminuria A2 + A3*/
gen albuminuria_5=uacr_5
recode albuminuria_5 1=0 2=1 3=1


save "Z:\Group_work\ABC_CKD\new_data\unzipped_2\AURUM\STATA_files\abc_ckd_cohort_all.dta", replace