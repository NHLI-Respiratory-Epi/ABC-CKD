/*create codes for betablockers*/
/*created by Sarah Cook*/
/*24.04.21*/
clear

forvalues f=1/135 {
	local c=string(`f',"%03.0f") /*converting number f to 3 digit string so we get the correct number of preceeding zeros */

use "Z:\Group_work\ABC_CKD\new_data\unzipped_2\AURUM\STATA_files\ckd2_drugissue_`c'.dta"


format prodcodeid %20.0g


merge m:1 prodcodeid using  "Z:\Group_work\ABC_CKD\Code_Lists\betablockers.dta"


gen betablockers=1 if _merge==3

drop _merge

keep if betablockers==1


/*generate indicator for taking betablockers on 1 Jan 2017*/
/*use 3 month window -if prescribed betablockers in 3 month period before 1st Jan 2017 count as on betablockers*/

gen betablockers_jan17=1 if betablockers==1 & issuedate<td(01jan2017) & issuedate>=td(01oct2016)

label variable betablockers "ever prescribed betablockers"
label variable betablockers_jan17 "using betablockers on 1st Jan 2017"

keep if betablockers_jan17==1

egen keepme=tag(patid)

keep if keepme==1

keep patid betablockers_jan17 issuedate prodcodeid dosageid quantity quantunitid duration route formulation strength bnfcode

rename issuedate date_prescribed_betablockers
rename prodcodeid betablockers_prodcodeid
rename dosageid betablockers_dosage_id
rename quantity betablockers_quantity
rename quantunitid betablockers_quantunitid
rename duration betablockers_duration
rename route betablockers_route
rename formulation betablockers_formulation
rename strength betablockers_strength
rename bnfcode betablockers_bnfcode




merge 1:1 patid using "Z:\Group_work\ABC_CKD\new_data\unzipped_2\AURUM\STATA_files\abc_ckd_cohort_all.dta"

drop _merge
save "Z:\Group_work\ABC_CKD\new_data\unzipped_2\AURUM\STATA_files\abc_ckd_cohort_all.dta", replace 
}


