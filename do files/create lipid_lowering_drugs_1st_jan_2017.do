/*create codes for lipid_lowering_drugs*/
/*created by Sarah Cook*/
/*24.04.21*/

forvalues f=1/135 {
	local c=string(`f',"%03.0f") /*converting number f to 3 digit string so we get the correct number of preceeding zeros */

use "Z:\Group_work\ABC_CKD\new_data\unzipped_2\AURUM\STATA_files\ckd2_drugissue_`c'.dta"


format prodcodeid %20.0g


merge m:1 prodcodeid using  "Z:\Group_work\ABC_CKD\Code_Lists\lipid_lowering_drugs.dta"


gen lipid_lowering_drugs=1 if _merge==3

drop _merge

keep if lipid_lowering_drugs==1


/*generate indicator for taking lipid_lowering_drugs on 1 Jan 2017*/
/*use 3 month window -if prescribed lipid_lowering_drugs in 3 month period before 1st Jan 2017 count as on lipid_lowering_drugs*/

gen lipid_lowering_drugs_jan17=1 if lipid_lowering_drugs==1 & issuedate<td(01jan2017) & issuedate>=td(01oct2016)

label variable lipid_lowering_drugs "ever prescribed lipid_lowering_drugs"
label variable lipid_lowering_drugs_jan17 "using lipid_lowering_drugs on 1st Jan 2017"

keep if lipid_lowering_drugs_jan17==1

egen keepme=tag(patid)

keep if keepme==1

keep patid lipid_lowering_drugs_jan17 issuedate prodcodeid dosageid quantity quantunitid duration route formulation strength bnfcode

rename issuedate date_prescribed_lld
rename prodcodeid lld_prodcodeid
rename dosageid lld_dosage_id
rename quantity lld_quantity
rename quantunitid lld_quantunitid
rename duration lld_duration
rename route lld_route
rename formulation lld_formulation
rename strength lld_strength
rename bnfcode lld_bnfcode




merge 1:1 patid using "Z:\Group_work\ABC_CKD\new_data\unzipped_2\AURUM\STATA_files\abc_ckd_cohort_all.dta"

drop _merge
save "Z:\Group_work\ABC_CKD\new_data\unzipped_2\AURUM\STATA_files\abc_ckd_cohort_all.dta", replace 
}


