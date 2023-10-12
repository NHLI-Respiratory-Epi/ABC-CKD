/* generate composite BMI variable from either recorded BMI or height and weight measurement*/

*1st Jan 2017*/

gen bmi_calc_1=weight_1/(height_1*height_1)


replace bmi_calc_1=. if bmi_calc_1<10 
*9 changes
replace bmi_calc_1=. if bmi_calc_1>100 & bmi_calc_1!=.
*48 changes


gen bmi_comp_1=bmi_1
replace bmi_comp_1=bmi_calc_1 if bmi_1==.
*8523 changes

label variable bmi_1 "most recent recorded bmi on 1st Jan 2017"
label variable bmi_calc_1 "most recent bmi from height and weight on 1st Jan 2017"
label variable bmi_comp_1 "most recent bmi on 1st Jan 2017 recorded or from height & weight"

gen bmi_cat_1=.
replace bmi_cat_1=1 if bmi_comp_1<25
replace bmi_cat_1=2 if bmi_comp_1>=25 & bmi_comp_1<30
replace bmi_cat_1=3 if bmi_comp_1>=30 & bmi_comp_1<40
replace bmi_cat_1=4 if bmi_comp_1>=40 & bmi_comp_1!=.

label variable bmi_cat_1 "most recent bmi by category as of 1st Jan 2017"

label define bmi_cat 1"<25" 2"25-29" 3"30-39" 4">=40"
label values bmi_cat_1 bmi_cat


/*31st Dec 2019*/

gen bmi_calc_7=weight_7/(height_7*height_7)


replace bmi_calc_7=. if bmi_calc_7<10 
*17 changes
replace bmi_calc_7=. if bmi_calc_7>100 & bmi_calc_7!=.
*62 changes


gen bmi_comp_7=bmi_7
replace bmi_comp_7=bmi_calc_7 if bmi_7==.
*4758 changes

label variable bmi_7 "most recent recorded bmi on 31st Dec 2019"
label variable bmi_calc_7 "most recent bmi from height and weight on 31st Dec 2019"
label variable bmi_comp_7 "most recent bmi on 31st Dec 2019 recorded or from height & weight"

gen bmi_cat_7=.
replace bmi_cat_7=1 if bmi_comp_7<25
replace bmi_cat_7=2 if bmi_comp_7>=25 & bmi_comp_7<30
replace bmi_cat_7=3 if bmi_comp_7>=30 & bmi_comp_7<40
replace bmi_cat_7=4 if bmi_comp_7>=40 & bmi_comp_7!=.

label variable bmi_cat_7 "most recent bmi by category as of 31st Dec 2019"

label define bmi_cat 1"<25" 2"25-29" 3"30-39" 4">=40"
label values bmi_cat_7 bmi_cat
