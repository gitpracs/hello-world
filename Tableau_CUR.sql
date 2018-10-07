begin;declare "SQL_CUR5" cursor with hold for SELECT (CASE WHEN (("ARRIVAL_LOCATION"."latitude_addr" = 'Undefined') OR ("ARRIVAL_LOCATION"."latitude_addr" = 'NullVal')) THEN NULL ELSE CAST("ARRIVAL_LOCATION"."latitude_addr" AS DOUBLE PRECISION) END) AS "calculation_457959817825951747", (CASE WHEN (("ARRIVAL_LOCATION"."longitude_addr" = 'Undefined') OR ("ARRIVAL_LOCATION"."longitude_addr" = 'NullVal')) THEN NULL ELSE CAST("ARRIVAL_LOCATION"."longitude_addr" AS DOUBLE PRECISION) END) AS "calculation_457959817826017284", COALESCE("F_IM_TRAIN_PERF"."actl_pure_rtm_late_mnt_qty", 0) AS "calculation_590253067519315982", COALESCE("F_IM_TRAIN_PERF"."actl_schd_ariv_late_mnt_qty", 0) AS "calculation_590253067519741967", 1 AS "number of records", "D_DATE"."acct_mnth" AS "acct_mnth", "F_IM_TRAIN_PERF"."actl_ariv_dttm" AS "actl_ariv_dttm", "F_IM_TRAIN_PERF"."actl_dprt_dttm" AS "actl_dprt_dttm", "F_IM_TRAIN_PERF"."actl_dwell_tm_mnt_qty" AS "actl_dwell_tm_mnt_qty", "F_IM_TRAIN_PERF"."actl_pure_rtm_late_mnt_qty" AS "actl_pure_rtm_late_mnt_qty", "F_IM_TRAIN_PERF"."actl_rtm_mnt_qty" AS "actl_rtm_mnt_qty", "F_IM_TRAIN_PERF"."actl_schd_ariv_late_mnt_qty" AS "actl_schd_ariv_late_mnt_qty", "F_IM_TRAIN_PERF"."actl_schd_dprt_late_mnt_qty" AS "actl_schd_dprt_late_mnt_qty", "F_IM_TRAIN_PERF"."actl_schd_rtm_late_mnt_qty" AS "actl_schd_rtm_late_mnt_qty", "DEPARTURE_LOCATION"."actv_ind" AS "actv_ind _d_location__1", "ARRIVAL_LOCATION"."actv_ind" AS "actv_ind _d_location_", "D_OTP_SERVICE_RSPB_HIER"."actv_ind" AS "actv_ind _d_otp_service_rspb_hier_", "D_TRAINROUTE"."actv_ind" AS "actv_ind _d_trainroute_", "F_IM_TRAIN_PERF"."actv_ind" AS "actv_ind", "D_DATE"."amtk_hldy_ind" AS "amtk_hldy_ind", "F_IM_TRAIN_PERF"."ariv_loc_cd" AS "ariv_loc_cd", "F_IM_TRAIN_PERF"."ariv_loc_id" AS "ariv_loc_id", "D_DATE"."cal_dt" AS "cal_dt", "D_DATE"."cal_half_yr_nbr" AS "cal_half_yr_nbr", "D_DATE"."cal_mnth_nbr" AS "cal_mnth_nbr", "D_DATE"."cal_mnth_nm" AS "cal_mnth_nm", "D_DATE"."cal_mnth_yr_nm" AS "cal_mnth_yr_nm", "D_DATE"."cal_mnth_yyyymm_nbr" AS "cal_mnth_yyyymm_nbr", "D_DATE"."cal_qtr_cd" AS "cal_qtr_cd", "D_DATE"."cal_qtr_nbr" AS "cal_qtr_nbr", "D_DATE"."cal_qtr_nm" AS "cal_qtr_nm", "D_DATE"."cal_qtr_yyyyq_nbr" AS "cal_qtr_yyyyq_nbr", "D_DATE"."cal_yr" AS "cal_yr", "D_DATE"."cal_yr_dy_nbr" AS "cal_yr_dy_nbr", "D_DATE"."cal_yr_lst_dy_ind" AS "cal_yr_lst_dy_ind", "D_DATE"."cal_yr_nm" AS "cal_yr_nm", "DEPARTURE_LOCATION"."chkpt_ind" AS "chkpt_ind _d_location_", "ARRIVAL_LOCATION"."chkpt_ind" AS "chkpt_ind", "D_DATE"."create_ts" AS "create_ts _d_date_", "DEPARTURE_LOCATION"."create_ts" AS "create_ts _d_location_ _1", "ARRIVAL_LOCATION"."create_ts" AS "create_ts _d_location_", "D_OTP_SERVICE_RSPB_HIER"."create_ts" AS "create_ts _d_otp_service_rspb_hier_", "D_TRAINROUTE"."create_ts" AS "create_ts _d_trainroute_", "F_IM_TRAIN_PERF"."create_ts" AS "create_ts", "D_DATE"."create_usr_id" AS "create_usr_id _d_date_", "DEPARTURE_LOCATION"."create_usr_id" AS "create_usr_id _d_location_ _1", "ARRIVAL_LOCATION"."create_usr_id" AS "create_usr_id _d_location_", "D_OTP_SERVICE_RSPB_HIER"."create_usr_id" AS "create_usr_id _d_otp_service_rspb_hier_", "D_TRAINROUTE"."create_usr_id" AS "create_usr_id _d_trainroute_", "F_IM_TRAIN_PERF"."create_usr_id" AS "create_usr_id", "F_IM_TRAIN_PERF"."cum_actl_pure_rtm_late_mnt_qty" AS "cum_actl_pure_rtm_late_mnt_qty", "F_IM_TRAIN_PERF"."cum_actl_rtm_mnt_qty" AS "cum_actl_rtm_mnt_qty", "F_IM_TRAIN_PERF"."cum_pure_rtm_mnt_qty" AS "cum_pure_rtm_mnt_qty", "F_IM_TRAIN_PERF"."cum_train_mile_qty" AS "cum_train_mile_qty", "D_TRAINROUTE"."data_srce_cd" AS "data_srce_cd", "F_IM_TRAIN_PERF"."data_srce_nm" AS "data_srce_nm", "D_DATE"."date_id" AS "date_id", "F_IM_TRAIN_PERF"."div_late_ind" AS "div_late_ind", "F_IM_TRAIN_PERF"."div_lost_mnt_qty" AS "div_lost_mnt_qty", "DEPARTURE_LOCATION"."div_nm" AS "div_nm _d_location_", "ARRIVAL_LOCATION"."div_nm" AS "div_nm", "F_IM_TRAIN_PERF"."div_on_tm_ind" AS "div_on_tm_ind", "F_IM_TRAIN_PERF"."div_oper_ind" AS "div_oper_ind", "F_IM_TRAIN_PERF"."div_train_mile_qty" AS "div_train_mile_qty", "F_IM_TRAIN_PERF"."dprt_loc_cd" AS "dprt_loc_cd", "F_IM_TRAIN_PERF"."dprt_loc_id" AS "dprt_loc_id", "DEPARTURE_LOCATION"."dst_obsv_ind" AS "dst_obsv_ind _d_location_", "ARRIVAL_LOCATION"."dst_obsv_ind" AS "dst_obsv_ind", "DEPARTURE_LOCATION"."dstr_mgr_empl_nbr" AS "dstr_mgr_empl_nbr _d_location_", "ARRIVAL_LOCATION"."dstr_mgr_empl_nbr" AS "dstr_mgr_empl_nbr", CAST("DEPARTURE_LOCATION"."dstr_mgr_frst_nm" AS TEXT) AS "dstr_mgr_frst_nm _d_location_", CAST("ARRIVAL_LOCATION"."dstr_mgr_frst_nm" AS TEXT) AS "dstr_mgr_frst_nm", CAST("DEPARTURE_LOCATION"."dstr_mgr_full_nm" AS TEXT) AS "dstr_mgr_full_nm _d_location_", CAST("ARRIVAL_LOCATION"."dstr_mgr_full_nm" AS TEXT) AS "dstr_mgr_full_nm", CAST("DEPARTURE_LOCATION"."dstr_mgr_lst_nm" AS TEXT) AS "dstr_mgr_lst_nm _d_location_", CAST("ARRIVAL_LOCATION"."dstr_mgr_lst_nm" AS TEXT) AS "dstr_mgr_lst_nm", "D_DATE"."dy_of_mnth_nbr" AS "dy_of_mnth_nbr", "D_DATE"."dy_of_wk_abbr_nm" AS "dy_of_wk_abbr_nm", "D_DATE"."dy_of_wk_iso_nbr" AS "dy_of_wk_iso_nbr", "D_DATE"."dy_of_wk_nbr" AS "dy_of_wk_nbr", "D_DATE"."dy_of_wk_nm" AS "dy_of_wk_nm", "D_DATE"."fed_hldy_ind" AS "fed_hldy_ind", "D_DATE"."fisc_half_yr_nbr" AS "fisc_half_yr_nbr", "D_DATE"."fisc_mnth_nbr" AS "fisc_mnth_nbr", "D_DATE"."fisc_mnth_yr_nm" AS "fisc_mnth_yr_nm", "D_DATE"."fisc_mnth_yyyymm_nbr" AS "fisc_mnth_yyyymm_nbr", "D_DATE"."fisc_qtr_cd" AS "fisc_qtr_cd", "D_DATE"."fisc_qtr_nbr" AS "fisc_qtr_nbr", "D_DATE"."fisc_qtr_nm" AS "fisc_qtr_nm", "D_DATE"."fisc_qtr_yyyyq_nbr" AS "fisc_qtr_yyyyq_nbr", "D_DATE"."fisc_yr" AS "fisc_yr", "D_DATE"."fisc_yr_dy_nbr" AS "fisc_yr_dy_nbr", "D_DATE"."fisc_yr_lst_dy_ind" AS "fisc_yr_lst_dy_ind", "D_DATE"."fisc_yr_nm" AS "fisc_yr_nm", "D_DATE"."fisc_yr_wk_nbr" AS "fisc_yr_wk_nbr", "F_IM_TRAIN_PERF"."host_railroad_ariv_loc_mp_nbr" AS "host_railroad_ariv_loc_mp_nbr", "F_IM_TRAIN_PERF"."host_railroad_cd" AS "host_railroad_cd", "F_IM_TRAIN_PERF"."host_railroad_dprt_loc_mp_nbr" AS "host_railroad_dprt_loc_mp_nbr", "F_IM_TRAIN_PERF"."host_railroad_id" AS "host_railroad_id", "F_IM_TRAIN_PERF"."im_train_perf_id" AS "im_train_perf_id", "DEPARTURE_LOCATION"."latitude_addr" AS "latitude_addr _d_location_", "ARRIVAL_LOCATION"."latitude_addr" AS "latitude_addr", "F_IM_TRAIN_PERF"."leg_offset_day_cnt" AS "leg_offset_day_cnt", "DEPARTURE_LOCATION"."loc_bgn_eff_dt" AS "loc_bgn_eff_dt _d_location_", "ARRIVAL_LOCATION"."loc_bgn_eff_dt" AS "loc_bgn_eff_dt", "DEPARTURE_LOCATION"."loc_cd" AS "loc_cd _d_location_", "ARRIVAL_LOCATION"."loc_cd" AS "loc_cd", "DEPARTURE_LOCATION"."loc_city_nm" AS "loc_city_nm _d_location_", "ARRIVAL_LOCATION"."loc_city_nm" AS "loc_city_nm", "DEPARTURE_LOCATION"."loc_ctry_nm" AS "loc_ctry_nm _d_location_", "ARRIVAL_LOCATION"."loc_ctry_nm" AS "loc_ctry_nm", "DEPARTURE_LOCATION"."loc_end_eff_dt" AS "loc_end_eff_dt _d_location_", "ARRIVAL_LOCATION"."loc_end_eff_dt" AS "loc_end_eff_dt", "DEPARTURE_LOCATION"."loc_id" AS "loc_id _d_location_", "ARRIVAL_LOCATION"."loc_id" AS "loc_id", "DEPARTURE_LOCATION"."loc_ln1_addr" AS "loc_ln1_addr _d_location_", "ARRIVAL_LOCATION"."loc_ln1_addr" AS "loc_ln1_addr", "DEPARTURE_LOCATION"."loc_ln2_addr" AS "loc_ln2_addr _d_location_", "ARRIVAL_LOCATION"."loc_ln2_addr" AS "loc_ln2_addr", "DEPARTURE_LOCATION"."loc_ln3_addr" AS "loc_ln3_addr _d_location_", "ARRIVAL_LOCATION"."loc_ln3_addr" AS "loc_ln3_addr", "DEPARTURE_LOCATION"."loc_nm" AS "loc_nm _d_location_", "ARRIVAL_LOCATION"."loc_nm" AS "loc_nm", "DEPARTURE_LOCATION"."loc_spr_city" AS "loc_spr_city _d_location_", "ARRIVAL_LOCATION"."loc_spr_city" AS "loc_spr_city", "DEPARTURE_LOCATION"."loc_state_prov_cd" AS "loc_state_prov_cd _d_location_", "ARRIVAL_LOCATION"."loc_state_prov_cd" AS "loc_state_prov_cd", "DEPARTURE_LOCATION"."loc_timezone_cd" AS "loc_timezone_cd _d_location_", "ARRIVAL_LOCATION"."loc_timezone_cd" AS "loc_timezone_cd", "DEPARTURE_LOCATION"."loc_timezone_nm" AS "loc_timezone_nm _d_location_", "ARRIVAL_LOCATION"."loc_timezone_nm" AS "loc_timezone_nm", "DEPARTURE_LOCATION"."loc_typ_cd" AS "loc_typ_cd _d_location_", "ARRIVAL_LOCATION"."loc_typ_cd" AS "loc_typ_cd", "DEPARTURE_LOCATION"."loc_typ_nm" AS "loc_typ_nm _d_location_", "ARRIVAL_LOCATION"."loc_typ_nm" AS "loc_typ_nm", "DEPARTURE_LOCATION"."loc_zip_cd" AS "loc_zip_cd _d_location_", "ARRIVAL_LOCATION"."loc_zip_cd" AS "loc_zip_cd", "DEPARTURE_LOCATION"."longitude_addr" AS "longitude_addr _d_location_", "ARRIVAL_LOCATION"."longitude_addr" AS "longitude_addr", "D_DATE"."lst_dy_in_mnth_ind" AS "lst_dy_in_mnth_ind", "D_DATE"."lst_updt_ts" AS "lst_updt_ts _d_date_", "DEPARTURE_LOCATION"."lst_updt_ts" AS "lst_updt_ts _d_location_ _1", "ARRIVAL_LOCATION"."lst_updt_ts" AS "lst_updt_ts _d_location_", "D_OTP_SERVICE_RSPB_HIER"."lst_updt_ts" AS "lst_updt_ts _d_otp_service_rspb_hier_", "D_TRAINROUTE"."lst_updt_ts" AS "lst_updt_ts _d_trainroute_", "F_IM_TRAIN_PERF"."lst_updt_ts" AS "lst_updt_ts", "D_DATE"."lst_updt_usr_id" AS "lst_updt_usr_id _d_date_", "DEPARTURE_LOCATION"."lst_updt_usr_id" AS "lst_updt_usr_id _d_location_ _1", "ARRIVAL_LOCATION"."lst_updt_usr_id" AS "lst_updt_usr_id _d_location_", "D_OTP_SERVICE_RSPB_HIER"."lst_updt_usr_id" AS "lst_updt_usr_id _d_otp_service_rspb_hier_", "D_TRAINROUTE"."lst_updt_usr_id" AS "lst_updt_usr_id _d_trainroute_", "F_IM_TRAIN_PERF"."lst_updt_usr_id" AS "lst_updt_usr_id", "F_IM_TRAIN_PERF"."miss_sght_ind" AS "miss_sght_ind", "D_DATE"."mnth_abbr_nm" AS "mnth_abbr_nm", "D_DATE"."mnth_of_qtr_nbr" AS "mnth_of_qtr_nbr", "D_DATE"."mnth_wk_nbr" AS "mnth_wk_nbr", "D_TRAINROUTE"."otp_amtk_train_ind" AS "otp_amtk_train_ind", "F_IM_TRAIN_PERF"."otp_data_ind" AS "otp_data_ind", "F_IM_TRAIN_PERF"."otp_dprt_seq_nbr" AS "otp_dprt_seq_nbr", "F_IM_TRAIN_PERF"."otp_region_rspb_hier_id" AS "otp_region_rspb_hier_id", "F_IM_TRAIN_PERF"."otp_rptbl_ind" AS "otp_rptbl_ind", "D_OTP_SERVICE_RSPB_HIER"."otp_svc_rspb_hier_id" AS "otp_svc_rspb_hier_id _d_otp_service_rspb_hier_", "D_TRAINROUTE"."otp_svc_rspb_hier_id" AS "otp_svc_rspb_hier_id", "D_TRAINROUTE"."otp_train_nm" AS "otp_train_nm", "D_TRAINROUTE"."otp_transp_sub_svc_nm" AS "otp_transp_sub_svc_nm", "D_TRAINROUTE"."otp_transp_svc_nm" AS "otp_transp_svc_nm", "D_TRAINROUTE"."otp_transp_typ_train_ind" AS "otp_transp_typ_train_ind", "D_OTP_SERVICE_RSPB_HIER"."ownr_transp_sub_svc_nm" AS "ownr_transp_sub_svc_nm", "D_OTP_SERVICE_RSPB_HIER"."ownr_transp_svc_nm" AS "ownr_transp_svc_nm", "D_DATE"."prcs_ts" AS "prcs_ts _d_date_", "DEPARTURE_LOCATION"."prcs_ts" AS "prcs_ts _d_location_ _1", "ARRIVAL_LOCATION"."prcs_ts" AS "prcs_ts _d_location_", "D_OTP_SERVICE_RSPB_HIER"."prcs_ts" AS "prcs_ts_d_otp_service_rspb_hier_", "D_TRAINROUTE"."prcs_ts" AS "prcs_ts _d_trainroute_", "F_IM_TRAIN_PERF"."prcs_ts" AS "prcs_ts", "D_DATE"."prior_wk_of_mnth" AS "prior_wk_of_mnth", "F_IM_TRAIN_PERF"."pure_rtm_mnt_qty" AS "pure_rtm_mnt_qty", "D_DATE"."qtr_dy_nbr" AS "qtr_dy_nbr", "D_DATE"."qtr_lst_dy_ind" AS "qtr_lst_dy_ind", "D_DATE"."qtr_wk_nbr" AS "qtr_wk_nbr", "F_IM_TRAIN_PERF"."region_late_ind" AS "region_late_ind", "F_IM_TRAIN_PERF"."region_lost_mnt_qty" AS "region_lost_mnt_qty", "DEPARTURE_LOCATION"."region_nm" AS "region_nm _d_location_", "ARRIVAL_LOCATION"."region_nm" AS "region_nm", "F_IM_TRAIN_PERF"."region_on_tm_ind" AS "region_on_tm_ind", "F_IM_TRAIN_PERF"."region_oper_ind" AS "region_oper_ind", "F_IM_TRAIN_PERF"."region_train_mile_qty" AS "region_train_mile_qty", "D_TRAINROUTE"."route_id" AS "route_id _d_trainroute_", "F_IM_TRAIN_PERF"."route_id" AS "route_id", "D_TRAINROUTE"."rvnu_shr_route_id" AS "rvnu_shr_route_id", "F_IM_TRAIN_PERF"."schd_ariv_dttm" AS "schd_ariv_dttm", "F_IM_TRAIN_PERF"."schd_dprt_dttm" AS "schd_dprt_dttm", "F_IM_TRAIN_PERF"."schd_dwell_tm_mnt_qty" AS "schd_dwell_tm_mnt_qty", "F_IM_TRAIN_PERF"."schd_rtm_mnt_qty" AS "schd_rtm_mnt_qty", "D_DATE"."season_nm" AS "season_nm", "F_IM_TRAIN_PERF"."seg_cncl_ind" AS "seg_cncl_ind", "F_IM_TRAIN_PERF"."seg_penalty_rspb_pty_nm" AS "seg_penalty_rspb_pty_nm", "F_IM_TRAIN_PERF"."seg_susp_cncl_penalty_amt" AS "seg_susp_cncl_penalty_amt", "F_IM_TRAIN_PERF"."seg_susp_cncl_penalty_ind" AS "seg_susp_cncl_penalty_ind", "F_IM_TRAIN_PERF"."seg_susp_ind" AS "seg_susp_ind", "DEPARTURE_LOCATION"."srce_lst_updt_ts" AS "srce_lst_updt_ts _d_location_", "D_TRAINROUTE"."srce_lst_updt_ts" AS "srce_lst_updt_ts _d_trainroute_", "ARRIVAL_LOCATION"."srce_lst_updt_ts" AS "srce_lst_updt_ts", "DEPARTURE_LOCATION"."stn_rptng_struc_id" AS "stn_rptng_struc_id _d_location_", "ARRIVAL_LOCATION"."stn_rptng_struc_id" AS "stn_rptng_struc_id", "F_IM_TRAIN_PERF"."stn_stop_ind" AS "stn_stop_ind", "DEPARTURE_LOCATION"."stn_typ_desc" AS "stn_typ_desc _d_location_", "ARRIVAL_LOCATION"."stn_typ_desc" AS "stn_typ_desc", CAST("D_OTP_SERVICE_RSPB_HIER"."svc_route_rspb_empl_nm_txt" AS TEXT) AS "svc_route_rspb_empl_nm_txt", CAST("D_OTP_SERVICE_RSPB_HIER"."svc_rspb_bus_ln_empl_nm_txt" AS TEXT) AS "svc_rspb_bus_ln_empl_nm_txt", "D_OTP_SERVICE_RSPB_HIER"."svc_rspb_bus_ln_nm" AS "svc_rspb_bus_ln_nm", CAST("D_OTP_SERVICE_RSPB_HIER"."svc_rspb_high_lvl_empl_nm" AS TEXT) AS "svc_rspb_high_lvl_empl_nm", "D_OTP_SERVICE_RSPB_HIER"."svc_rspb_high_lvl_nm" AS "svc_rspb_high_lvl_nm", CAST("D_OTP_SERVICE_RSPB_HIER"."svc_rspb_region_empl_nm_txt" AS TEXT) AS "svc_rspb_region_empl_nm_txt", "D_OTP_SERVICE_RSPB_HIER"."svc_rspb_region_nm" AS "svc_rspb_region_nm", "DEPARTURE_LOCATION"."te_stn_rptng_struc_id" AS "te_stn_rptng_struc_id _d_location_", "ARRIVAL_LOCATION"."te_stn_rptng_struc_id" AS "te_stn_rptng_struc_id", "D_DATE"."tot_days_in_mnth_nbr" AS "tot_days_in_mnth_nbr", "D_TRAINROUTE"."train_bgn_eff_dt" AS "train_bgn_eff_dt", "F_IM_TRAIN_PERF"."train_cmps_drct_cd" AS "train_cmps_drct_cd", "F_IM_TRAIN_PERF"."train_cncl_reason_id" AS "train_cncl_reason_id", "D_TRAINROUTE"."train_drct_cd" AS "train_drct_cd", "D_TRAINROUTE"."train_drct_nm" AS"train_drct_nm", "D_TRAINROUTE"."train_end_eff_dt" AS "train_end_eff_dt", "F_IM_TRAIN_PERF"."train_index_dt" AS "train_index_dt", "F_IM_TRAIN_PERF"."train_index_dt_id" AS "train_index_dt_id", "D_TRAINROUTE"."train_join_loc_cd" AS "train_join_loc_cd _d_trainroute_", "F_IM_TRAIN_PERF"."train_join_loc_cd" AS "train_join_loc_cd", "F_IM_TRAIN_PERF"."train_join_loc_dprt_seq_nbr" AS "train_join_loc_dprt_seq_nbr", "F_IM_TRAIN_PERF"."train_mile_qty" AS "train_mile_qty", "D_TRAINROUTE"."train_nbr" AS "train_nbr _d_trainroute_", "F_IM_TRAIN_PERF"."train_nbr" AS "train_nbr", "D_TRAINROUTE"."train_nm" AS "train_nm", "D_TRAINROUTE"."train_region_nm" AS "train_region_nm", "D_TRAINROUTE"."train_sctn_dest_loc_cd" AS "train_sctn_dest_loc_cd", "D_TRAINROUTE"."train_sctn_nbr" AS "train_sctn_nbr", "D_TRAINROUTE"."train_sctn_orig_loc_cd" AS "train_sctn_orig_loc_cd", "D_TRAINROUTE"."train_split_loc_cd" AS "train_split_loc_cd _d_trainroute_", "F_IM_TRAIN_PERF"."train_split_loc_cd" AS "train_split_loc_cd", "F_IM_TRAIN_PERF"."train_split_loc_dprt_seq_nbr" AS "train_split_loc_dprt_seq_nbr", "F_IM_TRAIN_PERF"."train_susp_reason_id" AS "train_susp_reason_id", "D_TRAINROUTE"."trainroute_id" AS "trainroute_id _d_trainroute_", "F_IM_TRAIN_PERF"."trainroute_id" AS "trainroute_id", "D_DATE"."wkdy_ind" AS "wkdy_ind", "D_DATE"."yr_wk_iso_nbr" AS "yr_wk_iso_nbr", "D_DATE"."yr_wk_nbr" AS "yr_wk_nbr" FROM "edw"."f_im_train_perf" "F_IM_TRAIN_PERF" INNER JOIN "edw"."d_location" "ARRIVAL_LOCATION" ON ("F_IM_TRAIN_PERF"."ariv_loc_id" = "ARRIVAL_LOCATION"."loc_id") INNER JOIN "edw"."d_location" "DEPARTURE_LOCATION" ON ("F_IM_TRAIN_PERF"."dprt_loc_id" = "DEPARTURE_LOCATION"."loc_id") INNER JOIN "edw"."d_date" "D_DATE" ON ("F_IM_TRAIN_PERF"."train_index_dt_id" = "D_DATE"."date_id") INNER JOIN "edw"."d_trainroute" "D_TRAINROUTE" ON ("F_IM_TRAIN_PERF"."trainroute_id" = "D_TRAINROUTE"."trainroute_id") INNER JOIN "edw"."d_otp_service_rspb_hier" "D_OTP_SERVICE_RSPB_HIER" ON ("D_TRAINROUTE"."otp_svc_rspb_hier_id" = "D_OTP_SERVICE_RSPB_HIER"."otp_svc_rspb_hier_id") WHERE (((CASE WHEN ("DEPARTURE_LOCATION"."loc_cd" = "ARRIVAL_LOCATION"."loc_cd") THEN 1 ELSE 0 END) = 0) AND ("D_TRAINROUTE"."otp_amtk_train_ind" = 1))