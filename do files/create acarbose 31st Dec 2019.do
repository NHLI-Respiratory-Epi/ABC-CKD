/*create codes for acarbose drugs 31st Dec 2019*/
/*created by Sarah Cook*/
/*02.11.21*/
clear

forvalues f=1/135 {
	local c=string(`f',"%03.0f") /*converting number f to 3 digit string so we get the correct number of preceeding zeros */

use "Z:\Group_work\ABC_CKD\new_data\unzipped_2\AURUM\STATA_files\ckd2_drugissue_`c'.dta"


format prodcodeid %20.0g


merge m:1 prodcodeid using  "Z:\Group_work\ABC_CKD\Code_Lists\acarbose.dta"


gen acarbose=1 if _merge==3

drop _merge

keep if acarbose==1


/*generate indicator for taking acarbose drugs on 31st Dec 2019 - codelist developed Sarah Cook for aurum using codelist from github Diabetic_drugs_Varun.dta to identify search terms*/
/*use 3 month window -if prescribed acarbose in 3 month period before 31st Dec 2019 count as on acarbose*/

gen acarbose_dec19=1 if acarbose==1 & issuedate<td(31dec2019) & issuedate>=td(30sept2019)

label variable acarbose "ever prescribed acarbose"
label variable acarbose_dec19 "using acarbose on 31st Dec 2019"

keep if acarbose_dec19==1

egen keepme=tag(patid)

keep if keepme==1

keep patid acarbose_dec19 productname

rename productname acarbosedrugname


merge 1:1 patid using "Z:\Group_work\ABC_CKD\new_data\unzipped_2\AURUM\STATA_files\abc_ckd_cohort_all.dta"

drop _merge
save "Z:\Group_work\ABC_CKD\new_data\unzipped_2\AURUM\STATA_files\abc_ckd_cohort_all.dta", replace 
}

