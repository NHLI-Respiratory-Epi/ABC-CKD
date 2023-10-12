/*create codes for sglt2i*/
/*created by Sarah Cook*/
/*24.04.21*/

forvalues f=1/135 {
	local c=string(`f',"%03.0f") /*converting number f to 3 digit string so we get the correct number of preceeding zeros */

use "Z:\Group_work\ABC_CKD\new_data\unzipped_2\AURUM\STATA_files\ckd2_drugissue_`c'.dta"


format prodcodeid %20.0g


merge m:1 prodcodeid using  "Z:\Group_work\ABC_CKD\Code_Lists\sglt2i.dta"


gen sglt2i=1 if _merge==3

drop _merge

keep if sglt2i==1


/*generate indicator for taking sglt2i on 1 Jan 2017*/
/*use 3 month window -if prescribed sglt2i in 3 month period before 1st Jan 2017 count as on sglt2i*/

gen sglt2i_jan17=1 if sglt2i==1 & issuedate<td(01jan2017) & issuedate>=td(01oct2016)

label variable sglt2i "ever prescribed sglt2i"
label variable sglt2i_jan17 "using sglt2i on 1st Jan 2017"

keep if sglt2i_jan17==1

egen keepme=tag(patid)

keep if keepme==1

keep patid sglt2i_jan17 issuedate prodcodeid dosageid quantity quantunitid duration route formulation strength bnfcode

rename issuedate date_prescribed_sglt2i
rename prodcodeid sglt2i_prodcodeid
rename dosageid sglt2i_dosage_id
rename quantity sglt2i_quantity
rename quantunitid sglt2i_quantunitid
rename duration sglt2i_duration
rename route sglt2i_route
rename formulation sglt2i_formulation
rename strength sglt2i_strength
rename bnfcode sglt2i_bnfcode




merge 1:1 patid using "Z:\Group_work\ABC_CKD\new_data\unzipped_2\AURUM\STATA_files\abc_ckd_cohort_all.dta"

drop _merge
save "Z:\Group_work\ABC_CKD\new_data\unzipped_2\AURUM\STATA_files\abc_ckd_cohort_all.dta", replace 
}


