/* generate incidence of CKD variables*/

/*do file created by Sarah Cook 20/09/21*/
/*updated 1/12/21*/

/*generate variable indicating incidence date*/
gen ckd_incidence_date=.

replace ckd_incidence_date=creatinine_measurement_date_2 if ckd_composite_1==0 & egfr_bin_2==1
replace ckd_incidence_date=ACR_measurement_date_2 if ckd_composite_1==0 & albuminuria_2==1 & ckd_incidence_date==. & ACR_measurement_date_2!=.
replace ckd_incidence_date=ACR_measurement_date_2 if ckd_composite_1==0 & albuminuria_2==1 & egfr_bin_2==1 & ACR_measurement_date_2<creatinine_measurement_date_2 & ACR_measurement_date_2!=.
replace ckd_incidence_date=creatinine_measurement_date_2 if ckd_composite_1==0 & albuminuria_2==1 & egfr_bin_2==1 & creatinine_measurement_date_2<ACR_measurement_date_2 & ACR_measurement_date_2!=.


replace ckd_incidence_date=creatinine_measurement_date_3 if ckd_composite_1==0 & ckd_composite_2==0 & egfr_bin_3==1
replace ckd_incidence_date=ACR_measurement_date_3 if ckd_composite_1==0 & ckd_composite_2==0 & albuminuria_3==1 & ckd_incidence_date==.
replace ckd_incidence_date=ACR_measurement_date_3 if ckd_composite_1==0 & ckd_composite_2==0 & albuminuria_3==1 & egfr_bin_3==1 & ACR_measurement_date_3<creatinine_measurement_date_3
replace ckd_incidence_date=creatinine_measurement_date_3 if ckd_composite_1==0 & ckd_composite_2==0 & albuminuria_3==1 & egfr_bin_3==1 & creatinine_measurement_date_3<ACR_measurement_date_3

replace ckd_incidence_date=creatinine_measurement_date_3 if ckd_composite_1==0 & ckd_composite_2==. & egfr_bin_3==1
replace ckd_incidence_date=ACR_measurement_date_3 if ckd_composite_1==0 & ckd_composite_2==. & albuminuria_3==1 & ckd_incidence_date==.
replace ckd_incidence_date=ACR_measurement_date_3 if ckd_composite_1==0 & ckd_composite_2==. & albuminuria_3==1 & egfr_bin_3==1 & ACR_measurement_date_3<creatinine_measurement_date_3
replace ckd_incidence_date=creatinine_measurement_date_3 if ckd_composite_1==0 & ckd_composite_2==. & albuminuria_3==1 & egfr_bin_3==1 & creatinine_measurement_date_3<ACR_measurement_date_3



replace ckd_incidence_date=creatinine_measurement_date_4 if ckd_composite_1==0 & ckd_composite_2==0 & ckd_composite_3==0 & egfr_bin_4==1
replace ckd_incidence_date=ACR_measurement_date_4 if ckd_composite_1==0 & ckd_composite_2==0 & ckd_composite_3==0 & albuminuria_4==1 & ckd_incidence_date==.
replace ckd_incidence_date=ACR_measurement_date_4 if ckd_composite_1==0 & ckd_composite_2==0 & ckd_composite_3==0 & albuminuria_4==1 & egfr_bin_4==1 & ACR_measurement_date_4<creatinine_measurement_date_4
replace ckd_incidence_date=creatinine_measurement_date_4 if ckd_composite_1==0 & ckd_composite_2==0 & ckd_composite_3==0  & albuminuria_4==1 & egfr_bin_4==1 & creatinine_measurement_date_4<ACR_measurement_date_4

replace ckd_incidence_date=creatinine_measurement_date_4 if ckd_composite_1==0 & ckd_composite_2==. & ckd_composite_3==0 & egfr_bin_4==1
replace ckd_incidence_date=ACR_measurement_date_4 if ckd_composite_1==0 & ckd_composite_2==. & ckd_composite_3==0 & albuminuria_4==1 & ckd_incidence_date==.
replace ckd_incidence_date=ACR_measurement_date_4 if ckd_composite_1==0 & ckd_composite_2==. & ckd_composite_3==0 & albuminuria_4==1 & egfr_bin_4==1 & ACR_measurement_date_4<creatinine_measurement_date_4
replace ckd_incidence_date=creatinine_measurement_date_4 if ckd_composite_1==0 & ckd_composite_2==. & ckd_composite_3==0  & albuminuria_4==1 & egfr_bin_4==1 & creatinine_measurement_date_4<ACR_measurement_date_4


replace ckd_incidence_date=creatinine_measurement_date_4 if ckd_composite_1==0 & ckd_composite_2==0 & ckd_composite_3==. & egfr_bin_4==1
replace ckd_incidence_date=ACR_measurement_date_4 if ckd_composite_1==0 & ckd_composite_2==0 & ckd_composite_3==. & albuminuria_4==1 & ckd_incidence_date==.
replace ckd_incidence_date=ACR_measurement_date_4 if ckd_composite_1==0 & ckd_composite_2==0 & ckd_composite_3==. & albuminuria_4==1 & egfr_bin_4==1 & ACR_measurement_date_4<creatinine_measurement_date_4
replace ckd_incidence_date=creatinine_measurement_date_4 if ckd_composite_1==0 & ckd_composite_2==0 & ckd_composite_3==.  & albuminuria_4==1 & egfr_bin_4==1 & creatinine_measurement_date_4<ACR_measurement_date_4


replace ckd_incidence_date=creatinine_measurement_date_4 if ckd_composite_1==0 & ckd_composite_2==. & ckd_composite_3==. & egfr_bin_4==1
replace ckd_incidence_date=ACR_measurement_date_4 if ckd_composite_1==0 & ckd_composite_2==. & ckd_composite_3==. & albuminuria_4==1 & ckd_incidence_date==.
replace ckd_incidence_date=ACR_measurement_date_4 if ckd_composite_1==0 & ckd_composite_2==. & ckd_composite_3==. & albuminuria_4==1 & egfr_bin_4==1 & ACR_measurement_date_4<creatinine_measurement_date_4
replace ckd_incidence_date=creatinine_measurement_date_4 if ckd_composite_1==0 & ckd_composite_2==. & ckd_composite_3==.  & albuminuria_4==1 & egfr_bin_4==1 & creatinine_measurement_date_4<ACR_measurement_date_4


replace ckd_incidence_date=creatinine_measurement_date_5 if ckd_composite_1==0 & ckd_composite_2==0 & ckd_composite_3==0 & ckd_composite_4==0 & egfr_bin_5==1
replace ckd_incidence_date=ACR_measurement_date_5 if ckd_composite_1==0 & ckd_composite_2==0 & ckd_composite_3==0 & ckd_composite_4==0 & albuminuria_5==1 & ckd_incidence_date==.
replace ckd_incidence_date=ACR_measurement_date_5 if ckd_composite_1==0 & ckd_composite_2==0 & ckd_composite_3==0 & ckd_composite_4==0 & albuminuria_5==1 & egfr_bin_5==1 & ACR_measurement_date_5<creatinine_measurement_date_5
replace ckd_incidence_date=creatinine_measurement_date_5 if ckd_composite_1==0 & ckd_composite_2==0 & ckd_composite_3==0  & ckd_composite_4==0 & albuminuria_5==1 & egfr_bin_5==1 & creatinine_measurement_date_5<ACR_measurement_date_5


replace ckd_incidence_date=creatinine_measurement_date_5 if ckd_composite_1==0 & ckd_composite_2==. & ckd_composite_3==0 & ckd_composite_4==0 & egfr_bin_5==1
replace ckd_incidence_date=ACR_measurement_date_5 if ckd_composite_1==0 & ckd_composite_2==. & ckd_composite_3==0 & ckd_composite_4==0 & albuminuria_5==1 & ckd_incidence_date==.
replace ckd_incidence_date=ACR_measurement_date_5 if ckd_composite_1==0 & ckd_composite_2==. & ckd_composite_3==0 & ckd_composite_4==0 & albuminuria_5==1 & egfr_bin_5==1 & ACR_measurement_date_5<creatinine_measurement_date_5
replace ckd_incidence_date=creatinine_measurement_date_5 if ckd_composite_1==0 & ckd_composite_2==. & ckd_composite_3==0  & ckd_composite_4==0 & albuminuria_5==1 & egfr_bin_5==1 & creatinine_measurement_date_5<ACR_measurement_date_5

replace ckd_incidence_date=creatinine_measurement_date_5 if ckd_composite_1==0 & ckd_composite_2==0 & ckd_composite_3==. & ckd_composite_4==0 & egfr_bin_5==1
replace ckd_incidence_date=ACR_measurement_date_5 if ckd_composite_1==0 & ckd_composite_2==0 & ckd_composite_3==. & ckd_composite_4==0 & albuminuria_5==1 & ckd_incidence_date==.
replace ckd_incidence_date=ACR_measurement_date_5 if ckd_composite_1==0 & ckd_composite_2==0 & ckd_composite_3==. & ckd_composite_4==0 & albuminuria_5==1 & egfr_bin_5==1 & ACR_measurement_date_5<creatinine_measurement_date_5
replace ckd_incidence_date=creatinine_measurement_date_5 if ckd_composite_1==0 & ckd_composite_2==0 & ckd_composite_3==.  & ckd_composite_4==0 & albuminuria_5==1 & egfr_bin_5==1 & creatinine_measurement_date_5<ACR_measurement_date_5

replace ckd_incidence_date=creatinine_measurement_date_5 if ckd_composite_1==0 & ckd_composite_2==0 & ckd_composite_3==0 & ckd_composite_4==. & egfr_bin_5==1
replace ckd_incidence_date=ACR_measurement_date_5 if ckd_composite_1==0 & ckd_composite_2==0 & ckd_composite_3==0 & ckd_composite_4==. & albuminuria_5==1 & ckd_incidence_date==.
replace ckd_incidence_date=ACR_measurement_date_5 if ckd_composite_1==0 & ckd_composite_2==0 & ckd_composite_3==0 & ckd_composite_4==. & albuminuria_5==1 & egfr_bin_5==1 & ACR_measurement_date_5<creatinine_measurement_date_5
replace ckd_incidence_date=creatinine_measurement_date_5 if ckd_composite_1==0 & ckd_composite_2==0 & ckd_composite_3==0  & ckd_composite_4==. & albuminuria_5==1 & egfr_bin_5==1 & creatinine_measurement_date_5<ACR_measurement_date_5


replace ckd_incidence_date=creatinine_measurement_date_5 if ckd_composite_1==0 & ckd_composite_2==0 & ckd_composite_3==. & ckd_composite_4==. & egfr_bin_5==1
replace ckd_incidence_date=ACR_measurement_date_5 if ckd_composite_1==0 & ckd_composite_2==0 & ckd_composite_3==. & ckd_composite_4==. & albuminuria_5==1 & ckd_incidence_date==.
replace ckd_incidence_date=ACR_measurement_date_5 if ckd_composite_1==0 & ckd_composite_2==0 & ckd_composite_3==. & ckd_composite_4==. & albuminuria_5==1 & egfr_bin_5==1 & ACR_measurement_date_5<creatinine_measurement_date_5
replace ckd_incidence_date=creatinine_measurement_date_5 if ckd_composite_1==0 & ckd_composite_2==0 & ckd_composite_3==.  & ckd_composite_4==. & albuminuria_5==1 & egfr_bin_5==1 & creatinine_measurement_date_5<ACR_measurement_date_5


replace ckd_incidence_date=creatinine_measurement_date_5 if ckd_composite_1==0 & ckd_composite_2==. & ckd_composite_3==. & ckd_composite_4==0 & egfr_bin_5==1
replace ckd_incidence_date=ACR_measurement_date_5 if ckd_composite_1==0 & ckd_composite_2==. & ckd_composite_3==. & ckd_composite_4==0 & albuminuria_5==1 & ckd_incidence_date==.
replace ckd_incidence_date=ACR_measurement_date_5 if ckd_composite_1==0 & ckd_composite_2==. & ckd_composite_3==. & ckd_composite_4==0 & albuminuria_5==1 & egfr_bin_5==1 & ACR_measurement_date_5<creatinine_measurement_date_5
replace ckd_incidence_date=creatinine_measurement_date_5 if ckd_composite_1==0 & ckd_composite_2==. & ckd_composite_3==.  & ckd_composite_4==0 & albuminuria_5==1 & egfr_bin_5==1 & creatinine_measurement_date_5<ACR_measurement_date_5


replace ckd_incidence_date=creatinine_measurement_date_5 if ckd_composite_1==0 & ckd_composite_2==. & ckd_composite_3==. & ckd_composite_4==. & egfr_bin_5==1
replace ckd_incidence_date=ACR_measurement_date_5 if ckd_composite_1==0 & ckd_composite_2==. & ckd_composite_3==0 & ckd_composite_4==. & albuminuria_5==1 & ckd_incidence_date==.
replace ckd_incidence_date=ACR_measurement_date_5 if ckd_composite_1==0 & ckd_composite_2==. & ckd_composite_3==. & ckd_composite_4==. & albuminuria_5==1 & egfr_bin_5==1 & ACR_measurement_date_5<creatinine_measurement_date_5
replace ckd_incidence_date=creatinine_measurement_date_5 if ckd_composite_1==0 & ckd_composite_2==. & ckd_composite_3==.  & ckd_composite_4==. & albuminuria_5==1 & egfr_bin_5==1 & creatinine_measurement_date_5<ACR_measurement_date_5

replace ckd_incidence_date=creatinine_measurement_date_5 if ckd_composite_1==0 & ckd_composite_2==0 & ckd_composite_3==. & ckd_composite_4==. & egfr_bin_5==1
replace ckd_incidence_date=ACR_measurement_date_5 if ckd_composite_1==0 & ckd_composite_2==0 & ckd_composite_3==0 & ckd_composite_4==. & albuminuria_5==1 & ckd_incidence_date==.
replace ckd_incidence_date=ACR_measurement_date_5 if ckd_composite_1==0 & ckd_composite_2==0 & ckd_composite_3==. & ckd_composite_4==. & albuminuria_5==1 & egfr_bin_5==1 & ACR_measurement_date_5<creatinine_measurement_date_5
replace ckd_incidence_date=creatinine_measurement_date_5 if ckd_composite_1==0 & ckd_composite_2==0 & ckd_composite_3==.  & ckd_composite_4==. & albuminuria_5==1 & egfr_bin_5==1 & creatinine_measurement_date_5<ACR_measurement_date_5


replace ckd_incidence_date=creatinine_measurement_date_5 if ckd_composite_1==0 & ckd_composite_2==. & ckd_composite_3==0 & ckd_composite_4==. & egfr_bin_5==1
replace ckd_incidence_date=ACR_measurement_date_5 if ckd_composite_1==0 & ckd_composite_2==. & ckd_composite_3==0 & ckd_composite_4==. & albuminuria_5==1 & ckd_incidence_date==.
replace ckd_incidence_date=ACR_measurement_date_5 if ckd_composite_1==0 & ckd_composite_2==. & ckd_composite_3==0 & ckd_composite_4==. & albuminuria_5==1 & egfr_bin_5==1 & ACR_measurement_date_5<creatinine_measurement_date_5
replace ckd_incidence_date=creatinine_measurement_date_5 if ckd_composite_1==0 & ckd_composite_2==. & ckd_composite_3==0  & ckd_composite_4==. & albuminuria_5==1 & egfr_bin_5==1 & creatinine_measurement_date_5<ACR_measurement_date_5

replace ckd_incidence_date=creatinine_measurement_date_5 if ckd_composite_1==0 & ckd_composite_2==. & ckd_composite_3==. & ckd_composite_4==. & egfr_bin_5==1
replace ckd_incidence_date=ACR_measurement_date_5 if ckd_composite_1==0 & ckd_composite_2==. & ckd_composite_3==. & ckd_composite_4==. & albuminuria_5==1 & ckd_incidence_date==.
replace ckd_incidence_date=ACR_measurement_date_5 if ckd_composite_1==0 & ckd_composite_2==. & ckd_composite_3==. & ckd_composite_4==. & albuminuria_5==1 & egfr_bin_5==1 & ACR_measurement_date_5<creatinine_measurement_date_5
replace ckd_incidence_date=creatinine_measurement_date_5 if ckd_composite_1==0 & ckd_composite_2==. & ckd_composite_3==.  & ckd_composite_4==. & albuminuria_5==1 & egfr_bin_5==1 & creatinine_measurement_date_5<ACR_measurement_date_5


replace ckd_incidence_date=creatinine_measurement_date_5 if ckd_composite_1==0 & ckd_composite_2==. & ckd_composite_3==. & ckd_composite_4==0 & egfr_bin_5==1
replace ckd_incidence_date=ACR_measurement_date_5 if ckd_composite_1==0 & ckd_composite_2==. & ckd_composite_3==. & ckd_composite_4==0 & albuminuria_5==1 & ckd_incidence_date==.
replace ckd_incidence_date=ACR_measurement_date_5 if ckd_composite_1==0 & ckd_composite_2==. & ckd_composite_3==. & ckd_composite_4==0 & albuminuria_5==1 & egfr_bin_5==1 & ACR_measurement_date_5<creatinine_measurement_date_5
replace ckd_incidence_date=creatinine_measurement_date_5 if ckd_composite_1==0 & ckd_composite_2==. & ckd_composite_3==.  & ckd_composite_4==0 & albuminuria_5==1 & egfr_bin_5==1 & creatinine_measurement_date_5<ACR_measurement_date_5

replace ckd_incidence_date=creatinine_measurement_date_6 if ckd_composite_1==0 & ckd_composite_2==0 & ckd_composite_3==0 & ckd_composite_4==0 & ckd_composite_5==0 & egfr_bin_6==1
replace ckd_incidence_date=ACR_measurement_date_6 if ckd_composite_1==0 & ckd_composite_2==0 & ckd_composite_3==0 & ckd_composite_4==0 & ckd_composite_5==0 & albuminuria_6==1 & ckd_incidence_date==.
replace ckd_incidence_date=ACR_measurement_date_6 if ckd_composite_1==0 & ckd_composite_2==0 & ckd_composite_3==0 & ckd_composite_4==0 & ckd_composite_5==0 & albuminuria_6==1 & egfr_bin_6==1 & ACR_measurement_date_6<creatinine_measurement_date_6
replace ckd_incidence_date=creatinine_measurement_date_6 if ckd_composite_1==0 & ckd_composite_2==0 & ckd_composite_3==0  & ckd_composite_4==0 & ckd_composite_5==0 & albuminuria_6==1 & egfr_bin_6==1 & creatinine_measurement_date_6<ACR_measurement_date_6


replace ckd_incidence_date=creatinine_measurement_date_6 if ckd_composite_1==0 & ckd_composite_2==. & ckd_composite_3==0 & ckd_composite_4==0 & ckd_composite_5==0 & egfr_bin_6==1
replace ckd_incidence_date=ACR_measurement_date_6 if ckd_composite_1==0 & ckd_composite_2==. & ckd_composite_3==0 & ckd_composite_4==0 & ckd_composite_5==0 & albuminuria_6==1 & ckd_incidence_date==.
replace ckd_incidence_date=ACR_measurement_date_6 if ckd_composite_1==0 & ckd_composite_2==. & ckd_composite_3==0 & ckd_composite_4==0 & ckd_composite_5==0 & albuminuria_6==1 & egfr_bin_6==1 & ACR_measurement_date_6<creatinine_measurement_date_6
replace ckd_incidence_date=creatinine_measurement_date_6 if ckd_composite_1==0 & ckd_composite_2==. & ckd_composite_3==0  & ckd_composite_4==0 & ckd_composite_5==0 & albuminuria_6==1 & egfr_bin_6==1 & creatinine_measurement_date_6<ACR_measurement_date_6


replace ckd_incidence_date=creatinine_measurement_date_6 if ckd_composite_1==0 & ckd_composite_2==0 & ckd_composite_3==. & ckd_composite_4==0 & ckd_composite_5==0 & egfr_bin_6==1
replace ckd_incidence_date=ACR_measurement_date_6 if ckd_composite_1==0 & ckd_composite_2==0 & ckd_composite_3==. & ckd_composite_4==0 & ckd_composite_5==0 & albuminuria_6==1 & ckd_incidence_date==.
replace ckd_incidence_date=ACR_measurement_date_6 if ckd_composite_1==0 & ckd_composite_2==0 & ckd_composite_3==. & ckd_composite_4==0 & ckd_composite_5==0 & albuminuria_6==1 & egfr_bin_6==1 & ACR_measurement_date_6<creatinine_measurement_date_6
replace ckd_incidence_date=creatinine_measurement_date_6 if ckd_composite_1==0 & ckd_composite_2==0 & ckd_composite_3==.  & ckd_composite_4==0 & ckd_composite_5==0 & albuminuria_6==1 & egfr_bin_6==1 & creatinine_measurement_date_6<ACR_measurement_date_6


replace ckd_incidence_date=creatinine_measurement_date_6 if ckd_composite_1==0 & ckd_composite_2==0 & ckd_composite_3==0 & ckd_composite_4==. & ckd_composite_5==0 & egfr_bin_6==1
replace ckd_incidence_date=ACR_measurement_date_6 if ckd_composite_1==0 & ckd_composite_2==0 & ckd_composite_3==0 & ckd_composite_4==. & ckd_composite_5==0 & albuminuria_6==1 & ckd_incidence_date==.
replace ckd_incidence_date=ACR_measurement_date_6 if ckd_composite_1==0 & ckd_composite_2==0 & ckd_composite_3==0 & ckd_composite_4==. & ckd_composite_5==0 & albuminuria_6==1 & egfr_bin_6==1 & ACR_measurement_date_6<creatinine_measurement_date_6
replace ckd_incidence_date=creatinine_measurement_date_6 if ckd_composite_1==0 & ckd_composite_2==0 & ckd_composite_3==0  & ckd_composite_4==. & ckd_composite_5==0 & albuminuria_6==1 & egfr_bin_6==1 & creatinine_measurement_date_6<ACR_measurement_date_6

replace ckd_incidence_date=creatinine_measurement_date_6 if ckd_composite_1==0 & ckd_composite_2==0 & ckd_composite_3==0 & ckd_composite_4==0 & ckd_composite_5==. & egfr_bin_6==1
replace ckd_incidence_date=ACR_measurement_date_6 if ckd_composite_1==0 & ckd_composite_2==0 & ckd_composite_3==0 & ckd_composite_4==0 & ckd_composite_5==. & albuminuria_6==1 & ckd_incidence_date==.
replace ckd_incidence_date=ACR_measurement_date_6 if ckd_composite_1==0 & ckd_composite_2==0 & ckd_composite_3==0 & ckd_composite_4==0 & ckd_composite_5==. & albuminuria_6==1 & egfr_bin_6==1 & ACR_measurement_date_6<creatinine_measurement_date_6
replace ckd_incidence_date=creatinine_measurement_date_6 if ckd_composite_1==0 & ckd_composite_2==0 & ckd_composite_3==0  & ckd_composite_4==0 & ckd_composite_5==. & albuminuria_6==1 & egfr_bin_6==1 & creatinine_measurement_date_6<ACR_measurement_date_6



replace ckd_incidence_date=creatinine_measurement_date_6 if ckd_composite_1==0 & ckd_composite_2==. & ckd_composite_3==. & ckd_composite_4==0 & ckd_composite_5==0 & egfr_bin_6==1
replace ckd_incidence_date=ACR_measurement_date_6 if ckd_composite_1==0 & ckd_composite_2==. & ckd_composite_3==. & ckd_composite_4==0 & ckd_composite_5==0 & albuminuria_6==1 & ckd_incidence_date==.
replace ckd_incidence_date=ACR_measurement_date_6 if ckd_composite_1==0 & ckd_composite_2==. & ckd_composite_3==. & ckd_composite_4==0 & ckd_composite_5==0 & albuminuria_6==1 & egfr_bin_6==1 & ACR_measurement_date_6<creatinine_measurement_date_6
replace ckd_incidence_date=creatinine_measurement_date_6 if ckd_composite_1==0 & ckd_composite_2==. & ckd_composite_3==.  & ckd_composite_4==0 & ckd_composite_5==0 & albuminuria_6==1 & egfr_bin_6==1 & creatinine_measurement_date_6<ACR_measurement_date_6



replace ckd_incidence_date=creatinine_measurement_date_6 if ckd_composite_1==0 & ckd_composite_2==. & ckd_composite_3==. & ckd_composite_4==0 & ckd_composite_5==0 & egfr_bin_6==1
replace ckd_incidence_date=ACR_measurement_date_6 if ckd_composite_1==0 & ckd_composite_2==. & ckd_composite_3==. & ckd_composite_4==0 & ckd_composite_5==0 & albuminuria_6==1 & ckd_incidence_date==.
replace ckd_incidence_date=ACR_measurement_date_6 if ckd_composite_1==0 & ckd_composite_2==. & ckd_composite_3==. & ckd_composite_4==0 & ckd_composite_5==0 & albuminuria_6==1 & egfr_bin_6==1 & ACR_measurement_date_6<creatinine_measurement_date_6
replace ckd_incidence_date=creatinine_measurement_date_6 if ckd_composite_1==0 & ckd_composite_2==. & ckd_composite_3==.  & ckd_composite_4==0 & ckd_composite_5==0 & albuminuria_6==1 & egfr_bin_6==1 & creatinine_measurement_date_6<ACR_measurement_date_6


replace ckd_incidence_date=creatinine_measurement_date_6 if ckd_composite_1==0 & ckd_composite_2==. & ckd_composite_3==. & ckd_composite_4==. & ckd_composite_5==0 & egfr_bin_6==1
replace ckd_incidence_date=ACR_measurement_date_6 if ckd_composite_1==0 & ckd_composite_2==. & ckd_composite_3==. & ckd_composite_4==. & ckd_composite_5==0 & albuminuria_6==1 & ckd_incidence_date==.
replace ckd_incidence_date=ACR_measurement_date_6 if ckd_composite_1==0 & ckd_composite_2==. & ckd_composite_3==. & ckd_composite_4==. & ckd_composite_5==0 & albuminuria_6==1 & egfr_bin_6==1 & ACR_measurement_date_6<creatinine_measurement_date_6
replace ckd_incidence_date=creatinine_measurement_date_6 if ckd_composite_1==0 & ckd_composite_2==. & ckd_composite_3==.  & ckd_composite_4==. & ckd_composite_5==0 & albuminuria_6==1 & egfr_bin_6==1 & creatinine_measurement_date_6<ACR_measurement_date_6

replace ckd_incidence_date=creatinine_measurement_date_6 if ckd_composite_1==0 & ckd_composite_2==0 & ckd_composite_3==. & ckd_composite_4==. & ckd_composite_5==. & egfr_bin_6==1
replace ckd_incidence_date=ACR_measurement_date_6 if ckd_composite_1==0 & ckd_composite_2==0 & ckd_composite_3==. & ckd_composite_4==. & ckd_composite_5==. & albuminuria_6==1 & ckd_incidence_date==.
replace ckd_incidence_date=ACR_measurement_date_6 if ckd_composite_1==0 & ckd_composite_2==0 & ckd_composite_3==. & ckd_composite_4==. & ckd_composite_5==. & albuminuria_6==1 & egfr_bin_6==1 & ACR_measurement_date_6<creatinine_measurement_date_6
replace ckd_incidence_date=creatinine_measurement_date_6 if ckd_composite_1==0 & ckd_composite_2==0 & ckd_composite_3==.  & ckd_composite_4==. & ckd_composite_5==. & albuminuria_6==1 & egfr_bin_6==1 & creatinine_measurement_date_6<ACR_measurement_date_6


replace ckd_incidence_date=creatinine_measurement_date_6 if ckd_composite_1==0 & ckd_composite_2==0 & ckd_composite_3==0 & ckd_composite_4==. & ckd_composite_5==. & egfr_bin_6==1
replace ckd_incidence_date=ACR_measurement_date_6 if ckd_composite_1==0 & ckd_composite_2==0 & ckd_composite_3==0 & ckd_composite_4==. & ckd_composite_5==. & albuminuria_6==1 & ckd_incidence_date==.
replace ckd_incidence_date=ACR_measurement_date_6 if ckd_composite_1==0 & ckd_composite_2==0 & ckd_composite_3==0 & ckd_composite_4==. & ckd_composite_5==. & albuminuria_6==1 & egfr_bin_6==1 & ACR_measurement_date_6<creatinine_measurement_date_6
replace ckd_incidence_date=creatinine_measurement_date_6 if ckd_composite_1==0 & ckd_composite_2==0 & ckd_composite_3==0  & ckd_composite_4==. & ckd_composite_5==. & albuminuria_6==1 & egfr_bin_6==1 & creatinine_measurement_date_6<ACR_measurement_date_6


replace ckd_incidence_date=creatinine_measurement_date_6 if ckd_composite_1==0 & ckd_composite_2==0 & ckd_composite_3==. & ckd_composite_4==. & ckd_composite_5==0 & egfr_bin_6==1
replace ckd_incidence_date=ACR_measurement_date_6 if ckd_composite_1==0 & ckd_composite_2==0 & ckd_composite_3==. & ckd_composite_4==. & ckd_composite_5==0 & albuminuria_6==1 & ckd_incidence_date==.
replace ckd_incidence_date=ACR_measurement_date_6 if ckd_composite_1==0 & ckd_composite_2==0 & ckd_composite_3==. & ckd_composite_4==. & ckd_composite_5==0 & albuminuria_6==1 & egfr_bin_6==1 & ACR_measurement_date_6<creatinine_measurement_date_6
replace ckd_incidence_date=creatinine_measurement_date_6 if ckd_composite_1==0 & ckd_composite_2==0 & ckd_composite_3==.  & ckd_composite_4==. & ckd_composite_5==0 & albuminuria_6==1 & egfr_bin_6==1 & creatinine_measurement_date_6<ACR_measurement_date_6

replace ckd_incidence_date=creatinine_measurement_date_6 if ckd_composite_1==0 & ckd_composite_2==. & ckd_composite_3==. & ckd_composite_4==0 & ckd_composite_5==. & egfr_bin_6==1
replace ckd_incidence_date=ACR_measurement_date_6 if ckd_composite_1==0 & ckd_composite_2==. & ckd_composite_3==. & ckd_composite_4==0 & ckd_composite_5==. & albuminuria_6==1 & ckd_incidence_date==.
replace ckd_incidence_date=ACR_measurement_date_6 if ckd_composite_1==0 & ckd_composite_2==. & ckd_composite_3==. & ckd_composite_4==0 & ckd_composite_5==. & albuminuria_6==1 & egfr_bin_6==1 & ACR_measurement_date_6<creatinine_measurement_date_6
replace ckd_incidence_date=creatinine_measurement_date_6 if ckd_composite_1==0 & ckd_composite_2==. & ckd_composite_3==.  & ckd_composite_4==0 & ckd_composite_5==. & albuminuria_6==1 & egfr_bin_6==1 & creatinine_measurement_date_6<ACR_measurement_date_6


replace ckd_incidence_date=creatinine_measurement_date_6 if ckd_composite_1==0 & ckd_composite_2==. & ckd_composite_3==0 & ckd_composite_4==. & ckd_composite_5==0 & egfr_bin_6==1
replace ckd_incidence_date=ACR_measurement_date_6 if ckd_composite_1==0 & ckd_composite_2==. & ckd_composite_3==0 & ckd_composite_4==. & ckd_composite_5==0 & albuminuria_6==1 & ckd_incidence_date==.
replace ckd_incidence_date=ACR_measurement_date_6 if ckd_composite_1==0 & ckd_composite_2==. & ckd_composite_3==0 & ckd_composite_4==. & ckd_composite_5==0 & albuminuria_6==1 & egfr_bin_6==1 & ACR_measurement_date_6<creatinine_measurement_date_6
replace ckd_incidence_date=creatinine_measurement_date_6 if ckd_composite_1==0 & ckd_composite_2==. & ckd_composite_3==0  & ckd_composite_4==. & ckd_composite_5==0 & albuminuria_6==1 & egfr_bin_6==1 & creatinine_measurement_date_6<ACR_measurement_date_6


replace ckd_incidence_date=creatinine_measurement_date_6 if ckd_composite_1==0 & ckd_composite_2==. & ckd_composite_3==. & ckd_composite_4==. & ckd_composite_5==. & egfr_bin_6==1
replace ckd_incidence_date=ACR_measurement_date_6 if ckd_composite_1==0 & ckd_composite_2==. & ckd_composite_3==. & ckd_composite_4==. & ckd_composite_5==. & albuminuria_6==1 & ckd_incidence_date==.
replace ckd_incidence_date=ACR_measurement_date_6 if ckd_composite_1==0 & ckd_composite_2==. & ckd_composite_3==. & ckd_composite_4==. & ckd_composite_5==. & albuminuria_6==1 & egfr_bin_6==1 & ACR_measurement_date_6<creatinine_measurement_date_6
replace ckd_incidence_date=creatinine_measurement_date_6 if ckd_composite_1==0 & ckd_composite_2==. & ckd_composite_3==.  & ckd_composite_4==. & ckd_composite_5==. & albuminuria_6==1 & egfr_bin_6==1 & creatinine_measurement_date_6<ACR_measurement_date_6


replace ckd_incidence_date=creatinine_measurement_date_6 if ckd_composite_1==0 & ckd_composite_2==. & ckd_composite_3==0 & ckd_composite_4==0 & ckd_composite_5==. & egfr_bin_6==1
replace ckd_incidence_date=ACR_measurement_date_6 if ckd_composite_1==0 & ckd_composite_2==. & ckd_composite_3==0 & ckd_composite_4==0 & ckd_composite_5==. & albuminuria_6==1 & ckd_incidence_date==.
replace ckd_incidence_date=ACR_measurement_date_6 if ckd_composite_1==0 & ckd_composite_2==. & ckd_composite_3==0 & ckd_composite_4==0 & ckd_composite_5==. & albuminuria_6==1 & egfr_bin_6==1 & ACR_measurement_date_6<creatinine_measurement_date_6
replace ckd_incidence_date=creatinine_measurement_date_6 if ckd_composite_1==0 & ckd_composite_2==. & ckd_composite_3==0  & ckd_composite_4==0 & ckd_composite_5==. & albuminuria_6==1 & egfr_bin_6==1 & creatinine_measurement_date_6<ACR_measurement_date_6


replace ckd_incidence_date=creatinine_measurement_date_6 if ckd_composite_1==0 & ckd_composite_2==0 & ckd_composite_3==. & ckd_composite_4==0 & ckd_composite_5==. & egfr_bin_6==1
replace ckd_incidence_date=ACR_measurement_date_6 if ckd_composite_1==0 & ckd_composite_2==0 & ckd_composite_3==. & ckd_composite_4==0 & ckd_composite_5==. & albuminuria_6==1 & ckd_incidence_date==.
replace ckd_incidence_date=ACR_measurement_date_6 if ckd_composite_1==0 & ckd_composite_2==0 & ckd_composite_3==. & ckd_composite_4==0 & ckd_composite_5==. & albuminuria_6==1 & egfr_bin_6==1 & ACR_measurement_date_6<creatinine_measurement_date_6
replace ckd_incidence_date=creatinine_measurement_date_6 if ckd_composite_1==0 & ckd_composite_2==0 & ckd_composite_3==.  & ckd_composite_4==0 & ckd_composite_5==. & albuminuria_6==1 & egfr_bin_6==1 & creatinine_measurement_date_6<ACR_measurement_date_6


replace ckd_incidence_date=creatinine_measurement_date_6 if ckd_composite_1==0 & ckd_composite_2==. & ckd_composite_3==0 & ckd_composite_4==. & ckd_composite_5==. & egfr_bin_6==1
replace ckd_incidence_date=ACR_measurement_date_6 if ckd_composite_1==0 & ckd_composite_2==. & ckd_composite_3==0 & ckd_composite_4==. & ckd_composite_5==. & albuminuria_6==1 & ckd_incidence_date==.
replace ckd_incidence_date=ACR_measurement_date_6 if ckd_composite_1==0 & ckd_composite_2==. & ckd_composite_3==0 & ckd_composite_4==. & ckd_composite_5==. & albuminuria_6==1 & egfr_bin_6==1 & ACR_measurement_date_6<creatinine_measurement_date_6
replace ckd_incidence_date=creatinine_measurement_date_6 if ckd_composite_1==0 & ckd_composite_2==. & ckd_composite_3==0  & ckd_composite_4==. & ckd_composite_5==. & albuminuria_6==1 & egfr_bin_6==1 & creatinine_measurement_date_6<ACR_measurement_date_6

replace ckd_incidence_date=creatinine_measurement_date_7 if ckd_composite_1==0 & ckd_composite_2==0 & ckd_composite_3==0 & ckd_composite_4==0 & ckd_composite_5==0 & ckd_composite_6==0 & egfr_bin_7==1
replace ckd_incidence_date=ACR_measurement_date_7 if ckd_composite_1==0 & ckd_composite_2==0 & ckd_composite_3==0 & ckd_composite_4==0 & ckd_composite_5==0 & ckd_composite_6==0 & albuminuria_7==1 & ckd_incidence_date==.
replace ckd_incidence_date=ACR_measurement_date_7 if ckd_composite_1==0 & ckd_composite_2==0 & ckd_composite_3==0 & ckd_composite_4==0 & ckd_composite_5==0 & ckd_composite_6==0 & albuminuria_7==1 & egfr_bin_7==1 & ACR_measurement_date_7<creatinine_measurement_date_7
replace ckd_incidence_date=creatinine_measurement_date_7 if ckd_composite_1==0 & ckd_composite_2==0 & ckd_composite_3==0  & ckd_composite_4==0 & ckd_composite_5==0 & ckd_composite_6==0 & albuminuria_7==1 & egfr_bin_7==1 & creatinine_measurement_date_7<ACR_measurement_date_7


replace ckd_incidence_date=creatinine_measurement_date_7 if ckd_composite_1==0 & ckd_composite_2==. & ckd_composite_3==0 & ckd_composite_4==0 & ckd_composite_5==0 & ckd_composite_6==0 & egfr_bin_7==1
replace ckd_incidence_date=ACR_measurement_date_7 if ckd_composite_1==0 & ckd_composite_2==. & ckd_composite_3==0 & ckd_composite_4==0 & ckd_composite_5==0 & ckd_composite_6==0 & albuminuria_7==1 & ckd_incidence_date==.
replace ckd_incidence_date=ACR_measurement_date_7 if ckd_composite_1==0 & ckd_composite_2==. & ckd_composite_3==0 & ckd_composite_4==0 & ckd_composite_5==0 & ckd_composite_6==0 & albuminuria_7==1 & egfr_bin_7==1 & ACR_measurement_date_7<creatinine_measurement_date_7
replace ckd_incidence_date=creatinine_measurement_date_7 if ckd_composite_1==0 & ckd_composite_2==. & ckd_composite_3==0  & ckd_composite_4==0 & ckd_composite_5==0 & ckd_composite_6==0 & albuminuria_7==1 & egfr_bin_7==1 & creatinine_measurement_date_7<ACR_measurement_date_7



replace ckd_incidence_date=creatinine_measurement_date_7 if ckd_composite_1==0 & ckd_composite_2==0 & ckd_composite_3==. & ckd_composite_4==0 & ckd_composite_5==0 & ckd_composite_6==0 & egfr_bin_7==1
replace ckd_incidence_date=ACR_measurement_date_7 if ckd_composite_1==0 & ckd_composite_2==0 & ckd_composite_3==. & ckd_composite_4==0 & ckd_composite_5==0 & ckd_composite_6==0 & albuminuria_7==1 & ckd_incidence_date==.
replace ckd_incidence_date=ACR_measurement_date_7 if ckd_composite_1==0 & ckd_composite_2==0 & ckd_composite_3==. & ckd_composite_4==0 & ckd_composite_5==0 & ckd_composite_6==0 & albuminuria_7==1 & egfr_bin_7==1 & ACR_measurement_date_7<creatinine_measurement_date_7
replace ckd_incidence_date=creatinine_measurement_date_7 if ckd_composite_1==0 & ckd_composite_2==0 & ckd_composite_3==.  & ckd_composite_4==0 & ckd_composite_5==0 & ckd_composite_6==0 & albuminuria_7==1 & egfr_bin_7==1 & creatinine_measurement_date_7<ACR_measurement_date_7


replace ckd_incidence_date=creatinine_measurement_date_7 if ckd_composite_1==0 & ckd_composite_2==0 & ckd_composite_3==0 & ckd_composite_4==. & ckd_composite_5==0 & ckd_composite_6==0 & egfr_bin_7==1
replace ckd_incidence_date=ACR_measurement_date_7 if ckd_composite_1==0 & ckd_composite_2==0 & ckd_composite_3==0 & ckd_composite_4==. & ckd_composite_5==0 & ckd_composite_6==0 & albuminuria_7==1 & ckd_incidence_date==.
replace ckd_incidence_date=ACR_measurement_date_7 if ckd_composite_1==0 & ckd_composite_2==0 & ckd_composite_3==0 & ckd_composite_4==. & ckd_composite_5==0 & ckd_composite_6==0 & albuminuria_7==1 & egfr_bin_7==1 & ACR_measurement_date_7<creatinine_measurement_date_7
replace ckd_incidence_date=creatinine_measurement_date_7 if ckd_composite_1==0 & ckd_composite_2==0 & ckd_composite_3==0  & ckd_composite_4==. & ckd_composite_5==0 & ckd_composite_6==0 & albuminuria_7==1 & egfr_bin_7==1 & creatinine_measurement_date_7<ACR_measurement_date_7


replace ckd_incidence_date=creatinine_measurement_date_7 if ckd_composite_1==0 & ckd_composite_2==0 & ckd_composite_3==0 & ckd_composite_4==0 & ckd_composite_5==. & ckd_composite_6==0 & egfr_bin_7==1
replace ckd_incidence_date=ACR_measurement_date_7 if ckd_composite_1==0 & ckd_composite_2==0 & ckd_composite_3==0 & ckd_composite_4==0 & ckd_composite_5==. & ckd_composite_6==0 & albuminuria_7==1 & ckd_incidence_date==.
replace ckd_incidence_date=ACR_measurement_date_7 if ckd_composite_1==0 & ckd_composite_2==0 & ckd_composite_3==0 & ckd_composite_4==0 & ckd_composite_5==. & ckd_composite_6==0 & albuminuria_7==1 & egfr_bin_7==1 & ACR_measurement_date_7<creatinine_measurement_date_7
replace ckd_incidence_date=creatinine_measurement_date_7 if ckd_composite_1==0 & ckd_composite_2==0 & ckd_composite_3==0  & ckd_composite_4==0 & ckd_composite_5==. & ckd_composite_6==0 & albuminuria_7==1 & egfr_bin_7==1 & creatinine_measurement_date_7<ACR_measurement_date_7


replace ckd_incidence_date=creatinine_measurement_date_7 if ckd_composite_1==0 & ckd_composite_2==0 & ckd_composite_3==0 & ckd_composite_4==0 & ckd_composite_5==0 & ckd_composite_6==. & egfr_bin_7==1
replace ckd_incidence_date=ACR_measurement_date_7 if ckd_composite_1==0 & ckd_composite_2==0 & ckd_composite_3==0 & ckd_composite_4==0 & ckd_composite_5==0 & ckd_composite_6==. & albuminuria_7==1 & ckd_incidence_date==.
replace ckd_incidence_date=ACR_measurement_date_7 if ckd_composite_1==0 & ckd_composite_2==0 & ckd_composite_3==0 & ckd_composite_4==0 & ckd_composite_5==0 & ckd_composite_6==. & albuminuria_7==1 & egfr_bin_7==1 & ACR_measurement_date_7<creatinine_measurement_date_7
replace ckd_incidence_date=creatinine_measurement_date_7 if ckd_composite_1==0 & ckd_composite_2==0 & ckd_composite_3==0  & ckd_composite_4==0 & ckd_composite_5==0 & ckd_composite_6==0 & albuminuria_7==1 & egfr_bin_7==1 & creatinine_measurement_date_7<ACR_measurement_date_7


replace ckd_incidence_date=creatinine_measurement_date_7 if ckd_composite_1==0 & ckd_composite_2==. & ckd_composite_3==. & ckd_composite_4==0 & ckd_composite_5==0 & ckd_composite_6==0 & egfr_bin_7==1
replace ckd_incidence_date=ACR_measurement_date_7 if ckd_composite_1==0 & ckd_composite_2==. & ckd_composite_3==. & ckd_composite_4==0 & ckd_composite_5==0 & ckd_composite_6==0 & albuminuria_7==1 & ckd_incidence_date==.
replace ckd_incidence_date=ACR_measurement_date_7 if ckd_composite_1==0 & ckd_composite_2==. & ckd_composite_3==. & ckd_composite_4==0 & ckd_composite_5==0 & ckd_composite_6==0 & albuminuria_7==1 & egfr_bin_7==1 & ACR_measurement_date_7<creatinine_measurement_date_7
replace ckd_incidence_date=creatinine_measurement_date_7 if ckd_composite_1==0 & ckd_composite_2==. & ckd_composite_3==.  & ckd_composite_4==0 & ckd_composite_5==0 & ckd_composite_6==0 & albuminuria_7==1 & egfr_bin_7==1 & creatinine_measurement_date_7<ACR_measurement_date_7


replace ckd_incidence_date=creatinine_measurement_date_7 if ckd_composite_1==0 & ckd_composite_2==. & ckd_composite_3==. & ckd_composite_4==. & ckd_composite_5==0 & ckd_composite_6==0 & egfr_bin_7==1
replace ckd_incidence_date=ACR_measurement_date_7 if ckd_composite_1==0 & ckd_composite_2==. & ckd_composite_3==. & ckd_composite_4==. & ckd_composite_5==0 & ckd_composite_6==0 & albuminuria_7==1 & ckd_incidence_date==.
replace ckd_incidence_date=ACR_measurement_date_7 if ckd_composite_1==0 & ckd_composite_2==. & ckd_composite_3==. & ckd_composite_4==. & ckd_composite_5==0 & ckd_composite_6==0 & albuminuria_7==1 & egfr_bin_7==1 & ACR_measurement_date_7<creatinine_measurement_date_7
replace ckd_incidence_date=creatinine_measurement_date_7 if ckd_composite_1==0 & ckd_composite_2==. & ckd_composite_3==.  & ckd_composite_4==. & ckd_composite_5==0 & ckd_composite_6==0 & albuminuria_7==1 & egfr_bin_7==1 & creatinine_measurement_date_7<ACR_measurement_date_7


replace ckd_incidence_date=creatinine_measurement_date_7 if ckd_composite_1==0 & ckd_composite_2==. & ckd_composite_3==. & ckd_composite_4==. & ckd_composite_5==. & ckd_composite_6==0 & egfr_bin_7==1
replace ckd_incidence_date=ACR_measurement_date_7 if ckd_composite_1==0 & ckd_composite_2==. & ckd_composite_3==. & ckd_composite_4==. & ckd_composite_5==. & ckd_composite_6==0 & albuminuria_7==1 & ckd_incidence_date==.
replace ckd_incidence_date=ACR_measurement_date_7 if ckd_composite_1==0 & ckd_composite_2==. & ckd_composite_3==. & ckd_composite_4==. & ckd_composite_5==. & ckd_composite_6==0 & albuminuria_7==1 & egfr_bin_7==1 & ACR_measurement_date_7<creatinine_measurement_date_7
replace ckd_incidence_date=creatinine_measurement_date_7 if ckd_composite_1==0 & ckd_composite_2==. & ckd_composite_3==.  & ckd_composite_4==. & ckd_composite_5==. & ckd_composite_6==0 & albuminuria_7==1 & egfr_bin_7==1 & creatinine_measurement_date_7<ACR_measurement_date_7


replace ckd_incidence_date=creatinine_measurement_date_7 if ckd_composite_1==0 & ckd_composite_2==. & ckd_composite_3==. & ckd_composite_4==. & ckd_composite_5==. & ckd_composite_6==. & egfr_bin_7==1
replace ckd_incidence_date=ACR_measurement_date_7 if ckd_composite_1==0 & ckd_composite_2==. & ckd_composite_3==. & ckd_composite_4==. & ckd_composite_5==. & ckd_composite_6==. & albuminuria_7==1 & ckd_incidence_date==.
replace ckd_incidence_date=ACR_measurement_date_7 if ckd_composite_1==0 & ckd_composite_2==. & ckd_composite_3==. & ckd_composite_4==. & ckd_composite_5==. & ckd_composite_6==. & albuminuria_7==1 & egfr_bin_7==1 & ACR_measurement_date_7<creatinine_measurement_date_7
replace ckd_incidence_date=creatinine_measurement_date_7 if ckd_composite_1==0 & ckd_composite_2==. & ckd_composite_3==.  & ckd_composite_4==. & ckd_composite_5==. & ckd_composite_6==. & albuminuria_7==1 & egfr_bin_7==1 & creatinine_measurement_date_7<ACR_measurement_date_7


replace ckd_incidence_date=creatinine_measurement_date_7 if ckd_composite_1==0 & ckd_composite_2==0 & ckd_composite_3==. & ckd_composite_4==. & ckd_composite_5==. & ckd_composite_6==. & egfr_bin_7==1
replace ckd_incidence_date=ACR_measurement_date_7 if ckd_composite_1==0 & ckd_composite_2==0 & ckd_composite_3==. & ckd_composite_4==. & ckd_composite_5==. & ckd_composite_6==. & albuminuria_7==1 & ckd_incidence_date==.
replace ckd_incidence_date=ACR_measurement_date_7 if ckd_composite_1==0 & ckd_composite_2==0 & ckd_composite_3==. & ckd_composite_4==. & ckd_composite_5==. & ckd_composite_6==. & albuminuria_7==1 & egfr_bin_7==1 & ACR_measurement_date_7<creatinine_measurement_date_7
replace ckd_incidence_date=creatinine_measurement_date_7 if ckd_composite_1==0 & ckd_composite_2==0 & ckd_composite_3==.  & ckd_composite_4==. & ckd_composite_5==. & ckd_composite_6==. & albuminuria_7==1 & egfr_bin_7==1 & creatinine_measurement_date_7<ACR_measurement_date_7


replace ckd_incidence_date=creatinine_measurement_date_7 if ckd_composite_1==0 & ckd_composite_2==0 & ckd_composite_3==0 & ckd_composite_4==. & ckd_composite_5==. & ckd_composite_6==0 & egfr_bin_7==1
replace ckd_incidence_date=ACR_measurement_date_7 if ckd_composite_1==0 & ckd_composite_2==0 & ckd_composite_3==0 & ckd_composite_4==. & ckd_composite_5==. & ckd_composite_6==0 & albuminuria_7==1 & ckd_incidence_date==.
replace ckd_incidence_date=ACR_measurement_date_7 if ckd_composite_1==0 & ckd_composite_2==0 & ckd_composite_3==0 & ckd_composite_4==. & ckd_composite_5==. & ckd_composite_6==0 & albuminuria_7==1 & egfr_bin_7==1 & ACR_measurement_date_7<creatinine_measurement_date_7
replace ckd_incidence_date=creatinine_measurement_date_7 if ckd_composite_1==0 & ckd_composite_2==0 & ckd_composite_3==0  & ckd_composite_4==. & ckd_composite_5==. & ckd_composite_6==0 & albuminuria_7==1 & egfr_bin_7==1 & creatinine_measurement_date_7<ACR_measurement_date_7


replace ckd_incidence_date=creatinine_measurement_date_7 if ckd_composite_1==0 & ckd_composite_2==0 & ckd_composite_3==. & ckd_composite_4==. & ckd_composite_5==0 & ckd_composite_6==0 & egfr_bin_7==1
replace ckd_incidence_date=ACR_measurement_date_7 if ckd_composite_1==0 & ckd_composite_2==0 & ckd_composite_3==. & ckd_composite_4==. & ckd_composite_5==0 & ckd_composite_6==0 & albuminuria_7==1 & ckd_incidence_date==.
replace ckd_incidence_date=ACR_measurement_date_7 if ckd_composite_1==0 & ckd_composite_2==0 & ckd_composite_3==. & ckd_composite_4==. & ckd_composite_5==0 & ckd_composite_6==0 & albuminuria_7==1 & egfr_bin_7==1 & ACR_measurement_date_7<creatinine_measurement_date_7
replace ckd_incidence_date=creatinine_measurement_date_7 if ckd_composite_1==0 & ckd_composite_2==0 & ckd_composite_3==.  & ckd_composite_4==. & ckd_composite_5==0 & ckd_composite_6==0 & albuminuria_7==1 & egfr_bin_7==1 & creatinine_measurement_date_7<ACR_measurement_date_7


replace ckd_incidence_date=creatinine_measurement_date_7 if ckd_composite_1==0 & ckd_composite_2==0 & ckd_composite_3==0 & ckd_composite_4==0 & ckd_composite_5==. & ckd_composite_6==. & egfr_bin_7==1
replace ckd_incidence_date=ACR_measurement_date_7 if ckd_composite_1==0 & ckd_composite_2==0 & ckd_composite_3==0 & ckd_composite_4==0 & ckd_composite_5==. & ckd_composite_6==. & albuminuria_7==1 & ckd_incidence_date==.
replace ckd_incidence_date=ACR_measurement_date_7 if ckd_composite_1==0 & ckd_composite_2==0 & ckd_composite_3==0 & ckd_composite_4==0 & ckd_composite_5==. & ckd_composite_6==. & albuminuria_7==1 & egfr_bin_7==1 & ACR_measurement_date_7<creatinine_measurement_date_7
replace ckd_incidence_date=creatinine_measurement_date_7 if ckd_composite_1==0 & ckd_composite_2==0 & ckd_composite_3==0  & ckd_composite_4==0 & ckd_composite_5==. & ckd_composite_6==. & albuminuria_7==1 & egfr_bin_7==1 & creatinine_measurement_date_7<ACR_measurement_date_7

replace ckd_incidence_date=creatinine_measurement_date_7 if ckd_composite_1==0 & ckd_composite_2==0 & ckd_composite_3==. & ckd_composite_4==. & ckd_composite_5==. & ckd_composite_6==0 & egfr_bin_7==1
replace ckd_incidence_date=ACR_measurement_date_7 if ckd_composite_1==0 & ckd_composite_2==0 & ckd_composite_3==. & ckd_composite_4==. & ckd_composite_5==. & ckd_composite_6==0 & albuminuria_7==1 & ckd_incidence_date==.
replace ckd_incidence_date=ACR_measurement_date_7 if ckd_composite_1==0 & ckd_composite_2==0 & ckd_composite_3==. & ckd_composite_4==. & ckd_composite_5==. & ckd_composite_6==0 & albuminuria_7==1 & egfr_bin_7==1 & ACR_measurement_date_7<creatinine_measurement_date_7
replace ckd_incidence_date=creatinine_measurement_date_7 if ckd_composite_1==0 & ckd_composite_2==0 & ckd_composite_3==.  & ckd_composite_4==. & ckd_composite_5==. & ckd_composite_6==0 & albuminuria_7==1 & egfr_bin_7==1 & creatinine_measurement_date_7<ACR_measurement_date_7


replace ckd_incidence_date=creatinine_measurement_date_7 if ckd_composite_1==0 & ckd_composite_2==. & ckd_composite_3==. & ckd_composite_4==. & ckd_composite_5==0 & ckd_composite_6==. & egfr_bin_7==1
replace ckd_incidence_date=ACR_measurement_date_7 if ckd_composite_1==0 & ckd_composite_2==. & ckd_composite_3==. & ckd_composite_4==. & ckd_composite_5==0 & ckd_composite_6==. & albuminuria_7==1 & ckd_incidence_date==.
replace ckd_incidence_date=ACR_measurement_date_7 if ckd_composite_1==0 & ckd_composite_2==. & ckd_composite_3==. & ckd_composite_4==. & ckd_composite_5==0 &ckd_composite_6==. & albuminuria_7==1 & egfr_bin_7==1 & ACR_measurement_date_7<creatinine_measurement_date_7
replace ckd_incidence_date=creatinine_measurement_date_7 if ckd_composite_1==0 & ckd_composite_2==. & ckd_composite_3==.  & ckd_composite_4==. & ckd_composite_5==0 & ckd_composite_6==. & albuminuria_7==1 & egfr_bin_7==1 & creatinine_measurement_date_7<ACR_measurement_date_7


replace ckd_incidence_date=creatinine_measurement_date_7 if ckd_composite_1==0 & ckd_composite_2==. & ckd_composite_3==0 & ckd_composite_4==. & ckd_composite_5==. & ckd_composite_6==. & egfr_bin_7==1
replace ckd_incidence_date=ACR_measurement_date_7 if ckd_composite_1==0 & ckd_composite_2==. & ckd_composite_3==0 & ckd_composite_4==. & ckd_composite_5==. & ckd_composite_6==. & albuminuria_7==1 & ckd_incidence_date==.
replace ckd_incidence_date=ACR_measurement_date_7 if ckd_composite_1==0 & ckd_composite_2==. & ckd_composite_3==0 & ckd_composite_4==. & ckd_composite_5==. & ckd_composite_6==. & albuminuria_7==1 & egfr_bin_7==1 & ACR_measurement_date_7<creatinine_measurement_date_7
replace ckd_incidence_date=creatinine_measurement_date_7 if ckd_composite_1==0 & ckd_composite_2==. & ckd_composite_3==0  & ckd_composite_4==. & ckd_composite_5==. & ckd_composite_6==. & albuminuria_7==1 & egfr_bin_7==1 & creatinine_measurement_date_7<ACR_measurement_date_7


replace ckd_incidence_date=creatinine_measurement_date_7 if ckd_composite_1==0 & ckd_composite_2==. & ckd_composite_3==0 & ckd_composite_4==. & ckd_composite_5==0 & ckd_composite_6==0 & egfr_bin_7==1
replace ckd_incidence_date=ACR_measurement_date_7 if ckd_composite_1==0 & ckd_composite_2==. & ckd_composite_3==0 & ckd_composite_4==. & ckd_composite_5==0 & ckd_composite_6==0 & albuminuria_7==1 & ckd_incidence_date==.
replace ckd_incidence_date=ACR_measurement_date_7 if ckd_composite_1==0 & ckd_composite_2==. & ckd_composite_3==0 & ckd_composite_4==. & ckd_composite_5==0 & ckd_composite_6==0 & albuminuria_7==1 & egfr_bin_7==1 & ACR_measurement_date_7<creatinine_measurement_date_7
replace ckd_incidence_date=creatinine_measurement_date_7 if ckd_composite_1==0 & ckd_composite_2==. & ckd_composite_3==0  & ckd_composite_4==0 & ckd_composite_5==0 & ckd_composite_6==0 & albuminuria_7==1 & egfr_bin_7==1 & creatinine_measurement_date_7<ACR_measurement_date_7

replace ckd_incidence_date=creatinine_measurement_date_7 if ckd_composite_1==0 & ckd_composite_2==. & ckd_composite_3==0 & ckd_composite_4==. & ckd_composite_5==. & ckd_composite_6==0 & egfr_bin_7==1
replace ckd_incidence_date=ACR_measurement_date_7 if ckd_composite_1==0 & ckd_composite_2==. & ckd_composite_3==0 & ckd_composite_4==. & ckd_composite_5==. & ckd_composite_6==0 & albuminuria_7==1 & ckd_incidence_date==.
replace ckd_incidence_date=ACR_measurement_date_7 if ckd_composite_1==0 & ckd_composite_2==. & ckd_composite_3==0 & ckd_composite_4==. & ckd_composite_5==. & ckd_composite_6==0 & albuminuria_7==1 & egfr_bin_7==1 & ACR_measurement_date_7<creatinine_measurement_date_7
replace ckd_incidence_date=creatinine_measurement_date_7 if ckd_composite_1==0 & ckd_composite_2==. & ckd_composite_3==0  & ckd_composite_4==. & ckd_composite_5==. & ckd_composite_6==0 & albuminuria_7==1 & egfr_bin_7==1 & creatinine_measurement_date_7<ACR_measurement_date_7


replace ckd_incidence_date=creatinine_measurement_date_7 if ckd_composite_1==0 & ckd_composite_2==0 & ckd_composite_3==. & ckd_composite_4==0 & ckd_composite_5==. & ckd_composite_6==. & egfr_bin_7==1
replace ckd_incidence_date=ACR_measurement_date_7 if ckd_composite_1==0 & ckd_composite_2==0 & ckd_composite_3==. & ckd_composite_4==0 & ckd_composite_5==. & ckd_composite_6==. & albuminuria_7==1 & ckd_incidence_date==.
replace ckd_incidence_date=ACR_measurement_date_7 if ckd_composite_1==0 & ckd_composite_2==0 & ckd_composite_3==. & ckd_composite_4==0 & ckd_composite_5==. & ckd_composite_6==. & albuminuria_7==1 & egfr_bin_7==1 & ACR_measurement_date_7<creatinine_measurement_date_7
replace ckd_incidence_date=creatinine_measurement_date_7 if ckd_composite_1==0 & ckd_composite_2==0 & ckd_composite_3==.  & ckd_composite_4==0 & ckd_composite_5==. & ckd_composite_6==. & albuminuria_7==1 & egfr_bin_7==1 & creatinine_measurement_date_7<ACR_measurement_date_7


replace ckd_incidence_date=creatinine_measurement_date_7 if ckd_composite_1==0 & ckd_composite_2==0 & ckd_composite_3==. & ckd_composite_4==0 & ckd_composite_5==. & ckd_composite_6==0 & egfr_bin_7==1
replace ckd_incidence_date=ACR_measurement_date_7 if ckd_composite_1==0 & ckd_composite_2==0 & ckd_composite_3==. & ckd_composite_4==0 & ckd_composite_5==. & ckd_composite_6==0 & albuminuria_7==1 & ckd_incidence_date==.
replace ckd_incidence_date=ACR_measurement_date_7 if ckd_composite_1==0 & ckd_composite_2==0 & ckd_composite_3==. & ckd_composite_4==0 & ckd_composite_5==. & ckd_composite_6==0 & albuminuria_7==1 & egfr_bin_7==1 & ACR_measurement_date_7<creatinine_measurement_date_7
replace ckd_incidence_date=creatinine_measurement_date_7 if ckd_composite_1==0 & ckd_composite_2==0 & ckd_composite_3==.  & ckd_composite_4==0 & ckd_composite_5==. & ckd_composite_6==0 & albuminuria_7==1 & egfr_bin_7==1 & creatinine_measurement_date_7<ACR_measurement_date_7


replace ckd_incidence_date=creatinine_measurement_date_7 if ckd_composite_1==0 & ckd_composite_2==0 & ckd_composite_3==. & ckd_composite_4==. & ckd_composite_5==0 & ckd_composite_6==. & egfr_bin_7==1
replace ckd_incidence_date=ACR_measurement_date_7 if ckd_composite_1==0 & ckd_composite_2==0 & ckd_composite_3==. & ckd_composite_4==. & ckd_composite_5==0 & ckd_composite_6==. & albuminuria_7==1 & ckd_incidence_date==.
replace ckd_incidence_date=ACR_measurement_date_7 if ckd_composite_1==0 & ckd_composite_2==0 & ckd_composite_3==. & ckd_composite_4==. & ckd_composite_5==0 & ckd_composite_6==. & albuminuria_7==1 & egfr_bin_7==1 & ACR_measurement_date_7<creatinine_measurement_date_7
replace ckd_incidence_date=creatinine_measurement_date_7 if ckd_composite_1==0 & ckd_composite_2==0 & ckd_composite_3==.  & ckd_composite_4==. & ckd_composite_5==0 & ckd_composite_6==0 & albuminuria_7==1 & egfr_bin_7==1 & creatinine_measurement_date_7<ACR_measurement_date_7


replace ckd_incidence_date=creatinine_measurement_date_7 if ckd_composite_1==0 & ckd_composite_2==. & ckd_composite_3==0 & ckd_composite_4==0 & ckd_composite_5==. & ckd_composite_6==0 & egfr_bin_7==1
replace ckd_incidence_date=ACR_measurement_date_7 if ckd_composite_1==0 & ckd_composite_2==. & ckd_composite_3==0 & ckd_composite_4==0 & ckd_composite_5==. & ckd_composite_6==0 & albuminuria_7==1 & ckd_incidence_date==.
replace ckd_incidence_date=ACR_measurement_date_7 if ckd_composite_1==0 & ckd_composite_2==. & ckd_composite_3==0 & ckd_composite_4==0 & ckd_composite_5==. & ckd_composite_6==0 & albuminuria_7==1 & egfr_bin_7==1 & ACR_measurement_date_7<creatinine_measurement_date_7
replace ckd_incidence_date=creatinine_measurement_date_7 if ckd_composite_1==0 & ckd_composite_2==. & ckd_composite_3==0  & ckd_composite_4==0 & ckd_composite_5==. & ckd_composite_6==0 & albuminuria_7==1 & egfr_bin_7==1 & creatinine_measurement_date_7<ACR_measurement_date_7


replace ckd_incidence_date=creatinine_measurement_date_7 if ckd_composite_1==0 & ckd_composite_2==. & ckd_composite_3==0 & ckd_composite_4==0 & ckd_composite_5==. & ckd_composite_6==. & egfr_bin_7==1
replace ckd_incidence_date=ACR_measurement_date_7 if ckd_composite_1==0 & ckd_composite_2==. & ckd_composite_3==0 & ckd_composite_4==0 & ckd_composite_5==. & ckd_composite_6==. & albuminuria_7==1 & ckd_incidence_date==.
replace ckd_incidence_date=ACR_measurement_date_7 if ckd_composite_1==0 & ckd_composite_2==. & ckd_composite_3==0 & ckd_composite_4==0 & ckd_composite_5==. & ckd_composite_6==. & albuminuria_7==1 & egfr_bin_7==1 & ACR_measurement_date_7<creatinine_measurement_date_7
replace ckd_incidence_date=creatinine_measurement_date_7 if ckd_composite_1==0 & ckd_composite_2==. & ckd_composite_3==0  & ckd_composite_4==0 & ckd_composite_5==. & ckd_composite_6==. & albuminuria_7==1 & egfr_bin_7==1 & creatinine_measurement_date_7<ACR_measurement_date_7


replace ckd_incidence_date=creatinine_measurement_date_7 if ckd_composite_1==0 & ckd_composite_2==. & ckd_composite_3==0 & ckd_composite_4==0 & ckd_composite_5==0 & ckd_composite_6==. & egfr_bin_7==1
replace ckd_incidence_date=ACR_measurement_date_7 if ckd_composite_1==0 & ckd_composite_2==. & ckd_composite_3==0 & ckd_composite_4==0 & ckd_composite_5==0 & ckd_composite_6==. & albuminuria_7==1 & ckd_incidence_date==.
replace ckd_incidence_date=ACR_measurement_date_7 if ckd_composite_1==0 & ckd_composite_2==. & ckd_composite_3==0 & ckd_composite_4==0 & ckd_composite_5==0 & ckd_composite_6==. & albuminuria_7==1 & egfr_bin_7==1 & ACR_measurement_date_7<creatinine_measurement_date_7
replace ckd_incidence_date=creatinine_measurement_date_7 if ckd_composite_1==0 & ckd_composite_2==. & ckd_composite_3==0  & ckd_composite_4==0 & ckd_composite_5==0 & ckd_composite_6==. & albuminuria_7==1 & egfr_bin_7==1 & creatinine_measurement_date_7<ACR_measurement_date_7

replace ckd_incidence_date=creatinine_measurement_date_7 if ckd_composite_1==0 & ckd_composite_2==. & ckd_composite_3==. & ckd_composite_4==0 & ckd_composite_5==0 & ckd_composite_6==. & egfr_bin_7==1
replace ckd_incidence_date=ACR_measurement_date_7 if ckd_composite_1==0 & ckd_composite_2==. & ckd_composite_3==. & ckd_composite_4==0 & ckd_composite_5==0 & ckd_composite_6==. & albuminuria_7==1 & ckd_incidence_date==.
replace ckd_incidence_date=ACR_measurement_date_7 if ckd_composite_1==0 & ckd_composite_2==. & ckd_composite_3==. & ckd_composite_4==0 & ckd_composite_5==0 & ckd_composite_6==. & albuminuria_7==1 & egfr_bin_7==1 & ACR_measurement_date_7<creatinine_measurement_date_7
replace ckd_incidence_date=creatinine_measurement_date_7 if ckd_composite_1==0 & ckd_composite_2==. & ckd_composite_3==.  & ckd_composite_4==0 & ckd_composite_5==0 & ckd_composite_6==. & albuminuria_7==1 & egfr_bin_7==1 & creatinine_measurement_date_7<ACR_measurement_date_7

replace ckd_incidence_date=creatinine_measurement_date_7 if ckd_composite_1==0 & ckd_composite_2==. & ckd_composite_3==. & ckd_composite_4==0 & ckd_composite_5==. & ckd_composite_6==0 & egfr_bin_7==1
replace ckd_incidence_date=ACR_measurement_date_7 if ckd_composite_1==0 & ckd_composite_2==. & ckd_composite_3==. & ckd_composite_4==0 & ckd_composite_5==. & ckd_composite_6==0 & albuminuria_7==1 & ckd_incidence_date==.
replace ckd_incidence_date=ACR_measurement_date_7 if ckd_composite_1==0 & ckd_composite_2==. & ckd_composite_3==. & ckd_composite_4==0 & ckd_composite_5==. & ckd_composite_6==0 & albuminuria_7==1 & egfr_bin_7==1 & ACR_measurement_date_7<creatinine_measurement_date_7
replace ckd_incidence_date=creatinine_measurement_date_7 if ckd_composite_1==0 & ckd_composite_2==. & ckd_composite_3==.  & ckd_composite_4==0 & ckd_composite_5==. & ckd_composite_6==0 & albuminuria_7==1 & egfr_bin_7==1 & creatinine_measurement_date_7<ACR_measurement_date_7


replace ckd_incidence_date=creatinine_measurement_date_7 if ckd_composite_1==0 & ckd_composite_2==0 & ckd_composite_3==. & ckd_composite_4==0 & ckd_composite_5==0 & ckd_composite_6==. & egfr_bin_7==1
replace ckd_incidence_date=ACR_measurement_date_7 if ckd_composite_1==0 & ckd_composite_2==0 & ckd_composite_3==. & ckd_composite_4==0 & ckd_composite_5==0 & ckd_composite_6==. & albuminuria_7==1 & ckd_incidence_date==.
replace ckd_incidence_date=ACR_measurement_date_7 if ckd_composite_1==0 & ckd_composite_2==0 & ckd_composite_3==. & ckd_composite_4==0 & ckd_composite_5==0 & ckd_composite_6==. & albuminuria_7==1 & egfr_bin_7==1 & ACR_measurement_date_7<creatinine_measurement_date_7
replace ckd_incidence_date=creatinine_measurement_date_7 if ckd_composite_1==0 & ckd_composite_2==0 & ckd_composite_3==.  & ckd_composite_4==0 & ckd_composite_5==0 & ckd_composite_6==. & albuminuria_7==1 & egfr_bin_7==1 & creatinine_measurement_date_7<ACR_measurement_date_7


replace ckd_incidence_date=creatinine_measurement_date_7 if ckd_composite_1==0 & ckd_composite_2==0 & ckd_composite_3==0 & ckd_composite_4==. & ckd_composite_5==. & ckd_composite_6==. & egfr_bin_7==1
replace ckd_incidence_date=ACR_measurement_date_7 if ckd_composite_1==0 & ckd_composite_2==0 & ckd_composite_3==0 & ckd_composite_4==. & ckd_composite_5==. & ckd_composite_6==. & albuminuria_7==1 & ckd_incidence_date==.
replace ckd_incidence_date=ACR_measurement_date_7 if ckd_composite_1==0 & ckd_composite_2==0 & ckd_composite_3==0 & ckd_composite_4==. & ckd_composite_5==. & ckd_composite_6==. & albuminuria_7==1 & egfr_bin_7==1 & ACR_measurement_date_7<creatinine_measurement_date_7
replace ckd_incidence_date=creatinine_measurement_date_7 if ckd_composite_1==0 & ckd_composite_2==0 & ckd_composite_3==0  & ckd_composite_4==. & ckd_composite_5==. & ckd_composite_6==. & albuminuria_7==1 & egfr_bin_7==1 & creatinine_measurement_date_7<ACR_measurement_date_7

format ckd_incidence_date %td

replace ckd_incidence_date=.b if ckd_incidence_date<td(01jan2017)


/*generate variable to indicate if CKD incident within study period*/
gen ckd_incident=0 if ckd_composite_1==0
replace ckd_incident=1 if ckd_composite_1==0 & (ckd_composite_2==1 | ckd_composite_3==1 | ckd_composite_4==1 | ckd_composite_5==1 | ckd_composite_6==1 | ckd_composite_7==1)



/*generate marker of adverse renal outcomes*/

*1. First eGFR measurement<15*/

gen egfr_15_1=0 if egfr>=15 & egfr!=.
replace egfr_15_1=1 if egfr<15


gen egfr_15_2=0 if egfr_2>=15 & egfr_2!=.
replace egfr_15_2=1 if egfr_2<15

gen egfr_15_3=0 if egfr_3>=15 & egfr_3!=.
replace egfr_15_3=1 if egfr_3<15

gen egfr_15_4=0 if egfr_4>=15 & egfr_4!=.
replace egfr_15_4=1 if egfr_4<15

gen egfr_15_5=0 if egfr_5>=15 & egfr_5!=.
replace egfr_15_5=1 if egfr_5<15

gen egfr_15_6=0 if egfr_6>=15 & egfr_6!=.
replace egfr_15_6=1 if egfr_6<15

gen egfr_15_7=0 if egfr_7>=15 & egfr_7!=.
replace egfr_15_7=1 if egfr_7<15

gen egfr_reduced_15=0 if egfr_15_1==0
replace egfr_reduced_15=1 if egfr_15_1==0 & (egfr_15_2==1 | egfr_15_3==1 | egfr_15_4==1 | egfr_15_5==1 | egfr_15_6==1 | egfr_15_7==1)

replace egfr_reduced_15=.b if egfr_15_1==1

/*date first eGFR measurement<15*/
gen egfr_15_date=.

replace egfr_15_date=creatinine_measurement_date_2 if egfr_15_1==0 & egfr_15_2==1

replace egfr_15_date=creatinine_measurement_date_3 if egfr_15_1==0 & egfr_15_2==0 & egfr_15_3==1


replace egfr_15_date=creatinine_measurement_date_4 if egfr_15_1==0 & egfr_15_2==0 & egfr_15_3==0 & egfr_15_4==1


replace egfr_15_date=creatinine_measurement_date_5 if egfr_15_1==0 & egfr_15_2==0 & egfr_15_3==0 & egfr_15_4==0 & egfr_15_5==1

replace egfr_15_date=creatinine_measurement_date_6 if egfr_15_1==0 & egfr_15_2==0 & egfr_15_3==0 & egfr_15_4==0 & egfr_15_5==0 & egfr_15_6==1

replace egfr_15_date=creatinine_measurement_date_7 if egfr_15_1==0 & egfr_15_2==0 & egfr_15_3==0 & egfr_15_4==0 & egfr_15_5==0 & egfr_15_6==0 &egfr_15_7==1