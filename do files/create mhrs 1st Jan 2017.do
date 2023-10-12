/*create codes for mhrs*/
/*created by Sarah Cook*/
/*24.04.21*/

forvalues f=1/135 {
	local c=string(`f',"%03.0f") /*converting number f to 3 digit string so we get the correct number of preceeding zeros */

use "Z:\Group_work\ABC_CKD\new_data\unzipped_2\AURUM\STATA_files\ckd2_drugissue_`c'.dta"


format prodcodeid %20.0g


merge m:1 prodcodeid using  "Z:\Group_work\ABC_CKD\Code_Lists\mhrs.dta"


gen mhrs=1 if _merge==3

drop _merge

keep if mhrs==1



gen duration_1=duration 
replace duration_1=. if duration<0

/*check realistic duration of prescription*/

/*generate indicator for taking mhrs on 1 Jan 2017*/
gen index_date_use=td(01jan2017)-duration_1
format index_date %td

gen mhrs_jan17=1 if mhrs==1 & issuedate==td(01jan2017)
replace mhrs_jan17=1 if mhrs==1 & (issuedate<=td(01jan2017) & issuedate>index_date)

label variable mhrs "ever prescribed mhrs"
label variable mhrs_jan17 "using mhrs on 1st Jan 2017"

keep if mhrs_jan17==1

egen keepme=tag(patid)

keep if keepme==1

keep patid mhrs_jan17 issuedate prodcodeid dosageid quantity quantunitid duration route formulation strength bnfcode

rename issuedate date_prescribed_mhrs
rename prodcodeid mhrs_prodcodeid
rename dosageid mhrs_dosage_id
rename quantity mhrs_quantity
rename quantunitid mhrs_quantunitid
rename duration mhrs_duration
rename route mhrs_route
rename formulation mhrs_formulation
rename strength mhrs_strength
rename bnfcode mhrs_bnfcode




merge 1:1 patid using "Z:\Group_work\ABC_CKD\new_data\unzipped_2\AURUM\STATA_files\abc_ckd_cohort_all.dta"

drop _merge
save "Z:\Group_work\ABC_CKD\new_data\unzipped_2\AURUM\STATA_files\abc_ckd_cohort_all.dta", replace 
}


