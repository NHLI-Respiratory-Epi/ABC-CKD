/*create codes for ddp4*/
/*created by Sarah Cook*/
/*24.04.21*/

forvalues f=1/135 {
	local c=string(`f',"%03.0f") /*converting number f to 3 digit string so we get the correct number of preceeding zeros */

use "Z:\Group_work\ABC_CKD\new_data\unzipped_2\AURUM\STATA_files\ckd2_drugissue_`c'.dta"


format prodcodeid %20.0g


merge m:1 prodcodeid using  "Z:\Group_work\ABC_CKD\Code_Lists\ddp4.dta"


gen ddp4=1 if _merge==3

drop _merge

keep if ddp4==1


/*generate indicator for taking ddp4 on 1 Jan 2017 - using codelis developed by Sarah Cook*/
/*use 3 month window -if prescribed ddp4 in 3 month period before 1st Jan 2017 count as on ddp4*/

gen ddp4_jan17=1 if ddp4==1 & issuedate<td(01jan2017) & issuedate>=td(01oct2016)

label variable ddp4 "ever prescribed ddp4"
label variable ddp4_jan17 "using ddp4 on 1st Jan 2017"

keep if ddp4_jan17==1

egen keepme=tag(patid)

keep if keepme==1

keep patid ddp4_jan17 issuedate prodcodeid dosageid quantity quantunitid duration route formulation substancestrength 

rename issuedate date_prescribed_ddp4
rename prodcodeid ddp4_prodcodeid
rename dosageid ddp4_dosage_id
rename quantity ddp4_quantity
rename quantunitid ddp4_quantunitid
rename duration ddp4_duration
rename route ddp4_route
rename formulation ddp4_formulation
rename substancestrength ddp4_strength


merge 1:1 patid using "Z:\Group_work\ABC_CKD\new_data\unzipped_2\AURUM\STATA_files\abc_ckd_cohort_all.dta"

drop _merge
save "Z:\Group_work\ABC_CKD\new_data\unzipped_2\AURUM\STATA_files\abc_ckd_cohort_all.dta", replace 
}

