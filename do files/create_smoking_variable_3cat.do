/*Create codes to indicate  smoking "never, ex, current"*/
/*Do file author Sarah Cook using code from Hannah Whitaker*/
/*creation date 13/06/2022*/
forvalues f=1/150 {
	local c=string(`f',"%03.0f") /*converting number f to 3 digit string so we get the correct number of preceeding zeros */


use "Z:\Group_work\ABC_CKD\new_data\unzipped_2\AURUM\STATA_files\ckd2ob_observation_`c'.dta"


format medcodeid %20.0g


/*merge using smoking codelist which categorises into never, ex and current*/
merge m:1 medcodeid using  "Z:\Group_work\ABC_CKD\Code_Lists\smoking_3cat.dta"
rename _merge smokingdatamatched

gsort patid -smokingdatamatched obsdate
by patid: drop if smokingdatamatched!=3 & _n>1
replace obsdate=. if smokingdatamatched!=3

gen startid=td(1jan2017)

gen _distance = obsdate-startid
gen _priority = 1 if _distance>=-365 & _distance<=30
replace _priority = 2 if _distance>30 & _distance<=365
replace _priority = 3 if _distance<-365
replace _priority = 4 if _distance>365 & _distance<.
gen _absdistance = abs(_distance)
replace _priority = 5 if smokstatus==.

sort patid _priority _absdistance 

*Patients nearest status is non-smoker, but have history of smoking, recode to ex-smoker.
by patid: gen b4=1 if obsdate<=obsdate[1]
drop if b4==.
by patid: egen ever_smok=sum(smokstatus) 
by patid: replace smokstatus = 1 if ever_smok>0 & smokstatus==0

sort patid _priority _absdistance 
by patid: replace smokstatus = smokstatus[1] 
drop smokingdatamatched _distance _priority _absdistance   
by patid: keep if _n==1
label define lab_smok 0"Never" 1"Ex-smoker" 2"Current"
label values smokstatus lab_smok
keep patid smokstatus obsdate startid
keep if smokstatus!=. 


rename obsdate smok_date

gen diff=startid-smok_date
replace diff=0 if diff==.

replace diff=diff*(-1) if diff<0
sort patid diff
by patid: gen litn=_n
keep if litn==1
drop diff litn startid

merge 1:1 patid using "Z:\Group_work\ABC_CKD\new_data\unzipped_2\AURUM\STATA_files\abc_ckd_cohort_all.dta"

drop _merge
save "Z:\Group_work\ABC_CKD\new_data\unzipped_2\AURUM\STATA_files\abc_ckd_cohort_all.dta", replace

}



