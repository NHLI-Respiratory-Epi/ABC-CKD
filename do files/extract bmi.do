/*Do file for creating BMI as recorded before Jan 2017*/
/*Do file author Sarah Cook*/
/*creation date 21/10/21*/
/*Do file for use in ABC CKD project*/
/*Database CPRD AURUM*/


clear


forvalues f=1/150 {
	local c=string(`f',"%03.0f") /*converting number f to 3 digit string so we get the correct number of preceeding zeros */

use "Z:\Group_work\ABC_CKD\new_data\unzipped_2\AURUM\STATA_files\ckd2ob_observation_`c'.dta"


format medcodeid %20.0g

/*keep records with observations "BMI"*/ 

keep if (medcodeid==8286991000006119 | medcodeid==2196071000000116 | medcodeid==3484801000006114 | medcodeid==100716012 | medcodeid==923861000006112 | medcodeid==3484781000006110 )

tab numunitid


/*keep most recent BMI values at start of study 1st Jan 2017*/
gen bmi_1=value

replace bmi_1=. if obsdate>td(01jan2017)

drop if bmi_1==.

gsort patid -obsdate
egen keepme=tag(patid)

keep if keepme==1


keep patid obsdate medcodeid numunitid obstypeid numrangelow numrangehigh bmi_1
rename obsdate bmi_measurement_date
rename medcodeid bmi_measurement_code
rename numunitid units_bmi
rename obstypeid obstypeid_bmi
rename numrangelow numrangelow_bmi
rename numrangehigh numrangehigh_bmi
 

label variable bmi_1 "most recent valid bmi measurement prior to 1st Jan 2017"

merge 1:1 patid using "Z:\Group_work\ABC_CKD\new_data\unzipped_2\AURUM\STATA_files\abc_ckd_cohort_all.dta"

drop _merge
save "Z:\Group_work\ABC_CKD\new_data\unzipped_2\AURUM\STATA_files\abc_ckd_cohort_all.dta", replace

}


/*Units
1=%
108=Body mass index
156=kg
157=kg/m2
216=mmHG
218=mmol/L
288=unit
359=kg/m?
568=BMI
657=kg/mA2
822=18.5-22.9
907=kg/m2
1200=kg/m/m
1309=K/M2
1410=18
1438=kg/m*m
1633=kg/ square m
1894=KG/M
2217=wt/ht2
2919=148
3193=98
3737=18.5-24.9
3791=54
6289=per metre squared
10716=1138*/

/*replace as missing if invalid unit - 85 changes*/
replace bmi_1=. if (units_bmi==1 | units_bmi==156 | units_bmi==1410 | units_bmi==1410 | units_bmi==2919 | units_bmi==3193 | units_bmi==3791 | units_bmi==10716)


/*replace as missing if bmi not in a valid range  - < 10 >100*/

replace bmi_1=. if bmi_1<10 
*894 changes
replace bmi_1=. if bmi_1>100 & bmi_1!=.
*1748 changes