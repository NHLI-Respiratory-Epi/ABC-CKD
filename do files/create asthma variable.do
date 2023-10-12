/*Create codes to indicate  asthma*/
/*Do file author Sarah*/
/*creation date 08/04/21*/
forvalues f=1/150 {
	local c=string(`f',"%03.0f") /*converting number f to 3 digit string so we get the correct number of preceeding zeros */


use "Z:\Group_work\ABC_CKD\new_data\unzipped_2\AURUM\STATA_files\ckd2ob_observation_`c'.dta"


format medcodeid %20.0g


/*merge using asthma codelist provided by Alicia asthma codes in Aurum_JQ*/
merge m:1 medcodeid using  "Z:\Group_work\ABC_CKD\Code_Lists\asthma.dta"

gen asthma=1 if _merge==3


sort patid obsdate

keep if asthma==1
by patid: gen asthma_n=_n if asthma==1
by patid: gen asthma_N=_N if asthma==1


count if asthma_N==1

gsort patid obsdate
egen keepme=tag(patid)

keep if keepme==1

rename medcodeid asthma_medcodeid
rename term asthma_desc
rename obsdate asthma_diagnosis_date


label variable asthma "has 1 or more asthma medcodes"
label variable asthma_medcodeid "medcodeid first asthma code"
label variable asthma_desc "desc of first asthma medcode"
label variable asthma_diagnosis_date "date of first record asthma"
label variable  asthma_N "number of asthma codes"

keep patid asthma asthma_medcodeid asthma_desc asthma_diagnosis_date asthma_N

merge 1:1 patid using "Z:\Group_work\ABC_CKD\new_data\unzipped_2\AURUM\STATA_files\abc_ckd_cohort_all.dta"

drop _merge
save "Z:\Group_work\ABC_CKD\new_data\unzipped_2\AURUM\STATA_files\abc_ckd_cohort_all.dta", replace

}