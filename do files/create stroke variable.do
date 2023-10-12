/*Create codes to indicate  stroke*/
/*Do file author Sarah*/
/*creation date 21/02/21*/
forvalues f=1/150 {
	local c=string(`f',"%03.0f") /*converting number f to 3 digit string so we get the correct number of preceeding zeros */


use "Z:\Group_work\ABC_CKD\new_data\unzipped_2\AURUM\STATA_files\ckd2ob_observation_`c'.dta"


format medcodeid %20.0g


/*merge using stroke codelist from Laura*/
merge m:1 medcodeid using  "Z:\Group_work\ABC_CKD\Code_Lists\stroke.dta"

gen stroke=1 if _merge==3


sort patid obsdate

keep if stroke==1
by patid: gen stroke_n=_n if stroke==1
by patid: gen stroke_N=_N if stroke==1


count if stroke_N==1

gsort patid obsdate
egen keepme=tag(patid)

keep if keepme==1

rename medcodeid stroke_medcodeid
rename readterm stroke_desc
rename obsdate stroke_diagnosis_date


label variable stroke "has 1 or more stroke medcodes"
label variable stroke_medcodeid "medcodeid first stroke code"
label variable stroke_desc "desc of first stroke medcode"
label variable stroke_diagnosis_date "date of first record stroke"
label variable  stroke_N "number of stroke codes"

keep patid stroke stroke_medcodeid stroke_desc stroke_diagnosis_date stroke_N

count

merge 1:1 patid using "Z:\Group_work\ABC_CKD\new_data\unzipped_2\AURUM\STATA_files\abc_ckd_cohort_all.dta"

drop _merge
save "Z:\Group_work\ABC_CKD\new_data\unzipped_2\AURUM\STATA_files\abc_ckd_cohort_all.dta", replace

}

