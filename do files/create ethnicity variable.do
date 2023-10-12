*Create codes to indicate ethnicity*/
/*Do file author Sarah*/
/*creation date 06/05/21*/

forvalues f=1/150 {
	local c=string(`f',"%03.0f") /*converting number f to 3 digit string so we get the correct number of preceeding zeros */



use "Z:\Group_work\ABC_CKD\new_data\unzipped_2\AURUM\STATA_files\ckd2ob_observation_`c'.dta"


format medcodeid %20.0g

/*merge using ethnicity codelist from COVID collateral project*/
merge m:1 medcodeid using  "Z:\Group_work\ABC_CKD\Code_Lists\ethnicity.dta"


gen ethnicity=1 if _merge==3


sort patid obsdate

keep if ethnicity==1
by patid: gen ethnicity_n=_n if ethnicity==1
by patid: gen ethnicity_N=_N if ethnicity==1


count if ethnicity_N==1


duplicates report ethnicity
duplicates drop patid ethnicity, force

/*keep most recent record of ethnicity assuming this will be correct if differences*/
gsort patid -obsdate
egen keepme=tag(patid)

keep if keepme==1

rename medcodeid ethnicity_medcodeid
rename term ethnicity_desc
rename obsdate ethnicity_date

keep patid ethnicity_medcodeid ethnicity_desc ethnicity_date eth16 eth5

count

merge 1:1 patid using "Z:\Group_work\ABC_CKD\new_data\unzipped_2\AURUM\STATA_files\abc_ckd_cohort_all.dta"

drop _merge
save "Z:\Group_work\ABC_CKD\new_data\unzipped_2\AURUM\STATA_files\abc_ckd_cohort_all.dta", replace

}
