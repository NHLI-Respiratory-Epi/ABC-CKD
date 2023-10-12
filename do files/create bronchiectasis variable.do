/*Create codes to indicate  bronchiectasis*/
/*Do file author Sarah*/
/*creation date 18/02/21*/
forvalues f=1/150 {
	local c=string(`f',"%03.0f") /*converting number f to 3 digit string so we get the correct number of preceeding zeros */


use "Z:\Group_work\ABC_CKD\new_data\unzipped_2\AURUM\STATA_files\ckd2ob_observation_`c'.dta"


format medcodeid %20.0g


/*merge using bronchiectasis codelist provided by Alicia bronchiectasis codes in Aurum_JQ*/
merge m:1 medcodeid using  "Z:\Group_work\ABC_CKD\Code_Lists\bronchiectasis.dta"

gen bronchiectasis=1 if _merge==3


sort patid obsdate

keep if bronchiectasis==1
by patid: gen bronchiectasis_n=_n if bronchiectasis==1
by patid: gen bronchiectasis_N=_N if bronchiectasis==1


count if bronchiectasis_N==1

gsort patid obsdate
egen keepme=tag(patid)

keep if keepme==1

rename medcodeid bronchiectasis_medcodeid
rename term bronchiectasis_desc
rename obsdate bronchiectasis_diagnosis_date


label variable bronchiectasis "has 1 or more bronchiectasis medcodes"
label variable bronchiectasis_medcodeid "medcodeid first bronchiectasis code"
label variable bronchiectasis_desc "desc of first bronchiectasis medcode"
label variable bronchiectasis_diagnosis_date "date of first record bronchiectasis"
label variable  bronchiectasis_N "number of bronchiectasis codes"

keep patid bronchiectasis bronchiectasis_medcodeid bronchiectasis_desc bronchiectasis_diagnosis_date bronchiectasis_N

merge 1:1 patid using "Z:\Group_work\ABC_CKD\new_data\unzipped_2\AURUM\STATA_files\abc_ckd_cohort_all.dta"

drop _merge
save "Z:\Group_work\ABC_CKD\new_data\unzipped_2\AURUM\STATA_files\abc_ckd_cohort_all.dta", replace

}


