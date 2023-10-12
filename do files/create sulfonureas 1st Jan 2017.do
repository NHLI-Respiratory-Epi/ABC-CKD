/*create codes for biguanide drugs 1st Jan 2017*/
/*created by Sarah Cook*/
/*02.11.21*/
clear

forvalues f=1/135 {
	local c=string(`f',"%03.0f") /*converting number f to 3 digit string so we get the correct number of preceeding zeros */

use "Z:\Group_work\ABC_CKD\new_data\unzipped_2\AURUM\STATA_files\ckd2_drugissue_`c'.dta"


format prodcodeid %20.0g


merge m:1 prodcodeid using  "Z:\Group_work\ABC_CKD\Code_Lists\sulfonureas.dta"


gen sulfonureas=1 if _merge==3

drop _merge

keep if sulfonureas==1


/*generate indicator for taking sulfonureas drugs on 1st Jan 2017 - codelist developed Sarah Cook for aurum using codelist from github Diabetic_drugs_Varun.dta to identify search terms*/
/*use 3 month window -if prescribed sulfonureas in 3 month period before 1st Jan 2017 count as on sulfonureas*/

gen sulfonureas_jan17=1 if sulfonureas==1 & issuedate<td(01jan2017) & issuedate>=td(01oct2016)

label variable sulfonureas "ever prescribed sulfonureas"
label variable sulfonureas_jan17 "using sulfonureas on 1st Jan 2017"

keep if sulfonureas_jan17==1

egen keepme=tag(patid)

keep if keepme==1

keep patid sulfonureas_jan17 productname

rename productname sulfonureasdrugname


merge 1:1 patid using "Z:\Group_work\ABC_CKD\new_data\unzipped_2\AURUM\STATA_files\abc_ckd_cohort_all.dta"

drop _merge
save "Z:\Group_work\ABC_CKD\new_data\unzipped_2\AURUM\STATA_files\abc_ckd_cohort_all.dta", replace 
}

