/*Do file for extracting HbA1C*/
/*Do file author Sarah Cook*/
/*creation date 13/09/21*/
/*Do file for use in ABC CKD project*/
/*Database CPRD AURUM*/


clear


forvalues f=1/150 {
	local c=string(`f',"%03.0f") /*converting number f to 3 digit string so we get the correct number of preceeding zeros */

use "Z:\Group_work\ABC_CKD\new_data\unzipped_2\AURUM\STATA_files\ckd2ob_observation_`c'.dta"


format medcodeid %20.0g

/*keep records with observations "HbA1C"*/ 

keep if (medcodeid==3199181000006110 | medcodeid==3199171000006112 | medcodeid==3199191000006113 | medcodeid==803891000006119 | medcodeid==457954013 | medcodeid==1986181000006111 | medcodeid==6280411000006114 | medcodeid==1986191000006114)

tab numunitid


/*keep most recent hba1c record on start of study 1st Jan 2017*/
gen hba1c_1=value

replace hba1c_1=. if obsdate>td(01jan2017)




drop if hba1c_1==.

gsort patid -obsdate
egen keepme=tag(patid)

keep if keepme==1


keep patid obsdate medcodeid numunitid obstypeid numrangelow numrangehigh hba1c_1
rename obsdate hba1c_measurement_date
rename medcodeid hba1c_measurement_code
rename numunitid units_hba1c
rename obstypeid obstypeid_hba1c
rename numrangelow numrangelow_hba1c
rename numrangehigh numrangehigh_hba1c
 

label variable hba1c_1 "most recent valid hba1c measurement prior to 1st Jan 2017"

merge 1:1 patid using "Z:\Group_work\ABC_CKD\new_data\unzipped_2\AURUM\STATA_files\abc_ckd_cohort_all.dta"

drop _merge
save "Z:\Group_work\ABC_CKD\new_data\unzipped_2\AURUM\STATA_files\abc_ckd_cohort_all.dta", replace

}

/*remove duplicate Patids keeping most recent measurement*/
drop keepme
sort patid -hba1c_measurement_date
egen keepme=tag(patid)
keep if keepme==1


replace hba1c_1=. if hba1c_1>14
replace hba1c_1=. if hba1c_1<4

/*units hb1ac
1=%
2=%HB
64=1
138=g/dl
153=IU
154= iu/L
162=l/l
199=mIU/L
218=mmol/L
220=mmol/mol
246=percent
288=units
332=mmol
355=% 0f hb
405=unknown units
603=h
672=mmols
679=g
849=%Hb
897=HbA1c
912=DCCT%
959=umol/mol
1043=% total Hb
1155=unknown
1192= %HB
1282= percent
1396= % Tot. Hb
1459= (bdsk u)
1677=HbA1c Level
1844=%Tot.
1905=%Hba10
2161=% Haemoglobin A
2758=% (DCCT)
2990=DCCT %
3411=% (DCCT)
3773=percentage
4744=% of Hba
*/







