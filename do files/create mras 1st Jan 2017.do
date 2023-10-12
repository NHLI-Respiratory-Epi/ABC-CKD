/*create codes for mras*/
/*created by Sarah Cook*/
/*24.04.21*/

forvalues f=1/135 {
	local c=string(`f',"%03.0f") /*converting number f to 3 digit string so we get the correct number of preceeding zeros */

use "Z:\Group_work\ABC_CKD\new_data\unzipped_2\AURUM\STATA_files\ckd2_drugissue_`c'.dta"


format prodcodeid %20.0g


merge m:1 prodcodeid using  "Z:\Group_work\ABC_CKD\Code_Lists\mras.dta"


gen mras=1 if _merge==3

drop _merge

keep if mras==1


/*generate indicator for taking mras on 1 Jan 2017*/
/*use 3 month window -if prescribed mras in 3 month period before 1st Jan 2017 count as on mras*/

gen mras_jan17=1 if mras==1 & issuedate<td(01jan2017) & issuedate>=td(01oct2016)

label variable mras "ever prescribed mras"
label variable mras_jan17 "using mras on 1st Jan 2017"

keep if mras_jan17==1

egen keepme=tag(patid)

keep if keepme==1

keep patid mras_jan17 issuedate prodcodeid dosageid quantity quantunitid duration route formulation strength bnfcode

rename issuedate date_prescribed_mras
rename prodcodeid mras_prodcodeid
rename dosageid mras_dosage_id
rename quantity mras_quantity
rename quantunitid mras_quantunitid
rename duration mras_duration
rename route mras_route
rename formulation mras_formulation
rename strength mras_strength
rename bnfcode mras_bnfcode




merge 1:1 patid using "Z:\Group_work\ABC_CKD\new_data\unzipped_2\AURUM\STATA_files\abc_ckd_cohort_all.dta"

drop _merge
save "Z:\Group_work\ABC_CKD\new_data\unzipped_2\AURUM\STATA_files\abc_ckd_cohort_all.dta", replace 
}


