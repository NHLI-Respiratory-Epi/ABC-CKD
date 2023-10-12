/*Do file for creating BMI as recorded before 31st Dec 2019*/
/*Do file author Sarah Cook*/
/*creation date 22/10/21*/
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


/*keep most recent BMI values at start of study 31st Dec 2019*/
gen bmi_7=value

replace bmi_7=. if obsdate>td(31dec2019)

drop if bmi_7==.

gsort patid -obsdate
egen keepme=tag(patid)

keep if keepme==1


keep patid obsdate medcodeid numunitid obstypeid numrangelow numrangehigh bmi_7
rename obsdate bmi_measurement_date_7
rename medcodeid bmi_measurement_code_7
rename numunitid units_bmi_7
rename obstypeid obstypeid_bmi_7
rename numrangelow numrangelow_bmi_7
rename numrangehigh numrangehigh_bmi_7
 

label variable bmi_7 "most recent valid bmi measurement prior to 31st Dec 2019"

merge 1:1 patid using "Z:\Group_work\ABC_CKD\new_data\unzipped_2\AURUM\STATA_files\abc_ckd_cohort_all.dta"

drop _merge
save "Z:\Group_work\ABC_CKD\new_data\unzipped_2\AURUM\STATA_files\abc_ckd_cohort_all.dta", replace

}


/*Units
1=%
41=/min
108=Body mass index
122=cm
156=kg
157=kg/m2
173=m
175=m2
216=mmHG
218=mmol/L
229=mu/L
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
10716=1138
18107=km/m2
18815=antibiotic*/



/*replace as missing if invalid unit - 138  changes*/
replace bmi_7=. if (units_bmi_7==1 | units_bmi_7==156 | units_bmi_7==1410 | units_bmi_7==1410 | units_bmi_7==2919 | units_bmi_7==3193 | units_bmi_7==3791 | units_bmi_7==10716 | units_bmi_7==41 | units_bmi_7==18815 | units_bmi_7==218 | units_bmi_7==229 | units_bmi_7==216 | units_bmi_7==173 | units_bmi_7==175 | units_bmi_7==122)


/*replace as missing if bmi not in a valid range  - < 10 >100*/

replace bmi_7=. if bmi_7<10 
*735 changes
replace bmi_7=. if bmi_7>100 & bmi_7!=.
*1604 changes
