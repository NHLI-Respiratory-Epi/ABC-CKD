*create codes for oral_diuretics*/
/*created by Sarah Cook*/
/*19.07.21*/

forvalues f=1/135 {
	local c=string(`f',"%03.0f") /*converting number f to 3 digit string so we get the correct number of preceeding zeros */

use "Z:\Group_work\ABC_CKD\new_data\unzipped_2\AURUM\STATA_files\ckd2_drugissue_`c'.dta"


format prodcodeid %20.0g


merge m:1 prodcodeid using  "Z:\Group_work\ABC_CKD\Code_Lists\oral_diuretics.dta"


gen oral_diuretics=1 if _merge==3

drop _merge

keep if oral_diuretics==1


/*generate indicator for taking oral_diuretics on 1 Jan 2019*/
/*use 3 month window -if prescribed oral_diuretics in 3 month period before 1st Jan 2019 count as on oral_diuretics*/

gen oral_diuretics_jan19=1 if oral_diuretics==1 & issuedate<td(01jan2019) & issuedate>=td(01oct2018)

label variable oral_diuretics "ever prescribed oral_diuretics"
label variable oral_diuretics_jan19 "using oral_diuretics on 1st Jan 2019"

keep if oral_diuretics_jan19==1

egen keepme=tag(patid)

keep if keepme==1

keep patid oral_diuretics_jan19 



merge 1:1 patid using "Z:\Group_work\ABC_CKD\new_data\unzipped_2\AURUM\STATA_files\abc_ckd_cohort_all.dta"

drop _merge
save "Z:\Group_work\ABC_CKD\new_data\unzipped_2\AURUM\STATA_files\abc_ckd_cohort_all.dta", replace 
}


