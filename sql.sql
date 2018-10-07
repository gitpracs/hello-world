SELECT
                INTGR_METRC_PERF_ID,
                METRC_TYP_DSPL_ORD_NBR,
                METRC_TYP_NM,
                FISC_YR_MNTH_NBR,
                FISC_MNTH,
                FISC_YR,
                CAL_MNTH_NM,
                case when to_char(sysdate,'YYYY') = fisc_yr
      and to_char(sysdate,'MM') = 11
      and to_char(sysdate,'DD') <= '15'
     then 'DEFAULT'
     when to_char(to_date((sysdate), 'YYYY MM DD'),'YYYY') = fisc_yr
      and to_char(sysdate,'MM') < 10
     then 'DEFAULT'
     when to_char(dateadd(year,1,sysdate),'YYYY') = fisc_yr
      and (
           (    to_char(sysdate,'MM') = 11
            and to_char(sysdate,'DD') >= '16')
          or to_char(sysdate,'MM') = 12)
     then 'DEFAULT'
    else to_char(fisc_yr)
    end as FISC_YR_FLTR,
                case when Upper(to_char(CAL_YR)||CAL_MNTH_NM) = trim(to_char(case when to_char(sysdate,'DD') between '01' and '15'
                                                                                                                                   then add_months(sysdate,-2)
                                                                                                                                   else add_months(sysdate,-1)
                                                                                                                                   end,'YYYYMONTH'))
     then 'DEFAULT'
     else upper(CAL_MNTH_NM)
     end as CAL_MNTH_NM_FLTR,
                CAL_YR,
                METRC_LVL_NM,
                METRC_NM,
                METRC_DSPL_NM,
                METRC_DSPL_ORD_NBR,
---------------------------------------------------------------------------------

CASE 

WHEN METRC_TYP_NM  = 'Food & Beverage Direct Cost Recovery' and METRC_NM in ('SPECIAL TRAINS') then null
                --Whole Numbers
                WHEN (METRC_TYP_NM  = 'Cost Recovery Ratio'
        or METRC_TYP_NM  = 'Food & Beverage Direct Cost Recovery'
        --or METRC_TYP_NM  = 'Customer Satisfaction Index (eCSI)'
        or METRC_TYP_NM  = 'Endpoint On Time Performance'
        or METRC_TYP_NM  = 'All Stations On Time Performance'
        or METRC_TYP_NM  = 'Ridership'
        or METRC_TYP_NM  = 'Initial Terminal Performance'
        or METRC_TYP_NM  = 'Amtrak Responsible Delay'
        or METRC_TYP_NM  = 'Amtrak as Host Delay'
        or METRC_TYP_NM  = 'Engineering Responsible Delay - Acela'
        or METRC_TYP_NM  = 'Fleet Reliability - Mean Miles Between Service Interruptions'
        or METRC_TYP_NM  = 'Serious Injuries and Fatalities'
                                or METRC_TYP_NM  = 'Sprains and Strains'
                                or METRC_TYP_NM  = 'Major Operating Rules Violations'
                                or METRC_TYP_NM  = 'Fully Allocated Contribution/(loss) (thousands)'
                                or METRC_TYP_NM  = 'Adjusted Operating Earnings/(thousands)'
        or METRC_TYP_NM  = 'Operating Income/(loss) (thousands)'
        )
        and round(METRC_FYTD_ACTL_SCR) is not null
     Then round(METRC_FYTD_ACTL_SCR) 
     
     -- 1 Decimal Place
                WHEN (METRC_TYP_NM  = 'Praise-to-Complaint Ratio (On-Board)'
                    or METRC_TYP_NM  = 'Customer Satisfaction Index (eCSI)'
        or METRC_TYP_NM  = 'Passenger Injuries per 100 million Passenger Miles')
    and round(METRC_FYTD_ACTL_SCR) is not null
     Then round(METRC_FYTD_ACTL_SCR,1) 
                
                
                  -- 2 Decimal Place
                WHEN (METRC_TYP_NM  = 'S2S Contact Rate'
                                                or metrc_typ_nm = 'FRA Reportable Incident Rate')
    and round(METRC_FYTD_ACTL_SCR) is not null
     Then round(METRC_FYTD_ACTL_SCR,2) 
                
                -- 4 Decimal Place
                WHEN (METRC_TYP_NM  = 'Cost per Available Seat Mile (CASM)'
                or METRC_TYP_NM  = 'Revenue per Available Seat Mile (RASM)')
    and round(METRC_FYTD_ACTL_SCR) is not null
     Then round(METRC_FYTD_ACTL_SCR,4) 
                
                
                else METRC_FYTD_ACTL_SCR END as METRC_FYTD_ACTL_SCR,
----------------------------------------------------------------------------------
----------------------------------------------------------------------------------
--Format FYTD Actual
----------------------------------------------------------------------------------
                CASE WHEN METRC_FYTD_ACTL_SCR is null then '' 
                
                WHEN METRC_TYP_NM  = 'Food & Beverage Direct Cost Recovery' and METRC_NM in ('SPECIAL TRAINS') then null

                                WHEN     ( METRC_TYP_NM  = 'Cost Recovery Ratio' 
                                                        or METRC_TYP_NM  = 'Food & Beverage Direct Cost Recovery'
                                                        or METRC_TYP_NM = 'Endpoint On Time Performance'
                                                        or METRC_TYP_NM  = 'All Stations On Time Performance'
                                                        or METRC_TYP_NM  = 'Initial Terminal Performance')
                                                        AND  METRC_FYTD_ACTL_SCR is not null
                                                        and METRC_FYTD_ACTL_SCR < 0
                                                
                                                then  '('||abs(cast(round(METRC_FYTD_ACTL_SCR) as varchar60))||'%'||')' 
                                                
                                WHEN     ( METRC_TYP_NM  = 'Cost Recovery Ratio' 
                                                        or METRC_TYP_NM  = 'Food & Beverage Direct Cost Recovery'
                                                        or METRC_TYP_NM = 'Endpoint On Time Performance'
                                                        or METRC_TYP_NM  = 'All Stations On Time Performance'
                                                        or METRC_TYP_NM  = 'Initial Terminal Performance')
                                                        AND  METRC_FYTD_ACTL_SCR is not null
                                                        and METRC_FYTD_ACTL_SCR >= 0
                                                
                                                then  cast(round(METRC_FYTD_ACTL_SCR) as varchar60)||'%'
                                                
------------------------------------------------------------------------------------  
                                                
                                                WHEN     (  METRC_TYP_NM  ='Passenger Injuries per 100 million Passenger Miles'
                                                                                               or METRC_TYP_NM  = 'Customer Satisfaction Index (eCSI)')
                                                        AND  METRC_FYTD_ACTL_SCR is not null
                                                        and METRC_FYTD_ACTL_SCR < 0
                                                        
                                                 then  '('|| abs(LTRIM(LTRIM(to_char(cast(round(METRC_FYTD_ACTL_SCR,1) as varchar60),'000.0')),'0'))||')'    
                                                        


                                                WHEN     (  METRC_TYP_NM  ='Passenger Injuries per 100 million Passenger Miles'
                                                                                               or METRC_TYP_NM  = 'Customer Satisfaction Index (eCSI)')
                                                        AND  METRC_FYTD_ACTL_SCR is not null
                                                        and METRC_FYTD_ACTL_SCR >= 0
                                                        
                                                 then  LTRIM(LTRIM(to_char(cast(round(METRC_FYTD_ACTL_SCR,1) as varchar60),'000.0')),'0')
                

-------------------------------------------------------------------------------------                
                                                
                                                WHEN     ( METRC_TYP_NM  = 'Praise-to-Complaint Ratio (On-Board)')
                                                        AND  METRC_FYTD_ACTL_SCR is not null
                                                        AND  METRC_FYTD_ACTL_SCR < 0
                                                
                                                then  '('||abs(cast(round(METRC_FYTD_ACTL_SCR,1) as varchar60))||'%)' 
                                                
                                                
                                                 WHEN     ( METRC_TYP_NM  = 'Praise-to-Complaint Ratio (On-Board)')
                                                        AND  METRC_FYTD_ACTL_SCR is not null
                                                        AND  METRC_FYTD_ACTL_SCR >= 0
                                                
                                                then  cast(round(METRC_FYTD_ACTL_SCR,1) as varchar60)||'%' 
                                                                
----------------------------------------------------------------------------------------                                            

                                                WHEN (METRC_TYP_NM  = 'Fully Allocated Contribution/(loss) (thousands)'
                                                                                or METRC_TYP_NM  = 'Adjusted Operating Earnings/(thousands)'
                                                        or METRC_TYP_NM  = 'Operating Income/(loss) (thousands)')
                                                        and METRC_FYTD_ACTL_SCR is not null
                                                        and METRC_FYTD_ACTL_SCR < 0
                                                      
                                                
                                                Then '($'||ltrim(cast(to_char(abs(METRC_FYTD_ACTL_SCR),'999,999,999,999,999')||')' as varchar60), ' ')                                              
                                                
                                                
                                                WHEN (METRC_TYP_NM  = 'Fully Allocated Contribution/(loss) (thousands)'
                                                                                or METRC_TYP_NM  = 'Adjusted Operating Earnings/(thousands)'
                                                        or METRC_TYP_NM  = 'Operating Income/(loss) (thousands)')
                                                        and METRC_FYTD_ACTL_SCR is not null
                                                        and METRC_FYTD_ACTL_SCR >= 0
                                                      
                                                
                                                Then '$'||ltrim(cast(to_char(METRC_FYTD_ACTL_SCR,'999,999,999,999,999')as varchar60), ' ') 

------------------------------------------------------------------------------------------

                                                WHEN (METRC_TYP_NM = 'Revenue per Available Seat Mile (RASM)'
                                                or METRC_TYP_NM = 'Cost per Available Seat Mile (CASM)')
                                                and METRC_FYTD_ACTL_SCR is not null
                                                and METRC_FYTD_ACTL_SCR < 0
                                                
                                                Then '($'||abs(ltrim(cast(to_char(round(METRC_FYTD_ACTL_SCR,4), '0.0000' ) as varchar60)))||')' 


                                                WHEN (METRC_TYP_NM = 'Revenue per Available Seat Mile (RASM)'
                                                or METRC_TYP_NM = 'Cost per Available Seat Mile (CASM)')
                                                and METRC_FYTD_ACTL_SCR is not null
                                                and METRC_FYTD_ACTL_SCR >= 0
                                                
                                                Then '$'||ltrim(cast(to_char(round(METRC_FYTD_ACTL_SCR,4), '0.0000' ) as varchar60)) 

------------------------------------------------------------------------------------------
                                                WHEN (METRC_TYP_NM = 'S2S Contact Rate'
                                                or metrc_typ_nm = 'Major Operating Rules Ratios'
                                                or metrc_typ_nm = 'FRA Reportable Incident Rate')
                                                and METRC_FYTD_ACTL_SCR < 0
                                                
                                                Then '('||abs(cast(to_char(round(METRC_FYTD_ACTL_SCR,2), '0.00' ) as varchar60))||')' 
                                                
                                                
                                                WHEN (METRC_TYP_NM = 'S2S Contact Rate'
                                                or metrc_typ_nm = 'Major Operating Rules Ratios'
                                                or metrc_typ_nm = 'FRA Reportable Incident Rate')
                                                and METRC_FYTD_ACTL_SCR >= 0 and METRC_FYTD_ACTL_SCR < 10
                                                
                                                Then cast(to_char(round(METRC_FYTD_ACTL_SCR,2), '0.00' ) as varchar60)

                        WHEN (METRC_TYP_NM = 'S2S Contact Rate'
                                                or metrc_typ_nm = 'Major Operating Rules Ratios'
                                                or metrc_typ_nm = 'FRA Reportable Incident Rate')
                                                and METRC_FYTD_ACTL_SCR >= 10
                                                
                                                Then cast(to_char(round(METRC_FYTD_ACTL_SCR,2), '00.00' ) as varchar60)


else ltrim(cast(to_char(METRC_FYTD_ACTL_SCR,'999,999,999,999,999')as varchar60),' ')  end as FORMATTED_METRC_FYTD_ACTL_SCR,

----------------------------------------------------------------------------------
                --Format Business Line FYTD Actual
                CASE WHEN METRC_FYTD_ACTL_SCR is null then ' ' 

                                WHEN     ( METRC_TYP_NM  = 'Cost Recovery Ratio' 
                                                        or METRC_TYP_NM  = 'Food & Beverage Direct Cost Recovery'
                                                        or METRC_TYP_NM = 'Endpoint On Time Performance'
                                                        or METRC_TYP_NM  = 'All Stations On Time Performance'
                                                        or METRC_TYP_NM  = 'Initial Terminal Performance')
                                                        AND  METRC_FYTD_ACTL_SCR is not null
                                                
                                                then  cast(round(METRC_FYTD_ACTL_SCR) as varchar60)||'%' 
                                                
                                 WHEN     (  METRC_TYP_NM  ='Passenger Injuries per 100 million Passenger Miles'
                                                                               or METRC_TYP_NM  = 'Customer Satisfaction Index (eCSI)')
                                                        AND  METRC_FYTD_ACTL_SCR is not null
                                                
                                                then   LTRIM(LTRIM(to_char(cast(round(METRC_FYTD_ACTL_SCR,1) as varchar60),'000.0')),'0')
                                                
                                                WHEN     ( METRC_TYP_NM  = 'Praise-to-Complaint Ratio (On-Board)')
                                                        AND  METRC_FYTD_ACTL_SCR is not null
                                                
                                                then  cast(round(METRC_FYTD_ACTL_SCR,1) as varchar60)||'%' 
                                                

WHEN (METRC_TYP_NM  = 'Fully Allocated Contribution/(loss) (thousands)'
                                or METRC_TYP_NM  = 'Adjusted Operating Earnings/(thousands)'
        or METRC_TYP_NM  = 'Operating Income/(loss) (thousands)')
        and METRC_FYTD_ACTL_SCR is not null
        and METRC_NM = 'AMTRAK'
      

Then '($'||ltrim(cast(to_char(abs(METRC_FYTD_ACTL_SCR),'999,999,999,999,999')||')' as varchar60), ' ')                                          
                                                


WHEN (METRC_TYP_NM  = 'Fully Allocated Contribution/(loss) (thousands)'
                                or METRC_TYP_NM  = 'Adjusted Operating Earnings/(thousands)'
        or METRC_TYP_NM  = 'Operating Income/(loss) (thousands)')
        and METRC_FYTD_ACTL_SCR is not null
        and METRC_NM <> 'AMTRAK'
        and METRC_FYTD_ACTL_SCR < 0

THEN '($'||ltrim(cast(to_char(abs(METRC_FYTD_ACTL_SCR),'999,999,999,999,999')||')' as varchar60), ' ')           

WHEN (METRC_TYP_NM  = 'Fully Allocated Contribution/(loss) (thousands)'
                                or METRC_TYP_NM  = 'Adjusted Operating Earnings/(thousands)'
        or METRC_TYP_NM  = 'Operating Income/(loss) (thousands)')
        and METRC_FYTD_ACTL_SCR is not null
        and METRC_NM <> 'AMTRAK'
        and METRC_FYTD_ACTL_SCR > 0    

Then '$'||ltrim(cast(to_char(METRC_FYTD_ACTL_SCR,'999,999,999,999,999')as varchar60), ' ') 


WHEN (METRC_TYP_NM = 'Revenue per Available Seat Mile (RASM)'
or METRC_TYP_NM = 'Cost per Available Seat Mile (CASM)')
and METRC_FYTD_ACTL_SCR is not null

Then '$'||ltrim(cast(to_char(round(METRC_FYTD_ACTL_SCR,4), '0.0000' ) as varchar60)) 

WHEN (METRC_TYP_NM = 'S2S Contact Rate'
or metrc_typ_nm = 'Major Operating Rules Ratios'
or metrc_typ_nm = 'FRA Reportable Incident Rate')

Then cast(to_char(round(METRC_FYTD_ACTL_SCR,2), '0.00' ) as varchar60) 


else ltrim(cast(to_char(METRC_FYTD_ACTL_SCR,'999,999,999,999,999')as varchar60),' ')  end as FRMT_BL_METRC_FYTD_ACTL_SCR,

---------------------------------------------------------------------------------
                CASE WHEN (METRC_TYP_NM  = 'Fully Allocated Contribution/(loss) (thousands)'
                                or METRC_TYP_NM  = 'Adjusted Operating Earnings/(thousands)'
        or METRC_TYP_NM  = 'Operating Income/(loss) (thousands)')
        and METRC_FISC_MNTH_ACTL_SCR is not null

                Then METRC_FISC_MNTH_ACTL_SCR  else METRC_FISC_MNTH_ACTL_SCR END as METRC_FISC_MNTH_ACTL_SCR,
----------------------------------------------------------------------------------
--Formated Month Actual
                CASE WHEN METRC_FISC_MNTH_ACTL_SCR is null then '' 

                                WHEN     ( METRC_TYP_NM  = 'Cost Recovery Ratio' 
                                                        or METRC_TYP_NM  = 'Food & Beverage Direct Cost Recovery'
                                                        or METRC_TYP_NM = 'Endpoint On Time Performance'
                                                        or METRC_TYP_NM  = 'All Stations On Time Performance'
                                                        or METRC_TYP_NM  = 'Initial Terminal Performance'
                                                        or METRC_TYP_NM  = 'Praise-to-Complaint Ratio (On-Board)')
                                                        AND  METRC_FISC_MNTH_ACTL_SCR is not null
                                                
                                                then  cast(round(METRC_FISC_MNTH_ACTL_SCR) as varchar60)||'%' 
                                                
                                                
                                                WHEN     (  METRC_TYP_NM  ='Passenger Injuries per 100 million Passenger Miles')
                                                        AND  METRC_FISC_MNTH_ACTL_SCR is not null
                                                
                                                then  cast(round(METRC_FISC_MNTH_ACTL_SCR,1) as varchar60)
                                                
                                                WHEN     ( METRC_TYP_NM  = 'Praise-to-Complaint Ratio (On-Board)')
                                                        AND  METRC_FISC_MNTH_ACTL_SCR is not null
                                                
                                                then  cast(round(METRC_FISC_MNTH_ACTL_SCR,1) as varchar60)||'%' 


WHEN (METRC_TYP_NM  = 'Fully Allocated Contribution/(loss) (thousands)'
                                or METRC_TYP_NM  = 'Adjusted Operating Earnings/(thousands)'
        or METRC_TYP_NM  = 'Operating Income/(loss) (thousands)')
        and METRC_FISC_MNTH_ACTL_SCR is not null

Then '$'||ltrim(cast(to_char(METRC_FISC_MNTH_ACTL_SCR,'999,999,999,999,999') as varchar60), ' ') 


WHEN (METRC_TYP_NM = 'Revenue per Available Seat Mile (RASM)'
or METRC_TYP_NM = 'Cost per Available Seat Mile (CASM)')
and METRC_FISC_MNTH_ACTL_SCR is not null

Then '$'||ltrim(cast(to_char(round(METRC_FISC_MNTH_ACTL_SCR,4), '0.0000' ) as varchar60)) 


WHEN ( METRC_TYP_NM = 'S2S Contact Rate'
or metrc_typ_nm = 'Major Operating Rules Ratios'
or metrc_typ_nm = 'FRA Reportable Incident Rate')
and METRC_FISC_MNTH_ACTL_SCR is not null

Then cast(to_char(round(METRC_FISC_MNTH_ACTL_SCR,2), '0.00' ) as varchar60) 


else ltrim(cast(to_char(METRC_FISC_MNTH_ACTL_SCR,'999,999,999,999,999')as varchar60),' ')  end as FRMT_METRC_FISC_MNTH_ACTL_SCR,
                METRC_CMPNT_1_NM,
                METRC_CMPNT_1_ACTL_SCR,
                METRC_CMPNT_2_NM,
                METRC_CMPNT_2_ACTL_SCR,
                ---------------------------------------------------------------------------------
CASE 

--exclude high target numbers
     WHEN METRC_TYP_NM  = 'Food & Beverage Direct Cost Recovery' AND METRC_FYTD_GOAL_SCR > 500  
                THEN NULL
                
                WHEN METRC_TYP_NM  = 'Food & Beverage Direct Cost Recovery' and METRC_NM in ('SPECIAL TRAINS') then null
                
                --Whole Numbers
                WHEN (METRC_TYP_NM  = 'Cost Recovery Ratio'
        --or METRC_TYP_NM  = 'Customer Satisfaction Index (eCSI)'
        or METRC_TYP_NM  = 'Food & Beverage Direct Cost Recovery' 
        or METRC_TYP_NM  = 'Endpoint On Time Performance'
        or METRC_TYP_NM  = 'All Stations On Time Performance'
        or METRC_TYP_NM  = 'Ridership'
        or METRC_TYP_NM  = 'Initial Terminal Performance'
        or METRC_TYP_NM  = 'Amtrak Responsible Delay'
        or METRC_TYP_NM  = 'Amtrak as Host Delay'
        or METRC_TYP_NM  = 'Engineering Responsible Delay - Acela'
        or METRC_TYP_NM  = 'Fleet Reliability - Mean Miles Between Service Interruptions'
        or METRC_TYP_NM  = 'Serious Injuries and Fatalities'
                                or METRC_TYP_NM  = 'Sprains and Strains'
                                or METRC_TYP_NM  = 'Major Operating Rules Violations'
                                or METRC_TYP_NM  = 'Fully Allocated Contribution/(loss) (thousands)'
        or METRC_TYP_NM  = 'Operating Income/(loss) (thousands)'
        )
        and round(METRC_FYTD_GOAL_SCR) is not null
     Then round(METRC_FYTD_GOAL_SCR) 
     
     
     -- 1 Decimal Place
                WHEN (METRC_TYP_NM  = 'Praise-to-Complaint Ratio (On-Board)'
        or METRC_TYP_NM  = 'Passenger Injuries per 100 million Passenger Miles'
        or METRC_TYP_NM  = 'Customer Satisfaction Index (eCSI)')
    and round(METRC_FYTD_GOAL_SCR) is not null
     Then round(METRC_FYTD_GOAL_SCR,1) 
                
                
                  -- 2 Decimal Place
                WHEN (METRC_TYP_NM  = 'S2S Contact Rate'
                or metrc_typ_nm = 'FRA Reportable Incident Rate')
    and round(METRC_FYTD_GOAL_SCR) is not null
     Then round(METRC_FYTD_GOAL_SCR,2) 
                
                -- 4 Decimal Place
                WHEN (METRC_TYP_NM  = 'Cost per Available Seat Mile (CASM)'
                or METRC_TYP_NM  = 'Revenue per Available Seat Mile (RASM)')
    and round(METRC_FYTD_GOAL_SCR) is not null
     Then round(METRC_FYTD_GOAL_SCR,4) 
                
                
                else METRC_FYTD_GOAL_SCR END as METRC_FYTD_GOAL_SCR,
----------------------------------------------------------------------------------
--Formatted FYTD Goal  
                CASE WHEN    METRC_TYP_NM  = 'Engineering Responsible Delay - Acela'
                                                                or METRC_TYP_NM = 'Passenger Average Minutes Late'
                                                                or (METRC_TYP_NM = 'FRA Reportable Incident Rate'   and  FISC_YR <= 2016)
                Then 'TBD'
                
                WHEN METRC_FYTD_GOAL_SCR is null then '' 
                
                WHEN METRC_TYP_NM  = 'Food & Beverage Direct Cost Recovery' and METRC_NM in ('SPECIAL TRAINS') then null
                
                --exclude high target numbers
     WHEN METRC_TYP_NM  = 'Food & Beverage Direct Cost Recovery' AND METRC_FYTD_GOAL_SCR > 500 
     then null

                                WHEN     ( METRC_TYP_NM  = 'Cost Recovery Ratio' 
                                                        or METRC_TYP_NM  = 'Food & Beverage Direct Cost Recovery' 
                                                        or METRC_TYP_NM = 'Endpoint On Time Performance'
                                                        or METRC_TYP_NM  = 'All Stations On Time Performance'
                                                        or METRC_TYP_NM  = 'Initial Terminal Performance')
                                                        AND  METRC_FYTD_GOAL_SCR is not null
                                                
                                                then  cast(round(METRC_FYTD_GOAL_SCR) as varchar60)||'%' 

                                                WHEN     (  METRC_TYP_NM  ='Passenger Injuries per 100 million Passenger Miles'
                                                                                                or METRC_TYP_NM  = 'Customer Satisfaction Index (eCSI)')
                                                        AND  METRC_FYTD_GOAL_SCR is not null
                                                
                                                then   LTRIM(LTRIM(to_char(cast(round(METRC_FYTD_GOAL_SCR,1) as varchar60),'000.0')),'0')
                                                
                                                WHEN     (  METRC_TYP_NM  = 'Praise-to-Complaint Ratio (On-Board)')
                                                        AND  METRC_FYTD_GOAL_SCR is not null
                                                
                                                then  cast(round(METRC_FYTD_GOAL_SCR,1) as varchar60)||'%' 

WHEN (METRC_TYP_NM  = 'Fully Allocated Contribution/(loss) (thousands)'
                                or METRC_TYP_NM  = 'Adjusted Operating Earnings/(thousands)'
        or METRC_TYP_NM  = 'Operating Income/(loss) (thousands)')
        and METRC_FYTD_GOAL_SCR is not null
        and METRC_FYTD_GOAL_SCR < 0

Then '($'||ltrim(cast(to_char(abs(METRC_FYTD_GOAL_SCR),'999,999,999,999,999')||')' as varchar60),' ')

WHEN (METRC_TYP_NM  = 'Fully Allocated Contribution/(loss) (thousands)'
                                or METRC_TYP_NM  = 'Adjusted Operating Earnings/(thousands)'
        or METRC_TYP_NM  = 'Operating Income/(loss) (thousands)')
        and METRC_FYTD_GOAL_SCR is not null
         and METRC_FYTD_GOAL_SCR >= 0

Then '$'||ltrim(cast(to_char(METRC_FYTD_GOAL_SCR,'999,999,999,999,999') as varchar60),' ') 


WHEN (METRC_TYP_NM = 'Revenue per Available Seat Mile (RASM)'
or METRC_TYP_NM = 'Cost per Available Seat Mile (CASM)')
and METRC_FYTD_GOAL_SCR is not null

Then '$'||ltrim(cast(to_char(abs(round(METRC_FYTD_GOAL_SCR,4)), '0.0000' ) as varchar60)) 


WHEN (METRC_TYP_NM = 'S2S Contact Rate'
or metrc_typ_nm = 'Major Operating Rules Ratios'
or metrc_typ_nm = 'FRA Reportable Incident Rate')
and METRC_FYTD_GOAL_SCR is not null

Then cast(to_char(round(METRC_FYTD_GOAL_SCR,2), '0.00' ) as varchar60) 



else ltrim(cast(to_char(METRC_FYTD_GOAL_SCR,'999,999,999,999,999')as varchar60),' ')  end as FRMT_METRC_FYTD_GOAL_SCR,
----------------------------------------------------------------------------------
--Formatted FYTD Goal  
                CASE WHEN METRC_FYTD_GOAL_SCR is null then ' ' 

--exclude high target numbers
     WHEN METRC_TYP_NM  = 'Food & Beverage Direct Cost Recovery' AND METRC_FYTD_GOAL_SCR > 500 --METRC_NM in ('CARDINAL','WASHINGTON-NORFOLK','SPECIAL TRAINS')
     then null

                                WHEN     ( METRC_TYP_NM  = 'Cost Recovery Ratio' 
                                                        or METRC_TYP_NM  = 'Food & Beverage Direct Cost Recovery' 
                                                        or METRC_TYP_NM = 'Endpoint On Time Performance'
                                                        or METRC_TYP_NM  = 'All Stations On Time Performance'
                                                        or METRC_TYP_NM  = 'Initial Terminal Performance')
                                                        AND  METRC_FYTD_GOAL_SCR is not null
                                                
                                                then  cast(round(METRC_FYTD_GOAL_SCR) as varchar60)||'%' 


                                                WHEN     (  METRC_TYP_NM  ='Passenger Injuries per 100 million Passenger Miles'
                                                                                                or METRC_TYP_NM  = 'Customer Satisfaction Index (eCSI)')
                                                        AND  METRC_FYTD_GOAL_SCR is not null
                                                
                                                then  LTRIM(LTRIM(to_char(cast(round(METRC_FYTD_GOAL_SCR,1) as varchar60),'000.0')),'0')
                                                
                                                WHEN     (  METRC_TYP_NM  = 'Praise-to-Complaint Ratio (On-Board)')
                                                        AND  METRC_FYTD_GOAL_SCR is not null
                                                
                                                then  cast(round(METRC_FYTD_GOAL_SCR,1) as varchar60)||'%' 

WHEN (METRC_TYP_NM  = 'Fully Allocated Contribution/(loss) (thousands)'
                                or METRC_TYP_NM  = 'Adjusted Operating Earnings/(thousands)'
        or METRC_TYP_NM  = 'Operating Income/(loss) (thousands)')
        and METRC_FYTD_GOAL_SCR is not null
        and METRC_NM = 'AMTRAK'

Then '($'||ltrim(cast(to_char(abs(METRC_FYTD_GOAL_SCR),'999,999,999,999,999')||')' as varchar60),' ')

WHEN (METRC_TYP_NM  = 'Fully Allocated Contribution/(loss) (thousands)'
                                or METRC_TYP_NM  = 'Adjusted Operating Earnings/(thousands)'
        or METRC_TYP_NM  = 'Operating Income/(loss) (thousands)')
        and METRC_FYTD_GOAL_SCR is not null
         and METRC_NM <> 'AMTRAK'
         and METRC_FYTD_GOAL_SCR > 0

Then '$'||ltrim(cast(to_char(METRC_FYTD_GOAL_SCR,'999,999,999,999,999') as varchar60),' ') 

WHEN (METRC_TYP_NM  = 'Fully Allocated Contribution/(loss) (thousands)'
                                or METRC_TYP_NM  = 'Adjusted Operating Earnings/(thousands)'
        or METRC_TYP_NM  = 'Operating Income/(loss) (thousands)')
        and METRC_FYTD_GOAL_SCR is not null
         and METRC_NM <> 'AMTRAK'
         and METRC_FYTD_GOAL_SCR < 0

Then '($'||ltrim(cast(to_char(abs(METRC_FYTD_GOAL_SCR),'999,999,999,999,999')||')' as varchar60),' ')


WHEN (METRC_TYP_NM = 'Revenue per Available Seat Mile (RASM)'
or METRC_TYP_NM = 'Cost per Available Seat Mile (CASM)')
and METRC_FYTD_GOAL_SCR is not null

Then '$'||ltrim(cast(to_char(abs(round(METRC_FYTD_GOAL_SCR,4)), '0.0000' ) as varchar60)) 


WHEN (METRC_TYP_NM = 'S2S Contact Rate'
or metrc_typ_nm = 'Major Operating Rules Ratios')
and METRC_FYTD_GOAL_SCR is not null

Then cast(to_char(round(METRC_FYTD_GOAL_SCR,2), '0.00' ) as varchar60) 



else ltrim(cast(to_char(METRC_FYTD_GOAL_SCR,'999,999,999,999,999')as varchar60),' ')  end as FRMT_BL_METRC_FYTD_GOAL_SCR,
---------------------------------------------------------------------------------
---------------------------------------------------------------------------------
CASE  WHEN     ( METRC_TYP_NM  = 'Cost Recovery Ratio' 
OR METRC_TYP_NM  = 'Fleet Reliability - Mean Miles Between Service Interruptions') 
                then METRC_FYTD_VRNC_SCR
                ELSE   abs(METRC_FYTD_VRNC_SCR) END as METRC_FYTD_VRNC_SCR,
----------------------------------------------------------------------------------
--Formated Variance
                CASE WHEN       METRC_TYP_NM  = 'Engineering Responsible Delay - Acela'
                                                        or METRC_TYP_NM = 'Serious Injuries and Fatalities'
                                                        or METRC_TYP_NM  = 'Major Operating Rules Violations'  
                                                        or METRC_TYP_NM = 'Passenger Average Minutes Late' 
                                                        or (METRC_TYP_NM = 'FRA Reportable Incident Rate' and  FISC_YR <= 2016)
                                                
                                                then  'N/A' 
                
                                WHEN METRC_FYTD_VRNC_SCR is null then '' 



                                WHEN     (  METRC_TYP_NM  = 'Food & Beverage Direct Cost Recovery'
                                                        or METRC_TYP_NM = 'Endpoint On Time Performance'
                                                        or METRC_TYP_NM  = 'All Stations On Time Performance'
                                                        or METRC_TYP_NM  = 'Initial Terminal Performance'
                                                      )
                                                        AND  METRC_FYTD_VRNC_SCR is not null
                                                
                                                then  cast(round(abs(METRC_FYTD_VRNC_SCR)) as varchar60)||' pts' 
                                                
                                                WHEN     ( METRC_TYP_NM  = 'Cost Recovery Ratio' 
                                                      )
                                                        AND  METRC_FYTD_VRNC_SCR is not null
                                                
                                                then  cast(round(abs(METRC_FYTD_VRNC_SCR)) as varchar60)||' pts' 
                                                
                                                
                                                WHEN     (  METRC_TYP_NM  ='Passenger Injuries per 100 million Passenger Miles'
                                                                                                or METRC_TYP_NM  = 'Customer Satisfaction Index (eCSI)')
                                                        AND  METRC_FYTD_VRNC_SCR is not null
                                                
                                                then  cast(round(abs(METRC_FYTD_VRNC_SCR),1) as varchar60)


                                                WHEN     ( METRC_TYP_NM  = 'Praise-to-Complaint Ratio (On-Board)')
                                                        AND  METRC_FYTD_VRNC_SCR is not null
                                                
                                                then  cast(round(abs(METRC_FYTD_VRNC_SCR),1) as varchar60)||' pts'
-----------
WHEN (METRC_TYP_NM  = 'Fully Allocated Contribution/(loss) (thousands)'
                                or METRC_TYP_NM  = 'Adjusted Operating Earnings/(thousands)'
        or METRC_TYP_NM  = 'Operating Income/(loss) (thousands)')
        and METRC_FYTD_VRNC_SCR is not null
        

Then '$'||ltrim(cast(to_char(abs(METRC_FYTD_VRNC_SCR),'999,999,999,999,999')as varchar60),' ') 


WHEN (METRC_TYP_NM = 'Revenue per Available Seat Mile (RASM)'
or METRC_TYP_NM = 'Cost per Available Seat Mile (CASM)')
and METRC_FYTD_VRNC_SCR is not null

Then '$'||ltrim(cast(to_char(abs(round(METRC_FYTD_VRNC_SCR,4)), '0.0000' ) as varchar60)) 

WHEN (METRC_TYP_NM = 'S2S Contact Rate'
or metrc_typ_nm = 'Major Operating Rules Ratios'
or metrc_typ_nm = 'FRA Reportable Incident Rate'
                                )
and METRC_FYTD_VRNC_SCR is not null

Then cast(to_char(abs(round(METRC_FYTD_VRNC_SCR,2)), '0.00' ) as varchar60) 

WHEN METRC_TYP_NM  = 'Fleet Reliability - Mean Miles Between Service Interruptions'
and METRC_FYTD_VRNC_SCR is not null
THEN ltrim(cast(to_char(abs(METRC_FYTD_VRNC_SCR),'999,999,999,999,999')as varchar60),' ')

else ltrim(cast(to_char(abs(METRC_FYTD_VRNC_SCR),'999,999,999,999,999')as varchar60),' ')  end as FRMT_METRC_FYTD_VRNC_SCR,
NULL as PARENT_BUSINESS_NAME 
                
FROM
                EDW.F_INTEGRATED_METRIC_PERF
where METRC_TYP_NM <> 'FRA Reportable Incident Rate'
