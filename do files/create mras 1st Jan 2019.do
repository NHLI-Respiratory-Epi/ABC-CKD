/*create codes for mras*/
/*created by Sarah Cook*/
/*20.06.21*/
clear

forvalues f=1/135 {
	local c=string(`f',"%03.0f") /*converting number f to 3 digit string so we get the correct number of preceeding zeros */

use "Z:\Group_work\ABC_CKD\new_data\unzipped_2\AURUM\STATA_files\ckd2_drugissue_`c'.dta"


format prodcodeid %20.0g


merge m:1 prodcodeid using  "Z:\Group_work\ABC_CKD\Code_Lists\mras.dta"


gen mras=1 if _merge==3

drop _merge

keep if mras==1


/*generate indicator for taking mras on 1 Jan 2019*/
/*use 3 month window -if prescribed mras in 3 month period before 1st Jan 2019 count as on mras*/

gen mras_jan19=1 if mras==1 & issuedate<td(01jan2019) & issuedate>=td(01oct2018)

label variable mras "ever prescribed mras"
label variable mras_jan19 "using mras on 1st Jan 2019"

keep if mras_jan19==1

egen keepme=tag(patid)

keep if keepme==1

keep patid mras_jan19 


merge 1:1 patid using "Z:\Group_work\ABC_CKD\new_data\unzipped_2\AURUM\STATA_files\abc_ckd_cohort_all.dta"

drop _merge
save "Z:\Group_work\ABC_CKD\new_data\unzipped_2\AURUM\STATA_files\abc_ckd_cohort_all.dta", replace 
}