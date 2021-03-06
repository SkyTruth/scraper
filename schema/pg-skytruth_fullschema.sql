--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

SET search_path = scraper, pg_catalog;

ALTER TABLE ONLY scraper.userena_userenasignup DROP CONSTRAINT userena_userenasignup_user_id_fkey;
ALTER TABLE ONLY scraper.guardian_userobjectpermission DROP CONSTRAINT guardian_userobjectpermission_user_id_fkey;
ALTER TABLE ONLY scraper.guardian_userobjectpermission DROP CONSTRAINT guardian_userobjectpermission_permission_id_fkey;
ALTER TABLE ONLY scraper.guardian_userobjectpermission DROP CONSTRAINT guardian_userobjectpermission_content_type_id_fkey;
ALTER TABLE ONLY scraper.guardian_groupobjectpermission DROP CONSTRAINT guardian_groupobjectpermission_permission_id_fkey;
ALTER TABLE ONLY scraper.guardian_groupobjectpermission DROP CONSTRAINT guardian_groupobjectpermission_group_id_fkey;
ALTER TABLE ONLY scraper.guardian_groupobjectpermission DROP CONSTRAINT guardian_groupobjectpermission_content_type_id_fkey;
ALTER TABLE ONLY scraper.easy_thumbnails_thumbnail DROP CONSTRAINT easy_thumbnails_thumbnail_source_id_fkey;
ALTER TABLE ONLY scraper.appomatic_websitebase_profile DROP CONSTRAINT appomatic_websitebase_profile_user_id_fkey;
ALTER TABLE ONLY scraper.appomatic_mapserver_layer DROP CONSTRAINT appomatic_mapserver_layer_application_id_fkey;
SET search_path = public, pg_catalog;

ALTER TABLE ONLY public.auth_user_user_permissions DROP CONSTRAINT user_id_refs_id_4dc23c39;
ALTER TABLE ONLY public.auth_user_groups DROP CONSTRAINT user_id_refs_id_40c41112;
ALTER TABLE ONLY public.auth_group_permissions DROP CONSTRAINT group_id_refs_id_f4b32aac;
ALTER TABLE ONLY public.django_comments DROP CONSTRAINT django_comments_user_id_fkey;
ALTER TABLE ONLY public.django_comments DROP CONSTRAINT django_comments_site_id_fkey;
ALTER TABLE ONLY public.django_comments DROP CONSTRAINT django_comments_content_type_id_fkey;
ALTER TABLE ONLY public.django_comment_flags DROP CONSTRAINT django_comment_flags_user_id_fkey;
ALTER TABLE ONLY public.django_comment_flags DROP CONSTRAINT django_comment_flags_comment_id_fkey;
ALTER TABLE ONLY public.django_admin_log DROP CONSTRAINT django_admin_log_user_id_fkey;
ALTER TABLE ONLY public.django_admin_log DROP CONSTRAINT django_admin_log_content_type_id_fkey;
ALTER TABLE ONLY public.auth_permission DROP CONSTRAINT content_type_id_refs_id_d043b34a;
ALTER TABLE ONLY public.auth_user_user_permissions DROP CONSTRAINT auth_user_user_permissions_permission_id_fkey;
ALTER TABLE ONLY public.auth_user_groups DROP CONSTRAINT auth_user_groups_group_id_fkey;
ALTER TABLE ONLY public.auth_group_permissions DROP CONSTRAINT auth_group_permissions_permission_id_fkey;
ALTER TABLE ONLY public.appomatic_mapdata_aispath DROP CONSTRAINT appomatic_mapdata_aispath_vessel_id_fkey;
ALTER TABLE ONLY public.appomatic_mapdata_ais DROP CONSTRAINT appomatic_mapdata_ais_vessel_id_fkey;
SET search_path = scraper, pg_catalog;

DROP TRIGGER feedentry_insert ON scraper.feedentry;
SET search_path = public, pg_catalog;

DROP TRIGGER bottaskstatus_update ON public."BotTaskStatus";
DROP TRIGGER appomatic_mapdata_ais_insert ON public.appomatic_mapdata_ais;
SET search_path = scraper, pg_catalog;

DROP RULE feedentry_replace ON scraper.feedentry;
DROP RULE feedentry_insert ON scraper.feedentry;
SET search_path = public, pg_catalog;

DROP RULE geometry_columns_update ON public.geometry_columns;
DROP RULE geometry_columns_insert ON public.geometry_columns;
DROP RULE geometry_columns_delete ON public.geometry_columns;
SET search_path = scraper, pg_catalog;

DROP INDEX scraper.region_the_geom_id;
DROP INDEX scraper.region_src_like;
DROP INDEX scraper.region_src;
DROP INDEX scraper.region_simple_geom_id;
DROP INDEX scraper.region_name_like;
DROP INDEX scraper.region_name;
DROP INDEX scraper.region_code_like;
DROP INDEX scraper.region_code;
DROP INDEX scraper.idx_satimage_published_source_image;
DROP INDEX scraper.idx_satimage_published_name;
DROP INDEX scraper.idx_satimage_published_geo_extent;
DROP INDEX scraper.idx_satimage_priority_acq_date;
DROP INDEX scraper.idx_satimage_name;
DROP INDEX scraper.idx_satimage_geo_extent;
DROP INDEX scraper.idx_satimage_aoi_the_geom;
DROP INDEX scraper.idx_satimage_aoi_name;
DROP INDEX scraper.idx_satimage_acquisition_date;
DROP INDEX scraper.idx_regions_the_geom;
DROP INDEX scraper.idx_regions_code;
DROP INDEX scraper.guardian_userobjectpermission_user_id;
DROP INDEX scraper.guardian_userobjectpermission_permission_id;
DROP INDEX scraper.guardian_userobjectpermission_content_type_id;
DROP INDEX scraper.guardian_groupobjectpermission_permission_id;
DROP INDEX scraper.guardian_groupobjectpermission_group_id;
DROP INDEX scraper.guardian_groupobjectpermission_content_type_id;
DROP INDEX scraper.feedentry_tags;
DROP INDEX scraper.feedentry_regions;
DROP INDEX scraper.feedentry_published;
DROP INDEX scraper.feedentry_latlng;
DROP INDEX scraper.feedentry_incident_datetime;
DROP INDEX scraper.feedentry_id;
DROP INDEX scraper.feed_entry_source;
DROP INDEX scraper.easy_thumbnails_thumbnail_storage_hash_like;
DROP INDEX scraper.easy_thumbnails_thumbnail_storage_hash;
DROP INDEX scraper.easy_thumbnails_thumbnail_source_id;
DROP INDEX scraper.easy_thumbnails_thumbnail_name_like;
DROP INDEX scraper.easy_thumbnails_thumbnail_name;
DROP INDEX scraper.easy_thumbnails_source_storage_hash_like;
DROP INDEX scraper.easy_thumbnails_source_storage_hash;
DROP INDEX scraper.easy_thumbnails_source_name_like;
DROP INDEX scraper.easy_thumbnails_source_name;
DROP INDEX scraper.appomatic_mapserver_layer_slug_like;
DROP INDEX scraper.appomatic_mapserver_layer_name_like;
DROP INDEX scraper.appomatic_mapserver_layer_application_id_like;
DROP INDEX scraper.appomatic_mapserver_layer_application_id;
DROP INDEX scraper.appomatic_mapserver_application_slug_like;
DROP INDEX scraper.appomatic_mapserver_application_name_like;
DROP INDEX scraper.appomatic_mapdelta_grouping_full_geom_id;
DROP INDEX scraper.appomatic_mapdelta_grouping_cropped_geom_id;
DROP INDEX scraper.appomatic_mapdelta_event_src_like;
DROP INDEX scraper.appomatic_mapdelta_event_src;
DROP INDEX scraper.appomatic_mapdelta_event_longitude;
DROP INDEX scraper.appomatic_mapdelta_event_location_id;
DROP INDEX scraper.appomatic_mapdelta_event_location;
DROP INDEX scraper.appomatic_mapdelta_event_latitude;
DROP INDEX scraper.appomatic_mapdelta_event_glocation_id;
DROP INDEX scraper.appomatic_mapdelta_event_glocation;
DROP INDEX scraper.appomatic_mapdelta_event_datetime;
DROP INDEX scraper.appomatic_mapdata_viirs_src_like;
DROP INDEX scraper.appomatic_mapdata_viirs_src;
DROP INDEX scraper.appomatic_mapdata_viirs_quality;
DROP INDEX scraper.appomatic_mapdata_viirs_longitude;
DROP INDEX scraper.appomatic_mapdata_viirs_location_id;
DROP INDEX scraper.appomatic_mapdata_viirs_location;
DROP INDEX scraper.appomatic_mapdata_viirs_latitude;
DROP INDEX scraper.appomatic_mapdata_viirs_footprint;
DROP INDEX scraper.appomatic_mapdata_viirs_datetime;
DROP INDEX scraper."appomatic_mapdata_viirs_Temperature";
DROP INDEX scraper."appomatic_mapdata_viirs_SourceID_like";
DROP INDEX scraper."appomatic_mapdata_viirs_SourceID";
DROP INDEX scraper."appomatic_mapdata_viirs_RadiativeHeat";
DROP INDEX scraper."appomatic_mapdata_viirs_RadiantOutput";
DROP INDEX scraper.appomatic_mapdata_sar_src_like;
DROP INDEX scraper.appomatic_mapdata_sar_src;
DROP INDEX scraper.appomatic_mapdata_sar_quality;
DROP INDEX scraper.appomatic_mapdata_sar_longitude;
DROP INDEX scraper.appomatic_mapdata_sar_location_id;
DROP INDEX scraper.appomatic_mapdata_sar_location;
DROP INDEX scraper.appomatic_mapdata_sar_latitude;
DROP INDEX scraper.appomatic_mapdata_sar_datetime;
DROP INDEX scraper.appomatic_mapcluster_query_slug_like;
DROP INDEX scraper.appomatic_mapcluster_query_slug;
DROP INDEX scraper.appomatic_mapcluster_cluster_src_like;
DROP INDEX scraper.appomatic_mapcluster_cluster_src;
DROP INDEX scraper.appomatic_mapcluster_cluster_longitude;
DROP INDEX scraper.appomatic_mapcluster_cluster_location_id;
DROP INDEX scraper.appomatic_mapcluster_cluster_location;
DROP INDEX scraper.appomatic_mapcluster_cluster_latitude;
DROP INDEX scraper.appomatic_mapcluster_cluster_glocation_id;
DROP INDEX scraper.appomatic_mapcluster_cluster_glocation;
DROP INDEX scraper.appomatic_mapcluster_cluster_datetime;
DROP INDEX scraper.appomatic_mapcluster_cluster_buffer_id;
DROP INDEX scraper.appomatic_mapcluster_cluster_buffer;
SET search_path = public, pg_catalog;

DROP INDEX public.updated;
DROP INDEX public.time_stamp;
DROP INDEX public.task_item;
DROP INDEX public.tag;
DROP INDEX public.suspected_responsible_company;
DROP INDEX public.state;
DROP INDEX public.seqid;
DROP INDEX public.reportnum;
DROP INDEX public.report_seqid;
DROP INDEX public.published;
DROP INDEX public.permit_type;
DROP INDEX public.permit_activity_type;
DROP INDEX public.pdf_seqid;
DROP INDEX public.pattern;
DROP INDEX public.name;
DROP INDEX public.material_name;
DROP INDEX public.lat_lng;
DROP INDEX public.incident_datetime;
DROP INDEX public."idcogisspill_UNIQUE";
DROP INDEX public.id;
DROP INDEX public.ft_id;
DROP INDEX public.feedentry_ewn2_tags;
DROP INDEX public.feedentry_ewn2_regions;
DROP INDEX public.feedentry_ewn2_published;
DROP INDEX public.feedentry_ewn2_latlng;
DROP INDEX public.feedentry_ewn2_incident_datetime;
DROP INDEX public.feedentry_ewn2_id;
DROP INDEX public.feed_entry_source;
DROP INDEX public.doc_num_index;
DROP INDEX public.django_session_session_key_like;
DROP INDEX public.django_session_expire_date;
DROP INDEX public.django_comments_user_id;
DROP INDEX public.django_comments_site_id;
DROP INDEX public.django_comments_content_type_id;
DROP INDEX public.django_comment_flags_user_id;
DROP INDEX public.django_comment_flags_flag_like;
DROP INDEX public.django_comment_flags_flag;
DROP INDEX public.django_comment_flags_comment_id;
DROP INDEX public.django_admin_log_user_id;
DROP INDEX public.django_admin_log_content_type_id;
DROP INDEX public.description;
DROP INDEX public.cas_type;
DROP INDEX public.cas_number;
DROP INDEX public.bot_status;
DROP INDEX public.auth_user_username_like;
DROP INDEX public.auth_user_user_permissions_user_id;
DROP INDEX public.auth_user_user_permissions_permission_id;
DROP INDEX public.auth_user_groups_user_id;
DROP INDEX public.auth_user_groups_group_id;
DROP INDEX public.auth_permission_content_type_id;
DROP INDEX public.auth_group_permissions_permission_id;
DROP INDEX public.auth_group_permissions_group_id;
DROP INDEX public.auth_group_name_like;
DROP INDEX public.areaid_blockid;
DROP INDEX public.area_block;
DROP INDEX public.appomatic_nrccluster_nrcreport_location_id;
DROP INDEX public.appomatic_nrccluster_nrcreport_location;
DROP INDEX public.appomatic_nrccluster_cluster_location_id;
DROP INDEX public.appomatic_nrccluster_cluster_location;
DROP INDEX public.appomatic_nrccluster_cluster_buffer_id;
DROP INDEX public.appomatic_nrccluster_cluster_buffer;
DROP INDEX public.appomatic_mapdata_vessel_src_like;
DROP INDEX public.appomatic_mapdata_vessel_src;
DROP INDEX public.appomatic_mapdata_vessel_mmsi_like;
DROP INDEX public.appomatic_mapdata_aispath_vessel_id;
DROP INDEX public.appomatic_mapdata_aispath_line_id;
DROP INDEX public.appomatic_mapdata_ais_vessel_id;
DROP INDEX public.appomatic_mapdata_ais_src_like;
DROP INDEX public.appomatic_mapdata_ais_src;
DROP INDEX public.appomatic_mapdata_ais_quality;
DROP INDEX public.appomatic_mapdata_ais_longitude;
DROP INDEX public.appomatic_mapdata_ais_location_id;
DROP INDEX public.appomatic_mapdata_ais_location;
DROP INDEX public.appomatic_mapdata_ais_latitude;
DROP INDEX public.appomatic_mapdata_ais_datetime;
DROP INDEX public.api_type_date;
DROP INDEX public.api_job_date;
DROP INDEX public.api_date_row;
DROP INDEX public.ais_seqid;
DROP INDEX public.ais_mmsi_datetime;
DROP INDEX public.ais_location_idx;
DROP INDEX public.activity_date;
DROP INDEX public."ViolationID";
DROP INDEX public."Nightfire_record_Lon_GMTCO";
DROP INDEX public."Nightfire_record_Lat_GMTCO";
DROP INDEX public."BLOCK_NUMB";
DROP INDEX public."AREA_CODE";
DROP INDEX public."API_DATE";
DROP INDEX public."AC_LAB";
SET search_path = scraper, pg_catalog;

ALTER TABLE ONLY scraper."wvStateBoundary100k_USGS_200203_ll83" DROP CONSTRAINT "wvStateBoundary100k_USGS_200203_ll83_pkey";
ALTER TABLE ONLY scraper.userena_userenasignup DROP CONSTRAINT userena_userenasignup_user_id_key;
ALTER TABLE ONLY scraper.userena_userenasignup DROP CONSTRAINT userena_userenasignup_pkey;
ALTER TABLE ONLY scraper.tl_2010_us_state10 DROP CONSTRAINT tl_2010_us_state10_pkey;
ALTER TABLE ONLY scraper.satimage DROP CONSTRAINT satimage_pkey;
ALTER TABLE ONLY scraper.satimage_aoi DROP CONSTRAINT satimage_aoi_pkey;
ALTER TABLE ONLY scraper.region DROP CONSTRAINT region_pkey;
ALTER TABLE ONLY scraper.guardian_userobjectpermission DROP CONSTRAINT guardian_userobjectpermission_user_id_permission_id_object__key;
ALTER TABLE ONLY scraper.guardian_userobjectpermission DROP CONSTRAINT guardian_userobjectpermission_pkey;
ALTER TABLE ONLY scraper.guardian_groupobjectpermission DROP CONSTRAINT guardian_groupobjectpermission_pkey;
ALTER TABLE ONLY scraper.guardian_groupobjectpermission DROP CONSTRAINT guardian_groupobjectpermissio_group_id_permission_id_object_key;
ALTER TABLE ONLY scraper.feedsource DROP CONSTRAINT feedsource_id;
ALTER TABLE ONLY scraper.easy_thumbnails_thumbnail DROP CONSTRAINT easy_thumbnails_thumbnail_storage_hash_name_source_id_key;
ALTER TABLE ONLY scraper.easy_thumbnails_thumbnail DROP CONSTRAINT easy_thumbnails_thumbnail_pkey;
ALTER TABLE ONLY scraper.easy_thumbnails_source DROP CONSTRAINT easy_thumbnails_source_storage_hash_name_key;
ALTER TABLE ONLY scraper.easy_thumbnails_source DROP CONSTRAINT easy_thumbnails_source_pkey;
ALTER TABLE ONLY scraper."WVCounty2005_03" DROP CONSTRAINT "countyBoundary_censusAndUSGS_200503_utm83_pkey";
ALTER TABLE ONLY scraper.appomatic_websitebase_profile DROP CONSTRAINT appomatic_websitebase_profile_user_id_key;
ALTER TABLE ONLY scraper.appomatic_websitebase_profile DROP CONSTRAINT appomatic_websitebase_profile_pkey;
ALTER TABLE ONLY scraper.appomatic_mapserver_layer DROP CONSTRAINT appomatic_mapserver_layer_pkey;
ALTER TABLE ONLY scraper.appomatic_mapserver_layer DROP CONSTRAINT appomatic_mapserver_layer_name_key;
ALTER TABLE ONLY scraper.appomatic_mapserver_application DROP CONSTRAINT appomatic_mapserver_application_pkey;
ALTER TABLE ONLY scraper.appomatic_mapserver_application DROP CONSTRAINT appomatic_mapserver_application_name_key;
ALTER TABLE ONLY scraper.appomatic_mapdelta_grouping DROP CONSTRAINT appomatic_mapdelta_grouping_pkey;
ALTER TABLE ONLY scraper.appomatic_mapdelta_event DROP CONSTRAINT appomatic_mapdelta_event_pkey;
ALTER TABLE ONLY scraper.appomatic_mapdata_viirs DROP CONSTRAINT appomatic_mapdata_viirs_pkey;
ALTER TABLE ONLY scraper.appomatic_mapdata_sar DROP CONSTRAINT appomatic_mapdata_sar_pkey;
ALTER TABLE ONLY scraper.appomatic_mapcluster_query DROP CONSTRAINT appomatic_mapcluster_query_pkey;
ALTER TABLE ONLY scraper.appomatic_mapcluster_cluster DROP CONSTRAINT appomatic_mapcluster_cluster_pkey;
ALTER TABLE ONLY scraper."PaState2011_01" DROP CONSTRAINT "PaState2011_01_pkey";
ALTER TABLE ONLY scraper."PaCounty2011_01" DROP CONSTRAINT "PaCounty2011_01_pkey";
ALTER TABLE ONLY scraper."Monongahela_HUC8_watersheds" DROP CONSTRAINT "Monongahela_HUC8_watersheds_pkey";
ALTER TABLE ONLY scraper."Monongahela_HUC6_Watershed" DROP CONSTRAINT "Monongahela_HUC6_Watershed_pkey";
ALTER TABLE ONLY scraper."HUC10_Monongahela" DROP CONSTRAINT "HUC10_Monongahela_pkey";
ALTER TABLE ONLY scraper."GOMPolygon_drawn" DROP CONSTRAINT "GOMPolygon_drawn_pkey";
ALTER TABLE ONLY scraper."Alegheny_Forest_PA" DROP CONSTRAINT "Alegheny_Forest_PA_pkey";
SET search_path = public, pg_catalog;

ALTER TABLE ONLY public.temp_material DROP CONSTRAINT temp_material_pkey;
ALTER TABLE ONLY public."temp_FSU_SAR_FOOTPRINTS" DROP CONSTRAINT "temp_FSU_SAR_FOOTPRINTS_pkey";
ALTER TABLE ONLY public.spatial_ref_sys DROP CONSTRAINT spatial_ref_sys_pkey;
ALTER TABLE ONLY public.django_site DROP CONSTRAINT django_site_pkey;
ALTER TABLE ONLY public.django_session DROP CONSTRAINT django_session_pkey;
ALTER TABLE ONLY public.django_content_type DROP CONSTRAINT django_content_type_pkey;
ALTER TABLE ONLY public.django_content_type DROP CONSTRAINT django_content_type_app_label_model_key;
ALTER TABLE ONLY public.django_comments DROP CONSTRAINT django_comments_pkey;
ALTER TABLE ONLY public.django_comment_flags DROP CONSTRAINT django_comment_flags_user_id_comment_id_flag_key;
ALTER TABLE ONLY public.django_comment_flags DROP CONSTRAINT django_comment_flags_pkey;
ALTER TABLE ONLY public.django_admin_log DROP CONSTRAINT django_admin_log_pkey;
ALTER TABLE ONLY public.auth_user DROP CONSTRAINT auth_user_username_key;
ALTER TABLE ONLY public.auth_user_user_permissions DROP CONSTRAINT auth_user_user_permissions_user_id_permission_id_key;
ALTER TABLE ONLY public.auth_user_user_permissions DROP CONSTRAINT auth_user_user_permissions_pkey;
ALTER TABLE ONLY public.auth_user DROP CONSTRAINT auth_user_pkey;
ALTER TABLE ONLY public.auth_user_groups DROP CONSTRAINT auth_user_groups_user_id_group_id_key;
ALTER TABLE ONLY public.auth_user_groups DROP CONSTRAINT auth_user_groups_pkey;
ALTER TABLE ONLY public.auth_permission DROP CONSTRAINT auth_permission_pkey;
ALTER TABLE ONLY public.auth_permission DROP CONSTRAINT auth_permission_content_type_id_codename_key;
ALTER TABLE ONLY public.auth_group DROP CONSTRAINT auth_group_pkey;
ALTER TABLE ONLY public.auth_group_permissions DROP CONSTRAINT auth_group_permissions_pkey;
ALTER TABLE ONLY public.auth_group_permissions DROP CONSTRAINT auth_group_permissions_group_id_permission_id_key;
ALTER TABLE ONLY public.auth_group DROP CONSTRAINT auth_group_name_key;
ALTER TABLE ONLY public.appomatic_nrccluster_nrcreport DROP CONSTRAINT appomatic_nrccluster_nrcreport_pkey;
ALTER TABLE ONLY public.appomatic_nrccluster_cluster DROP CONSTRAINT appomatic_nrccluster_cluster_pkey;
ALTER TABLE ONLY public.appomatic_mapimport_downloaded DROP CONSTRAINT appomatic_mapimport_downloaded_src_filename_key;
ALTER TABLE ONLY public.appomatic_mapimport_downloaded DROP CONSTRAINT appomatic_mapimport_downloaded_pkey;
ALTER TABLE ONLY public.appomatic_mapdata_vessel DROP CONSTRAINT appomatic_mapdata_vessel_pkey;
ALTER TABLE ONLY public.appomatic_mapdata_vessel DROP CONSTRAINT appomatic_mapdata_vessel_mmsi_key;
ALTER TABLE ONLY public.appomatic_mapdata_aispath DROP CONSTRAINT appomatic_mapdata_aispath_pkey;
ALTER TABLE ONLY public.appomatic_mapdata_ais DROP CONSTRAINT appomatic_mapdata_ais_pkey;
ALTER TABLE ONLY public."WV_DrillingPermit" DROP CONSTRAINT "WV_DrillingPermit_pkey";
ALTER TABLE ONLY public."RssFeed" DROP CONSTRAINT "RssFeed_pkey";
ALTER TABLE ONLY public."RssFeedItem" DROP CONSTRAINT "RssFeedItem_pkey";
ALTER TABLE ONLY public."RSSEmailSubscription" DROP CONSTRAINT "RSSEmailSubscription_pkey";
ALTER TABLE ONLY public."PublishedFeedItems" DROP CONSTRAINT "PublishedFeedItems_pkey";
ALTER TABLE ONLY public."PA_Violation" DROP CONSTRAINT "PA_Violation_pkey";
ALTER TABLE ONLY public."PA_Spud" DROP CONSTRAINT "PA_Spud_pkey";
ALTER TABLE ONLY public."PA_Spud_new" DROP CONSTRAINT "PA_Spud_new_pkey";
ALTER TABLE ONLY public."PA_Spud_copy" DROP CONSTRAINT "PA_Spud_copy_pkey";
ALTER TABLE ONLY public."PA_DrillingPermit" DROP CONSTRAINT "PA_DrillingPermit_pkey";
ALTER TABLE ONLY public."NrcUnits" DROP CONSTRAINT "NrcUnits_pkey";
ALTER TABLE ONLY public."NrcTag" DROP CONSTRAINT "NrcTag_pkey";
ALTER TABLE ONLY public."NrcScraperTarget" DROP CONSTRAINT "NrcScraperTarget_pkey";
ALTER TABLE ONLY public."NrcScrapedReport" DROP CONSTRAINT "NrcScrapedReport_pkey";
ALTER TABLE ONLY public."NrcScrapedMaterial" DROP CONSTRAINT "NrcScrapedMaterial_pkey";
ALTER TABLE ONLY public."NrcScrapedFullReport" DROP CONSTRAINT "NrcScrapedFullReport_pkey";
ALTER TABLE ONLY public."NrcParsedReport" DROP CONSTRAINT "NrcParsedReport_pkey";
ALTER TABLE ONLY public."NrcMaterials" DROP CONSTRAINT "NrcMaterials_pkey";
ALTER TABLE ONLY public."NrcGeocode" DROP CONSTRAINT "NrcGeocode_pkey";
ALTER TABLE ONLY public."NrcAnalysis" DROP CONSTRAINT "NrcAnalysis_pkey";
ALTER TABLE ONLY public."Nightfire_record" DROP CONSTRAINT "Nightfire_record_pkey";
ALTER TABLE ONLY public."Nightfire_file" DROP CONSTRAINT "Nightfire_file_pkey";
ALTER TABLE ONLY public."Nightfire_file" DROP CONSTRAINT "Nightfire_file_filename_key";
ALTER TABLE ONLY public."LeaseBlockCentroid" DROP CONSTRAINT "LeaseBlockCentroid_pkey";
ALTER TABLE ONLY public."LA_Lease_Blocks" DROP CONSTRAINT "LA_Lease_Blocks_pkey";
ALTER TABLE ONLY public."GeocodeCache" DROP CONSTRAINT "GeocodeCache_pkey";
ALTER TABLE ONLY public."FracFocusScrape" DROP CONSTRAINT "FracFocusScrape_pkey";
ALTER TABLE ONLY public."FracFocusReport" DROP CONSTRAINT "FracFocusReport_pkey";
ALTER TABLE ONLY public."FracFocusReport_old" DROP CONSTRAINT "FracFocusReport_old_pkey";
ALTER TABLE ONLY public."FracFocusReport_old2" DROP CONSTRAINT "FracFocusReport_old2_pkey";
ALTER TABLE ONLY public."FracFocusReportChemical" DROP CONSTRAINT "FracFocusReportChemical_pkey";
ALTER TABLE ONLY public."FracFocusParse" DROP CONSTRAINT "FracFocusParse_pkey";
ALTER TABLE ONLY public."FracFocusParseChemical" DROP CONSTRAINT "FracFocusParseChemical_pkey";
ALTER TABLE ONLY public."FracFocusPDF" DROP CONSTRAINT "FracFocusPDF_pkey";
ALTER TABLE ONLY public."FracFocusChemical_old" DROP CONSTRAINT "FracFocusChemical_old_pkey";
ALTER TABLE ONLY public."FracFocusChemical_old2" DROP CONSTRAINT "FracFocusChemical_old2_pkey";
ALTER TABLE ONLY public."FeedSource" DROP CONSTRAINT "FeedSource_pkey";
ALTER TABLE ONLY public."DEFUNCT_FeedEntry" DROP CONSTRAINT "FeedEntry_pkey";
ALTER TABLE ONLY public."FeedEntryTag" DROP CONSTRAINT "FeedEntryTag_pkey";
ALTER TABLE ONLY public."FT_Test" DROP CONSTRAINT "FT_Test_pkey";
ALTER TABLE ONLY public."CogisSpill" DROP CONSTRAINT "CogisSpill_pkey";
ALTER TABLE ONLY public."CogisInspection" DROP CONSTRAINT "CogisInspection_pkey";
ALTER TABLE ONLY public."BotTask" DROP CONSTRAINT "BotTask_pkey";
ALTER TABLE ONLY public."BotTaskStatus" DROP CONSTRAINT "BotTaskStatus_pkey";
ALTER TABLE ONLY public."BotTaskParams" DROP CONSTRAINT "BotTaskParams_pkey";
ALTER TABLE ONLY public."BotTaskError" DROP CONSTRAINT "BotTaskError_pkey";
ALTER TABLE ONLY public."AreaCodeMap" DROP CONSTRAINT "AreaCodeMap_pkey";
SET search_path = scraper, pg_catalog;

ALTER TABLE scraper."wvStateBoundary100k_USGS_200203_ll83" ALTER COLUMN gid DROP DEFAULT;
ALTER TABLE scraper.userena_userenasignup ALTER COLUMN id DROP DEFAULT;
ALTER TABLE scraper.tl_2010_us_state10 ALTER COLUMN gid DROP DEFAULT;
ALTER TABLE scraper.satimage_published ALTER COLUMN id DROP DEFAULT;
ALTER TABLE scraper.satimage_aoi ALTER COLUMN id DROP DEFAULT;
ALTER TABLE scraper.satimage ALTER COLUMN id DROP DEFAULT;
ALTER TABLE scraper.region ALTER COLUMN id DROP DEFAULT;
ALTER TABLE scraper.guardian_userobjectpermission ALTER COLUMN id DROP DEFAULT;
ALTER TABLE scraper.guardian_groupobjectpermission ALTER COLUMN id DROP DEFAULT;
ALTER TABLE scraper.easy_thumbnails_thumbnail ALTER COLUMN id DROP DEFAULT;
ALTER TABLE scraper.easy_thumbnails_source ALTER COLUMN id DROP DEFAULT;
ALTER TABLE scraper.appomatic_websitebase_profile ALTER COLUMN id DROP DEFAULT;
ALTER TABLE scraper.appomatic_mapdelta_grouping ALTER COLUMN id DROP DEFAULT;
ALTER TABLE scraper.appomatic_mapdelta_event ALTER COLUMN id DROP DEFAULT;
ALTER TABLE scraper.appomatic_mapdata_viirs ALTER COLUMN id DROP DEFAULT;
ALTER TABLE scraper.appomatic_mapdata_sar ALTER COLUMN id DROP DEFAULT;
ALTER TABLE scraper.appomatic_mapcluster_query ALTER COLUMN id DROP DEFAULT;
ALTER TABLE scraper.appomatic_mapcluster_cluster ALTER COLUMN id DROP DEFAULT;
ALTER TABLE scraper."WVCounty2005_03" ALTER COLUMN gid DROP DEFAULT;
ALTER TABLE scraper."PaState2011_01" ALTER COLUMN gid DROP DEFAULT;
ALTER TABLE scraper."PaCounty2011_01" ALTER COLUMN gid DROP DEFAULT;
ALTER TABLE scraper."Monongahela_HUC8_watersheds" ALTER COLUMN gid2 DROP DEFAULT;
ALTER TABLE scraper."Monongahela_HUC6_Watershed" ALTER COLUMN gid2 DROP DEFAULT;
ALTER TABLE scraper."HUC10_Monongahela" ALTER COLUMN gid2 DROP DEFAULT;
ALTER TABLE scraper."GOMPolygon_drawn" ALTER COLUMN gid DROP DEFAULT;
ALTER TABLE scraper."Alegheny_Forest_PA" ALTER COLUMN gid DROP DEFAULT;
SET search_path = public, pg_catalog;

ALTER TABLE public.django_site ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.django_content_type ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.django_comments ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.django_comment_flags ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.django_admin_log ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.auth_user_user_permissions ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.auth_user_groups ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.auth_user ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.auth_permission ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.auth_group_permissions ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.auth_group ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.appomatic_nrccluster_nrcreport ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.appomatic_nrccluster_cluster ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.appomatic_mapimport_downloaded ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.appomatic_mapdata_vessel ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.appomatic_mapdata_aispath ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.appomatic_mapdata_ais ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.ais ALTER COLUMN seqid DROP DEFAULT;
ALTER TABLE public."RSSEmailSubscription" ALTER COLUMN st_id DROP DEFAULT;
ALTER TABLE public."Nightfire_file" ALTER COLUMN id DROP DEFAULT;
SET search_path = scraper, pg_catalog;

DROP SEQUENCE scraper."wvStateBoundary100k_USGS_200203_ll83_gid_seq";
DROP TABLE scraper."wvStateBoundary100k_USGS_200203_ll83";
DROP SEQUENCE scraper.userena_userenasignup_id_seq;
DROP TABLE scraper.userena_userenasignup;
DROP SEQUENCE scraper.tl_2010_us_state10_gid_seq;
DROP TABLE scraper.tl_2010_us_state10;
DROP SEQUENCE scraper.satimage_published_id_seq;
DROP TABLE scraper.satimage_published;
DROP SEQUENCE scraper.satimage_id_seq;
DROP SEQUENCE scraper.satimage_aoi_id_seq;
DROP TABLE scraper.satimage_aoi;
DROP TABLE scraper.satimage;
DROP SEQUENCE scraper.region_id_seq;
DROP SEQUENCE scraper.guardian_userobjectpermission_id_seq;
DROP TABLE scraper.guardian_userobjectpermission;
DROP SEQUENCE scraper.guardian_groupobjectpermission_id_seq;
DROP TABLE scraper.guardian_groupobjectpermission;
DROP TABLE scraper.feedsource;
DROP TABLE scraper.feedentry_backup;
DROP TABLE scraper.feedentry;
DROP SEQUENCE scraper.easy_thumbnails_thumbnail_id_seq;
DROP TABLE scraper.easy_thumbnails_thumbnail;
DROP SEQUENCE scraper.easy_thumbnails_source_id_seq;
DROP TABLE scraper.easy_thumbnails_source;
DROP SEQUENCE scraper."countyBoundary_censusAndUSGS_200503_utm83_gid_seq";
DROP SEQUENCE scraper.appomatic_websitebase_profile_id_seq;
DROP TABLE scraper.appomatic_websitebase_profile;
DROP TABLE scraper.appomatic_mapserver_layer;
DROP TABLE scraper.appomatic_mapserver_application;
DROP SEQUENCE scraper.appomatic_mapdelta_grouping_id_seq;
DROP TABLE scraper.appomatic_mapdelta_grouping;
DROP SEQUENCE scraper.appomatic_mapdelta_event_id_seq;
DROP TABLE scraper.appomatic_mapdelta_event;
DROP VIEW scraper.appomatic_mapdata_viirsfilteredview;
DROP TABLE scraper.region;
DROP SEQUENCE scraper.appomatic_mapdata_viirs_id_seq;
DROP TABLE scraper.appomatic_mapdata_viirs;
DROP SEQUENCE scraper.appomatic_mapdata_sar_id_seq;
DROP TABLE scraper.appomatic_mapdata_sar;
DROP VIEW scraper.appomatic_mapdata_ais_path_view;
DROP TABLE scraper.appomatic_mapdata_ais_old;
DROP VIEW scraper.appomatic_mapdata_ais_calculated_speeds_view;
DROP TABLE scraper.appomatic_mapdata_ais_calculated_speeds;
DROP SEQUENCE scraper.appomatic_mapcluster_query_id_seq;
DROP TABLE scraper.appomatic_mapcluster_query;
DROP SEQUENCE scraper.appomatic_mapcluster_cluster_id_seq;
DROP TABLE scraper.appomatic_mapcluster_cluster;
DROP TABLE scraper."WVCounty2005_03";
DROP TABLE scraper."RssFeedItem_Backup";
DROP SEQUENCE scraper."PaState2011_01_gid_seq";
DROP TABLE scraper."PaState2011_01";
DROP SEQUENCE scraper."PaCounty2011_01_gid_seq";
DROP TABLE scraper."PaCounty2011_01";
DROP SEQUENCE scraper."Monongahela_HUC8_watersheds_gid2_seq";
DROP TABLE scraper."Monongahela_HUC8_watersheds";
DROP SEQUENCE scraper."Monongahela_HUC6_Watershed_gid2_seq";
DROP TABLE scraper."Monongahela_HUC6_Watershed";
DROP SEQUENCE scraper."HUC10_Monongahela_gid2_seq";
DROP TABLE scraper."HUC10_Monongahela";
DROP SEQUENCE scraper."GOMPolygon_drawn_gid_seq";
DROP TABLE scraper."GOMPolygon_drawn";
DROP VIEW scraper."EXPORT_FracFocusReport";
DROP VIEW scraper."EXPORT_FracFocusCombined";
DROP VIEW scraper."EXPORT_FracFocusChemical";
DROP SEQUENCE scraper."Alegheny_Forest_PA_gid_seq";
DROP TABLE scraper."Alegheny_Forest_PA";
SET search_path = public, pg_catalog;

DROP TABLE public.temp_nrc_in_sar;
DROP TABLE public.temp_material;
DROP SEQUENCE public.temp_material_id_seq;
DROP TABLE public."temp_FSU_SAR_FOOTPRINTS";
DROP TABLE public.spatial_ref_sys;
DROP VIEW public.raster_overviews;
DROP VIEW public.raster_columns;
DROP SEQUENCE public.nightfire_file_id_seq;
DROP VIEW public.geometry_columns;
DROP VIEW public.geography_columns;
DROP TABLE public.feedentry_ewn2;
DROP SEQUENCE public.django_site_id_seq;
DROP TABLE public.django_site;
DROP TABLE public.django_session;
DROP SEQUENCE public.django_content_type_id_seq;
DROP TABLE public.django_content_type;
DROP SEQUENCE public.django_comments_id_seq;
DROP TABLE public.django_comments;
DROP SEQUENCE public.django_comment_flags_id_seq;
DROP TABLE public.django_comment_flags;
DROP SEQUENCE public.django_admin_log_id_seq;
DROP TABLE public.django_admin_log;
DROP SEQUENCE public.auth_user_user_permissions_id_seq;
DROP TABLE public.auth_user_user_permissions;
DROP SEQUENCE public.auth_user_id_seq;
DROP SEQUENCE public.auth_user_groups_id_seq;
DROP TABLE public.auth_user_groups;
DROP TABLE public.auth_user;
DROP SEQUENCE public.auth_permission_id_seq;
DROP TABLE public.auth_permission;
DROP SEQUENCE public.auth_group_permissions_id_seq;
DROP TABLE public.auth_group_permissions;
DROP SEQUENCE public.auth_group_id_seq;
DROP TABLE public.auth_group;
DROP SEQUENCE public.appomatic_nrccluster_nrcreport_id_seq;
DROP TABLE public.appomatic_nrccluster_nrcreport;
DROP SEQUENCE public.appomatic_nrccluster_cluster_id_seq;
DROP TABLE public.appomatic_nrccluster_cluster;
DROP SEQUENCE public.appomatic_mapimport_downloaded_id_seq;
DROP TABLE public.appomatic_mapimport_downloaded;
DROP SEQUENCE public.appomatic_mapdata_vessel_id_seq;
DROP TABLE public.appomatic_mapdata_vessel;
DROP SEQUENCE public.appomatic_mapdata_aispath_id_seq;
DROP TABLE public.appomatic_mapdata_aispath;
DROP SEQUENCE public.appomatic_mapdata_ais_id_seq;
DROP TABLE public.appomatic_mapdata_ais;
DROP SEQUENCE public.ais_seqid_seq;
DROP TABLE public.ais;
DROP TABLE public."WV_DrillingPermit";
DROP SEQUENCE public.wv_drillingpermit_st_id_seq;
DROP VIEW public."TEST2";
DROP VIEW public."TEST";
DROP TABLE public."TEMP_PGIDS";
DROP TABLE public."RssFeedItem";
DROP TABLE public."RssFeed";
DROP SEQUENCE public.rssfeed_id_seq;
DROP SEQUENCE public."RSSEmailSubscription_st_id_seq";
DROP TABLE public."RSSEmailSubscription_backup";
DROP TABLE public."RSSEmailSubscription";
DROP TABLE public."PublishedFeedItems";
DROP SEQUENCE public.publishedfeeditems_id_seq;
DROP TABLE public."PA_Violation";
DROP SEQUENCE public.pa_violation_st_id_seq;
DROP TABLE public."PA_Spud_new";
DROP SEQUENCE public.pa_spud_new_st_id_seq;
DROP TABLE public."PA_Spud_copy";
DROP SEQUENCE public.pa_spud_copy_st_id_seq;
DROP TABLE public."PA_Spud";
DROP SEQUENCE public.pa_spud_st_id_seq;
DROP TABLE public."PA_DrillingPermit";
DROP SEQUENCE public.pa_drillingpermit_st_id_seq;
DROP TABLE public."NrcUnits";
DROP SEQUENCE public.nrcunits_id_seq;
DROP TABLE public."NrcTag";
DROP TABLE public."NrcScraperTarget";
DROP SEQUENCE public.nrcscrapertarget_id_seq;
DROP TABLE public."NrcScrapedMaterial";
DROP SEQUENCE public.nrcscrapedmaterial_st_id_seq;
DROP TABLE public."NrcScrapedFullReport";
DROP TABLE public."NrcMaterials";
DROP SEQUENCE public.nrcmaterials_id_seq;
DROP TABLE public."Nightfire_record";
DROP SEQUENCE public."Nightfire_file_id_seq";
DROP TABLE public."Nightfire_file";
DROP TABLE public."LeaseBlockCentroid";
DROP SEQUENCE public.leaseblockcentroid_id_seq;
DROP TABLE public."LA_Lease_Blocks";
DROP SEQUENCE public.la_lease_blocks_id_seq;
DROP TABLE public."GeocodeCache";
DROP TABLE public."FracFocusScrape";
DROP SEQUENCE public.fracfocusscrape_seqid_seq;
DROP TABLE public."FracFocusReport_old2";
DROP SEQUENCE public.fracfocusreport_old2_seqid_seq;
DROP TABLE public."FracFocusReport_old";
DROP SEQUENCE public.fracfocusreport_old_seqid_seq;
DROP TABLE public."FracFocusReportChemical";
DROP SEQUENCE public.fracfocusreportchemical_seqid_seq;
DROP TABLE public."FracFocusReport";
DROP SEQUENCE public.fracfocusreport_seqid_seq;
DROP TABLE public."FracFocusParseChemical";
DROP SEQUENCE public.fracfocusparsechemical_seqid_seq;
DROP TABLE public."FracFocusParse";
DROP SEQUENCE public.fracfocusparse_seqid_seq;
DROP TABLE public."FracFocusPDF";
DROP TABLE public."FracFocusChemical_old2";
DROP SEQUENCE public.fracfocuschemical_old2_seqid_seq;
DROP TABLE public."FracFocusChemical_old";
DROP SEQUENCE public.fracfocuschemical_old_seqid_seq;
DROP TABLE public."FeedSource";
DROP SEQUENCE public.feedsource_id_seq;
DROP TABLE public."FeedEntryTag";
DROP TABLE public."FT_Test";
DROP SEQUENCE public.ft_test_seq_seq;
DROP VIEW public."FT_NRC_Incident_Reports";
DROP TABLE public."DEFUNCT_FracFocus";
DROP TABLE public."DEFUNCT_FeedEntry";
DROP SEQUENCE public.feedentry_published_seq_seq;
DROP TABLE public."DEFUNCT_BlockCentroidNew";
DROP TABLE public."DEFUNCT_BlockCentroid";
DROP TABLE public."CogisSpill";
DROP SEQUENCE public.cogisspill_st_id_seq;
DROP TABLE public."CogisInspection";
DROP SEQUENCE public.cogisinspection_st_id_seq;
DROP TABLE public."CO_Permits";
DROP TABLE public."BotTaskStatus";
DROP TABLE public."BotTaskParams";
DROP TABLE public."BotTaskError";
DROP TABLE public."BotTask";
DROP TABLE public."Boemre_sizes";
DROP TABLE public."AreaCodeMap";
DROP SEQUENCE public.areacodemap_id_seq;
DROP VIEW public."23051_Incidents";
DROP VIEW public."NrcReleaseIncidents";
DROP TABLE public."NrcScrapedReport";
DROP TABLE public."NrcParsedReport";
DROP TABLE public."NrcGeocode";
DROP TABLE public."NrcAnalysis";
SET search_path = pg_catalog;

DROP CAST (text AS public.geometry);
DROP CAST (public.raster AS public.geometry);
DROP CAST (public.raster AS bytea);
DROP CAST (public.raster AS public.box3d);
DROP CAST (public.geometry AS text);
DROP CAST (public.geometry AS public.geometry);
DROP CAST (public.geometry AS public.geography);
DROP CAST (public.geometry AS bytea);
DROP CAST (public.geometry AS public.box3d);
DROP CAST (public.geometry AS public.box2d);
DROP CAST (public.geometry AS box);
DROP CAST (public.geography AS public.geometry);
DROP CAST (public.geography AS public.geography);
DROP CAST (public.geography AS bytea);
DROP CAST (bytea AS public.geometry);
DROP CAST (bytea AS public.geography);
DROP CAST (public.box3d AS public.geometry);
DROP CAST (public.box3d AS public.box2d);
DROP CAST (public.box3d AS box);
DROP CAST (public.box2d AS public.geometry);
DROP CAST (public.box2d AS public.box3d);
SET search_path = public, pg_catalog;

DROP OPERATOR CLASS public.gist_geometry_ops_nd USING gist;
DROP OPERATOR CLASS public.gist_geometry_ops_2d USING gist;
DROP OPERATOR CLASS public.gist_geography_ops USING gist;
DROP OPERATOR CLASS public.btree_geometry_ops USING btree;
DROP OPERATOR CLASS public.btree_geography_ops USING btree;
DROP OPERATOR public.~= (raster, raster);
DROP OPERATOR public.~= (geometry, geometry);
DROP OPERATOR public.~ (geometry, raster);
DROP OPERATOR public.~ (raster, geometry);
DROP OPERATOR public.~ (raster, raster);
DROP OPERATOR public.~ (geometry, geometry);
DROP OPERATOR public.|>> (raster, raster);
DROP OPERATOR public.|>> (geometry, geometry);
DROP OPERATOR public.|&> (raster, raster);
DROP OPERATOR public.|&> (geometry, geometry);
DROP OPERATOR public.@ (raster, raster);
DROP OPERATOR public.@ (geometry, geometry);
DROP OPERATOR public.>> (raster, raster);
DROP OPERATOR public.>> (geometry, geometry);
DROP OPERATOR public.>= (geography, geography);
DROP OPERATOR public.>= (geometry, geometry);
DROP OPERATOR public.> (geography, geography);
DROP OPERATOR public.> (geometry, geometry);
DROP OPERATOR public.= (geography, geography);
DROP OPERATOR public.= (geometry, geometry);
DROP OPERATOR public.<= (geography, geography);
DROP OPERATOR public.<= (geometry, geometry);
DROP OPERATOR public.<<| (raster, raster);
DROP OPERATOR public.<<| (geometry, geometry);
DROP OPERATOR public.<< (raster, raster);
DROP OPERATOR public.<< (geometry, geometry);
DROP OPERATOR public.<-> (geometry, geometry);
DROP OPERATOR public.<#> (geometry, geometry);
DROP OPERATOR public.< (geography, geography);
DROP OPERATOR public.< (geometry, geometry);
DROP OPERATOR public.&> (raster, raster);
DROP OPERATOR public.&> (geometry, geometry);
DROP OPERATOR public.&<| (raster, raster);
DROP OPERATOR public.&<| (geometry, geometry);
DROP OPERATOR public.&< (raster, raster);
DROP OPERATOR public.&< (geometry, geometry);
DROP OPERATOR public.&&& (geometry, geometry);
DROP OPERATOR public.&& (geometry, raster);
DROP OPERATOR public.&& (raster, geometry);
DROP OPERATOR public.&& (raster, raster);
DROP OPERATOR public.&& (geography, geography);
DROP OPERATOR public.&& (geometry, geometry);
DROP AGGREGATE public.st_union(raster, integer, text);
DROP AGGREGATE public.st_union(raster, text);
DROP AGGREGATE public.st_union(raster, integer);
DROP AGGREGATE public.st_union(raster);
DROP AGGREGATE public.st_union(geometry);
DROP AGGREGATE public.st_polygonize(geometry);
DROP AGGREGATE public.st_memunion(geometry);
DROP AGGREGATE public.st_memcollect(geometry);
DROP AGGREGATE public.st_makeline(geometry);
DROP AGGREGATE public.st_extent(geometry);
DROP AGGREGATE public.st_collect(geometry);
DROP AGGREGATE public.st_accum(geometry);
DROP AGGREGATE public.st_3dextent(geometry);
SET search_path = scraper, pg_catalog;

DROP FUNCTION scraper.update_time_stamp_column();
DROP FUNCTION scraper.feedentry_insert();
DROP FUNCTION scraper.appomatic_mapdata_ais_insert();
SET search_path = public, pg_catalog;

DROP FUNCTION public.updategeometrysrid(catalogn_name character varying, schema_name character varying, table_name character varying, column_name character varying, new_srid_in integer);
DROP FUNCTION public.updategeometrysrid(character varying, character varying, character varying, integer);
DROP FUNCTION public.updategeometrysrid(character varying, character varying, integer);
DROP FUNCTION public.unlockrows(text);
DROP FUNCTION public.text(geometry);
DROP FUNCTION public.st_zmin(box3d);
DROP FUNCTION public.st_zmflag(geometry);
DROP FUNCTION public.st_zmax(box3d);
DROP FUNCTION public.st_z(geometry);
DROP FUNCTION public.st_ymin(box3d);
DROP FUNCTION public.st_ymax(box3d);
DROP FUNCTION public.st_y(geometry);
DROP FUNCTION public.st_xmin(box3d);
DROP FUNCTION public.st_xmax(box3d);
DROP FUNCTION public.st_x(geometry);
DROP FUNCTION public.st_world2rastercoordy(rast raster, xw double precision, yw double precision);
DROP FUNCTION public.st_world2rastercoordy(rast raster, pt geometry);
DROP FUNCTION public.st_world2rastercoordy(rast raster, yw double precision);
DROP FUNCTION public.st_world2rastercoordx(rast raster, xw double precision, yw double precision);
DROP FUNCTION public.st_world2rastercoordx(rast raster, pt geometry);
DROP FUNCTION public.st_world2rastercoordx(rast raster, xw double precision);
DROP FUNCTION public.st_wkttosql(text);
DROP FUNCTION public.st_wkbtosql(wkb bytea);
DROP FUNCTION public.st_within(geom1 geometry, geom2 geometry);
DROP FUNCTION public.st_width(raster);
DROP FUNCTION public.st_valuepercent(rastertable text, rastercolumn text, nband integer, exclude_nodata_value boolean, searchvalue double precision, roundto double precision);
DROP FUNCTION public.st_valuepercent(rastertable text, rastercolumn text, nband integer, exclude_nodata_value boolean, searchvalues double precision[], roundto double precision, OUT value double precision, OUT percent double precision);
DROP FUNCTION public.st_valuepercent(rastertable text, rastercolumn text, nband integer, searchvalue double precision, roundto double precision);
DROP FUNCTION public.st_valuepercent(rastertable text, rastercolumn text, nband integer, searchvalues double precision[], roundto double precision, OUT value double precision, OUT percent double precision);
DROP FUNCTION public.st_valuepercent(rast raster, nband integer, exclude_nodata_value boolean, searchvalue double precision, roundto double precision);
DROP FUNCTION public.st_valuepercent(rast raster, nband integer, exclude_nodata_value boolean, searchvalues double precision[], roundto double precision, OUT value double precision, OUT percent double precision);
DROP FUNCTION public.st_valuepercent(rastertable text, rastercolumn text, searchvalue double precision, roundto double precision);
DROP FUNCTION public.st_valuepercent(rastertable text, rastercolumn text, searchvalues double precision[], roundto double precision, OUT value double precision, OUT percent double precision);
DROP FUNCTION public.st_valuepercent(rast raster, nband integer, searchvalue double precision, roundto double precision);
DROP FUNCTION public.st_valuepercent(rast raster, nband integer, searchvalues double precision[], roundto double precision, OUT value double precision, OUT percent double precision);
DROP FUNCTION public.st_valuepercent(rast raster, searchvalue double precision, roundto double precision);
DROP FUNCTION public.st_valuepercent(rast raster, searchvalues double precision[], roundto double precision, OUT value double precision, OUT percent double precision);
DROP FUNCTION public.st_valuecount(rastertable text, rastercolumn text, nband integer, exclude_nodata_value boolean, searchvalue double precision, roundto double precision);
DROP FUNCTION public.st_valuecount(rastertable text, rastercolumn text, nband integer, exclude_nodata_value boolean, searchvalues double precision[], roundto double precision, OUT value double precision, OUT count integer);
DROP FUNCTION public.st_valuecount(rastertable text, rastercolumn text, nband integer, searchvalue double precision, roundto double precision);
DROP FUNCTION public.st_valuecount(rastertable text, rastercolumn text, nband integer, searchvalues double precision[], roundto double precision, OUT value double precision, OUT count integer);
DROP FUNCTION public.st_valuecount(rast raster, nband integer, exclude_nodata_value boolean, searchvalue double precision, roundto double precision);
DROP FUNCTION public.st_valuecount(rast raster, nband integer, exclude_nodata_value boolean, searchvalues double precision[], roundto double precision, OUT value double precision, OUT count integer);
DROP FUNCTION public.st_valuecount(rastertable text, rastercolumn text, searchvalue double precision, roundto double precision);
DROP FUNCTION public.st_valuecount(rastertable text, rastercolumn text, searchvalues double precision[], roundto double precision, OUT value double precision, OUT count integer);
DROP FUNCTION public.st_valuecount(rast raster, nband integer, searchvalue double precision, roundto double precision);
DROP FUNCTION public.st_valuecount(rast raster, nband integer, searchvalues double precision[], roundto double precision, OUT value double precision, OUT count integer);
DROP FUNCTION public.st_valuecount(rast raster, searchvalue double precision, roundto double precision);
DROP FUNCTION public.st_valuecount(rast raster, searchvalues double precision[], roundto double precision, OUT value double precision, OUT count integer);
DROP FUNCTION public.st_value(rast raster, band integer, x integer, y integer, hasnodata boolean);
DROP FUNCTION public.st_value(rast raster, band integer, pt geometry, hasnodata boolean);
DROP FUNCTION public.st_value(rast raster, x integer, y integer, hasnodata boolean);
DROP FUNCTION public.st_value(rast raster, pt geometry, hasnodata boolean);
DROP FUNCTION public.st_upperlefty(raster);
DROP FUNCTION public.st_upperleftx(raster);
DROP FUNCTION public.st_union(geom1 geometry, geom2 geometry);
DROP FUNCTION public.st_union(geometry[]);
DROP FUNCTION public.st_unaryunion(geometry);
DROP FUNCTION public.st_transscale(geometry, double precision, double precision, double precision, double precision);
DROP FUNCTION public.st_translate(geometry, double precision, double precision, double precision);
DROP FUNCTION public.st_translate(geometry, double precision, double precision);
DROP FUNCTION public.st_transform(rast raster, srid integer, scalex double precision, scaley double precision, algorithm text, maxerr double precision);
DROP FUNCTION public.st_transform(rast raster, srid integer, algorithm text, maxerr double precision, scalex double precision, scaley double precision);
DROP FUNCTION public.st_transform(rast raster, srid integer, scalexy double precision, algorithm text, maxerr double precision);
DROP FUNCTION public.st_transform(geometry, integer);
DROP FUNCTION public.st_touches(geom1 geometry, geom2 geometry);
DROP FUNCTION public.st_symmetricdifference(geom1 geometry, geom2 geometry);
DROP FUNCTION public.st_symdifference(geom1 geometry, geom2 geometry);
DROP FUNCTION public.st_summarystats(rastertable text, rastercolumn text, nband integer, exclude_nodata_value boolean);
DROP FUNCTION public.st_summarystats(rastertable text, rastercolumn text, exclude_nodata_value boolean);
DROP FUNCTION public.st_summarystats(rast raster, nband integer, exclude_nodata_value boolean);
DROP FUNCTION public.st_summarystats(rast raster, exclude_nodata_value boolean);
DROP FUNCTION public.st_summary(geography);
DROP FUNCTION public.st_summary(geometry);
DROP FUNCTION public.st_sum4ma(matrix double precision[], nodatamode text, VARIADIC args text[]);
DROP FUNCTION public.st_stddev4ma(matrix double precision[], nodatamode text, VARIADIC args text[]);
DROP FUNCTION public.st_startpoint(geometry);
DROP FUNCTION public.st_srid(raster);
DROP FUNCTION public.st_srid(geometry);
DROP FUNCTION public.st_split(geom1 geometry, geom2 geometry);
DROP FUNCTION public.st_snaptogrid(rast raster, gridx double precision, gridy double precision, scalex double precision, scaley double precision, algorithm text, maxerr double precision);
DROP FUNCTION public.st_snaptogrid(rast raster, gridx double precision, gridy double precision, algorithm text, maxerr double precision, scalex double precision, scaley double precision);
DROP FUNCTION public.st_snaptogrid(rast raster, gridx double precision, gridy double precision, scalexy double precision, algorithm text, maxerr double precision);
DROP FUNCTION public.st_snaptogrid(geom1 geometry, geom2 geometry, double precision, double precision, double precision, double precision);
DROP FUNCTION public.st_snaptogrid(geometry, double precision, double precision, double precision, double precision);
DROP FUNCTION public.st_snaptogrid(geometry, double precision, double precision);
DROP FUNCTION public.st_snaptogrid(geometry, double precision);
DROP FUNCTION public.st_snap(geom1 geometry, geom2 geometry, double precision);
DROP FUNCTION public.st_slope(rast raster, band integer, pixeltype text);
DROP FUNCTION public.st_skewy(raster);
DROP FUNCTION public.st_skewx(raster);
DROP FUNCTION public.st_simplifypreservetopology(geometry, double precision);
DROP FUNCTION public.st_simplify(geometry, double precision);
DROP FUNCTION public.st_shortestline(geom1 geometry, geom2 geometry);
DROP FUNCTION public.st_shift_longitude(geometry);
DROP FUNCTION public.st_sharedpaths(geom1 geometry, geom2 geometry);
DROP FUNCTION public.st_setvalue(rast raster, band integer, x integer, y integer, newvalue double precision);
DROP FUNCTION public.st_setvalue(rast raster, band integer, pt geometry, newvalue double precision);
DROP FUNCTION public.st_setvalue(rast raster, x integer, y integer, newvalue double precision);
DROP FUNCTION public.st_setvalue(rast raster, pt geometry, newvalue double precision);
DROP FUNCTION public.st_setupperleft(rast raster, upperleftx double precision, upperlefty double precision);
DROP FUNCTION public.st_setsrid(rast raster, srid integer);
DROP FUNCTION public.st_setsrid(geometry, integer);
DROP FUNCTION public.st_setskew(rast raster, skewx double precision, skewy double precision);
DROP FUNCTION public.st_setskew(rast raster, skew double precision);
DROP FUNCTION public.st_setscale(rast raster, scalex double precision, scaley double precision);
DROP FUNCTION public.st_setscale(rast raster, scale double precision);
DROP FUNCTION public.st_setrotation(rast raster, rotation double precision);
DROP FUNCTION public.st_setpoint(geometry, integer, geometry);
DROP FUNCTION public.st_setgeotransform(rast raster, imag double precision, jmag double precision, theta_i double precision, theta_ij double precision, xoffset double precision, yoffset double precision);
DROP FUNCTION public.st_setgeoreference(rast raster, georef text, format text);
DROP FUNCTION public.st_setbandnodatavalue(rast raster, band integer, nodatavalue double precision, forcechecking boolean);
DROP FUNCTION public.st_setbandnodatavalue(rast raster, nodatavalue double precision);
DROP FUNCTION public.st_setbandisnodata(rast raster, band integer);
DROP FUNCTION public.st_segmentize(geometry, double precision);
DROP FUNCTION public.st_scaley(raster);
DROP FUNCTION public.st_scalex(raster);
DROP FUNCTION public.st_scale(geometry, double precision, double precision, double precision);
DROP FUNCTION public.st_scale(geometry, double precision, double precision);
DROP FUNCTION public.st_samealignment(ulx1 double precision, uly1 double precision, scalex1 double precision, scaley1 double precision, skewx1 double precision, skewy1 double precision, ulx2 double precision, uly2 double precision, scalex2 double precision, scaley2 double precision, skewx2 double precision, skewy2 double precision);
DROP FUNCTION public.st_samealignment(rast1 raster, rast2 raster);
DROP FUNCTION public.st_rotation(raster);
DROP FUNCTION public.st_rotatez(geometry, double precision);
DROP FUNCTION public.st_rotatey(geometry, double precision);
DROP FUNCTION public.st_rotatex(geometry, double precision);
DROP FUNCTION public.st_rotate(geometry, double precision, double precision, double precision);
DROP FUNCTION public.st_rotate(geometry, double precision, geometry);
DROP FUNCTION public.st_rotate(geometry, double precision);
DROP FUNCTION public.st_reverse(geometry);
DROP FUNCTION public.st_reskew(rast raster, skewx double precision, skewy double precision, algorithm text, maxerr double precision);
DROP FUNCTION public.st_reskew(rast raster, skewxy double precision, algorithm text, maxerr double precision);
DROP FUNCTION public.st_rescale(rast raster, scalex double precision, scaley double precision, algorithm text, maxerr double precision);
DROP FUNCTION public.st_rescale(rast raster, scalexy double precision, algorithm text, maxerr double precision);
DROP FUNCTION public.st_resample(rast raster, width integer, height integer, srid integer, gridx double precision, gridy double precision, skewx double precision, skewy double precision, algorithm text, maxerr double precision);
DROP FUNCTION public.st_resample(rast raster, srid integer, scalex double precision, scaley double precision, gridx double precision, gridy double precision, skewx double precision, skewy double precision, algorithm text, maxerr double precision);
DROP FUNCTION public.st_resample(rast raster, ref raster, usescale boolean, algorithm text, maxerr double precision);
DROP FUNCTION public.st_resample(rast raster, ref raster, algorithm text, maxerr double precision, usescale boolean);
DROP FUNCTION public.st_removerepeatedpoints(geometry);
DROP FUNCTION public.st_removepoint(geometry, integer);
DROP FUNCTION public.st_relatematch(text, text);
DROP FUNCTION public.st_relate(geom1 geometry, geom2 geometry, text);
DROP FUNCTION public.st_relate(geom1 geometry, geom2 geometry, integer);
DROP FUNCTION public.st_relate(geom1 geometry, geom2 geometry);
DROP FUNCTION public.st_reclass(rast raster, nband integer, reclassexpr text, pixeltype text, nodataval double precision);
DROP FUNCTION public.st_reclass(rast raster, reclassexpr text, pixeltype text);
DROP FUNCTION public.st_reclass(rast raster, VARIADIC reclassargset reclassarg[]);
DROP FUNCTION public.st_raster2worldcoordy(rast raster, xr integer, yr integer);
DROP FUNCTION public.st_raster2worldcoordy(rast raster, yr integer);
DROP FUNCTION public.st_raster2worldcoordx(rast raster, xr integer, yr integer);
DROP FUNCTION public.st_raster2worldcoordx(rast raster, xr integer);
DROP FUNCTION public.st_range4ma(matrix double precision[], nodatamode text, VARIADIC args text[]);
DROP FUNCTION public.st_quantile(rastertable text, rastercolumn text, nband integer, exclude_nodata_value boolean, quantile double precision);
DROP FUNCTION public.st_quantile(rastertable text, rastercolumn text, nband integer, exclude_nodata_value boolean, quantiles double precision[]);
DROP FUNCTION public.st_quantile(rastertable text, rastercolumn text, exclude_nodata_value boolean, quantile double precision);
DROP FUNCTION public.st_quantile(rastertable text, rastercolumn text, nband integer, quantile double precision);
DROP FUNCTION public.st_quantile(rastertable text, rastercolumn text, nband integer, quantiles double precision[]);
DROP FUNCTION public.st_quantile(rast raster, nband integer, exclude_nodata_value boolean, quantile double precision);
DROP FUNCTION public.st_quantile(rast raster, nband integer, exclude_nodata_value boolean, quantiles double precision[]);
DROP FUNCTION public.st_quantile(rastertable text, rastercolumn text, quantile double precision);
DROP FUNCTION public.st_quantile(rastertable text, rastercolumn text, quantiles double precision[]);
DROP FUNCTION public.st_quantile(rast raster, exclude_nodata_value boolean, quantile double precision);
DROP FUNCTION public.st_quantile(rast raster, nband integer, quantile double precision);
DROP FUNCTION public.st_quantile(rast raster, nband integer, quantiles double precision[]);
DROP FUNCTION public.st_quantile(rast raster, quantile double precision);
DROP FUNCTION public.st_quantile(rast raster, quantiles double precision[]);
DROP FUNCTION public.st_project(geog geography, distance double precision, azimuth double precision);
DROP FUNCTION public.st_polygonize(geometry[]);
DROP FUNCTION public.st_polygonfromwkb(bytea, integer);
DROP FUNCTION public.st_polygonfromwkb(bytea);
DROP FUNCTION public.st_polygonfromtext(text, integer);
DROP FUNCTION public.st_polygonfromtext(text);
DROP FUNCTION public.st_polygon(rast raster, band integer);
DROP FUNCTION public.st_polygon(geometry, integer);
DROP FUNCTION public.st_polyfromwkb(bytea, integer);
DROP FUNCTION public.st_polyfromwkb(bytea);
DROP FUNCTION public.st_polyfromtext(text, integer);
DROP FUNCTION public.st_polyfromtext(text);
DROP FUNCTION public.st_pointonsurface(geometry);
DROP FUNCTION public.st_pointn(geometry, integer);
DROP FUNCTION public.st_pointfromwkb(bytea, integer);
DROP FUNCTION public.st_pointfromwkb(bytea);
DROP FUNCTION public.st_pointfromtext(text, integer);
DROP FUNCTION public.st_pointfromtext(text);
DROP FUNCTION public.st_point_inside_circle(geometry, double precision, double precision, double precision);
DROP FUNCTION public.st_point(double precision, double precision);
DROP FUNCTION public.st_pixelwidth(raster);
DROP FUNCTION public.st_pixelheight(raster);
DROP FUNCTION public.st_pixelaspolygons(rast raster, band integer, OUT geom geometry, OUT val double precision, OUT x integer, OUT y integer);
DROP FUNCTION public.st_pixelaspolygon(rast raster, x integer, y integer);
DROP FUNCTION public.st_perimeter2d(geometry);
DROP FUNCTION public.st_perimeter(geog geography, use_spheroid boolean);
DROP FUNCTION public.st_perimeter(geometry);
DROP FUNCTION public.st_patchn(geometry, integer);
DROP FUNCTION public.st_overlaps(geom1 geometry, geom2 geometry);
DROP FUNCTION public.st_orderingequals(geometrya geometry, geometryb geometry);
DROP FUNCTION public.st_offsetcurve(line geometry, distance double precision, params text);
DROP FUNCTION public.st_numpoints(geometry);
DROP FUNCTION public.st_numpatches(geometry);
DROP FUNCTION public.st_numinteriorrings(geometry);
DROP FUNCTION public.st_numinteriorring(geometry);
DROP FUNCTION public.st_numgeometries(geometry);
DROP FUNCTION public.st_numbands(raster);
DROP FUNCTION public.st_nrings(geometry);
DROP FUNCTION public.st_npoints(geometry);
DROP FUNCTION public.st_node(g geometry);
DROP FUNCTION public.st_ndims(geometry);
DROP FUNCTION public.st_multipolygonfromtext(text, integer);
DROP FUNCTION public.st_multipolygonfromtext(text);
DROP FUNCTION public.st_multipolyfromwkb(bytea, integer);
DROP FUNCTION public.st_multipolyfromwkb(bytea);
DROP FUNCTION public.st_multipointfromwkb(bytea, integer);
DROP FUNCTION public.st_multipointfromwkb(bytea);
DROP FUNCTION public.st_multipointfromtext(text);
DROP FUNCTION public.st_multilinestringfromtext(text, integer);
DROP FUNCTION public.st_multilinestringfromtext(text);
DROP FUNCTION public.st_multilinefromwkb(bytea);
DROP FUNCTION public.st_multi(geometry);
DROP FUNCTION public.st_mpolyfromwkb(bytea, integer);
DROP FUNCTION public.st_mpolyfromwkb(bytea);
DROP FUNCTION public.st_mpolyfromtext(text, integer);
DROP FUNCTION public.st_mpolyfromtext(text);
DROP FUNCTION public.st_mpointfromwkb(bytea, integer);
DROP FUNCTION public.st_mpointfromwkb(bytea);
DROP FUNCTION public.st_mpointfromtext(text, integer);
DROP FUNCTION public.st_mpointfromtext(text);
DROP FUNCTION public.st_mlinefromwkb(bytea, integer);
DROP FUNCTION public.st_mlinefromwkb(bytea);
DROP FUNCTION public.st_mlinefromtext(text, integer);
DROP FUNCTION public.st_mlinefromtext(text);
DROP FUNCTION public.st_minpossiblevalue(pixeltype text);
DROP FUNCTION public.st_minimumboundingcircle(inputgeom geometry, segs_per_quarter integer);
DROP FUNCTION public.st_min4ma(matrix double precision[], nodatamode text, VARIADIC args text[]);
DROP FUNCTION public.st_metadata(rast raster, OUT upperleftx double precision, OUT upperlefty double precision, OUT width integer, OUT height integer, OUT scalex double precision, OUT scaley double precision, OUT skewx double precision, OUT skewy double precision, OUT srid integer, OUT numbands integer);
DROP FUNCTION public.st_mem_size(geometry);
DROP FUNCTION public.st_mean4ma(matrix double precision[], nodatamode text, VARIADIC args text[]);
DROP FUNCTION public.st_maxdistance(geom1 geometry, geom2 geometry);
DROP FUNCTION public.st_max4ma(matrix double precision[], nodatamode text, VARIADIC args text[]);
DROP FUNCTION public.st_mapalgebrafctngb(rast raster, band integer, pixeltype text, ngbwidth integer, ngbheight integer, onerastngbuserfunc regprocedure, nodatamode text, VARIADIC args text[]);
DROP FUNCTION public.st_mapalgebrafct(rast1 raster, band1 integer, rast2 raster, band2 integer, tworastuserfunc regprocedure, pixeltype text, extenttype text, VARIADIC userargs text[]);
DROP FUNCTION public.st_mapalgebrafct(rast1 raster, rast2 raster, tworastuserfunc regprocedure, pixeltype text, extenttype text, VARIADIC userargs text[]);
DROP FUNCTION public.st_mapalgebrafct(rast raster, band integer, pixeltype text, onerastuserfunc regprocedure, VARIADIC args text[]);
DROP FUNCTION public.st_mapalgebrafct(rast raster, pixeltype text, onerastuserfunc regprocedure, VARIADIC args text[]);
DROP FUNCTION public.st_mapalgebrafct(rast raster, band integer, onerastuserfunc regprocedure, VARIADIC args text[]);
DROP FUNCTION public.st_mapalgebrafct(rast raster, band integer, pixeltype text, onerastuserfunc regprocedure);
DROP FUNCTION public.st_mapalgebrafct(rast raster, onerastuserfunc regprocedure, VARIADIC args text[]);
DROP FUNCTION public.st_mapalgebrafct(rast raster, pixeltype text, onerastuserfunc regprocedure);
DROP FUNCTION public.st_mapalgebrafct(rast raster, band integer, onerastuserfunc regprocedure);
DROP FUNCTION public.st_mapalgebrafct(rast raster, onerastuserfunc regprocedure);
DROP FUNCTION public.st_mapalgebraexpr(rast1 raster, band1 integer, rast2 raster, band2 integer, expression text, pixeltype text, extenttype text, nodata1expr text, nodata2expr text, nodatanodataval double precision);
DROP FUNCTION public.st_mapalgebraexpr(rast1 raster, rast2 raster, expression text, pixeltype text, extenttype text, nodata1expr text, nodata2expr text, nodatanodataval double precision);
DROP FUNCTION public.st_mapalgebraexpr(rast raster, band integer, pixeltype text, expression text, nodataval double precision);
DROP FUNCTION public.st_mapalgebraexpr(rast raster, pixeltype text, expression text, nodataval double precision);
DROP FUNCTION public.st_makevalid(geometry);
DROP FUNCTION public.st_makepolygon(geometry, geometry[]);
DROP FUNCTION public.st_makepolygon(geometry);
DROP FUNCTION public.st_makepointm(double precision, double precision, double precision);
DROP FUNCTION public.st_makepoint(double precision, double precision, double precision, double precision);
DROP FUNCTION public.st_makepoint(double precision, double precision, double precision);
DROP FUNCTION public.st_makepoint(double precision, double precision);
DROP FUNCTION public.st_makeline(geom1 geometry, geom2 geometry);
DROP FUNCTION public.st_makeline(geometry[]);
DROP FUNCTION public.st_makeenvelope(double precision, double precision, double precision, double precision, integer);
DROP FUNCTION public.st_makeemptyraster(width integer, height integer, upperleftx double precision, upperlefty double precision, scalex double precision, scaley double precision, skewx double precision, skewy double precision, srid integer);
DROP FUNCTION public.st_makeemptyraster(width integer, height integer, upperleftx double precision, upperlefty double precision, pixelsize double precision);
DROP FUNCTION public.st_makeemptyraster(rast raster);
DROP FUNCTION public.st_makebox2d(geom1 geometry, geom2 geometry);
DROP FUNCTION public.st_m(geometry);
DROP FUNCTION public.st_longestline(geom1 geometry, geom2 geometry);
DROP FUNCTION public.st_locatebetweenelevations(geometry geometry, fromelevation double precision, toelevation double precision);
DROP FUNCTION public.st_locatebetween(geometry geometry, frommeasure double precision, tomeasure double precision, leftrightoffset double precision);
DROP FUNCTION public.st_locatealong(geometry geometry, measure double precision, leftrightoffset double precision);
DROP FUNCTION public.st_locate_between_measures(geometry, double precision, double precision);
DROP FUNCTION public.st_locate_along_measure(geometry, double precision);
DROP FUNCTION public.st_linetocurve(geometry geometry);
DROP FUNCTION public.st_linestringfromwkb(bytea, integer);
DROP FUNCTION public.st_linestringfromwkb(bytea);
DROP FUNCTION public.st_linemerge(geometry);
DROP FUNCTION public.st_linefromwkb(bytea, integer);
DROP FUNCTION public.st_linefromwkb(bytea);
DROP FUNCTION public.st_linefromtext(text, integer);
DROP FUNCTION public.st_linefromtext(text);
DROP FUNCTION public.st_linefrommultipoint(geometry);
DROP FUNCTION public.st_linecrossingdirection(geom1 geometry, geom2 geometry);
DROP FUNCTION public.st_line_substring(geometry, double precision, double precision);
DROP FUNCTION public.st_line_locate_point(geom1 geometry, geom2 geometry);
DROP FUNCTION public.st_line_interpolate_point(geometry, double precision);
DROP FUNCTION public.st_length_spheroid(geometry, spheroid);
DROP FUNCTION public.st_length2d_spheroid(geometry, spheroid);
DROP FUNCTION public.st_length2d(geometry);
DROP FUNCTION public.st_length(geog geography, use_spheroid boolean);
DROP FUNCTION public.st_length(text);
DROP FUNCTION public.st_length(geometry);
DROP FUNCTION public.st_isvalidreason(geometry, integer);
DROP FUNCTION public.st_isvalidreason(geometry);
DROP FUNCTION public.st_isvaliddetail(geometry, integer);
DROP FUNCTION public.st_isvaliddetail(geometry);
DROP FUNCTION public.st_isvalid(geometry, integer);
DROP FUNCTION public.st_isvalid(geometry);
DROP FUNCTION public.st_issimple(geometry);
DROP FUNCTION public.st_isring(geometry);
DROP FUNCTION public.st_isempty(rast raster);
DROP FUNCTION public.st_isempty(geometry);
DROP FUNCTION public.st_iscollection(geometry);
DROP FUNCTION public.st_isclosed(geometry);
DROP FUNCTION public.st_intersects(rast1 raster, nband1 integer, rast2 raster, nband2 integer);
DROP FUNCTION public.st_intersects(geom geometry, rast raster, nband integer);
DROP FUNCTION public.st_intersects(rast raster, nband integer, geom geometry);
DROP FUNCTION public.st_intersects(rast raster, geom geometry, nband integer);
DROP FUNCTION public.st_intersects(rast1 raster, rast2 raster);
DROP FUNCTION public.st_intersects(text, text);
DROP FUNCTION public.st_intersects(geography, geography);
DROP FUNCTION public.st_intersects(geom1 geometry, geom2 geometry);
DROP FUNCTION public.st_intersection(rast1 raster, band1 integer, rast2 raster, band2 integer, returnband text, nodataval double precision);
DROP FUNCTION public.st_intersection(rast1 raster, band1 integer, rast2 raster, band2 integer, returnband text, nodataval double precision[]);
DROP FUNCTION public.st_intersection(rast1 raster, band1 integer, rast2 raster, band2 integer, nodataval double precision);
DROP FUNCTION public.st_intersection(rast1 raster, band1 integer, rast2 raster, band2 integer, nodataval double precision[]);
DROP FUNCTION public.st_intersection(rast1 raster, rast2 raster, returnband text, nodataval double precision);
DROP FUNCTION public.st_intersection(rast1 raster, rast2 raster, returnband text, nodataval double precision[]);
DROP FUNCTION public.st_intersection(rast1 raster, rast2 raster, nodataval double precision);
DROP FUNCTION public.st_intersection(rast1 raster, rast2 raster, nodataval double precision[]);
DROP FUNCTION public.st_intersection(rast raster, band integer, geomin geometry);
DROP FUNCTION public.st_intersection(geomin geometry, rast raster, band integer);
DROP FUNCTION public.st_intersection(rast raster, geomin geometry);
DROP FUNCTION public.st_intersection(text, text);
DROP FUNCTION public.st_intersection(geography, geography);
DROP FUNCTION public.st_intersection(geom1 geometry, geom2 geometry);
DROP FUNCTION public.st_interpolatepoint(line geometry, point geometry);
DROP FUNCTION public.st_interiorringn(geometry, integer);
DROP FUNCTION public.st_histogram(rastertable text, rastercolumn text, nband integer, exclude_nodata_value boolean, bins integer, width double precision[], "right" boolean);
DROP FUNCTION public.st_histogram(rastertable text, rastercolumn text, nband integer, bins integer, width double precision[], "right" boolean);
DROP FUNCTION public.st_histogram(rastertable text, rastercolumn text, nband integer, exclude_nodata_value boolean, bins integer, "right" boolean);
DROP FUNCTION public.st_histogram(rast raster, nband integer, exclude_nodata_value boolean, bins integer, width double precision[], "right" boolean);
DROP FUNCTION public.st_histogram(rastertable text, rastercolumn text, nband integer, bins integer, "right" boolean);
DROP FUNCTION public.st_histogram(rast raster, nband integer, bins integer, width double precision[], "right" boolean);
DROP FUNCTION public.st_histogram(rast raster, nband integer, exclude_nodata_value boolean, bins integer, "right" boolean);
DROP FUNCTION public.st_histogram(rast raster, nband integer, bins integer, "right" boolean);
DROP FUNCTION public.st_hillshade(rast raster, band integer, pixeltype text, azimuth double precision, altitude double precision, max_bright double precision, elevation_scale double precision);
DROP FUNCTION public.st_height(raster);
DROP FUNCTION public.st_hausdorffdistance(geom1 geometry, geom2 geometry, double precision);
DROP FUNCTION public.st_hausdorffdistance(geom1 geometry, geom2 geometry);
DROP FUNCTION public.st_hasnoband(rast raster, nband integer);
DROP FUNCTION public.st_hasarc(geometry geometry);
DROP FUNCTION public.st_gmltosql(text, integer);
DROP FUNCTION public.st_gmltosql(text);
DROP FUNCTION public.st_geotransform(raster, OUT imag double precision, OUT jmag double precision, OUT theta_i double precision, OUT theta_ij double precision, OUT xoffset double precision, OUT yoffset double precision);
DROP FUNCTION public.st_georeference(rast raster, format text);
DROP FUNCTION public.st_geomfromwkb(bytea, integer);
DROP FUNCTION public.st_geomfromwkb(bytea);
DROP FUNCTION public.st_geomfromtext(text, integer);
DROP FUNCTION public.st_geomfromtext(text);
DROP FUNCTION public.st_geomfromkml(text);
DROP FUNCTION public.st_geomfromgml(text, integer);
DROP FUNCTION public.st_geomfromgml(text);
DROP FUNCTION public.st_geomfromgeojson(text);
DROP FUNCTION public.st_geomfromewkt(text);
DROP FUNCTION public.st_geomfromewkb(bytea);
DROP FUNCTION public.st_geometrytype(geometry);
DROP FUNCTION public.st_geometryn(geometry, integer);
DROP FUNCTION public.st_geometryfromtext(text, integer);
DROP FUNCTION public.st_geometryfromtext(text);
DROP FUNCTION public.st_geomcollfromwkb(bytea, integer);
DROP FUNCTION public.st_geomcollfromwkb(bytea);
DROP FUNCTION public.st_geomcollfromtext(text, integer);
DROP FUNCTION public.st_geomcollfromtext(text);
DROP FUNCTION public.st_geohash(geom geometry, maxchars integer);
DROP FUNCTION public.st_geographyfromtext(text);
DROP FUNCTION public.st_geogfromwkb(bytea);
DROP FUNCTION public.st_geogfromtext(text);
DROP FUNCTION public.st_gdaldrivers(OUT idx integer, OUT short_name text, OUT long_name text, OUT create_options text);
DROP FUNCTION public.st_forcerhr(geometry);
DROP FUNCTION public.st_force_collection(geometry);
DROP FUNCTION public.st_force_4d(geometry);
DROP FUNCTION public.st_force_3dz(geometry);
DROP FUNCTION public.st_force_3dm(geometry);
DROP FUNCTION public.st_force_3d(geometry);
DROP FUNCTION public.st_force_2d(geometry);
DROP FUNCTION public.st_flipcoordinates(geometry);
DROP FUNCTION public.st_find_extent(text, text, text);
DROP FUNCTION public.st_find_extent(text, text);
DROP FUNCTION public.st_exteriorring(geometry);
DROP FUNCTION public.st_expand(geometry, double precision);
DROP FUNCTION public.st_expand(box3d, double precision);
DROP FUNCTION public.st_expand(box2d, double precision);
DROP FUNCTION public.st_estimated_extent(text, text, text);
DROP FUNCTION public.st_estimated_extent(text, text);
DROP FUNCTION public.st_equals(geom1 geometry, geom2 geometry);
DROP FUNCTION public.st_envelope(raster);
DROP FUNCTION public.st_envelope(geometry);
DROP FUNCTION public.st_endpoint(geometry);
DROP FUNCTION public.st_dwithin(geography, geography, double precision, boolean);
DROP FUNCTION public.st_dwithin(text, text, double precision);
DROP FUNCTION public.st_dwithin(geography, geography, double precision);
DROP FUNCTION public.st_dwithin(geom1 geometry, geom2 geometry, double precision);
DROP FUNCTION public.st_dumprings(geometry);
DROP FUNCTION public.st_dumppoints(geometry);
DROP FUNCTION public.st_dumpaspolygons(rast raster, band integer);
DROP FUNCTION public.st_dump(geometry);
DROP FUNCTION public.st_distinct4ma(matrix double precision[], nodatamode text, VARIADIC args text[]);
DROP FUNCTION public.st_distance_spheroid(geom1 geometry, geom2 geometry, spheroid);
DROP FUNCTION public.st_distance_sphere(geom1 geometry, geom2 geometry);
DROP FUNCTION public.st_distance(geography, geography, boolean);
DROP FUNCTION public.st_distance(text, text);
DROP FUNCTION public.st_distance(geography, geography);
DROP FUNCTION public.st_distance(geom1 geometry, geom2 geometry);
DROP FUNCTION public.st_disjoint(geom1 geometry, geom2 geometry);
DROP FUNCTION public.st_dimension(geometry);
DROP FUNCTION public.st_difference(geom1 geometry, geom2 geometry);
DROP FUNCTION public.st_dfullywithin(geom1 geometry, geom2 geometry, double precision);
DROP FUNCTION public.st_curvetoline(geometry, integer);
DROP FUNCTION public.st_curvetoline(geometry);
DROP FUNCTION public.st_crosses(geom1 geometry, geom2 geometry);
DROP FUNCTION public.st_covers(text, text);
DROP FUNCTION public.st_covers(geography, geography);
DROP FUNCTION public.st_covers(geom1 geometry, geom2 geometry);
DROP FUNCTION public.st_coveredby(text, text);
DROP FUNCTION public.st_coveredby(geography, geography);
DROP FUNCTION public.st_coveredby(geom1 geometry, geom2 geometry);
DROP FUNCTION public.st_count(rastertable text, rastercolumn text, nband integer, exclude_nodata_value boolean);
DROP FUNCTION public.st_count(rastertable text, rastercolumn text, exclude_nodata_value boolean);
DROP FUNCTION public.st_count(rast raster, nband integer, exclude_nodata_value boolean);
DROP FUNCTION public.st_count(rast raster, exclude_nodata_value boolean);
DROP FUNCTION public.st_coorddim(geometry geometry);
DROP FUNCTION public.st_convexhull(raster);
DROP FUNCTION public.st_convexhull(geometry);
DROP FUNCTION public.st_containsproperly(geom1 geometry, geom2 geometry);
DROP FUNCTION public.st_contains(geom1 geometry, geom2 geometry);
DROP FUNCTION public.st_concavehull(param_geom geometry, param_pctconvex double precision, param_allow_holes boolean);
DROP FUNCTION public.st_combine_bbox(box3d, geometry);
DROP FUNCTION public.st_combine_bbox(box2d, geometry);
DROP FUNCTION public.st_collectionhomogenize(geometry);
DROP FUNCTION public.st_collectionextract(geometry, integer);
DROP FUNCTION public.st_collect(geom1 geometry, geom2 geometry);
DROP FUNCTION public.st_collect(geometry[]);
DROP FUNCTION public.st_closestpoint(geom1 geometry, geom2 geometry);
DROP FUNCTION public.st_clip(rast raster, band integer, geom geometry, nodataval double precision, crop boolean);
DROP FUNCTION public.st_clip(rast raster, band integer, geom geometry, nodataval double precision[], crop boolean);
DROP FUNCTION public.st_clip(rast raster, geom geometry, nodataval double precision, crop boolean);
DROP FUNCTION public.st_clip(rast raster, geom geometry, nodataval double precision[], crop boolean);
DROP FUNCTION public.st_clip(rast raster, band integer, geom geometry, crop boolean);
DROP FUNCTION public.st_clip(rast raster, geom geometry, crop boolean);
DROP FUNCTION public.st_cleangeometry(geometry);
DROP FUNCTION public.st_centroid(geometry);
DROP FUNCTION public.st_buildarea(geometry);
DROP FUNCTION public.st_buffer(geometry, double precision, text);
DROP FUNCTION public.st_buffer(geometry, double precision, integer);
DROP FUNCTION public.st_buffer(text, double precision);
DROP FUNCTION public.st_buffer(geography, double precision);
DROP FUNCTION public.st_buffer(geometry, double precision);
DROP FUNCTION public.st_boundary(geometry);
DROP FUNCTION public.st_bdpolyfromtext(text, integer);
DROP FUNCTION public.st_bdmpolyfromtext(text, integer);
DROP FUNCTION public.st_bandpixeltype(rast raster, band integer);
DROP FUNCTION public.st_bandpath(rast raster, band integer);
DROP FUNCTION public.st_bandnodatavalue(rast raster, band integer);
DROP FUNCTION public.st_bandmetadata(rast raster, band integer, OUT pixeltype text, OUT nodatavalue double precision, OUT isoutdb boolean, OUT path text);
DROP FUNCTION public.st_bandmetadata(rast raster, band integer[], OUT bandnum integer, OUT pixeltype text, OUT nodatavalue double precision, OUT isoutdb boolean, OUT path text);
DROP FUNCTION public.st_bandisnodata(rast raster, band integer, forcechecking boolean);
DROP FUNCTION public.st_bandisnodata(rast raster, forcechecking boolean);
DROP FUNCTION public.st_band(rast raster, nbands text, delimiter character);
DROP FUNCTION public.st_band(rast raster, nband integer);
DROP FUNCTION public.st_band(rast raster, nbands integer[]);
DROP FUNCTION public.st_azimuth(geog1 geography, geog2 geography);
DROP FUNCTION public.st_azimuth(geom1 geometry, geom2 geometry);
DROP FUNCTION public.st_asx3d(geom geometry, maxdecimaldigits integer, options integer);
DROP FUNCTION public.st_astiff(rast raster, nbands integer[], compression text, srid integer);
DROP FUNCTION public.st_astiff(rast raster, nbands integer[], options text[], srid integer);
DROP FUNCTION public.st_astiff(rast raster, compression text, srid integer);
DROP FUNCTION public.st_astiff(rast raster, options text[], srid integer);
DROP FUNCTION public.st_astext(text);
DROP FUNCTION public.st_astext(geography);
DROP FUNCTION public.st_astext(geometry);
DROP FUNCTION public.st_assvg(geog geography, rel integer, maxdecimaldigits integer);
DROP FUNCTION public.st_assvg(geom geometry, rel integer, maxdecimaldigits integer);
DROP FUNCTION public.st_assvg(text);
DROP FUNCTION public.st_asraster(geom geometry, width integer, height integer, pixeltype text, value double precision, nodataval double precision, upperleftx double precision, upperlefty double precision, skewx double precision, skewy double precision, touched boolean);
DROP FUNCTION public.st_asraster(geom geometry, width integer, height integer, gridx double precision, gridy double precision, pixeltype text, value double precision, nodataval double precision, skewx double precision, skewy double precision, touched boolean);
DROP FUNCTION public.st_asraster(geom geometry, scalex double precision, scaley double precision, pixeltype text, value double precision, nodataval double precision, upperleftx double precision, upperlefty double precision, skewx double precision, skewy double precision, touched boolean);
DROP FUNCTION public.st_asraster(geom geometry, scalex double precision, scaley double precision, gridx double precision, gridy double precision, pixeltype text, value double precision, nodataval double precision, skewx double precision, skewy double precision, touched boolean);
DROP FUNCTION public.st_asraster(geom geometry, width integer, height integer, pixeltype text[], value double precision[], nodataval double precision[], upperleftx double precision, upperlefty double precision, skewx double precision, skewy double precision, touched boolean);
DROP FUNCTION public.st_asraster(geom geometry, width integer, height integer, gridx double precision, gridy double precision, pixeltype text[], value double precision[], nodataval double precision[], skewx double precision, skewy double precision, touched boolean);
DROP FUNCTION public.st_asraster(geom geometry, scalex double precision, scaley double precision, pixeltype text[], value double precision[], nodataval double precision[], upperleftx double precision, upperlefty double precision, skewx double precision, skewy double precision, touched boolean);
DROP FUNCTION public.st_asraster(geom geometry, scalex double precision, scaley double precision, gridx double precision, gridy double precision, pixeltype text[], value double precision[], nodataval double precision[], skewx double precision, skewy double precision, touched boolean);
DROP FUNCTION public.st_asraster(geom geometry, ref raster, pixeltype text, value double precision, nodataval double precision, touched boolean);
DROP FUNCTION public.st_asraster(geom geometry, ref raster, pixeltype text[], value double precision[], nodataval double precision[], touched boolean);
DROP FUNCTION public.st_aspng(rast raster, nband integer, compression integer);
DROP FUNCTION public.st_aspng(rast raster, nband integer, options text[]);
DROP FUNCTION public.st_aspng(rast raster, nbands integer[], compression integer);
DROP FUNCTION public.st_aspng(rast raster, nbands integer[], options text[]);
DROP FUNCTION public.st_aspng(rast raster, options text[]);
DROP FUNCTION public.st_aspect(rast raster, band integer, pixeltype text);
DROP FUNCTION public.st_aslatlontext(geometry, text);
DROP FUNCTION public.st_aslatlontext(geometry);
DROP FUNCTION public.st_askml(version integer, geog geography, maxdecimaldigits integer, nprefix text);
DROP FUNCTION public.st_askml(version integer, geom geometry, maxdecimaldigits integer, nprefix text);
DROP FUNCTION public.st_askml(geog geography, maxdecimaldigits integer);
DROP FUNCTION public.st_askml(geom geometry, maxdecimaldigits integer);
DROP FUNCTION public.st_askml(text);
DROP FUNCTION public.st_asjpeg(rast raster, nband integer, quality integer);
DROP FUNCTION public.st_asjpeg(rast raster, nband integer, options text[]);
DROP FUNCTION public.st_asjpeg(rast raster, nbands integer[], quality integer);
DROP FUNCTION public.st_asjpeg(rast raster, nbands integer[], options text[]);
DROP FUNCTION public.st_asjpeg(rast raster, options text[]);
DROP FUNCTION public.st_ashexewkb(geometry, text);
DROP FUNCTION public.st_ashexewkb(geometry);
DROP FUNCTION public.st_asgml(version integer, geog geography, maxdecimaldigits integer, options integer, nprefix text);
DROP FUNCTION public.st_asgml(version integer, geom geometry, maxdecimaldigits integer, options integer, nprefix text);
DROP FUNCTION public.st_asgml(geog geography, maxdecimaldigits integer, options integer);
DROP FUNCTION public.st_asgml(geom geometry, maxdecimaldigits integer, options integer);
DROP FUNCTION public.st_asgml(text);
DROP FUNCTION public.st_asgeojson(gj_version integer, geog geography, maxdecimaldigits integer, options integer);
DROP FUNCTION public.st_asgeojson(gj_version integer, geom geometry, maxdecimaldigits integer, options integer);
DROP FUNCTION public.st_asgeojson(geog geography, maxdecimaldigits integer, options integer);
DROP FUNCTION public.st_asgeojson(geom geometry, maxdecimaldigits integer, options integer);
DROP FUNCTION public.st_asgeojson(text);
DROP FUNCTION public.st_asgdalraster(rast raster, format text, options text[], srid integer);
DROP FUNCTION public.st_asewkt(text);
DROP FUNCTION public.st_asewkt(geography);
DROP FUNCTION public.st_asewkt(geometry);
DROP FUNCTION public.st_asewkb(geometry, text);
DROP FUNCTION public.st_asewkb(geometry);
DROP FUNCTION public.st_asbinary(geography, text);
DROP FUNCTION public.st_asbinary(geometry, text);
DROP FUNCTION public.st_asbinary(raster);
DROP FUNCTION public.st_asbinary(geography);
DROP FUNCTION public.st_asbinary(geometry);
DROP FUNCTION public.st_area2d(geometry);
DROP FUNCTION public.st_area(geog geography, use_spheroid boolean);
DROP FUNCTION public.st_area(text);
DROP FUNCTION public.st_area(geometry);
DROP FUNCTION public.st_approxsummarystats(rastertable text, rastercolumn text, nband integer, exclude_nodata_value boolean, sample_percent double precision);
DROP FUNCTION public.st_approxsummarystats(rastertable text, rastercolumn text, nband integer, sample_percent double precision);
DROP FUNCTION public.st_approxsummarystats(rast raster, nband integer, exclude_nodata_value boolean, sample_percent double precision);
DROP FUNCTION public.st_approxsummarystats(rastertable text, rastercolumn text, sample_percent double precision);
DROP FUNCTION public.st_approxsummarystats(rastertable text, rastercolumn text, exclude_nodata_value boolean);
DROP FUNCTION public.st_approxsummarystats(rast raster, exclude_nodata_value boolean, sample_percent double precision);
DROP FUNCTION public.st_approxsummarystats(rast raster, nband integer, sample_percent double precision);
DROP FUNCTION public.st_approxsummarystats(rast raster, sample_percent double precision);
DROP FUNCTION public.st_approxquantile(rastertable text, rastercolumn text, nband integer, exclude_nodata_value boolean, sample_percent double precision, quantile double precision);
DROP FUNCTION public.st_approxquantile(rastertable text, rastercolumn text, nband integer, exclude_nodata_value boolean, sample_percent double precision, quantiles double precision[]);
DROP FUNCTION public.st_approxquantile(rastertable text, rastercolumn text, nband integer, sample_percent double precision, quantile double precision);
DROP FUNCTION public.st_approxquantile(rastertable text, rastercolumn text, nband integer, sample_percent double precision, quantiles double precision[]);
DROP FUNCTION public.st_approxquantile(rast raster, nband integer, exclude_nodata_value boolean, sample_percent double precision, quantile double precision);
DROP FUNCTION public.st_approxquantile(rast raster, nband integer, exclude_nodata_value boolean, sample_percent double precision, quantiles double precision[]);
DROP FUNCTION public.st_approxquantile(rastertable text, rastercolumn text, exclude_nodata_value boolean, quantile double precision);
DROP FUNCTION public.st_approxquantile(rastertable text, rastercolumn text, sample_percent double precision, quantile double precision);
DROP FUNCTION public.st_approxquantile(rastertable text, rastercolumn text, sample_percent double precision, quantiles double precision[]);
DROP FUNCTION public.st_approxquantile(rast raster, nband integer, sample_percent double precision, quantile double precision);
DROP FUNCTION public.st_approxquantile(rast raster, nband integer, sample_percent double precision, quantiles double precision[]);
DROP FUNCTION public.st_approxquantile(rastertable text, rastercolumn text, quantile double precision);
DROP FUNCTION public.st_approxquantile(rastertable text, rastercolumn text, quantiles double precision[]);
DROP FUNCTION public.st_approxquantile(rast raster, exclude_nodata_value boolean, quantile double precision);
DROP FUNCTION public.st_approxquantile(rast raster, sample_percent double precision, quantile double precision);
DROP FUNCTION public.st_approxquantile(rast raster, sample_percent double precision, quantiles double precision[]);
DROP FUNCTION public.st_approxquantile(rast raster, quantile double precision);
DROP FUNCTION public.st_approxquantile(rast raster, quantiles double precision[]);
DROP FUNCTION public.st_approxhistogram(rastertable text, rastercolumn text, nband integer, exclude_nodata_value boolean, sample_percent double precision, bins integer, width double precision[], "right" boolean);
DROP FUNCTION public.st_approxhistogram(rastertable text, rastercolumn text, nband integer, sample_percent double precision, bins integer, width double precision[], "right" boolean);
DROP FUNCTION public.st_approxhistogram(rastertable text, rastercolumn text, nband integer, exclude_nodata_value boolean, sample_percent double precision, bins integer, "right" boolean);
DROP FUNCTION public.st_approxhistogram(rast raster, nband integer, exclude_nodata_value boolean, sample_percent double precision, bins integer, width double precision[], "right" boolean);
DROP FUNCTION public.st_approxhistogram(rastertable text, rastercolumn text, nband integer, sample_percent double precision, bins integer, "right" boolean);
DROP FUNCTION public.st_approxhistogram(rast raster, nband integer, sample_percent double precision, bins integer, width double precision[], "right" boolean);
DROP FUNCTION public.st_approxhistogram(rast raster, nband integer, exclude_nodata_value boolean, sample_percent double precision, bins integer, "right" boolean);
DROP FUNCTION public.st_approxhistogram(rast raster, nband integer, sample_percent double precision, bins integer, "right" boolean);
DROP FUNCTION public.st_approxhistogram(rastertable text, rastercolumn text, nband integer, sample_percent double precision);
DROP FUNCTION public.st_approxhistogram(rastertable text, rastercolumn text, sample_percent double precision);
DROP FUNCTION public.st_approxhistogram(rast raster, nband integer, sample_percent double precision);
DROP FUNCTION public.st_approxhistogram(rast raster, sample_percent double precision);
DROP FUNCTION public.st_approxcount(rastertable text, rastercolumn text, nband integer, exclude_nodata_value boolean, sample_percent double precision);
DROP FUNCTION public.st_approxcount(rastertable text, rastercolumn text, exclude_nodata_value boolean, sample_percent double precision);
DROP FUNCTION public.st_approxcount(rastertable text, rastercolumn text, nband integer, sample_percent double precision);
DROP FUNCTION public.st_approxcount(rast raster, nband integer, exclude_nodata_value boolean, sample_percent double precision);
DROP FUNCTION public.st_approxcount(rastertable text, rastercolumn text, sample_percent double precision);
DROP FUNCTION public.st_approxcount(rast raster, exclude_nodata_value boolean, sample_percent double precision);
DROP FUNCTION public.st_approxcount(rast raster, nband integer, sample_percent double precision);
DROP FUNCTION public.st_approxcount(rast raster, sample_percent double precision);
DROP FUNCTION public.st_affine(geometry, double precision, double precision, double precision, double precision, double precision, double precision, double precision, double precision, double precision, double precision, double precision, double precision);
DROP FUNCTION public.st_affine(geometry, double precision, double precision, double precision, double precision, double precision, double precision);
DROP FUNCTION public.st_addpoint(geom1 geometry, geom2 geometry, integer);
DROP FUNCTION public.st_addpoint(geom1 geometry, geom2 geometry);
DROP FUNCTION public.st_addmeasure(geometry, double precision, double precision);
DROP FUNCTION public.st_addband(rast raster, index integer, pixeltype text, initialvalue double precision, nodataval double precision);
DROP FUNCTION public.st_addband(torast raster, fromrast raster, fromband integer, torastindex integer);
DROP FUNCTION public.st_addband(rast raster, pixeltype text, initialvalue double precision, nodataval double precision);
DROP FUNCTION public.st_addband(torast raster, fromrasts raster[], fromband integer);
DROP FUNCTION public.st_3dshortestline(geom1 geometry, geom2 geometry);
DROP FUNCTION public.st_3dperimeter(geometry);
DROP FUNCTION public.st_3dmaxdistance(geom1 geometry, geom2 geometry);
DROP FUNCTION public.st_3dmakebox(geom1 geometry, geom2 geometry);
DROP FUNCTION public.st_3dlongestline(geom1 geometry, geom2 geometry);
DROP FUNCTION public.st_3dlength_spheroid(geometry, spheroid);
DROP FUNCTION public.st_3dlength(geometry);
DROP FUNCTION public.st_3dintersects(geom1 geometry, geom2 geometry);
DROP FUNCTION public.st_3ddwithin(geom1 geometry, geom2 geometry, double precision);
DROP FUNCTION public.st_3ddistance(geom1 geometry, geom2 geometry);
DROP FUNCTION public.st_3ddfullywithin(geom1 geometry, geom2 geometry, double precision);
DROP FUNCTION public.st_3dclosestpoint(geom1 geometry, geom2 geometry);
DROP FUNCTION public.raster_same(raster, raster);
DROP FUNCTION public.raster_right(raster, raster);
DROP FUNCTION public.raster_overright(raster, raster);
DROP FUNCTION public.raster_overleft(raster, raster);
DROP FUNCTION public.raster_overlap(raster, raster);
DROP FUNCTION public.raster_overbelow(raster, raster);
DROP FUNCTION public.raster_overabove(raster, raster);
DROP FUNCTION public.raster_left(raster, raster);
DROP FUNCTION public.raster_geometry_overlap(raster, geometry);
DROP FUNCTION public.raster_geometry_contain(raster, geometry);
DROP FUNCTION public.raster_contained(raster, raster);
DROP FUNCTION public.raster_contain(raster, raster);
DROP FUNCTION public.raster_below(raster, raster);
DROP FUNCTION public.raster_above(raster, raster);
DROP FUNCTION public.postgis_version();
DROP FUNCTION public.postgis_typmod_type(integer);
DROP FUNCTION public.postgis_typmod_srid(integer);
DROP FUNCTION public.postgis_typmod_dims(integer);
DROP FUNCTION public.postgis_type_name(geomname character varying, coord_dimension integer, use_new_name boolean);
DROP FUNCTION public.postgis_transform_geometry(geometry, text, text, integer);
DROP FUNCTION public.postgis_svn_version();
DROP FUNCTION public.postgis_scripts_released();
DROP FUNCTION public.postgis_scripts_installed();
DROP FUNCTION public.postgis_scripts_build_date();
DROP FUNCTION public.postgis_raster_scripts_installed();
DROP FUNCTION public.postgis_raster_lib_version();
DROP FUNCTION public.postgis_raster_lib_build_date();
DROP FUNCTION public.postgis_proj_version();
DROP FUNCTION public.postgis_noop(geometry);
DROP FUNCTION public.postgis_libxml_version();
DROP FUNCTION public.postgis_libjson_version();
DROP FUNCTION public.postgis_lib_version();
DROP FUNCTION public.postgis_lib_build_date();
DROP FUNCTION public.postgis_hasbbox(geometry);
DROP FUNCTION public.postgis_getbbox(geometry);
DROP FUNCTION public.postgis_geos_version();
DROP FUNCTION public.postgis_gdal_version();
DROP FUNCTION public.postgis_full_version();
DROP FUNCTION public.postgis_dropbbox(geometry);
DROP FUNCTION public.postgis_constraint_type(geomschema text, geomtable text, geomcolumn text);
DROP FUNCTION public.postgis_constraint_srid(geomschema text, geomtable text, geomcolumn text);
DROP FUNCTION public.postgis_constraint_dims(geomschema text, geomtable text, geomcolumn text);
DROP FUNCTION public.postgis_cache_bbox();
DROP FUNCTION public.postgis_addbbox(geometry);
DROP FUNCTION public.populate_geometry_columns(tbl_oid oid, use_typmod boolean);
DROP FUNCTION public.populate_geometry_columns(use_typmod boolean);
DROP FUNCTION public.pgis_geometry_union_finalfn(pgis_abs);
DROP FUNCTION public.pgis_geometry_polygonize_finalfn(pgis_abs);
DROP FUNCTION public.pgis_geometry_makeline_finalfn(pgis_abs);
DROP FUNCTION public.pgis_geometry_collect_finalfn(pgis_abs);
DROP FUNCTION public.pgis_geometry_accum_transfn(pgis_abs, geometry);
DROP FUNCTION public.pgis_geometry_accum_finalfn(pgis_abs);
DROP FUNCTION public.longtransactionsenabled();
DROP FUNCTION public.lockrow(text, text, text, text, timestamp without time zone);
DROP FUNCTION public.lockrow(text, text, text, timestamp without time zone);
DROP FUNCTION public.lockrow(text, text, text, text);
DROP FUNCTION public.lockrow(text, text, text);
DROP FUNCTION public.gettransactionid();
DROP FUNCTION public.get_proj4_from_srid(integer);
DROP FUNCTION public.geomfromewkt(text);
DROP FUNCTION public.geomfromewkb(bytea);
DROP FUNCTION public.geometrytype(geography);
DROP FUNCTION public.geometrytype(geometry);
DROP FUNCTION public.geometry_within(geom1 geometry, geom2 geometry);
DROP FUNCTION public.geometry_same(geom1 geometry, geom2 geometry);
DROP FUNCTION public.geometry_right(geom1 geometry, geom2 geometry);
DROP FUNCTION public.geometry_raster_overlap(geometry, raster);
DROP FUNCTION public.geometry_raster_contain(geometry, raster);
DROP FUNCTION public.geometry_overright(geom1 geometry, geom2 geometry);
DROP FUNCTION public.geometry_overleft(geom1 geometry, geom2 geometry);
DROP FUNCTION public.geometry_overlaps_nd(geometry, geometry);
DROP FUNCTION public.geometry_overlaps(geom1 geometry, geom2 geometry);
DROP FUNCTION public.geometry_overbelow(geom1 geometry, geom2 geometry);
DROP FUNCTION public.geometry_overabove(geom1 geometry, geom2 geometry);
DROP FUNCTION public.geometry_lt(geom1 geometry, geom2 geometry);
DROP FUNCTION public.geometry_left(geom1 geometry, geom2 geometry);
DROP FUNCTION public.geometry_le(geom1 geometry, geom2 geometry);
DROP FUNCTION public.geometry_gt(geom1 geometry, geom2 geometry);
DROP FUNCTION public.geometry_gist_union_nd(bytea, internal);
DROP FUNCTION public.geometry_gist_union_2d(bytea, internal);
DROP FUNCTION public.geometry_gist_sel_2d(internal, oid, internal, integer);
DROP FUNCTION public.geometry_gist_same_nd(geometry, geometry, internal);
DROP FUNCTION public.geometry_gist_same_2d(geom1 geometry, geom2 geometry, internal);
DROP FUNCTION public.geometry_gist_picksplit_nd(internal, internal);
DROP FUNCTION public.geometry_gist_picksplit_2d(internal, internal);
DROP FUNCTION public.geometry_gist_penalty_nd(internal, internal, internal);
DROP FUNCTION public.geometry_gist_penalty_2d(internal, internal, internal);
DROP FUNCTION public.geometry_gist_joinsel_2d(internal, oid, internal, smallint);
DROP FUNCTION public.geometry_gist_distance_2d(internal, geometry, integer);
DROP FUNCTION public.geometry_gist_decompress_nd(internal);
DROP FUNCTION public.geometry_gist_decompress_2d(internal);
DROP FUNCTION public.geometry_gist_consistent_nd(internal, geometry, integer);
DROP FUNCTION public.geometry_gist_consistent_2d(internal, geometry, integer);
DROP FUNCTION public.geometry_gist_compress_nd(internal);
DROP FUNCTION public.geometry_gist_compress_2d(internal);
DROP FUNCTION public.geometry_ge(geom1 geometry, geom2 geometry);
DROP FUNCTION public.geometry_eq(geom1 geometry, geom2 geometry);
DROP FUNCTION public.geometry_distance_centroid(geom1 geometry, geom2 geometry);
DROP FUNCTION public.geometry_distance_box(geom1 geometry, geom2 geometry);
DROP FUNCTION public.geometry_contains(geom1 geometry, geom2 geometry);
DROP FUNCTION public.geometry_cmp(geom1 geometry, geom2 geometry);
DROP FUNCTION public.geometry_below(geom1 geometry, geom2 geometry);
DROP FUNCTION public.geometry_above(geom1 geometry, geom2 geometry);
DROP FUNCTION public.geometry(geometry, integer, boolean);
DROP FUNCTION public.geometry(geography);
DROP FUNCTION public.geometry(bytea);
DROP FUNCTION public.geometry(text);
DROP FUNCTION public.geometry(box3d);
DROP FUNCTION public.geometry(box2d);
DROP FUNCTION public.geography_overlaps(geography, geography);
DROP FUNCTION public.geography_lt(geography, geography);
DROP FUNCTION public.geography_le(geography, geography);
DROP FUNCTION public.geography_gt(geography, geography);
DROP FUNCTION public.geography_gist_union(bytea, internal);
DROP FUNCTION public.geography_gist_selectivity(internal, oid, internal, integer);
DROP FUNCTION public.geography_gist_same(box2d, box2d, internal);
DROP FUNCTION public.geography_gist_picksplit(internal, internal);
DROP FUNCTION public.geography_gist_penalty(internal, internal, internal);
DROP FUNCTION public.geography_gist_join_selectivity(internal, oid, internal, smallint);
DROP FUNCTION public.geography_gist_decompress(internal);
DROP FUNCTION public.geography_gist_consistent(internal, geography, integer);
DROP FUNCTION public.geography_gist_compress(internal);
DROP FUNCTION public.geography_ge(geography, geography);
DROP FUNCTION public.geography_eq(geography, geography);
DROP FUNCTION public.geography_cmp(geography, geography);
DROP FUNCTION public.geography(geography, integer, boolean);
DROP FUNCTION public.geography(geometry);
DROP FUNCTION public.geography(bytea);
DROP FUNCTION public.find_srid(character varying, character varying, character varying);
DROP FUNCTION public.equals(geom1 geometry, geom2 geometry);
DROP FUNCTION public.enablelongtransactions();
DROP FUNCTION public.droprasterconstraints(rastschema name, rasttable name, rastcolumn name, srid boolean, scale_x boolean, scale_y boolean, blocksize_x boolean, blocksize_y boolean, same_alignment boolean, regular_blocking boolean, num_bands boolean, pixel_types boolean, nodata_values boolean, out_db boolean, extent boolean);
DROP FUNCTION public.droprasterconstraints(rasttable name, rastcolumn name, srid boolean, scale_x boolean, scale_y boolean, blocksize_x boolean, blocksize_y boolean, same_alignment boolean, regular_blocking boolean, num_bands boolean, pixel_types boolean, nodata_values boolean, out_db boolean, extent boolean);
DROP FUNCTION public.droprasterconstraints(rastschema name, rasttable name, rastcolumn name, VARIADIC constraints text[]);
DROP FUNCTION public.droprasterconstraints(rasttable name, rastcolumn name, VARIADIC constraints text[]);
DROP FUNCTION public.dropoverviewconstraints(ovschema name, ovtable name, ovcolumn name);
DROP FUNCTION public.dropoverviewconstraints(ovtable name, ovcolumn name);
DROP FUNCTION public.dropgeometrytable(catalog_name character varying, schema_name character varying, table_name character varying);
DROP FUNCTION public.dropgeometrytable(schema_name character varying, table_name character varying);
DROP FUNCTION public.dropgeometrytable(table_name character varying);
DROP FUNCTION public.dropgeometrycolumn(catalog_name character varying, schema_name character varying, table_name character varying, column_name character varying);
DROP FUNCTION public.dropgeometrycolumn(schema_name character varying, table_name character varying, column_name character varying);
DROP FUNCTION public.dropgeometrycolumn(table_name character varying, column_name character varying);
DROP FUNCTION public.disablelongtransactions();
DROP FUNCTION public.checkauthtrigger();
DROP FUNCTION public.checkauth(text, text, text);
DROP FUNCTION public.checkauth(text, text);
DROP FUNCTION public.bytea(raster);
DROP FUNCTION public.bytea(geography);
DROP FUNCTION public.bytea(geometry);
DROP FUNCTION public.box3dtobox(box3d);
DROP FUNCTION public.box3d(raster);
DROP FUNCTION public.box3d(box2d);
DROP FUNCTION public.box3d(geometry);
DROP FUNCTION public.box2d(box3d);
DROP FUNCTION public.box2d(geometry);
DROP FUNCTION public.box(box3d);
DROP FUNCTION public.box(geometry);
DROP FUNCTION public.appomatic_mapdata_ais_insert();
DROP FUNCTION public.addrasterconstraints(rastschema name, rasttable name, rastcolumn name, srid boolean, scale_x boolean, scale_y boolean, blocksize_x boolean, blocksize_y boolean, same_alignment boolean, regular_blocking boolean, num_bands boolean, pixel_types boolean, nodata_values boolean, out_db boolean, extent boolean);
DROP FUNCTION public.addrasterconstraints(rasttable name, rastcolumn name, srid boolean, scale_x boolean, scale_y boolean, blocksize_x boolean, blocksize_y boolean, same_alignment boolean, regular_blocking boolean, num_bands boolean, pixel_types boolean, nodata_values boolean, out_db boolean, extent boolean);
DROP FUNCTION public.addrasterconstraints(rastschema name, rasttable name, rastcolumn name, VARIADIC constraints text[]);
DROP FUNCTION public.addrasterconstraints(rasttable name, rastcolumn name, VARIADIC constraints text[]);
DROP FUNCTION public.addoverviewconstraints(ovschema name, ovtable name, ovcolumn name, refschema name, reftable name, refcolumn name, ovfactor integer);
DROP FUNCTION public.addoverviewconstraints(ovtable name, ovcolumn name, reftable name, refcolumn name, ovfactor integer);
DROP FUNCTION public.addgeometrycolumn(catalog_name character varying, schema_name character varying, table_name character varying, column_name character varying, new_srid_in integer, new_type character varying, new_dim integer, use_typmod boolean);
DROP FUNCTION public.addgeometrycolumn(schema_name character varying, table_name character varying, column_name character varying, new_srid integer, new_type character varying, new_dim integer, use_typmod boolean);
DROP FUNCTION public.addgeometrycolumn(table_name character varying, column_name character varying, new_srid integer, new_type character varying, new_dim integer, use_typmod boolean);
DROP FUNCTION public.addauth(text);
DROP FUNCTION public._st_within(geom1 geometry, geom2 geometry);
DROP FUNCTION public._st_valuecount(rastertable text, rastercolumn text, nband integer, exclude_nodata_value boolean, searchvalues double precision[], roundto double precision);
DROP FUNCTION public._st_valuecount(rast raster, nband integer, exclude_nodata_value boolean, searchvalues double precision[], roundto double precision);
DROP FUNCTION public._st_touches(geom1 geometry, geom2 geometry);
DROP FUNCTION public._st_summarystats(rastertable text, rastercolumn text, nband integer, exclude_nodata_value boolean, sample_percent double precision);
DROP FUNCTION public._st_summarystats(rast raster, nband integer, exclude_nodata_value boolean, sample_percent double precision);
DROP FUNCTION public._st_slope4ma(matrix double precision[], nodatamode text, VARIADIC args text[]);
DROP FUNCTION public._st_resample(rast raster, algorithm text, maxerr double precision, srid integer, scalex double precision, scaley double precision, gridx double precision, gridy double precision, skewx double precision, skewy double precision, width integer, height integer);
DROP FUNCTION public._st_reclass(rast raster, VARIADIC reclassargset reclassarg[]);
DROP FUNCTION public._st_quantile(rastertable text, rastercolumn text, nband integer, exclude_nodata_value boolean, sample_percent double precision, quantiles double precision[]);
DROP FUNCTION public._st_quantile(rast raster, nband integer, exclude_nodata_value boolean, sample_percent double precision, quantiles double precision[]);
DROP FUNCTION public._st_pointoutside(geography);
DROP FUNCTION public._st_overlaps(geom1 geometry, geom2 geometry);
DROP FUNCTION public._st_orderingequals(geometrya geometry, geometryb geometry);
DROP FUNCTION public._st_maxdistance(geom1 geometry, geom2 geometry);
DROP FUNCTION public._st_mapalgebra4unionstate(rast1 raster, rast2 raster, p_expression text, p_nodata1expr text, p_nodata2expr text, p_nodatanodataval double precision, t_expression text, t_nodata1expr text, t_nodata2expr text, t_nodatanodataval double precision);
DROP FUNCTION public._st_mapalgebra4unionstate(rast1 raster, rast2 raster, bandnum integer, p_expression text);
DROP FUNCTION public._st_mapalgebra4unionstate(rast1 raster, rast2 raster, p_expression text);
DROP FUNCTION public._st_mapalgebra4unionstate(rast1 raster, rast2 raster, bandnum integer);
DROP FUNCTION public._st_mapalgebra4unionstate(rast1 raster, rast2 raster);
DROP FUNCTION public._st_mapalgebra4unionfinal1(rast raster);
DROP FUNCTION public._st_longestline(geom1 geometry, geom2 geometry);
DROP FUNCTION public._st_linecrossingdirection(geom1 geometry, geom2 geometry);
DROP FUNCTION public._st_intersects(rast1 raster, nband1 integer, rast2 raster, nband2 integer);
DROP FUNCTION public._st_intersects(geom geometry, rast raster, nband integer);
DROP FUNCTION public._st_intersects(rast raster, geom geometry, nband integer);
DROP FUNCTION public._st_intersects(geom1 geometry, geom2 geometry);
DROP FUNCTION public._st_histogram(rast raster, nband integer, exclude_nodata_value boolean, sample_percent double precision, bins integer, width double precision[], "right" boolean, min double precision, max double precision);
DROP FUNCTION public._st_histogram(rastertable text, rastercolumn text, nband integer, exclude_nodata_value boolean, sample_percent double precision, bins integer, width double precision[], "right" boolean);
DROP FUNCTION public._st_hillshade4ma(matrix double precision[], nodatamode text, VARIADIC args text[]);
DROP FUNCTION public._st_geomfromgml(text, integer);
DROP FUNCTION public._st_expand(geography, double precision);
DROP FUNCTION public._st_equals(geom1 geometry, geom2 geometry);
DROP FUNCTION public._st_dwithin(geography, geography, double precision, boolean);
DROP FUNCTION public._st_dwithin(geom1 geometry, geom2 geometry, double precision);
DROP FUNCTION public._st_dumppoints(the_geom geometry, cur_path integer[]);
DROP FUNCTION public._st_distance(geography, geography, double precision, boolean);
DROP FUNCTION public._st_dfullywithin(geom1 geometry, geom2 geometry, double precision);
DROP FUNCTION public._st_crosses(geom1 geometry, geom2 geometry);
DROP FUNCTION public._st_covers(geography, geography);
DROP FUNCTION public._st_covers(geom1 geometry, geom2 geometry);
DROP FUNCTION public._st_coveredby(geom1 geometry, geom2 geometry);
DROP FUNCTION public._st_count(rastertable text, rastercolumn text, nband integer, exclude_nodata_value boolean, sample_percent double precision);
DROP FUNCTION public._st_count(rast raster, nband integer, exclude_nodata_value boolean, sample_percent double precision);
DROP FUNCTION public._st_containsproperly(geom1 geometry, geom2 geometry);
DROP FUNCTION public._st_contains(geom1 geometry, geom2 geometry);
DROP FUNCTION public._st_concavehull(param_inputgeom geometry);
DROP FUNCTION public._st_buffer(geometry, double precision, cstring);
DROP FUNCTION public._st_bestsrid(geography, geography);
DROP FUNCTION public._st_bestsrid(geography);
DROP FUNCTION public._st_asx3d(integer, geometry, integer, integer, text);
DROP FUNCTION public._st_asraster(geom geometry, scalex double precision, scaley double precision, width integer, height integer, pixeltype text[], value double precision[], nodataval double precision[], upperleftx double precision, upperlefty double precision, gridx double precision, gridy double precision, skewx double precision, skewy double precision, touched boolean);
DROP FUNCTION public._st_aspect4ma(matrix double precision[], nodatamode text, VARIADIC args text[]);
DROP FUNCTION public._st_askml(integer, geography, integer, text);
DROP FUNCTION public._st_askml(integer, geometry, integer, text);
DROP FUNCTION public._st_asgml(integer, geography, integer, integer, text);
DROP FUNCTION public._st_asgml(integer, geometry, integer, integer, text);
DROP FUNCTION public._st_asgeojson(integer, geography, integer, integer);
DROP FUNCTION public._st_asgeojson(integer, geometry, integer, integer);
DROP FUNCTION public._st_3ddwithin(geom1 geometry, geom2 geometry, double precision);
DROP FUNCTION public._st_3ddfullywithin(geom1 geometry, geom2 geometry, double precision);
DROP FUNCTION public._raster_constraint_pixel_types(rast raster);
DROP FUNCTION public._raster_constraint_out_db(rast raster);
DROP FUNCTION public._raster_constraint_nodata_values(rast raster);
DROP FUNCTION public._raster_constraint_info_srid(rastschema name, rasttable name, rastcolumn name);
DROP FUNCTION public._raster_constraint_info_scale(rastschema name, rasttable name, rastcolumn name, axis character);
DROP FUNCTION public._raster_constraint_info_regular_blocking(rastschema name, rasttable name, rastcolumn name);
DROP FUNCTION public._raster_constraint_info_pixel_types(rastschema name, rasttable name, rastcolumn name);
DROP FUNCTION public._raster_constraint_info_out_db(rastschema name, rasttable name, rastcolumn name);
DROP FUNCTION public._raster_constraint_info_num_bands(rastschema name, rasttable name, rastcolumn name);
DROP FUNCTION public._raster_constraint_info_nodata_values(rastschema name, rasttable name, rastcolumn name);
DROP FUNCTION public._raster_constraint_info_extent(rastschema name, rasttable name, rastcolumn name);
DROP FUNCTION public._raster_constraint_info_blocksize(rastschema name, rasttable name, rastcolumn name, axis text);
DROP FUNCTION public._raster_constraint_info_alignment(rastschema name, rasttable name, rastcolumn name);
DROP FUNCTION public._overview_constraint_info(ovschema name, ovtable name, ovcolumn name, OUT refschema name, OUT reftable name, OUT refcolumn name, OUT factor integer);
DROP FUNCTION public._overview_constraint(ov raster, factor integer, refschema name, reftable name, refcolumn name);
DROP FUNCTION public._drop_raster_constraint_srid(rastschema name, rasttable name, rastcolumn name);
DROP FUNCTION public._drop_raster_constraint_scale(rastschema name, rasttable name, rastcolumn name, axis character);
DROP FUNCTION public._drop_raster_constraint_regular_blocking(rastschema name, rasttable name, rastcolumn name);
DROP FUNCTION public._drop_raster_constraint_pixel_types(rastschema name, rasttable name, rastcolumn name);
DROP FUNCTION public._drop_raster_constraint_out_db(rastschema name, rasttable name, rastcolumn name);
DROP FUNCTION public._drop_raster_constraint_num_bands(rastschema name, rasttable name, rastcolumn name);
DROP FUNCTION public._drop_raster_constraint_nodata_values(rastschema name, rasttable name, rastcolumn name);
DROP FUNCTION public._drop_raster_constraint_extent(rastschema name, rasttable name, rastcolumn name);
DROP FUNCTION public._drop_raster_constraint_blocksize(rastschema name, rasttable name, rastcolumn name, axis text);
DROP FUNCTION public._drop_raster_constraint_alignment(rastschema name, rasttable name, rastcolumn name);
DROP FUNCTION public._drop_raster_constraint(rastschema name, rasttable name, cn name);
DROP FUNCTION public._drop_overview_constraint(ovschema name, ovtable name, ovcolumn name);
DROP FUNCTION public._add_raster_constraint_srid(rastschema name, rasttable name, rastcolumn name);
DROP FUNCTION public._add_raster_constraint_scale(rastschema name, rasttable name, rastcolumn name, axis character);
DROP FUNCTION public._add_raster_constraint_regular_blocking(rastschema name, rasttable name, rastcolumn name);
DROP FUNCTION public._add_raster_constraint_pixel_types(rastschema name, rasttable name, rastcolumn name);
DROP FUNCTION public._add_raster_constraint_out_db(rastschema name, rasttable name, rastcolumn name);
DROP FUNCTION public._add_raster_constraint_num_bands(rastschema name, rasttable name, rastcolumn name);
DROP FUNCTION public._add_raster_constraint_nodata_values(rastschema name, rasttable name, rastcolumn name);
DROP FUNCTION public._add_raster_constraint_extent(rastschema name, rasttable name, rastcolumn name);
DROP FUNCTION public._add_raster_constraint_blocksize(rastschema name, rasttable name, rastcolumn name, axis text);
DROP FUNCTION public._add_raster_constraint_alignment(rastschema name, rasttable name, rastcolumn name);
DROP FUNCTION public._add_raster_constraint(cn name, sql text);
DROP FUNCTION public._add_overview_constraint(ovschema name, ovtable name, ovcolumn name, refschema name, reftable name, refcolumn name, factor integer);
DROP TYPE public.valuecount;
DROP TYPE public.valid_detail;
DROP TYPE public.summarystats;
DROP TYPE public.spheroid CASCADE;
DROP FUNCTION public.spheroid_out(spheroid);
DROP FUNCTION public.spheroid_in(cstring);
DROP TYPE public.reclassarg;
DROP TYPE public.raster CASCADE;
DROP FUNCTION public.raster_out(raster);
DROP FUNCTION public.raster_in(cstring);
DROP TYPE public.quantile;
DROP TYPE public.pgis_abs CASCADE;
DROP FUNCTION public.pgis_abs_out(pgis_abs);
DROP FUNCTION public.pgis_abs_in(cstring);
DROP TYPE public.histogram;
DROP TYPE public.gidx CASCADE;
DROP FUNCTION public.gidx_out(gidx);
DROP FUNCTION public.gidx_in(cstring);
DROP TYPE public.geomval;
DROP TYPE public.geometry_dump;
DROP TYPE public.geometry CASCADE;
DROP FUNCTION public.geometry_typmod_out(integer);
DROP FUNCTION public.geometry_typmod_in(cstring[]);
DROP FUNCTION public.geometry_send(geometry);
DROP FUNCTION public.geometry_recv(internal);
DROP FUNCTION public.geometry_out(geometry);
DROP FUNCTION public.geometry_in(cstring);
DROP FUNCTION public.geometry_analyze(internal);
DROP TYPE public.geography CASCADE;
DROP FUNCTION public.geography_typmod_out(integer);
DROP FUNCTION public.geography_typmod_in(cstring[]);
DROP FUNCTION public.geography_send(geography);
DROP FUNCTION public.geography_recv(internal, oid, integer);
DROP FUNCTION public.geography_out(geography);
DROP FUNCTION public.geography_in(cstring, oid, integer);
DROP FUNCTION public.geography_analyze(internal);
DROP TYPE public.box3d CASCADE;
DROP FUNCTION public.box3d_out(box3d);
DROP FUNCTION public.box3d_in(cstring);
DROP TYPE public.box2df CASCADE;
DROP FUNCTION public.box2df_out(box2df);
DROP FUNCTION public.box2df_in(cstring);
DROP TYPE public.box2d CASCADE;
DROP FUNCTION public.box2d_out(box2d);
DROP FUNCTION public.box2d_in(cstring);
DROP EXTENSION plpgsql;
DROP SCHEMA scraper;
DROP SCHEMA public;
--
-- Name: public; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA public;


ALTER SCHEMA public OWNER TO postgres;

--
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON SCHEMA public IS 'standard public schema';


--
-- Name: scraper; Type: SCHEMA; Schema: -; Owner: scraper
--

CREATE SCHEMA scraper;


ALTER SCHEMA scraper OWNER TO scraper;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

--
-- Name: box2d; Type: SHELL TYPE; Schema: public; Owner: postgres
--

CREATE TYPE box2d;


--
-- Name: box2d_in(cstring); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION box2d_in(cstring) RETURNS box2d
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-2.0', 'BOX2D_in';


ALTER FUNCTION public.box2d_in(cstring) OWNER TO postgres;

--
-- Name: box2d_out(box2d); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION box2d_out(box2d) RETURNS cstring
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-2.0', 'BOX2D_out';


ALTER FUNCTION public.box2d_out(box2d) OWNER TO postgres;

--
-- Name: box2d; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE box2d (
    INTERNALLENGTH = 65,
    INPUT = box2d_in,
    OUTPUT = box2d_out,
    ALIGNMENT = int4,
    STORAGE = plain
);


ALTER TYPE public.box2d OWNER TO postgres;

--
-- Name: box2df; Type: SHELL TYPE; Schema: public; Owner: postgres
--

CREATE TYPE box2df;


--
-- Name: box2df_in(cstring); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION box2df_in(cstring) RETURNS box2df
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-2.0', 'box2df_in';


ALTER FUNCTION public.box2df_in(cstring) OWNER TO postgres;

--
-- Name: box2df_out(box2df); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION box2df_out(box2df) RETURNS cstring
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-2.0', 'box2df_out';


ALTER FUNCTION public.box2df_out(box2df) OWNER TO postgres;

--
-- Name: box2df; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE box2df (
    INTERNALLENGTH = 16,
    INPUT = box2df_in,
    OUTPUT = box2df_out,
    ALIGNMENT = double,
    STORAGE = plain
);


ALTER TYPE public.box2df OWNER TO postgres;

--
-- Name: box3d; Type: SHELL TYPE; Schema: public; Owner: postgres
--

CREATE TYPE box3d;


--
-- Name: box3d_in(cstring); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION box3d_in(cstring) RETURNS box3d
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-2.0', 'BOX3D_in';


ALTER FUNCTION public.box3d_in(cstring) OWNER TO postgres;

--
-- Name: box3d_out(box3d); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION box3d_out(box3d) RETURNS cstring
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-2.0', 'BOX3D_out';


ALTER FUNCTION public.box3d_out(box3d) OWNER TO postgres;

--
-- Name: box3d; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE box3d (
    INTERNALLENGTH = 52,
    INPUT = box3d_in,
    OUTPUT = box3d_out,
    ALIGNMENT = double,
    STORAGE = plain
);


ALTER TYPE public.box3d OWNER TO postgres;

--
-- Name: geography; Type: SHELL TYPE; Schema: public; Owner: postgres
--

CREATE TYPE geography;


--
-- Name: geography_analyze(internal); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION geography_analyze(internal) RETURNS boolean
    LANGUAGE c STRICT
    AS '$libdir/postgis-2.0', 'geography_analyze';


ALTER FUNCTION public.geography_analyze(internal) OWNER TO postgres;

--
-- Name: geography_in(cstring, oid, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION geography_in(cstring, oid, integer) RETURNS geography
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-2.0', 'geography_in';


ALTER FUNCTION public.geography_in(cstring, oid, integer) OWNER TO postgres;

--
-- Name: geography_out(geography); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION geography_out(geography) RETURNS cstring
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-2.0', 'geography_out';


ALTER FUNCTION public.geography_out(geography) OWNER TO postgres;

--
-- Name: geography_recv(internal, oid, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION geography_recv(internal, oid, integer) RETURNS geography
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-2.0', 'geography_recv';


ALTER FUNCTION public.geography_recv(internal, oid, integer) OWNER TO postgres;

--
-- Name: geography_send(geography); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION geography_send(geography) RETURNS bytea
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-2.0', 'geography_send';


ALTER FUNCTION public.geography_send(geography) OWNER TO postgres;

--
-- Name: geography_typmod_in(cstring[]); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION geography_typmod_in(cstring[]) RETURNS integer
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-2.0', 'geography_typmod_in';


ALTER FUNCTION public.geography_typmod_in(cstring[]) OWNER TO postgres;

--
-- Name: geography_typmod_out(integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION geography_typmod_out(integer) RETURNS cstring
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-2.0', 'postgis_typmod_out';


ALTER FUNCTION public.geography_typmod_out(integer) OWNER TO postgres;

--
-- Name: geography; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE geography (
    INTERNALLENGTH = variable,
    INPUT = geography_in,
    OUTPUT = geography_out,
    RECEIVE = geography_recv,
    SEND = geography_send,
    TYPMOD_IN = geography_typmod_in,
    TYPMOD_OUT = geography_typmod_out,
    ANALYZE = geography_analyze,
    DELIMITER = ':',
    ALIGNMENT = double,
    STORAGE = main
);


ALTER TYPE public.geography OWNER TO postgres;

--
-- Name: geometry; Type: SHELL TYPE; Schema: public; Owner: postgres
--

CREATE TYPE geometry;


--
-- Name: geometry_analyze(internal); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION geometry_analyze(internal) RETURNS boolean
    LANGUAGE c STRICT
    AS '$libdir/postgis-2.0', 'geometry_analyze_2d';


ALTER FUNCTION public.geometry_analyze(internal) OWNER TO postgres;

--
-- Name: geometry_in(cstring); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION geometry_in(cstring) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-2.0', 'LWGEOM_in';


ALTER FUNCTION public.geometry_in(cstring) OWNER TO postgres;

--
-- Name: geometry_out(geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION geometry_out(geometry) RETURNS cstring
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-2.0', 'LWGEOM_out';


ALTER FUNCTION public.geometry_out(geometry) OWNER TO postgres;

--
-- Name: geometry_recv(internal); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION geometry_recv(internal) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-2.0', 'LWGEOM_recv';


ALTER FUNCTION public.geometry_recv(internal) OWNER TO postgres;

--
-- Name: geometry_send(geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION geometry_send(geometry) RETURNS bytea
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-2.0', 'LWGEOM_send';


ALTER FUNCTION public.geometry_send(geometry) OWNER TO postgres;

--
-- Name: geometry_typmod_in(cstring[]); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION geometry_typmod_in(cstring[]) RETURNS integer
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-2.0', 'geometry_typmod_in';


ALTER FUNCTION public.geometry_typmod_in(cstring[]) OWNER TO postgres;

--
-- Name: geometry_typmod_out(integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION geometry_typmod_out(integer) RETURNS cstring
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-2.0', 'postgis_typmod_out';


ALTER FUNCTION public.geometry_typmod_out(integer) OWNER TO postgres;

--
-- Name: geometry; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE geometry (
    INTERNALLENGTH = variable,
    INPUT = geometry_in,
    OUTPUT = geometry_out,
    RECEIVE = geometry_recv,
    SEND = geometry_send,
    TYPMOD_IN = geometry_typmod_in,
    TYPMOD_OUT = geometry_typmod_out,
    ANALYZE = geometry_analyze,
    DELIMITER = ':',
    ALIGNMENT = double,
    STORAGE = main
);


ALTER TYPE public.geometry OWNER TO postgres;

--
-- Name: geometry_dump; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE geometry_dump AS (
	path integer[],
	geom geometry
);


ALTER TYPE public.geometry_dump OWNER TO postgres;

--
-- Name: geomval; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE geomval AS (
	geom geometry,
	val double precision
);


ALTER TYPE public.geomval OWNER TO postgres;

--
-- Name: gidx; Type: SHELL TYPE; Schema: public; Owner: postgres
--

CREATE TYPE gidx;


--
-- Name: gidx_in(cstring); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION gidx_in(cstring) RETURNS gidx
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-2.0', 'gidx_in';


ALTER FUNCTION public.gidx_in(cstring) OWNER TO postgres;

--
-- Name: gidx_out(gidx); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION gidx_out(gidx) RETURNS cstring
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-2.0', 'gidx_out';


ALTER FUNCTION public.gidx_out(gidx) OWNER TO postgres;

--
-- Name: gidx; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE gidx (
    INTERNALLENGTH = variable,
    INPUT = gidx_in,
    OUTPUT = gidx_out,
    ALIGNMENT = double,
    STORAGE = plain
);


ALTER TYPE public.gidx OWNER TO postgres;

--
-- Name: histogram; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE histogram AS (
	min double precision,
	max double precision,
	count bigint,
	percent double precision
);


ALTER TYPE public.histogram OWNER TO postgres;

--
-- Name: pgis_abs; Type: SHELL TYPE; Schema: public; Owner: postgres
--

CREATE TYPE pgis_abs;


--
-- Name: pgis_abs_in(cstring); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION pgis_abs_in(cstring) RETURNS pgis_abs
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-2.0', 'pgis_abs_in';


ALTER FUNCTION public.pgis_abs_in(cstring) OWNER TO postgres;

--
-- Name: pgis_abs_out(pgis_abs); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION pgis_abs_out(pgis_abs) RETURNS cstring
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-2.0', 'pgis_abs_out';


ALTER FUNCTION public.pgis_abs_out(pgis_abs) OWNER TO postgres;

--
-- Name: pgis_abs; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE pgis_abs (
    INTERNALLENGTH = 8,
    INPUT = pgis_abs_in,
    OUTPUT = pgis_abs_out,
    ALIGNMENT = double,
    STORAGE = plain
);


ALTER TYPE public.pgis_abs OWNER TO postgres;

--
-- Name: quantile; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE quantile AS (
	quantile double precision,
	value double precision
);


ALTER TYPE public.quantile OWNER TO postgres;

--
-- Name: raster; Type: SHELL TYPE; Schema: public; Owner: postgres
--

CREATE TYPE raster;


--
-- Name: raster_in(cstring); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION raster_in(cstring) RETURNS raster
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/rtpostgis-2.0', 'RASTER_in';


ALTER FUNCTION public.raster_in(cstring) OWNER TO postgres;

--
-- Name: raster_out(raster); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION raster_out(raster) RETURNS cstring
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/rtpostgis-2.0', 'RASTER_out';


ALTER FUNCTION public.raster_out(raster) OWNER TO postgres;

--
-- Name: raster; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE raster (
    INTERNALLENGTH = variable,
    INPUT = raster_in,
    OUTPUT = raster_out,
    ALIGNMENT = double,
    STORAGE = extended
);


ALTER TYPE public.raster OWNER TO postgres;

--
-- Name: reclassarg; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE reclassarg AS (
	nband integer,
	reclassexpr text,
	pixeltype text,
	nodataval double precision
);


ALTER TYPE public.reclassarg OWNER TO postgres;

--
-- Name: spheroid; Type: SHELL TYPE; Schema: public; Owner: postgres
--

CREATE TYPE spheroid;


--
-- Name: spheroid_in(cstring); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION spheroid_in(cstring) RETURNS spheroid
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-2.0', 'ellipsoid_in';


ALTER FUNCTION public.spheroid_in(cstring) OWNER TO postgres;

--
-- Name: spheroid_out(spheroid); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION spheroid_out(spheroid) RETURNS cstring
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-2.0', 'ellipsoid_out';


ALTER FUNCTION public.spheroid_out(spheroid) OWNER TO postgres;

--
-- Name: spheroid; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE spheroid (
    INTERNALLENGTH = 65,
    INPUT = spheroid_in,
    OUTPUT = spheroid_out,
    ALIGNMENT = double,
    STORAGE = plain
);


ALTER TYPE public.spheroid OWNER TO postgres;

--
-- Name: summarystats; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE summarystats AS (
	count bigint,
	sum double precision,
	mean double precision,
	stddev double precision,
	min double precision,
	max double precision
);


ALTER TYPE public.summarystats OWNER TO postgres;

--
-- Name: valid_detail; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE valid_detail AS (
	valid boolean,
	reason character varying,
	location geometry
);


ALTER TYPE public.valid_detail OWNER TO postgres;

--
-- Name: valuecount; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE valuecount AS (
	value double precision,
	count integer,
	percent double precision
);


ALTER TYPE public.valuecount OWNER TO postgres;

--
-- Name: _add_overview_constraint(name, name, name, name, name, name, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION _add_overview_constraint(ovschema name, ovtable name, ovcolumn name, refschema name, reftable name, refcolumn name, factor integer) RETURNS boolean
    LANGUAGE plpgsql STRICT
    AS $_$
	DECLARE
		fqtn text;
		cn name;
		sql text;
	BEGIN
		fqtn := '';
		IF length($1) > 0 THEN
			fqtn := quote_ident($1) || '.';
		END IF;
		fqtn := fqtn || quote_ident($2);

		cn := 'enforce_overview_' || $3;

		sql := 'ALTER TABLE ' || fqtn
			|| ' ADD CONSTRAINT ' || quote_ident(cn)
			|| ' CHECK (_overview_constraint(' || quote_ident($3)
			|| ',' || $7
			|| ',' || quote_literal($4)
			|| ',' || quote_literal($5)
			|| ',' || quote_literal($6)
			|| '))';

		RETURN _add_raster_constraint(cn, sql);
	END;
	$_$;


ALTER FUNCTION public._add_overview_constraint(ovschema name, ovtable name, ovcolumn name, refschema name, reftable name, refcolumn name, factor integer) OWNER TO postgres;

--
-- Name: _add_raster_constraint(name, text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION _add_raster_constraint(cn name, sql text) RETURNS boolean
    LANGUAGE plpgsql STRICT
    AS $$
	BEGIN
		BEGIN
			EXECUTE sql;
		EXCEPTION
			WHEN duplicate_object THEN
				RAISE NOTICE 'The constraint "%" already exists.  To replace the existing constraint, delete the constraint and call ApplyRasterConstraints again', cn;
			WHEN OTHERS THEN
				RAISE NOTICE 'Unable to add constraint "%"', cn;
				RETURN FALSE;
		END;

		RETURN TRUE;
	END;
	$$;


ALTER FUNCTION public._add_raster_constraint(cn name, sql text) OWNER TO postgres;

--
-- Name: _add_raster_constraint_alignment(name, name, name); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION _add_raster_constraint_alignment(rastschema name, rasttable name, rastcolumn name) RETURNS boolean
    LANGUAGE plpgsql STRICT
    AS $_$
	DECLARE
		fqtn text;
		cn name;
		sql text;
		attr text;
	BEGIN
		fqtn := '';
		IF length($1) > 0 THEN
			fqtn := quote_ident($1) || '.';
		END IF;
		fqtn := fqtn || quote_ident($2);

		cn := 'enforce_same_alignment_' || $3;

		sql := 'SELECT st_makeemptyraster(1, 1, upperleftx, upperlefty, scalex, scaley, skewx, skewy, srid) FROM st_metadata((SELECT '
			|| quote_ident($3)
			|| ' FROM ' || fqtn || ' LIMIT 1))';
		BEGIN
			EXECUTE sql INTO attr;
		EXCEPTION WHEN OTHERS THEN
			RAISE NOTICE 'Unable to get the alignment of a sample raster';
			RETURN FALSE;
		END;

		sql := 'ALTER TABLE ' || fqtn ||
			' ADD CONSTRAINT ' || quote_ident(cn) ||
			' CHECK (st_samealignment(' || quote_ident($3) || ', ''' || attr || '''::raster))';
		RETURN _add_raster_constraint(cn, sql);
	END;
	$_$;


ALTER FUNCTION public._add_raster_constraint_alignment(rastschema name, rasttable name, rastcolumn name) OWNER TO postgres;

--
-- Name: _add_raster_constraint_blocksize(name, name, name, text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION _add_raster_constraint_blocksize(rastschema name, rasttable name, rastcolumn name, axis text) RETURNS boolean
    LANGUAGE plpgsql STRICT
    AS $_$
	DECLARE
		fqtn text;
		cn name;
		sql text;
		attr int;
	BEGIN
		IF lower($4) != 'width' AND lower($4) != 'height' THEN
			RAISE EXCEPTION 'axis must be either "width" or "height"';
			RETURN FALSE;
		END IF;

		fqtn := '';
		IF length($1) > 0 THEN
			fqtn := quote_ident($1) || '.';
		END IF;
		fqtn := fqtn || quote_ident($2);

		cn := 'enforce_' || $4 || '_' || $3;

		sql := 'SELECT st_' || $4 || '('
			|| quote_ident($3)
			|| ') FROM ' || fqtn
			|| ' LIMIT 1';
		BEGIN
			EXECUTE sql INTO attr;
		EXCEPTION WHEN OTHERS THEN
			RAISE NOTICE 'Unable to get the % of a sample raster', $4;
			RETURN FALSE;
		END;

		sql := 'ALTER TABLE ' || fqtn
			|| ' ADD CONSTRAINT ' || quote_ident(cn)
			|| ' CHECK (st_' || $4 || '('
			|| quote_ident($3)
			|| ') = ' || attr || ')';
		RETURN _add_raster_constraint(cn, sql);
	END;
	$_$;


ALTER FUNCTION public._add_raster_constraint_blocksize(rastschema name, rasttable name, rastcolumn name, axis text) OWNER TO postgres;

--
-- Name: _add_raster_constraint_extent(name, name, name); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION _add_raster_constraint_extent(rastschema name, rasttable name, rastcolumn name) RETURNS boolean
    LANGUAGE plpgsql STRICT
    AS $_$
	DECLARE
		fqtn text;
		cn name;
		sql text;
		attr text;
	BEGIN
		fqtn := '';
		IF length($1) > 0 THEN
			fqtn := quote_ident($1) || '.';
		END IF;
		fqtn := fqtn || quote_ident($2);

		cn := 'enforce_max_extent_' || $3;

		sql := 'SELECT st_ashexewkb(st_convexhull(st_collect(st_convexhull('
			|| quote_ident($3)
			|| ')))) FROM '
			|| fqtn;
		BEGIN
			EXECUTE sql INTO attr;
		EXCEPTION WHEN OTHERS THEN
			RAISE NOTICE 'Unable to get the extent of a sample raster';
			RETURN FALSE;
		END;

		sql := 'ALTER TABLE ' || fqtn
			|| ' ADD CONSTRAINT ' || quote_ident(cn)
			|| ' CHECK (st_coveredby(st_convexhull('
			|| quote_ident($3)
			|| '), ''' || attr || '''::geometry))';
		RETURN _add_raster_constraint(cn, sql);
	END;
	$_$;


ALTER FUNCTION public._add_raster_constraint_extent(rastschema name, rasttable name, rastcolumn name) OWNER TO postgres;

--
-- Name: _add_raster_constraint_nodata_values(name, name, name); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION _add_raster_constraint_nodata_values(rastschema name, rasttable name, rastcolumn name) RETURNS boolean
    LANGUAGE plpgsql STRICT
    AS $_$
	DECLARE
		fqtn text;
		cn name;
		sql text;
		attr double precision[];
		max int;
	BEGIN
		fqtn := '';
		IF length($1) > 0 THEN
			fqtn := quote_ident($1) || '.';
		END IF;
		fqtn := fqtn || quote_ident($2);

		cn := 'enforce_nodata_values_' || $3;

		sql := 'SELECT _raster_constraint_nodata_values(' || quote_ident($3)
			|| ') FROM ' || fqtn
			|| ' LIMIT 1';
		BEGIN
			EXECUTE sql INTO attr;
		EXCEPTION WHEN OTHERS THEN
			RAISE NOTICE 'Unable to get the nodata values of a sample raster';
			RETURN FALSE;
		END;
		max := array_length(attr, 1);
		IF max < 1 OR max IS NULL THEN
			RAISE NOTICE 'Unable to get the nodata values of a sample raster';
			RETURN FALSE;
		END IF;

		sql := 'ALTER TABLE ' || fqtn
			|| ' ADD CONSTRAINT ' || quote_ident(cn)
			|| ' CHECK (_raster_constraint_nodata_values(' || quote_ident($3)
			|| ')::numeric(16,10)[] = ''{';
		FOR x in 1..max LOOP
			IF attr[x] IS NULL THEN
				sql := sql || 'NULL';
			ELSE
				sql := sql || attr[x];
			END IF;
			IF x < max THEN
				sql := sql || ',';
			END IF;
		END LOOP;
		sql := sql || '}''::numeric(16,10)[])';

		RETURN _add_raster_constraint(cn, sql);
	END;
	$_$;


ALTER FUNCTION public._add_raster_constraint_nodata_values(rastschema name, rasttable name, rastcolumn name) OWNER TO postgres;

--
-- Name: _add_raster_constraint_num_bands(name, name, name); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION _add_raster_constraint_num_bands(rastschema name, rasttable name, rastcolumn name) RETURNS boolean
    LANGUAGE plpgsql STRICT
    AS $_$
	DECLARE
		fqtn text;
		cn name;
		sql text;
		attr int;
	BEGIN
		fqtn := '';
		IF length($1) > 0 THEN
			fqtn := quote_ident($1) || '.';
		END IF;
		fqtn := fqtn || quote_ident($2);

		cn := 'enforce_num_bands_' || $3;

		sql := 'SELECT st_numbands(' || quote_ident($3)
			|| ') FROM ' || fqtn
			|| ' LIMIT 1';
		BEGIN
			EXECUTE sql INTO attr;
		EXCEPTION WHEN OTHERS THEN
			RAISE NOTICE 'Unable to get the number of bands of a sample raster';
			RETURN FALSE;
		END;

		sql := 'ALTER TABLE ' || fqtn
			|| ' ADD CONSTRAINT ' || quote_ident(cn)
			|| ' CHECK (st_numbands(' || quote_ident($3)
			|| ') = ' || attr
			|| ')';
		RETURN _add_raster_constraint(cn, sql);
	END;
	$_$;


ALTER FUNCTION public._add_raster_constraint_num_bands(rastschema name, rasttable name, rastcolumn name) OWNER TO postgres;

--
-- Name: _add_raster_constraint_out_db(name, name, name); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION _add_raster_constraint_out_db(rastschema name, rasttable name, rastcolumn name) RETURNS boolean
    LANGUAGE plpgsql STRICT
    AS $_$
	DECLARE
		fqtn text;
		cn name;
		sql text;
		attr boolean[];
		max int;
	BEGIN
		fqtn := '';
		IF length($1) > 0 THEN
			fqtn := quote_ident($1) || '.';
		END IF;
		fqtn := fqtn || quote_ident($2);

		cn := 'enforce_out_db_' || $3;

		sql := 'SELECT _raster_constraint_out_db(' || quote_ident($3)
			|| ') FROM ' || fqtn
			|| ' LIMIT 1';
		BEGIN
			EXECUTE sql INTO attr;
		EXCEPTION WHEN OTHERS THEN
			RAISE NOTICE 'Unable to get the out-of-database bands of a sample raster';
			RETURN FALSE;
		END;
		max := array_length(attr, 1);
		IF max < 1 OR max IS NULL THEN
			RAISE NOTICE 'Unable to get the out-of-database bands of a sample raster';
			RETURN FALSE;
		END IF;

		sql := 'ALTER TABLE ' || fqtn
			|| ' ADD CONSTRAINT ' || quote_ident(cn)
			|| ' CHECK (_raster_constraint_out_db(' || quote_ident($3)
			|| ') = ''{';
		FOR x in 1..max LOOP
			IF attr[x] IS FALSE THEN
				sql := sql || 'FALSE';
			ELSE
				sql := sql || 'TRUE';
			END IF;
			IF x < max THEN
				sql := sql || ',';
			END IF;
		END LOOP;
		sql := sql || '}''::boolean[])';

		RETURN _add_raster_constraint(cn, sql);
	END;
	$_$;


ALTER FUNCTION public._add_raster_constraint_out_db(rastschema name, rasttable name, rastcolumn name) OWNER TO postgres;

--
-- Name: _add_raster_constraint_pixel_types(name, name, name); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION _add_raster_constraint_pixel_types(rastschema name, rasttable name, rastcolumn name) RETURNS boolean
    LANGUAGE plpgsql STRICT
    AS $_$
	DECLARE
		fqtn text;
		cn name;
		sql text;
		attr text[];
		max int;
	BEGIN
		fqtn := '';
		IF length($1) > 0 THEN
			fqtn := quote_ident($1) || '.';
		END IF;
		fqtn := fqtn || quote_ident($2);

		cn := 'enforce_pixel_types_' || $3;

		sql := 'SELECT _raster_constraint_pixel_types(' || quote_ident($3)
			|| ') FROM ' || fqtn
			|| ' LIMIT 1';
		BEGIN
			EXECUTE sql INTO attr;
		EXCEPTION WHEN OTHERS THEN
			RAISE NOTICE 'Unable to get the pixel types of a sample raster';
			RETURN FALSE;
		END;
		max := array_length(attr, 1);
		IF max < 1 OR max IS NULL THEN
			RAISE NOTICE 'Unable to get the pixel types of a sample raster';
			RETURN FALSE;
		END IF;

		sql := 'ALTER TABLE ' || fqtn
			|| ' ADD CONSTRAINT ' || quote_ident(cn)
			|| ' CHECK (_raster_constraint_pixel_types(' || quote_ident($3)
			|| ') = ''{';
		FOR x in 1..max LOOP
			sql := sql || '"' || attr[x] || '"';
			IF x < max THEN
				sql := sql || ',';
			END IF;
		END LOOP;
		sql := sql || '}''::text[])';

		RETURN _add_raster_constraint(cn, sql);
	END;
	$_$;


ALTER FUNCTION public._add_raster_constraint_pixel_types(rastschema name, rasttable name, rastcolumn name) OWNER TO postgres;

--
-- Name: _add_raster_constraint_regular_blocking(name, name, name); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION _add_raster_constraint_regular_blocking(rastschema name, rasttable name, rastcolumn name) RETURNS boolean
    LANGUAGE plpgsql STRICT
    AS $_$
	DECLARE
		fqtn text;
		cn name;
		sql text;
	BEGIN

		RAISE INFO 'The regular_blocking constraint is just a flag indicating that the column "%" is regularly blocked.  It is up to the end-user to ensure that the column is truely regularly blocked.', quote_ident($3);

		fqtn := '';
		IF length($1) > 0 THEN
			fqtn := quote_ident($1) || '.';
		END IF;
		fqtn := fqtn || quote_ident($2);

		cn := 'enforce_regular_blocking_' || $3;

		sql := 'ALTER TABLE ' || fqtn
			|| ' ADD CONSTRAINT ' || quote_ident(cn)
			|| ' CHECK (TRUE)';
		RETURN _add_raster_constraint(cn, sql);
	END;
	$_$;


ALTER FUNCTION public._add_raster_constraint_regular_blocking(rastschema name, rasttable name, rastcolumn name) OWNER TO postgres;

--
-- Name: _add_raster_constraint_scale(name, name, name, character); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION _add_raster_constraint_scale(rastschema name, rasttable name, rastcolumn name, axis character) RETURNS boolean
    LANGUAGE plpgsql STRICT
    AS $_$
	DECLARE
		fqtn text;
		cn name;
		sql text;
		attr double precision;
	BEGIN
		IF lower($4) != 'x' AND lower($4) != 'y' THEN
			RAISE EXCEPTION 'axis must be either "x" or "y"';
			RETURN FALSE;
		END IF;

		fqtn := '';
		IF length($1) > 0 THEN
			fqtn := quote_ident($1) || '.';
		END IF;
		fqtn := fqtn || quote_ident($2);

		cn := 'enforce_scale' || $4 || '_' || $3;

		sql := 'SELECT st_scale' || $4 || '('
			|| quote_ident($3)
			|| ') FROM '
			|| fqtn
			|| ' LIMIT 1';
		BEGIN
			EXECUTE sql INTO attr;
		EXCEPTION WHEN OTHERS THEN
			RAISE NOTICE 'Unable to get the %-scale of a sample raster', upper($4);
			RETURN FALSE;
		END;

		sql := 'ALTER TABLE ' || fqtn
			|| ' ADD CONSTRAINT ' || quote_ident(cn)
			|| ' CHECK (st_scale' || $4 || '('
			|| quote_ident($3)
			|| ')::numeric(16,10) = (' || attr || ')::numeric(16,10))';
		RETURN _add_raster_constraint(cn, sql);
	END;
	$_$;


ALTER FUNCTION public._add_raster_constraint_scale(rastschema name, rasttable name, rastcolumn name, axis character) OWNER TO postgres;

--
-- Name: _add_raster_constraint_srid(name, name, name); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION _add_raster_constraint_srid(rastschema name, rasttable name, rastcolumn name) RETURNS boolean
    LANGUAGE plpgsql STRICT
    AS $_$
	DECLARE
		fqtn text;
		cn name;
		sql text;
		attr int;
	BEGIN
		fqtn := '';
		IF length($1) > 0 THEN
			fqtn := quote_ident($1) || '.';
		END IF;
		fqtn := fqtn || quote_ident($2);

		cn := 'enforce_srid_' || $3;

		sql := 'SELECT st_srid('
			|| quote_ident($3)
			|| ') FROM ' || fqtn
			|| ' LIMIT 1';
		BEGIN
			EXECUTE sql INTO attr;
		EXCEPTION WHEN OTHERS THEN
			RAISE NOTICE 'Unable to get the SRID of a sample raster';
			RETURN FALSE;
		END;

		sql := 'ALTER TABLE ' || fqtn
			|| ' ADD CONSTRAINT ' || quote_ident(cn)
			|| ' CHECK (st_srid('
			|| quote_ident($3)
			|| ') = ' || attr || ')';

		RETURN _add_raster_constraint(cn, sql);
	END;
	$_$;


ALTER FUNCTION public._add_raster_constraint_srid(rastschema name, rasttable name, rastcolumn name) OWNER TO postgres;

--
-- Name: _drop_overview_constraint(name, name, name); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION _drop_overview_constraint(ovschema name, ovtable name, ovcolumn name) RETURNS boolean
    LANGUAGE sql STRICT
    AS $_$ SELECT _drop_raster_constraint($1, $2, 'enforce_overview_' || $3) $_$;


ALTER FUNCTION public._drop_overview_constraint(ovschema name, ovtable name, ovcolumn name) OWNER TO postgres;

--
-- Name: _drop_raster_constraint(name, name, name); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION _drop_raster_constraint(rastschema name, rasttable name, cn name) RETURNS boolean
    LANGUAGE plpgsql STRICT
    AS $_$
	DECLARE
		fqtn text;
	BEGIN
		fqtn := '';
		IF length($1) > 0 THEN
			fqtn := quote_ident($1) || '.';
		END IF;
		fqtn := fqtn || quote_ident($2);

		BEGIN
			EXECUTE 'ALTER TABLE '
				|| fqtn
				|| ' DROP CONSTRAINT '
				|| quote_ident(cn);
			RETURN TRUE;
		EXCEPTION
			WHEN undefined_object THEN
				RAISE NOTICE 'The constraint "%" does not exist.  Skipping', cn;
			WHEN OTHERS THEN
				RAISE NOTICE 'Unable to drop constraint "%"', cn;
				RETURN FALSE;
		END;

		RETURN TRUE;
	END;
	$_$;


ALTER FUNCTION public._drop_raster_constraint(rastschema name, rasttable name, cn name) OWNER TO postgres;

--
-- Name: _drop_raster_constraint_alignment(name, name, name); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION _drop_raster_constraint_alignment(rastschema name, rasttable name, rastcolumn name) RETURNS boolean
    LANGUAGE sql STRICT
    AS $_$ SELECT _drop_raster_constraint($1, $2, 'enforce_same_alignment_' || $3) $_$;


ALTER FUNCTION public._drop_raster_constraint_alignment(rastschema name, rasttable name, rastcolumn name) OWNER TO postgres;

--
-- Name: _drop_raster_constraint_blocksize(name, name, name, text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION _drop_raster_constraint_blocksize(rastschema name, rasttable name, rastcolumn name, axis text) RETURNS boolean
    LANGUAGE plpgsql STRICT
    AS $_$
	BEGIN
		IF lower($4) != 'width' AND lower($4) != 'height' THEN
			RAISE EXCEPTION 'axis must be either "width" or "height"';
			RETURN FALSE;
		END IF;

		RETURN _drop_raster_constraint($1, $2, 'enforce_' || $4 || '_' || $3);
	END;
	$_$;


ALTER FUNCTION public._drop_raster_constraint_blocksize(rastschema name, rasttable name, rastcolumn name, axis text) OWNER TO postgres;

--
-- Name: _drop_raster_constraint_extent(name, name, name); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION _drop_raster_constraint_extent(rastschema name, rasttable name, rastcolumn name) RETURNS boolean
    LANGUAGE sql STRICT
    AS $_$ SELECT _drop_raster_constraint($1, $2, 'enforce_max_extent_' || $3) $_$;


ALTER FUNCTION public._drop_raster_constraint_extent(rastschema name, rasttable name, rastcolumn name) OWNER TO postgres;

--
-- Name: _drop_raster_constraint_nodata_values(name, name, name); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION _drop_raster_constraint_nodata_values(rastschema name, rasttable name, rastcolumn name) RETURNS boolean
    LANGUAGE sql STRICT
    AS $_$ SELECT _drop_raster_constraint($1, $2, 'enforce_nodata_values_' || $3) $_$;


ALTER FUNCTION public._drop_raster_constraint_nodata_values(rastschema name, rasttable name, rastcolumn name) OWNER TO postgres;

--
-- Name: _drop_raster_constraint_num_bands(name, name, name); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION _drop_raster_constraint_num_bands(rastschema name, rasttable name, rastcolumn name) RETURNS boolean
    LANGUAGE sql STRICT
    AS $_$ SELECT _drop_raster_constraint($1, $2, 'enforce_num_bands_' || $3) $_$;


ALTER FUNCTION public._drop_raster_constraint_num_bands(rastschema name, rasttable name, rastcolumn name) OWNER TO postgres;

--
-- Name: _drop_raster_constraint_out_db(name, name, name); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION _drop_raster_constraint_out_db(rastschema name, rasttable name, rastcolumn name) RETURNS boolean
    LANGUAGE sql STRICT
    AS $_$ SELECT _drop_raster_constraint($1, $2, 'enforce_out_db_' || $3) $_$;


ALTER FUNCTION public._drop_raster_constraint_out_db(rastschema name, rasttable name, rastcolumn name) OWNER TO postgres;

--
-- Name: _drop_raster_constraint_pixel_types(name, name, name); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION _drop_raster_constraint_pixel_types(rastschema name, rasttable name, rastcolumn name) RETURNS boolean
    LANGUAGE sql STRICT
    AS $_$ SELECT _drop_raster_constraint($1, $2, 'enforce_pixel_types_' || $3) $_$;


ALTER FUNCTION public._drop_raster_constraint_pixel_types(rastschema name, rasttable name, rastcolumn name) OWNER TO postgres;

--
-- Name: _drop_raster_constraint_regular_blocking(name, name, name); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION _drop_raster_constraint_regular_blocking(rastschema name, rasttable name, rastcolumn name) RETURNS boolean
    LANGUAGE sql STRICT
    AS $_$ SELECT _drop_raster_constraint($1, $2, 'enforce_regular_blocking_' || $3) $_$;


ALTER FUNCTION public._drop_raster_constraint_regular_blocking(rastschema name, rasttable name, rastcolumn name) OWNER TO postgres;

--
-- Name: _drop_raster_constraint_scale(name, name, name, character); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION _drop_raster_constraint_scale(rastschema name, rasttable name, rastcolumn name, axis character) RETURNS boolean
    LANGUAGE plpgsql STRICT
    AS $_$
	BEGIN
		IF lower($4) != 'x' AND lower($4) != 'y' THEN
			RAISE EXCEPTION 'axis must be either "x" or "y"';
			RETURN FALSE;
		END IF;

		RETURN _drop_raster_constraint($1, $2, 'enforce_scale' || $4 || '_' || $3);
	END;
	$_$;


ALTER FUNCTION public._drop_raster_constraint_scale(rastschema name, rasttable name, rastcolumn name, axis character) OWNER TO postgres;

--
-- Name: _drop_raster_constraint_srid(name, name, name); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION _drop_raster_constraint_srid(rastschema name, rasttable name, rastcolumn name) RETURNS boolean
    LANGUAGE sql STRICT
    AS $_$ SELECT _drop_raster_constraint($1, $2, 'enforce_srid_' || $3) $_$;


ALTER FUNCTION public._drop_raster_constraint_srid(rastschema name, rasttable name, rastcolumn name) OWNER TO postgres;

--
-- Name: _overview_constraint(raster, integer, name, name, name); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION _overview_constraint(ov raster, factor integer, refschema name, reftable name, refcolumn name) RETURNS boolean
    LANGUAGE sql STABLE
    AS $_$ SELECT COALESCE((SELECT TRUE FROM raster_columns WHERE r_table_catalog = current_database() AND r_table_schema = $3 AND r_table_name = $4 AND r_raster_column = $5), FALSE) $_$;


ALTER FUNCTION public._overview_constraint(ov raster, factor integer, refschema name, reftable name, refcolumn name) OWNER TO postgres;

--
-- Name: _overview_constraint_info(name, name, name); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION _overview_constraint_info(ovschema name, ovtable name, ovcolumn name, OUT refschema name, OUT reftable name, OUT refcolumn name, OUT factor integer) RETURNS record
    LANGUAGE sql STABLE STRICT
    AS $_$
	SELECT
		split_part(split_part(s.consrc, '''::name', 1), '''', 2)::name,
		split_part(split_part(s.consrc, '''::name', 2), '''', 2)::name,
		split_part(split_part(s.consrc, '''::name', 3), '''', 2)::name,
		trim(both from split_part(s.consrc, ',', 2))::integer
	FROM pg_class c, pg_namespace n, pg_attribute a, pg_constraint s
	WHERE n.nspname = $1
		AND c.relname = $2
		AND a.attname = $3
		AND a.attrelid = c.oid
		AND s.connamespace = n.oid
		AND s.conrelid = c.oid
		AND a.attnum = ANY (s.conkey)
		AND s.consrc LIKE '%_overview_constraint(%'
	$_$;


ALTER FUNCTION public._overview_constraint_info(ovschema name, ovtable name, ovcolumn name, OUT refschema name, OUT reftable name, OUT refcolumn name, OUT factor integer) OWNER TO postgres;

--
-- Name: _raster_constraint_info_alignment(name, name, name); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION _raster_constraint_info_alignment(rastschema name, rasttable name, rastcolumn name) RETURNS boolean
    LANGUAGE sql STABLE STRICT
    AS $_$
	SELECT
		TRUE
	FROM pg_class c, pg_namespace n, pg_attribute a, pg_constraint s
	WHERE n.nspname = $1
		AND c.relname = $2
		AND a.attname = $3
		AND a.attrelid = c.oid
		AND s.connamespace = n.oid
		AND s.conrelid = c.oid
		AND a.attnum = ANY (s.conkey)
		AND s.consrc LIKE '%st_samealignment(%';
	$_$;


ALTER FUNCTION public._raster_constraint_info_alignment(rastschema name, rasttable name, rastcolumn name) OWNER TO postgres;

--
-- Name: _raster_constraint_info_blocksize(name, name, name, text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION _raster_constraint_info_blocksize(rastschema name, rasttable name, rastcolumn name, axis text) RETURNS integer
    LANGUAGE sql STABLE STRICT
    AS $_$
	SELECT
		replace(replace(split_part(s.consrc, ' = ', 2), ')', ''), '(', '')::integer
	FROM pg_class c, pg_namespace n, pg_attribute a, pg_constraint s
	WHERE n.nspname = $1
		AND c.relname = $2
		AND a.attname = $3
		AND a.attrelid = c.oid
		AND s.connamespace = n.oid
		AND s.conrelid = c.oid
		AND a.attnum = ANY (s.conkey)
		AND s.consrc LIKE '%st_' || $4 || '(% = %';
	$_$;


ALTER FUNCTION public._raster_constraint_info_blocksize(rastschema name, rasttable name, rastcolumn name, axis text) OWNER TO postgres;

--
-- Name: _raster_constraint_info_extent(name, name, name); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION _raster_constraint_info_extent(rastschema name, rasttable name, rastcolumn name) RETURNS geometry
    LANGUAGE sql STABLE STRICT
    AS $_$
	SELECT
		trim(both '''' from split_part(trim(split_part(s.consrc, ',', 2)), '::', 1))::geometry
	FROM pg_class c, pg_namespace n, pg_attribute a, pg_constraint s
	WHERE n.nspname = $1
		AND c.relname = $2
		AND a.attname = $3
		AND a.attrelid = c.oid
		AND s.connamespace = n.oid
		AND s.conrelid = c.oid
		AND a.attnum = ANY (s.conkey)
		AND s.consrc LIKE '%st_coveredby(st_convexhull(%';
	$_$;


ALTER FUNCTION public._raster_constraint_info_extent(rastschema name, rasttable name, rastcolumn name) OWNER TO postgres;

--
-- Name: _raster_constraint_info_nodata_values(name, name, name); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION _raster_constraint_info_nodata_values(rastschema name, rasttable name, rastcolumn name) RETURNS double precision[]
    LANGUAGE sql STABLE STRICT
    AS $_$
	SELECT
		trim(both '''' from split_part(replace(replace(split_part(s.consrc, ' = ', 2), ')', ''), '(', ''), '::', 1))::double precision[]
	FROM pg_class c, pg_namespace n, pg_attribute a, pg_constraint s
	WHERE n.nspname = $1
		AND c.relname = $2
		AND a.attname = $3
		AND a.attrelid = c.oid
		AND s.connamespace = n.oid
		AND s.conrelid = c.oid
		AND a.attnum = ANY (s.conkey)
		AND s.consrc LIKE '%_raster_constraint_nodata_values(%';
	$_$;


ALTER FUNCTION public._raster_constraint_info_nodata_values(rastschema name, rasttable name, rastcolumn name) OWNER TO postgres;

--
-- Name: _raster_constraint_info_num_bands(name, name, name); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION _raster_constraint_info_num_bands(rastschema name, rasttable name, rastcolumn name) RETURNS integer
    LANGUAGE sql STABLE STRICT
    AS $_$
	SELECT
		replace(replace(split_part(s.consrc, ' = ', 2), ')', ''), '(', '')::integer
	FROM pg_class c, pg_namespace n, pg_attribute a, pg_constraint s
	WHERE n.nspname = $1
		AND c.relname = $2
		AND a.attname = $3
		AND a.attrelid = c.oid
		AND s.connamespace = n.oid
		AND s.conrelid = c.oid
		AND a.attnum = ANY (s.conkey)
		AND s.consrc LIKE '%st_numbands(%';
	$_$;


ALTER FUNCTION public._raster_constraint_info_num_bands(rastschema name, rasttable name, rastcolumn name) OWNER TO postgres;

--
-- Name: _raster_constraint_info_out_db(name, name, name); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION _raster_constraint_info_out_db(rastschema name, rasttable name, rastcolumn name) RETURNS boolean[]
    LANGUAGE sql STABLE STRICT
    AS $_$
	SELECT
		trim(both '''' from split_part(replace(replace(split_part(s.consrc, ' = ', 2), ')', ''), '(', ''), '::', 1))::boolean[]
	FROM pg_class c, pg_namespace n, pg_attribute a, pg_constraint s
	WHERE n.nspname = $1
		AND c.relname = $2
		AND a.attname = $3
		AND a.attrelid = c.oid
		AND s.connamespace = n.oid
		AND s.conrelid = c.oid
		AND a.attnum = ANY (s.conkey)
		AND s.consrc LIKE '%_raster_constraint_out_db(%';
	$_$;


ALTER FUNCTION public._raster_constraint_info_out_db(rastschema name, rasttable name, rastcolumn name) OWNER TO postgres;

--
-- Name: _raster_constraint_info_pixel_types(name, name, name); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION _raster_constraint_info_pixel_types(rastschema name, rasttable name, rastcolumn name) RETURNS text[]
    LANGUAGE sql STABLE STRICT
    AS $_$
	SELECT
		trim(both '''' from split_part(replace(replace(split_part(s.consrc, ' = ', 2), ')', ''), '(', ''), '::', 1))::text[]
	FROM pg_class c, pg_namespace n, pg_attribute a, pg_constraint s
	WHERE n.nspname = $1
		AND c.relname = $2
		AND a.attname = $3
		AND a.attrelid = c.oid
		AND s.connamespace = n.oid
		AND s.conrelid = c.oid
		AND a.attnum = ANY (s.conkey)
		AND s.consrc LIKE '%_raster_constraint_pixel_types(%';
	$_$;


ALTER FUNCTION public._raster_constraint_info_pixel_types(rastschema name, rasttable name, rastcolumn name) OWNER TO postgres;

--
-- Name: _raster_constraint_info_regular_blocking(name, name, name); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION _raster_constraint_info_regular_blocking(rastschema name, rasttable name, rastcolumn name) RETURNS boolean
    LANGUAGE plpgsql STABLE STRICT
    AS $_$
	DECLARE
		cn text;
		sql text;
		rtn boolean;
	BEGIN
		cn := 'enforce_regular_blocking_' || $3;

		sql := 'SELECT TRUE FROM pg_class c, pg_namespace n, pg_constraint s'
			|| ' WHERE n.nspname = ' || quote_literal($1)
			|| ' AND c.relname = ' || quote_literal($2)
			|| ' AND s.connamespace = n.oid AND s.conrelid = c.oid'
			|| ' AND s.conname = ' || quote_literal(cn);
		EXECUTE sql INTO rtn;
		RETURN rtn;
	END;
	$_$;


ALTER FUNCTION public._raster_constraint_info_regular_blocking(rastschema name, rasttable name, rastcolumn name) OWNER TO postgres;

--
-- Name: _raster_constraint_info_scale(name, name, name, character); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION _raster_constraint_info_scale(rastschema name, rasttable name, rastcolumn name, axis character) RETURNS double precision
    LANGUAGE sql STABLE STRICT
    AS $_$
	SELECT
		replace(replace(split_part(split_part(s.consrc, ' = ', 2), '::', 1), ')', ''), '(', '')::double precision
	FROM pg_class c, pg_namespace n, pg_attribute a, pg_constraint s
	WHERE n.nspname = $1
		AND c.relname = $2
		AND a.attname = $3
		AND a.attrelid = c.oid
		AND s.connamespace = n.oid
		AND s.conrelid = c.oid
		AND a.attnum = ANY (s.conkey)
		AND s.consrc LIKE '%st_scale' || $4 || '(% = %';
	$_$;


ALTER FUNCTION public._raster_constraint_info_scale(rastschema name, rasttable name, rastcolumn name, axis character) OWNER TO postgres;

--
-- Name: _raster_constraint_info_srid(name, name, name); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION _raster_constraint_info_srid(rastschema name, rasttable name, rastcolumn name) RETURNS integer
    LANGUAGE sql STABLE STRICT
    AS $_$
	SELECT
		replace(replace(split_part(s.consrc, ' = ', 2), ')', ''), '(', '')::integer
	FROM pg_class c, pg_namespace n, pg_attribute a, pg_constraint s
	WHERE n.nspname = $1
		AND c.relname = $2
		AND a.attname = $3
		AND a.attrelid = c.oid
		AND s.connamespace = n.oid
		AND s.conrelid = c.oid
		AND a.attnum = ANY (s.conkey)
		AND s.consrc LIKE '%st_srid(% = %';
	$_$;


ALTER FUNCTION public._raster_constraint_info_srid(rastschema name, rasttable name, rastcolumn name) OWNER TO postgres;

--
-- Name: _raster_constraint_nodata_values(raster); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION _raster_constraint_nodata_values(rast raster) RETURNS double precision[]
    LANGUAGE sql STABLE STRICT
    AS $_$ SELECT array_agg(nodatavalue)::double precision[] FROM st_bandmetadata($1, ARRAY[]::int[]); $_$;


ALTER FUNCTION public._raster_constraint_nodata_values(rast raster) OWNER TO postgres;

--
-- Name: _raster_constraint_out_db(raster); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION _raster_constraint_out_db(rast raster) RETURNS boolean[]
    LANGUAGE sql STABLE STRICT
    AS $_$ SELECT array_agg(isoutdb)::boolean[] FROM st_bandmetadata($1, ARRAY[]::int[]); $_$;


ALTER FUNCTION public._raster_constraint_out_db(rast raster) OWNER TO postgres;

--
-- Name: _raster_constraint_pixel_types(raster); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION _raster_constraint_pixel_types(rast raster) RETURNS text[]
    LANGUAGE sql STABLE STRICT
    AS $_$ SELECT array_agg(pixeltype)::text[] FROM st_bandmetadata($1, ARRAY[]::int[]); $_$;


ALTER FUNCTION public._raster_constraint_pixel_types(rast raster) OWNER TO postgres;

--
-- Name: _st_3ddfullywithin(geometry, geometry, double precision); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION _st_3ddfullywithin(geom1 geometry, geom2 geometry, double precision) RETURNS boolean
    LANGUAGE c IMMUTABLE STRICT COST 100
    AS '$libdir/postgis-2.0', 'LWGEOM_dfullywithin3d';


ALTER FUNCTION public._st_3ddfullywithin(geom1 geometry, geom2 geometry, double precision) OWNER TO postgres;

--
-- Name: _st_3ddwithin(geometry, geometry, double precision); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION _st_3ddwithin(geom1 geometry, geom2 geometry, double precision) RETURNS boolean
    LANGUAGE c IMMUTABLE STRICT COST 100
    AS '$libdir/postgis-2.0', 'LWGEOM_dwithin3d';


ALTER FUNCTION public._st_3ddwithin(geom1 geometry, geom2 geometry, double precision) OWNER TO postgres;

--
-- Name: _st_asgeojson(integer, geometry, integer, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION _st_asgeojson(integer, geometry, integer, integer) RETURNS text
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-2.0', 'LWGEOM_asGeoJson';


ALTER FUNCTION public._st_asgeojson(integer, geometry, integer, integer) OWNER TO postgres;

--
-- Name: _st_asgeojson(integer, geography, integer, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION _st_asgeojson(integer, geography, integer, integer) RETURNS text
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-2.0', 'geography_as_geojson';


ALTER FUNCTION public._st_asgeojson(integer, geography, integer, integer) OWNER TO postgres;

--
-- Name: _st_asgml(integer, geometry, integer, integer, text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION _st_asgml(integer, geometry, integer, integer, text) RETURNS text
    LANGUAGE c IMMUTABLE
    AS '$libdir/postgis-2.0', 'LWGEOM_asGML';


ALTER FUNCTION public._st_asgml(integer, geometry, integer, integer, text) OWNER TO postgres;

--
-- Name: _st_asgml(integer, geography, integer, integer, text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION _st_asgml(integer, geography, integer, integer, text) RETURNS text
    LANGUAGE c IMMUTABLE
    AS '$libdir/postgis-2.0', 'geography_as_gml';


ALTER FUNCTION public._st_asgml(integer, geography, integer, integer, text) OWNER TO postgres;

--
-- Name: _st_askml(integer, geometry, integer, text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION _st_askml(integer, geometry, integer, text) RETURNS text
    LANGUAGE c IMMUTABLE
    AS '$libdir/postgis-2.0', 'LWGEOM_asKML';


ALTER FUNCTION public._st_askml(integer, geometry, integer, text) OWNER TO postgres;

--
-- Name: _st_askml(integer, geography, integer, text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION _st_askml(integer, geography, integer, text) RETURNS text
    LANGUAGE c IMMUTABLE
    AS '$libdir/postgis-2.0', 'geography_as_kml';


ALTER FUNCTION public._st_askml(integer, geography, integer, text) OWNER TO postgres;

--
-- Name: _st_aspect4ma(double precision[], text, text[]); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION _st_aspect4ma(matrix double precision[], nodatamode text, VARIADIC args text[]) RETURNS double precision
    LANGUAGE plpgsql IMMUTABLE
    AS $$
    DECLARE
        pwidth float;
        pheight float;
        dz_dx float;
        dz_dy float;
        aspect float;
    BEGIN
        pwidth := args[1]::float;
        pheight := args[2]::float;
        dz_dx := ((matrix[3][1] + 2.0 * matrix[3][2] + matrix[3][3]) - (matrix[1][1] + 2.0 * matrix[1][2] + matrix[1][3])) / (8.0 * pwidth);
        dz_dy := ((matrix[1][3] + 2.0 * matrix[2][3] + matrix[3][3]) - (matrix[1][1] + 2.0 * matrix[2][1] + matrix[3][1])) / (8.0 * pheight);
        IF abs(dz_dx) = 0::float AND abs(dz_dy) = 0::float THEN
            RETURN -1;
        END IF;

        aspect := atan2(dz_dy, -dz_dx);
        IF aspect > (pi() / 2.0) THEN
            RETURN (5.0 * pi() / 2.0) - aspect;
        ELSE
            RETURN (pi() / 2.0) - aspect;
        END IF;
    END;
    $$;


ALTER FUNCTION public._st_aspect4ma(matrix double precision[], nodatamode text, VARIADIC args text[]) OWNER TO postgres;

--
-- Name: _st_asraster(geometry, double precision, double precision, integer, integer, text[], double precision[], double precision[], double precision, double precision, double precision, double precision, double precision, double precision, boolean); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION _st_asraster(geom geometry, scalex double precision DEFAULT 0, scaley double precision DEFAULT 0, width integer DEFAULT 0, height integer DEFAULT 0, pixeltype text[] DEFAULT ARRAY['8BUI'::text], value double precision[] DEFAULT ARRAY[(1)::double precision], nodataval double precision[] DEFAULT ARRAY[(0)::double precision], upperleftx double precision DEFAULT NULL::double precision, upperlefty double precision DEFAULT NULL::double precision, gridx double precision DEFAULT NULL::double precision, gridy double precision DEFAULT NULL::double precision, skewx double precision DEFAULT 0, skewy double precision DEFAULT 0, touched boolean DEFAULT false) RETURNS raster
    LANGUAGE c STABLE
    AS '$libdir/rtpostgis-2.0', 'RASTER_asRaster';


ALTER FUNCTION public._st_asraster(geom geometry, scalex double precision, scaley double precision, width integer, height integer, pixeltype text[], value double precision[], nodataval double precision[], upperleftx double precision, upperlefty double precision, gridx double precision, gridy double precision, skewx double precision, skewy double precision, touched boolean) OWNER TO postgres;

--
-- Name: _st_asx3d(integer, geometry, integer, integer, text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION _st_asx3d(integer, geometry, integer, integer, text) RETURNS text
    LANGUAGE c IMMUTABLE
    AS '$libdir/postgis-2.0', 'LWGEOM_asX3D';


ALTER FUNCTION public._st_asx3d(integer, geometry, integer, integer, text) OWNER TO postgres;

--
-- Name: _st_bestsrid(geography); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION _st_bestsrid(geography) RETURNS integer
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$SELECT _ST_BestSRID($1,$1)$_$;


ALTER FUNCTION public._st_bestsrid(geography) OWNER TO postgres;

--
-- Name: _st_bestsrid(geography, geography); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION _st_bestsrid(geography, geography) RETURNS integer
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-2.0', 'geography_bestsrid';


ALTER FUNCTION public._st_bestsrid(geography, geography) OWNER TO postgres;

--
-- Name: _st_buffer(geometry, double precision, cstring); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION _st_buffer(geometry, double precision, cstring) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT COST 100
    AS '$libdir/postgis-2.0', 'buffer';


ALTER FUNCTION public._st_buffer(geometry, double precision, cstring) OWNER TO postgres;

--
-- Name: _st_concavehull(geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION _st_concavehull(param_inputgeom geometry) RETURNS geometry
    LANGUAGE plpgsql IMMUTABLE STRICT
    AS $$
	DECLARE     
	vexhull GEOMETRY;
	var_resultgeom geometry;
	var_inputgeom geometry;
	vexring GEOMETRY;
	cavering GEOMETRY;
	cavept geometry[];
	seglength double precision;
	var_tempgeom geometry;
	scale_factor integer := 1;
	i integer;
	
	BEGIN

		-- First compute the ConvexHull of the geometry
		vexhull := ST_ConvexHull(param_inputgeom);
		var_inputgeom := param_inputgeom;
		--A point really has no concave hull
		IF ST_GeometryType(vexhull) = 'ST_Point' OR ST_GeometryType(vexHull) = 'ST_LineString' THEN
			RETURN vexhull;
		END IF;

		-- convert the hull perimeter to a linestring so we can manipulate individual points
		vexring := CASE WHEN ST_GeometryType(vexhull) = 'ST_LineString' THEN vexhull ELSE ST_ExteriorRing(vexhull) END;
		IF abs(ST_X(ST_PointN(vexring,1))) < 1 THEN --scale the geometry to prevent stupid precision errors - not sure it works so make low for now
			scale_factor := 100;
			vexring := ST_Scale(vexring, scale_factor,scale_factor);
			var_inputgeom := ST_Scale(var_inputgeom, scale_factor, scale_factor);
			--RAISE NOTICE 'Scaling';
		END IF;
		seglength := ST_Length(vexring)/least(ST_NPoints(vexring)*2,1000) ;

		vexring := ST_Segmentize(vexring, seglength);
		-- find the point on the original geom that is closest to each point of the convex hull and make a new linestring out of it.
		cavering := ST_Collect(
			ARRAY(

				SELECT 
					ST_ClosestPoint(var_inputgeom, pt ) As the_geom
					FROM (
						SELECT  ST_PointN(vexring, n ) As pt, n
							FROM 
							generate_series(1, ST_NPoints(vexring) ) As n
						) As pt
				
				)
			)
		; 
		

		var_resultgeom := ST_MakeLine(geom) 
			FROM ST_Dump(cavering) As foo;

		IF ST_IsSimple(var_resultgeom) THEN
			var_resultgeom := ST_MakePolygon(var_resultgeom);
			--RAISE NOTICE 'is Simple: %', var_resultgeom;
		ELSE 
			--RAISE NOTICE 'is not Simple: %', var_resultgeom;
			var_resultgeom := ST_ConvexHull(var_resultgeom);
		END IF;
		
		IF scale_factor > 1 THEN -- scale the result back
			var_resultgeom := ST_Scale(var_resultgeom, 1/scale_factor, 1/scale_factor);
		END IF;
		RETURN var_resultgeom;
	
	END;
$$;


ALTER FUNCTION public._st_concavehull(param_inputgeom geometry) OWNER TO postgres;

--
-- Name: _st_contains(geometry, geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION _st_contains(geom1 geometry, geom2 geometry) RETURNS boolean
    LANGUAGE c IMMUTABLE STRICT COST 100
    AS '$libdir/postgis-2.0', 'contains';


ALTER FUNCTION public._st_contains(geom1 geometry, geom2 geometry) OWNER TO postgres;

--
-- Name: _st_containsproperly(geometry, geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION _st_containsproperly(geom1 geometry, geom2 geometry) RETURNS boolean
    LANGUAGE c IMMUTABLE STRICT COST 100
    AS '$libdir/postgis-2.0', 'containsproperly';


ALTER FUNCTION public._st_containsproperly(geom1 geometry, geom2 geometry) OWNER TO postgres;

--
-- Name: _st_count(raster, integer, boolean, double precision); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION _st_count(rast raster, nband integer DEFAULT 1, exclude_nodata_value boolean DEFAULT true, sample_percent double precision DEFAULT 1) RETURNS bigint
    LANGUAGE plpgsql IMMUTABLE STRICT
    AS $_$
	DECLARE
		rtn bigint;
	BEGIN
		IF exclude_nodata_value IS FALSE THEN
			SELECT width * height INTO rtn FROM ST_Metadata(rast);
		ELSE
			SELECT count INTO rtn FROM _st_summarystats($1, $2, $3, $4);
		END IF;

		RETURN rtn;
	END;
	$_$;


ALTER FUNCTION public._st_count(rast raster, nband integer, exclude_nodata_value boolean, sample_percent double precision) OWNER TO postgres;

--
-- Name: _st_count(text, text, integer, boolean, double precision); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION _st_count(rastertable text, rastercolumn text, nband integer DEFAULT 1, exclude_nodata_value boolean DEFAULT true, sample_percent double precision DEFAULT 1) RETURNS bigint
    LANGUAGE plpgsql STABLE STRICT
    AS $_$
	DECLARE
		curs refcursor;

		ctable text;
		ccolumn text;
		rast raster;
		stats summarystats;

		rtn bigint;
		tmp bigint;
	BEGIN
		-- nband
		IF nband < 1 THEN
			RAISE WARNING 'Invalid band index (must use 1-based). Returning NULL';
			RETURN NULL;
		END IF;

		-- sample percent
		IF sample_percent < 0 OR sample_percent > 1 THEN
			RAISE WARNING 'Invalid sample percentage (must be between 0 and 1). Returning NULL';
			RETURN NULL;
		END IF;

		-- exclude_nodata_value IS TRUE
		IF exclude_nodata_value IS TRUE THEN
			SELECT count INTO rtn FROM _st_summarystats($1, $2, $3, $4, $5);
			RETURN rtn;
		END IF;

		-- clean rastertable and rastercolumn
		ctable := quote_ident(rastertable);
		ccolumn := quote_ident(rastercolumn);

		BEGIN
			OPEN curs FOR EXECUTE 'SELECT '
					|| ccolumn
					|| ' FROM '
					|| ctable
					|| ' WHERE '
					|| ccolumn
					|| ' IS NOT NULL';
		EXCEPTION
			WHEN OTHERS THEN
				RAISE WARNING 'Invalid table or column name. Returning NULL';
				RETURN NULL;
		END;

		rtn := 0;
		LOOP
			FETCH curs INTO rast;
			EXIT WHEN NOT FOUND;

			SELECT (width * height) INTO tmp FROM ST_Metadata(rast);
			rtn := rtn + tmp;
		END LOOP;

		CLOSE curs;

		RETURN rtn;
	END;
	$_$;


ALTER FUNCTION public._st_count(rastertable text, rastercolumn text, nband integer, exclude_nodata_value boolean, sample_percent double precision) OWNER TO postgres;

--
-- Name: _st_coveredby(geometry, geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION _st_coveredby(geom1 geometry, geom2 geometry) RETURNS boolean
    LANGUAGE c IMMUTABLE STRICT COST 100
    AS '$libdir/postgis-2.0', 'coveredby';


ALTER FUNCTION public._st_coveredby(geom1 geometry, geom2 geometry) OWNER TO postgres;

--
-- Name: _st_covers(geometry, geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION _st_covers(geom1 geometry, geom2 geometry) RETURNS boolean
    LANGUAGE c IMMUTABLE STRICT COST 100
    AS '$libdir/postgis-2.0', 'covers';


ALTER FUNCTION public._st_covers(geom1 geometry, geom2 geometry) OWNER TO postgres;

--
-- Name: _st_covers(geography, geography); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION _st_covers(geography, geography) RETURNS boolean
    LANGUAGE c IMMUTABLE STRICT COST 100
    AS '$libdir/postgis-2.0', 'geography_covers';


ALTER FUNCTION public._st_covers(geography, geography) OWNER TO postgres;

--
-- Name: _st_crosses(geometry, geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION _st_crosses(geom1 geometry, geom2 geometry) RETURNS boolean
    LANGUAGE c IMMUTABLE STRICT COST 100
    AS '$libdir/postgis-2.0', 'crosses';


ALTER FUNCTION public._st_crosses(geom1 geometry, geom2 geometry) OWNER TO postgres;

--
-- Name: _st_dfullywithin(geometry, geometry, double precision); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION _st_dfullywithin(geom1 geometry, geom2 geometry, double precision) RETURNS boolean
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-2.0', 'LWGEOM_dfullywithin';


ALTER FUNCTION public._st_dfullywithin(geom1 geometry, geom2 geometry, double precision) OWNER TO postgres;

--
-- Name: _st_distance(geography, geography, double precision, boolean); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION _st_distance(geography, geography, double precision, boolean) RETURNS double precision
    LANGUAGE c IMMUTABLE STRICT COST 100
    AS '$libdir/postgis-2.0', 'geography_distance';


ALTER FUNCTION public._st_distance(geography, geography, double precision, boolean) OWNER TO postgres;

--
-- Name: _st_dumppoints(geometry, integer[]); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION _st_dumppoints(the_geom geometry, cur_path integer[]) RETURNS SETOF geometry_dump
    LANGUAGE plpgsql
    AS $$
DECLARE
  tmp geometry_dump;
  tmp2 geometry_dump;
  nb_points integer;
  nb_geom integer;
  i integer;
  j integer;
  g geometry;
  
BEGIN
  
  RAISE DEBUG '%,%', cur_path, ST_GeometryType(the_geom);

  -- Special case collections : iterate and return the DumpPoints of the geometries

  IF (ST_IsCollection(the_geom)) THEN
 
    i = 1;
    FOR tmp2 IN SELECT (ST_Dump(the_geom)).* LOOP

      FOR tmp IN SELECT * FROM _ST_DumpPoints(tmp2.geom, cur_path || tmp2.path) LOOP
	    RETURN NEXT tmp;
      END LOOP;
      i = i + 1;
      
    END LOOP;

    RETURN;
  END IF;
  

  -- Special case (POLYGON) : return the points of the rings of a polygon
  IF (ST_GeometryType(the_geom) = 'ST_Polygon') THEN

    FOR tmp IN SELECT * FROM _ST_DumpPoints(ST_ExteriorRing(the_geom), cur_path || ARRAY[1]) LOOP
      RETURN NEXT tmp;
    END LOOP;
    
    j := ST_NumInteriorRings(the_geom);
    FOR i IN 1..j LOOP
        FOR tmp IN SELECT * FROM _ST_DumpPoints(ST_InteriorRingN(the_geom, i), cur_path || ARRAY[i+1]) LOOP
          RETURN NEXT tmp;
        END LOOP;
    END LOOP;
    
    RETURN;
  END IF;

  -- Special case (TRIANGLE) : return the points of the external rings of a TRIANGLE
  IF (ST_GeometryType(the_geom) = 'ST_Triangle') THEN

    FOR tmp IN SELECT * FROM _ST_DumpPoints(ST_ExteriorRing(the_geom), cur_path || ARRAY[1]) LOOP
      RETURN NEXT tmp;
    END LOOP;
    
    RETURN;
  END IF;

    
  -- Special case (POINT) : return the point
  IF (ST_GeometryType(the_geom) = 'ST_Point') THEN

    tmp.path = cur_path || ARRAY[1];
    tmp.geom = the_geom;

    RETURN NEXT tmp;
    RETURN;

  END IF;


  -- Use ST_NumPoints rather than ST_NPoints to have a NULL value if the_geom isn't
  -- a LINESTRING, CIRCULARSTRING.
  SELECT ST_NumPoints(the_geom) INTO nb_points;

  -- This should never happen
  IF (nb_points IS NULL) THEN
    RAISE EXCEPTION 'Unexpected error while dumping geometry %', ST_AsText(the_geom);
  END IF;

  FOR i IN 1..nb_points LOOP
    tmp.path = cur_path || ARRAY[i];
    tmp.geom := ST_PointN(the_geom, i);
    RETURN NEXT tmp;
  END LOOP;
   
END
$$;


ALTER FUNCTION public._st_dumppoints(the_geom geometry, cur_path integer[]) OWNER TO postgres;

--
-- Name: _st_dwithin(geometry, geometry, double precision); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION _st_dwithin(geom1 geometry, geom2 geometry, double precision) RETURNS boolean
    LANGUAGE c IMMUTABLE STRICT COST 100
    AS '$libdir/postgis-2.0', 'LWGEOM_dwithin';


ALTER FUNCTION public._st_dwithin(geom1 geometry, geom2 geometry, double precision) OWNER TO postgres;

--
-- Name: _st_dwithin(geography, geography, double precision, boolean); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION _st_dwithin(geography, geography, double precision, boolean) RETURNS boolean
    LANGUAGE c IMMUTABLE STRICT COST 100
    AS '$libdir/postgis-2.0', 'geography_dwithin';


ALTER FUNCTION public._st_dwithin(geography, geography, double precision, boolean) OWNER TO postgres;

--
-- Name: _st_equals(geometry, geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION _st_equals(geom1 geometry, geom2 geometry) RETURNS boolean
    LANGUAGE c IMMUTABLE STRICT COST 100
    AS '$libdir/postgis-2.0', 'ST_Equals';


ALTER FUNCTION public._st_equals(geom1 geometry, geom2 geometry) OWNER TO postgres;

--
-- Name: _st_expand(geography, double precision); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION _st_expand(geography, double precision) RETURNS geography
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-2.0', 'geography_expand';


ALTER FUNCTION public._st_expand(geography, double precision) OWNER TO postgres;

--
-- Name: _st_geomfromgml(text, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION _st_geomfromgml(text, integer) RETURNS geometry
    LANGUAGE c IMMUTABLE
    AS '$libdir/postgis-2.0', 'geom_from_gml';


ALTER FUNCTION public._st_geomfromgml(text, integer) OWNER TO postgres;

--
-- Name: _st_hillshade4ma(double precision[], text, text[]); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION _st_hillshade4ma(matrix double precision[], nodatamode text, VARIADIC args text[]) RETURNS double precision
    LANGUAGE plpgsql IMMUTABLE
    AS $$
    DECLARE
        pwidth float;
        pheight float;
        dz_dx float;
        dz_dy float;
        zenith float;
        azimuth float;
        slope float;
        aspect float;
        max_bright float;
        elevation_scale float;
    BEGIN
        pwidth := args[1]::float;
        pheight := args[2]::float;
        azimuth := (5.0 * pi() / 2.0) - args[3]::float;
        zenith := (pi() / 2.0) - args[4]::float;
        dz_dx := ((matrix[3][1] + 2.0 * matrix[3][2] + matrix[3][3]) - (matrix[1][1] + 2.0 * matrix[1][2] + matrix[1][3])) / (8.0 * pwidth);
        dz_dy := ((matrix[1][3] + 2.0 * matrix[2][3] + matrix[3][3]) - (matrix[1][1] + 2.0 * matrix[2][1] + matrix[3][1])) / (8.0 * pheight);
        elevation_scale := args[6]::float;
        slope := atan(sqrt(elevation_scale * pow(dz_dx, 2.0) + pow(dz_dy, 2.0)));
        -- handle special case of 0, 0
        IF abs(dz_dy) = 0::float AND abs(dz_dy) = 0::float THEN
            -- set to pi as that is the expected PostgreSQL answer in Linux
            aspect := pi();
        ELSE
            aspect := atan2(dz_dy, -dz_dx);
        END IF;
        max_bright := args[5]::float;

        IF aspect < 0 THEN
            aspect := aspect + (2.0 * pi());
        END IF;

        RETURN max_bright * ( (cos(zenith)*cos(slope)) + (sin(zenith)*sin(slope)*cos(azimuth - aspect)) );
    END;
    $$;


ALTER FUNCTION public._st_hillshade4ma(matrix double precision[], nodatamode text, VARIADIC args text[]) OWNER TO postgres;

--
-- Name: _st_histogram(text, text, integer, boolean, double precision, integer, double precision[], boolean); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION _st_histogram(rastertable text, rastercolumn text, nband integer DEFAULT 1, exclude_nodata_value boolean DEFAULT true, sample_percent double precision DEFAULT 1, bins integer DEFAULT 0, width double precision[] DEFAULT NULL::double precision[], "right" boolean DEFAULT false) RETURNS SETOF histogram
    LANGUAGE c IMMUTABLE
    AS '$libdir/rtpostgis-2.0', 'RASTER_histogramCoverage';


ALTER FUNCTION public._st_histogram(rastertable text, rastercolumn text, nband integer, exclude_nodata_value boolean, sample_percent double precision, bins integer, width double precision[], "right" boolean) OWNER TO postgres;

--
-- Name: _st_histogram(raster, integer, boolean, double precision, integer, double precision[], boolean, double precision, double precision); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION _st_histogram(rast raster, nband integer DEFAULT 1, exclude_nodata_value boolean DEFAULT true, sample_percent double precision DEFAULT 1, bins integer DEFAULT 0, width double precision[] DEFAULT NULL::double precision[], "right" boolean DEFAULT false, min double precision DEFAULT NULL::double precision, max double precision DEFAULT NULL::double precision) RETURNS SETOF histogram
    LANGUAGE c IMMUTABLE
    AS '$libdir/rtpostgis-2.0', 'RASTER_histogram';


ALTER FUNCTION public._st_histogram(rast raster, nband integer, exclude_nodata_value boolean, sample_percent double precision, bins integer, width double precision[], "right" boolean, min double precision, max double precision) OWNER TO postgres;

--
-- Name: _st_intersects(geometry, geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION _st_intersects(geom1 geometry, geom2 geometry) RETURNS boolean
    LANGUAGE c IMMUTABLE STRICT COST 100
    AS '$libdir/postgis-2.0', 'intersects';


ALTER FUNCTION public._st_intersects(geom1 geometry, geom2 geometry) OWNER TO postgres;

--
-- Name: _st_intersects(raster, geometry, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION _st_intersects(rast raster, geom geometry, nband integer DEFAULT NULL::integer) RETURNS boolean
    LANGUAGE plpgsql IMMUTABLE COST 1000
    AS $$
	DECLARE
		gr raster;
		scale double precision;
	BEGIN
		IF ST_Intersects(geom, ST_ConvexHull(rast)) IS NOT TRUE THEN
			RETURN FALSE;
		ELSEIF nband IS NULL THEN
			RETURN TRUE;
		END IF;

		-- scale is set to 1/100th of raster for granularity
		SELECT least(scalex, scaley) / 100. INTO scale FROM ST_Metadata(rast);
		gr := _st_asraster(geom, scale, scale);
		IF gr IS NULL THEN
			RAISE EXCEPTION 'Unable to convert geometry to a raster';
			RETURN FALSE;
		END IF;

		RETURN ST_Intersects(rast, nband, gr, 1);
	END;
	$$;


ALTER FUNCTION public._st_intersects(rast raster, geom geometry, nband integer) OWNER TO postgres;

--
-- Name: _st_intersects(geometry, raster, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION _st_intersects(geom geometry, rast raster, nband integer DEFAULT NULL::integer) RETURNS boolean
    LANGUAGE plpgsql IMMUTABLE COST 1000
    AS $$
	DECLARE
		hasnodata boolean := TRUE;
		nodata float8 := 0.0;
		convexhull geometry;
		geomintersect geometry;
		x1w double precision := 0.0;
		x2w double precision := 0.0;
		y1w double precision := 0.0;
		y2w double precision := 0.0;
		x1 integer := 0;
		x2 integer := 0;
		x3 integer := 0;
		x4 integer := 0;
		y1 integer := 0;
		y2 integer := 0;
		y3 integer := 0;
		y4 integer := 0;
		x integer := 0;
		y integer := 0;
		xinc integer := 0;
		yinc integer := 0;
		pixelval double precision;
		bintersect boolean := FALSE;
		gtype text;
		scale float8;
		w int;
		h int;
	BEGIN
		convexhull := ST_ConvexHull(rast);
		IF nband IS NOT NULL THEN
			SELECT CASE WHEN bmd.nodatavalue IS NULL THEN FALSE ELSE NULL END INTO hasnodata FROM ST_BandMetaData(rast, nband) AS bmd;
		END IF;

		IF ST_Intersects(geom, convexhull) IS NOT TRUE THEN
			RETURN FALSE;
		ELSEIF nband IS NULL OR hasnodata IS FALSE THEN
			RETURN TRUE;
		END IF;

		-- Get the intersection between with the geometry.
		-- We will search for withvalue pixel only in this area.
		geomintersect := st_intersection(geom, convexhull);

--RAISE NOTICE 'geomintersect=%', st_astext(geomintersect);

		-- If the intersection is empty, return false
		IF st_isempty(geomintersect) THEN
			RETURN FALSE;
		END IF;

		-- We create a minimalistic buffer around the intersection in order to scan every pixels
		-- that would touch the edge or intersect with the geometry
		SELECT sqrt(scalex * scalex + skewy * skewy), width, height INTO scale, w, h FROM ST_Metadata(rast);
		IF scale != 0 THEN
			geomintersect := st_buffer(geomintersect, scale / 1000000);
		END IF;

--RAISE NOTICE 'geomintersect2=%', st_astext(geomintersect);

		-- Find the world coordinates of the bounding box of the intersecting area
		x1w := st_xmin(geomintersect);
		y1w := st_ymin(geomintersect);
		x2w := st_xmax(geomintersect);
		y2w := st_ymax(geomintersect);
		nodata := st_bandnodatavalue(rast, nband);

--RAISE NOTICE 'x1w=%, y1w=%, x2w=%, y2w=%', x1w, y1w, x2w, y2w;

		-- Convert world coordinates to raster coordinates
		x1 := st_world2rastercoordx(rast, x1w, y1w);
		y1 := st_world2rastercoordy(rast, x1w, y1w);
		x2 := st_world2rastercoordx(rast, x2w, y1w);
		y2 := st_world2rastercoordy(rast, x2w, y1w);
		x3 := st_world2rastercoordx(rast, x1w, y2w);
		y3 := st_world2rastercoordy(rast, x1w, y2w);
		x4 := st_world2rastercoordx(rast, x2w, y2w);
		y4 := st_world2rastercoordy(rast, x2w, y2w);

--RAISE NOTICE 'x1=%, y1=%, x2=%, y2=%, x3=%, y3=%, x4=%, y4=%', x1, y1, x2, y2, x3, y3, x4, y4;

		-- Order the raster coordinates for the upcoming FOR loop.
		x1 := int4smaller(int4smaller(int4smaller(x1, x2), x3), x4);
		y1 := int4smaller(int4smaller(int4smaller(y1, y2), y3), y4);
		x2 := int4larger(int4larger(int4larger(x1, x2), x3), x4);
		y2 := int4larger(int4larger(int4larger(y1, y2), y3), y4);

		-- Make sure the range is not lower than 1.
		-- This can happen when world coordinate are exactly on the left border
		-- of the raster and that they do not span on more than one pixel.
		x1 := int4smaller(int4larger(x1, 1), w);
		y1 := int4smaller(int4larger(y1, 1), h);

		-- Also make sure the range does not exceed the width and height of the raster.
		-- This can happen when world coordinate are exactly on the lower right border
		-- of the raster.
		x2 := int4smaller(x2, w);
		y2 := int4smaller(y2, h);

--RAISE NOTICE 'x1=%, y1=%, x2=%, y2=%', x1, y1, x2, y2;

		-- Search exhaustively for withvalue pixel on a moving 3x3 grid
		-- (very often more efficient than searching on a mere 1x1 grid)
		FOR xinc in 0..2 LOOP
			FOR yinc in 0..2 LOOP
				FOR x IN x1+xinc..x2 BY 3 LOOP
					FOR y IN y1+yinc..y2 BY 3 LOOP
						-- Check first if the pixel intersects with the geometry. Often many won't.
						bintersect := NOT st_isempty(st_intersection(st_pixelaspolygon(rast, x, y), geom));

						IF bintersect THEN
							-- If the pixel really intersects, check its value. Return TRUE if with value.
							pixelval := st_value(rast, nband, x, y);
							IF pixelval != nodata THEN
								RETURN TRUE;
							END IF;
						END IF;
					END LOOP;
				END LOOP;
			END LOOP;
		END LOOP;

		RETURN FALSE;
	END;
	$$;


ALTER FUNCTION public._st_intersects(geom geometry, rast raster, nband integer) OWNER TO postgres;

--
-- Name: _st_intersects(raster, integer, raster, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION _st_intersects(rast1 raster, nband1 integer, rast2 raster, nband2 integer) RETURNS boolean
    LANGUAGE c IMMUTABLE STRICT COST 1000
    AS '$libdir/rtpostgis-2.0', 'RASTER_intersects';


ALTER FUNCTION public._st_intersects(rast1 raster, nband1 integer, rast2 raster, nband2 integer) OWNER TO postgres;

--
-- Name: _st_linecrossingdirection(geometry, geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION _st_linecrossingdirection(geom1 geometry, geom2 geometry) RETURNS integer
    LANGUAGE c IMMUTABLE STRICT COST 100
    AS '$libdir/postgis-2.0', 'ST_LineCrossingDirection';


ALTER FUNCTION public._st_linecrossingdirection(geom1 geometry, geom2 geometry) OWNER TO postgres;

--
-- Name: _st_longestline(geometry, geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION _st_longestline(geom1 geometry, geom2 geometry) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-2.0', 'LWGEOM_longestline2d';


ALTER FUNCTION public._st_longestline(geom1 geometry, geom2 geometry) OWNER TO postgres;

--
-- Name: _st_mapalgebra4unionfinal1(raster); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION _st_mapalgebra4unionfinal1(rast raster) RETURNS raster
    LANGUAGE plpgsql
    AS $$
    DECLARE
    BEGIN
    	-- NOTE: I have to sacrifice RANGE.  Sorry RANGE.  Any 2 banded raster is going to be treated
    	-- as a MEAN
        IF ST_NumBands(rast) = 2 THEN
            RETURN ST_MapAlgebraExpr(rast, 1, rast, 2, 'CASE WHEN [rast2.val] > 0 THEN [rast1.val] / [rast2.val]::float8 ELSE NULL END'::text, NULL::text, 'UNION'::text, NULL::text, NULL::text, NULL::double precision);
        ELSE
            RETURN rast;
        END IF;
    END;
    $$;


ALTER FUNCTION public._st_mapalgebra4unionfinal1(rast raster) OWNER TO postgres;

--
-- Name: _st_mapalgebra4unionstate(raster, raster); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION _st_mapalgebra4unionstate(rast1 raster, rast2 raster) RETURNS raster
    LANGUAGE sql
    AS $_$
        SELECT _ST_MapAlgebra4UnionState($1,$2, 'LAST', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
    $_$;


ALTER FUNCTION public._st_mapalgebra4unionstate(rast1 raster, rast2 raster) OWNER TO postgres;

--
-- Name: _st_mapalgebra4unionstate(raster, raster, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION _st_mapalgebra4unionstate(rast1 raster, rast2 raster, bandnum integer) RETURNS raster
    LANGUAGE sql
    AS $_$
        SELECT _ST_MapAlgebra4UnionState($1,ST_Band($2,$3), 'LAST', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
    $_$;


ALTER FUNCTION public._st_mapalgebra4unionstate(rast1 raster, rast2 raster, bandnum integer) OWNER TO postgres;

--
-- Name: _st_mapalgebra4unionstate(raster, raster, text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION _st_mapalgebra4unionstate(rast1 raster, rast2 raster, p_expression text) RETURNS raster
    LANGUAGE sql
    AS $_$
        SELECT _ST_MapAlgebra4UnionState($1,$2, $3, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
    $_$;


ALTER FUNCTION public._st_mapalgebra4unionstate(rast1 raster, rast2 raster, p_expression text) OWNER TO postgres;

--
-- Name: _st_mapalgebra4unionstate(raster, raster, integer, text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION _st_mapalgebra4unionstate(rast1 raster, rast2 raster, bandnum integer, p_expression text) RETURNS raster
    LANGUAGE sql
    AS $_$
        SELECT _ST_MapAlgebra4UnionState($1, ST_Band($2,$3), $4, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
    $_$;


ALTER FUNCTION public._st_mapalgebra4unionstate(rast1 raster, rast2 raster, bandnum integer, p_expression text) OWNER TO postgres;

--
-- Name: _st_mapalgebra4unionstate(raster, raster, text, text, text, double precision, text, text, text, double precision); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION _st_mapalgebra4unionstate(rast1 raster, rast2 raster, p_expression text, p_nodata1expr text, p_nodata2expr text, p_nodatanodataval double precision, t_expression text, t_nodata1expr text, t_nodata2expr text, t_nodatanodataval double precision) RETURNS raster
    LANGUAGE plpgsql
    AS $$
    DECLARE
        t_raster raster;
        p_raster raster;
    BEGIN
        -- With the new ST_MapAlgebraExpr we must split the main expression in three expressions: expression, nodata1expr, nodata2expr and a nodatanodataval
        -- ST_MapAlgebraExpr(rast1 raster, band1 integer, rast2 raster, band2 integer, expression text, pixeltype text, extentexpr text, nodata1expr text, nodata2expr text, nodatanodatadaval double precision)
        -- We must make sure that when NULL is passed as the first raster to ST_MapAlgebraExpr, ST_MapAlgebraExpr resolve the nodata1expr
        -- Note: rast2 is always a single band raster since it is the accumulated raster thus far
        -- 		There we always set that to band 1 regardless of what band num is requested
        IF upper(p_expression) = 'LAST' THEN
            --RAISE NOTICE 'last asked for ';
            RETURN ST_MapAlgebraExpr(rast1, 1, rast2, 1, '[rast2.val]'::text, NULL::text, 'UNION'::text, '[rast2.val]'::text, '[rast1.val]'::text, NULL::double precision);
        ELSIF upper(p_expression) = 'FIRST' THEN
            RETURN ST_MapAlgebraExpr(rast1, 1, rast2, 1, '[rast1.val]'::text, NULL::text, 'UNION'::text, '[rast2.val]'::text, '[rast1.val]'::text, NULL::double precision);
        ELSIF upper(p_expression) = 'MIN' THEN
            RETURN ST_MapAlgebraExpr(rast1, 1, rast2, 1, 'LEAST([rast1.val], [rast2.val])'::text, NULL::text, 'UNION'::text, '[rast2.val]'::text, '[rast1.val]'::text, NULL::double precision);
        ELSIF upper(p_expression) = 'MAX' THEN
            RETURN ST_MapAlgebraExpr(rast1, 1, rast2, 1, 'GREATEST([rast1.val], [rast2.val])'::text, NULL::text, 'UNION'::text, '[rast2.val]'::text, '[rast1.val]'::text, NULL::double precision);
        ELSIF upper(p_expression) = 'COUNT' THEN
            RETURN ST_MapAlgebraExpr(rast1, 1, rast2, 1, '[rast1.val] + 1'::text, NULL::text, 'UNION'::text, '1'::text, '[rast1.val]'::text, 0::double precision);
        ELSIF upper(p_expression) = 'SUM' THEN
            RETURN ST_MapAlgebraExpr(rast1, 1, rast2, 1, '[rast1.val] + [rast2.val]'::text, NULL::text, 'UNION'::text, '[rast2.val]'::text, '[rast1.val]'::text, NULL::double precision);
        ELSIF upper(p_expression) = 'RANGE' THEN
        -- have no idea what this is 
            t_raster = ST_MapAlgebraExpr(rast1, 2, rast2, 1, 'LEAST([rast1.val], [rast2.val])'::text, NULL::text, 'UNION'::text, '[rast2.val]'::text, '[rast1.val]'::text, NULL::double precision);
            p_raster := _ST_MapAlgebra4UnionState(rast1, rast2, 'MAX'::text, NULL::text, NULL::text, NULL::double precision, NULL::text, NULL::text, NULL::text, NULL::double precision);
            RETURN ST_AddBand(p_raster, t_raster, 1, 2);
        ELSIF upper(p_expression) = 'MEAN' THEN
        -- looks like t_raster is used to keep track of accumulated count
        -- and p_raster is there to keep track of accumulated sum and final state function
        -- would then do a final map to divide them.  This one is currently broken because 
        	-- have not reworked it so it can do without a final function
            t_raster = ST_MapAlgebraExpr(rast1, 2, rast2, 1, '[rast1.val] + 1'::text, NULL::text, 'UNION'::text, '1'::text, '[rast1.val]'::text, 0::double precision);
            p_raster := _ST_MapAlgebra4UnionState(rast1, rast2, 'SUM'::text, NULL::text, NULL::text, NULL::double precision, NULL::text, NULL::text, NULL::text, NULL::double precision);
            RETURN ST_AddBand(p_raster, t_raster, 1, 2);
        ELSE
            IF t_expression NOTNULL AND t_expression != '' THEN
                t_raster = ST_MapAlgebraExpr(rast1, 2, rast2, 1, t_expression, NULL::text, 'UNION'::text, t_nodata1expr, t_nodata2expr, t_nodatanodataval::double precision);
                p_raster = ST_MapAlgebraExpr(rast1, 1, rast2, 1, p_expression, NULL::text, 'UNION'::text, p_nodata1expr, p_nodata2expr, p_nodatanodataval::double precision);
                RETURN ST_AddBand(p_raster, t_raster, 1, 2);
            END IF;
            RETURN ST_MapAlgebraExpr(rast1, 1, rast2, 1, p_expression, NULL, 'UNION'::text, NULL::text, NULL::text, NULL::double precision);
        END IF;
    END;
    $$;


ALTER FUNCTION public._st_mapalgebra4unionstate(rast1 raster, rast2 raster, p_expression text, p_nodata1expr text, p_nodata2expr text, p_nodatanodataval double precision, t_expression text, t_nodata1expr text, t_nodata2expr text, t_nodatanodataval double precision) OWNER TO postgres;

--
-- Name: _st_maxdistance(geometry, geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION _st_maxdistance(geom1 geometry, geom2 geometry) RETURNS double precision
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-2.0', 'LWGEOM_maxdistance2d_linestring';


ALTER FUNCTION public._st_maxdistance(geom1 geometry, geom2 geometry) OWNER TO postgres;

--
-- Name: _st_orderingequals(geometry, geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION _st_orderingequals(geometrya geometry, geometryb geometry) RETURNS boolean
    LANGUAGE c IMMUTABLE STRICT COST 100
    AS '$libdir/postgis-2.0', 'LWGEOM_same';


ALTER FUNCTION public._st_orderingequals(geometrya geometry, geometryb geometry) OWNER TO postgres;

--
-- Name: _st_overlaps(geometry, geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION _st_overlaps(geom1 geometry, geom2 geometry) RETURNS boolean
    LANGUAGE c IMMUTABLE STRICT COST 100
    AS '$libdir/postgis-2.0', 'overlaps';


ALTER FUNCTION public._st_overlaps(geom1 geometry, geom2 geometry) OWNER TO postgres;

--
-- Name: _st_pointoutside(geography); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION _st_pointoutside(geography) RETURNS geography
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-2.0', 'geography_point_outside';


ALTER FUNCTION public._st_pointoutside(geography) OWNER TO postgres;

--
-- Name: _st_quantile(raster, integer, boolean, double precision, double precision[]); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION _st_quantile(rast raster, nband integer DEFAULT 1, exclude_nodata_value boolean DEFAULT true, sample_percent double precision DEFAULT 1, quantiles double precision[] DEFAULT NULL::double precision[]) RETURNS SETOF quantile
    LANGUAGE c IMMUTABLE
    AS '$libdir/rtpostgis-2.0', 'RASTER_quantile';


ALTER FUNCTION public._st_quantile(rast raster, nband integer, exclude_nodata_value boolean, sample_percent double precision, quantiles double precision[]) OWNER TO postgres;

--
-- Name: _st_quantile(text, text, integer, boolean, double precision, double precision[]); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION _st_quantile(rastertable text, rastercolumn text, nband integer DEFAULT 1, exclude_nodata_value boolean DEFAULT true, sample_percent double precision DEFAULT 1, quantiles double precision[] DEFAULT NULL::double precision[]) RETURNS SETOF quantile
    LANGUAGE c STABLE
    AS '$libdir/rtpostgis-2.0', 'RASTER_quantileCoverage';


ALTER FUNCTION public._st_quantile(rastertable text, rastercolumn text, nband integer, exclude_nodata_value boolean, sample_percent double precision, quantiles double precision[]) OWNER TO postgres;

--
-- Name: _st_reclass(raster, reclassarg[]); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION _st_reclass(rast raster, VARIADIC reclassargset reclassarg[]) RETURNS raster
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/rtpostgis-2.0', 'RASTER_reclass';


ALTER FUNCTION public._st_reclass(rast raster, VARIADIC reclassargset reclassarg[]) OWNER TO postgres;

--
-- Name: _st_resample(raster, text, double precision, integer, double precision, double precision, double precision, double precision, double precision, double precision, integer, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION _st_resample(rast raster, algorithm text DEFAULT 'NearestNeighbour'::text, maxerr double precision DEFAULT 0.125, srid integer DEFAULT NULL::integer, scalex double precision DEFAULT 0, scaley double precision DEFAULT 0, gridx double precision DEFAULT NULL::double precision, gridy double precision DEFAULT NULL::double precision, skewx double precision DEFAULT 0, skewy double precision DEFAULT 0, width integer DEFAULT NULL::integer, height integer DEFAULT NULL::integer) RETURNS raster
    LANGUAGE c STABLE
    AS '$libdir/rtpostgis-2.0', 'RASTER_resample';


ALTER FUNCTION public._st_resample(rast raster, algorithm text, maxerr double precision, srid integer, scalex double precision, scaley double precision, gridx double precision, gridy double precision, skewx double precision, skewy double precision, width integer, height integer) OWNER TO postgres;

--
-- Name: _st_slope4ma(double precision[], text, text[]); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION _st_slope4ma(matrix double precision[], nodatamode text, VARIADIC args text[]) RETURNS double precision
    LANGUAGE plpgsql IMMUTABLE
    AS $$
    DECLARE
        pwidth float;
        pheight float;
        dz_dx float;
        dz_dy float;
    BEGIN
        pwidth := args[1]::float;
        pheight := args[2]::float;
        dz_dx := ((matrix[3][1] + 2.0 * matrix[3][2] + matrix[3][3]) - (matrix[1][1] + 2.0 * matrix[1][2] + matrix[1][3])) / (8.0 * pwidth);
        dz_dy := ((matrix[1][3] + 2.0 * matrix[2][3] + matrix[3][3]) - (matrix[1][1] + 2.0 * matrix[2][1] + matrix[3][1])) / (8.0 * pheight);
        RETURN atan(sqrt(pow(dz_dx, 2.0) + pow(dz_dy, 2.0)));
    END;
    $$;


ALTER FUNCTION public._st_slope4ma(matrix double precision[], nodatamode text, VARIADIC args text[]) OWNER TO postgres;

--
-- Name: _st_summarystats(raster, integer, boolean, double precision); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION _st_summarystats(rast raster, nband integer DEFAULT 1, exclude_nodata_value boolean DEFAULT true, sample_percent double precision DEFAULT 1) RETURNS summarystats
    LANGUAGE c IMMUTABLE
    AS '$libdir/rtpostgis-2.0', 'RASTER_summaryStats';


ALTER FUNCTION public._st_summarystats(rast raster, nband integer, exclude_nodata_value boolean, sample_percent double precision) OWNER TO postgres;

--
-- Name: _st_summarystats(text, text, integer, boolean, double precision); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION _st_summarystats(rastertable text, rastercolumn text, nband integer DEFAULT 1, exclude_nodata_value boolean DEFAULT true, sample_percent double precision DEFAULT 1) RETURNS summarystats
    LANGUAGE c IMMUTABLE
    AS '$libdir/rtpostgis-2.0', 'RASTER_summaryStatsCoverage';


ALTER FUNCTION public._st_summarystats(rastertable text, rastercolumn text, nband integer, exclude_nodata_value boolean, sample_percent double precision) OWNER TO postgres;

--
-- Name: _st_touches(geometry, geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION _st_touches(geom1 geometry, geom2 geometry) RETURNS boolean
    LANGUAGE c IMMUTABLE STRICT COST 100
    AS '$libdir/postgis-2.0', 'touches';


ALTER FUNCTION public._st_touches(geom1 geometry, geom2 geometry) OWNER TO postgres;

--
-- Name: _st_valuecount(raster, integer, boolean, double precision[], double precision); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION _st_valuecount(rast raster, nband integer DEFAULT 1, exclude_nodata_value boolean DEFAULT true, searchvalues double precision[] DEFAULT NULL::double precision[], roundto double precision DEFAULT 0) RETURNS SETOF valuecount
    LANGUAGE c IMMUTABLE
    AS '$libdir/rtpostgis-2.0', 'RASTER_valueCount';


ALTER FUNCTION public._st_valuecount(rast raster, nband integer, exclude_nodata_value boolean, searchvalues double precision[], roundto double precision) OWNER TO postgres;

--
-- Name: _st_valuecount(text, text, integer, boolean, double precision[], double precision); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION _st_valuecount(rastertable text, rastercolumn text, nband integer DEFAULT 1, exclude_nodata_value boolean DEFAULT true, searchvalues double precision[] DEFAULT NULL::double precision[], roundto double precision DEFAULT 0) RETURNS SETOF valuecount
    LANGUAGE c STABLE
    AS '$libdir/rtpostgis-2.0', 'RASTER_valueCountCoverage';


ALTER FUNCTION public._st_valuecount(rastertable text, rastercolumn text, nband integer, exclude_nodata_value boolean, searchvalues double precision[], roundto double precision) OWNER TO postgres;

--
-- Name: _st_within(geometry, geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION _st_within(geom1 geometry, geom2 geometry) RETURNS boolean
    LANGUAGE sql IMMUTABLE
    AS $_$SELECT _ST_Contains($2,$1)$_$;


ALTER FUNCTION public._st_within(geom1 geometry, geom2 geometry) OWNER TO postgres;

--
-- Name: addauth(text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION addauth(text) RETURNS boolean
    LANGUAGE plpgsql
    AS $_$ 
DECLARE
	lockid alias for $1;
	okay boolean;
	myrec record;
BEGIN
	-- check to see if table exists
	--  if not, CREATE TEMP TABLE mylock (transid xid, lockcode text)
	okay := 'f';
	FOR myrec IN SELECT * FROM pg_class WHERE relname = 'temp_lock_have_table' LOOP
		okay := 't';
	END LOOP; 
	IF (okay <> 't') THEN 
		CREATE TEMP TABLE temp_lock_have_table (transid xid, lockcode text);
			-- this will only work from pgsql7.4 up
			-- ON COMMIT DELETE ROWS;
	END IF;

	--  INSERT INTO mylock VALUES ( $1)
--	EXECUTE 'INSERT INTO temp_lock_have_table VALUES ( '||
--		quote_literal(getTransactionID()) || ',' ||
--		quote_literal(lockid) ||')';

	INSERT INTO temp_lock_have_table VALUES (getTransactionID(), lockid);

	RETURN true::boolean;
END;
$_$;


ALTER FUNCTION public.addauth(text) OWNER TO postgres;

--
-- Name: addgeometrycolumn(character varying, character varying, integer, character varying, integer, boolean); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION addgeometrycolumn(table_name character varying, column_name character varying, new_srid integer, new_type character varying, new_dim integer, use_typmod boolean DEFAULT true) RETURNS text
    LANGUAGE plpgsql STRICT
    AS $_$
DECLARE
	ret  text;
BEGIN
	SELECT AddGeometryColumn('','',$1,$2,$3,$4,$5, $6) into ret;
	RETURN ret;
END;
$_$;


ALTER FUNCTION public.addgeometrycolumn(table_name character varying, column_name character varying, new_srid integer, new_type character varying, new_dim integer, use_typmod boolean) OWNER TO postgres;

--
-- Name: addgeometrycolumn(character varying, character varying, character varying, integer, character varying, integer, boolean); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION addgeometrycolumn(schema_name character varying, table_name character varying, column_name character varying, new_srid integer, new_type character varying, new_dim integer, use_typmod boolean DEFAULT true) RETURNS text
    LANGUAGE plpgsql STABLE STRICT
    AS $_$
DECLARE
	ret  text;
BEGIN
	SELECT AddGeometryColumn('',$1,$2,$3,$4,$5,$6,$7) into ret;
	RETURN ret;
END;
$_$;


ALTER FUNCTION public.addgeometrycolumn(schema_name character varying, table_name character varying, column_name character varying, new_srid integer, new_type character varying, new_dim integer, use_typmod boolean) OWNER TO postgres;

--
-- Name: addgeometrycolumn(character varying, character varying, character varying, character varying, integer, character varying, integer, boolean); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION addgeometrycolumn(catalog_name character varying, schema_name character varying, table_name character varying, column_name character varying, new_srid_in integer, new_type character varying, new_dim integer, use_typmod boolean DEFAULT true) RETURNS text
    LANGUAGE plpgsql STRICT
    AS $$
DECLARE
	rec RECORD;
	sr varchar;
	real_schema name;
	sql text;
	new_srid integer;

BEGIN

	-- Verify geometry type
	IF (postgis_type_name(new_type,new_dim) IS NULL )
	THEN
		RAISE EXCEPTION 'Invalid type name "%(%)" - valid ones are:
	POINT, MULTIPOINT,
	LINESTRING, MULTILINESTRING,
	POLYGON, MULTIPOLYGON,
	CIRCULARSTRING, COMPOUNDCURVE, MULTICURVE,
	CURVEPOLYGON, MULTISURFACE,
	GEOMETRY, GEOMETRYCOLLECTION,
	POINTM, MULTIPOINTM,
	LINESTRINGM, MULTILINESTRINGM,
	POLYGONM, MULTIPOLYGONM,
	CIRCULARSTRINGM, COMPOUNDCURVEM, MULTICURVEM
	CURVEPOLYGONM, MULTISURFACEM, TRIANGLE, TRIANGLEM,
	POLYHEDRALSURFACE, POLYHEDRALSURFACEM, TIN, TINM
	or GEOMETRYCOLLECTIONM', new_type, new_dim;
		RETURN 'fail';
	END IF;


	-- Verify dimension
	IF ( (new_dim >4) OR (new_dim <0) ) THEN
		RAISE EXCEPTION 'invalid dimension';
		RETURN 'fail';
	END IF;

	IF ( (new_type LIKE '%M') AND (new_dim!=3) ) THEN
		RAISE EXCEPTION 'TypeM needs 3 dimensions';
		RETURN 'fail';
	END IF;


	-- Verify SRID
	IF ( new_srid_in > 0 ) THEN
		IF new_srid_in > 998999 THEN
			RAISE EXCEPTION 'AddGeometryColumn() - SRID must be <= %', 998999;
		END IF;
		new_srid := new_srid_in;
		SELECT SRID INTO sr FROM spatial_ref_sys WHERE SRID = new_srid;
		IF NOT FOUND THEN
			RAISE EXCEPTION 'AddGeometryColumn() - invalid SRID';
			RETURN 'fail';
		END IF;
	ELSE
		new_srid := ST_SRID('POINT EMPTY'::geometry);
		IF ( new_srid_in != new_srid ) THEN
			RAISE NOTICE 'SRID value % converted to the officially unknown SRID value %', new_srid_in, new_srid;
		END IF;
	END IF;


	-- Verify schema
	IF ( schema_name IS NOT NULL AND schema_name != '' ) THEN
		sql := 'SELECT nspname FROM pg_namespace ' ||
			'WHERE text(nspname) = ' || quote_literal(schema_name) ||
			'LIMIT 1';
		RAISE DEBUG '%', sql;
		EXECUTE sql INTO real_schema;

		IF ( real_schema IS NULL ) THEN
			RAISE EXCEPTION 'Schema % is not a valid schemaname', quote_literal(schema_name);
			RETURN 'fail';
		END IF;
	END IF;

	IF ( real_schema IS NULL ) THEN
		RAISE DEBUG 'Detecting schema';
		sql := 'SELECT n.nspname AS schemaname ' ||
			'FROM pg_catalog.pg_class c ' ||
			  'JOIN pg_catalog.pg_namespace n ON n.oid = c.relnamespace ' ||
			'WHERE c.relkind = ' || quote_literal('r') ||
			' AND n.nspname NOT IN (' || quote_literal('pg_catalog') || ', ' || quote_literal('pg_toast') || ')' ||
			' AND pg_catalog.pg_table_is_visible(c.oid)' ||
			' AND c.relname = ' || quote_literal(table_name);
		RAISE DEBUG '%', sql;
		EXECUTE sql INTO real_schema;

		IF ( real_schema IS NULL ) THEN
			RAISE EXCEPTION 'Table % does not occur in the search_path', quote_literal(table_name);
			RETURN 'fail';
		END IF;
	END IF;


	-- Add geometry column to table
	IF use_typmod THEN
	     sql := 'ALTER TABLE ' ||
            quote_ident(real_schema) || '.' || quote_ident(table_name)
            || ' ADD COLUMN ' || quote_ident(column_name) ||
            ' geometry(' || postgis_type_name(new_type, new_dim) || ', ' || new_srid::text || ')';
        RAISE DEBUG '%', sql;
	ELSE
        sql := 'ALTER TABLE ' ||
            quote_ident(real_schema) || '.' || quote_ident(table_name)
            || ' ADD COLUMN ' || quote_ident(column_name) ||
            ' geometry ';
        RAISE DEBUG '%', sql;
    END IF;
	EXECUTE sql;

	IF NOT use_typmod THEN
        -- Add table CHECKs
        sql := 'ALTER TABLE ' ||
            quote_ident(real_schema) || '.' || quote_ident(table_name)
            || ' ADD CONSTRAINT '
            || quote_ident('enforce_srid_' || column_name)
            || ' CHECK (st_srid(' || quote_ident(column_name) ||
            ') = ' || new_srid::text || ')' ;
        RAISE DEBUG '%', sql;
        EXECUTE sql;
    
        sql := 'ALTER TABLE ' ||
            quote_ident(real_schema) || '.' || quote_ident(table_name)
            || ' ADD CONSTRAINT '
            || quote_ident('enforce_dims_' || column_name)
            || ' CHECK (st_ndims(' || quote_ident(column_name) ||
            ') = ' || new_dim::text || ')' ;
        RAISE DEBUG '%', sql;
        EXECUTE sql;
    
        IF ( NOT (new_type = 'GEOMETRY')) THEN
            sql := 'ALTER TABLE ' ||
                quote_ident(real_schema) || '.' || quote_ident(table_name) || ' ADD CONSTRAINT ' ||
                quote_ident('enforce_geotype_' || column_name) ||
                ' CHECK (GeometryType(' ||
                quote_ident(column_name) || ')=' ||
                quote_literal(new_type) || ' OR (' ||
                quote_ident(column_name) || ') is null)';
            RAISE DEBUG '%', sql;
            EXECUTE sql;
        END IF;
    END IF;

	RETURN
		real_schema || '.' ||
		table_name || '.' || column_name ||
		' SRID:' || new_srid::text ||
		' TYPE:' || new_type ||
		' DIMS:' || new_dim::text || ' ';
END;
$$;


ALTER FUNCTION public.addgeometrycolumn(catalog_name character varying, schema_name character varying, table_name character varying, column_name character varying, new_srid_in integer, new_type character varying, new_dim integer, use_typmod boolean) OWNER TO postgres;

--
-- Name: addoverviewconstraints(name, name, name, name, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION addoverviewconstraints(ovtable name, ovcolumn name, reftable name, refcolumn name, ovfactor integer) RETURNS boolean
    LANGUAGE sql STRICT
    AS $_$ SELECT AddOverviewConstraints('', $1, $2, '', $3, $4, $5) $_$;


ALTER FUNCTION public.addoverviewconstraints(ovtable name, ovcolumn name, reftable name, refcolumn name, ovfactor integer) OWNER TO postgres;

--
-- Name: addoverviewconstraints(name, name, name, name, name, name, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION addoverviewconstraints(ovschema name, ovtable name, ovcolumn name, refschema name, reftable name, refcolumn name, ovfactor integer) RETURNS boolean
    LANGUAGE plpgsql STRICT
    AS $_$
	DECLARE
		x int;
		s name;
		t name;
		oschema name;
		rschema name;
		sql text;
		rtn boolean;
	BEGIN
		FOR x IN 1..2 LOOP
			s := '';

			IF x = 1 THEN
				s := $1;
				t := $2;
			ELSE
				s := $4;
				t := $5;
			END IF;

			-- validate user-provided schema
			IF length(s) > 0 THEN
				sql := 'SELECT nspname FROM pg_namespace '
					|| 'WHERE nspname = ' || quote_literal(s)
					|| 'LIMIT 1';
				EXECUTE sql INTO s;

				IF s IS NULL THEN
					RAISE EXCEPTION 'The value % is not a valid schema', quote_literal(s);
					RETURN FALSE;
				END IF;
			END IF;

			-- no schema, determine what it could be using the table
			IF length(s) < 1 THEN
				sql := 'SELECT n.nspname AS schemaname '
					|| 'FROM pg_catalog.pg_class c '
					|| 'JOIN pg_catalog.pg_namespace n ON n.oid = c.relnamespace '
					|| 'WHERE c.relkind = ' || quote_literal('r')
					|| ' AND n.nspname NOT IN (' || quote_literal('pg_catalog')
					|| ', ' || quote_literal('pg_toast')
					|| ') AND pg_catalog.pg_table_is_visible(c.oid)'
					|| ' AND c.relname = ' || quote_literal(t);
				EXECUTE sql INTO s;

				IF s IS NULL THEN
					RAISE EXCEPTION 'The table % does not occur in the search_path', quote_literal(t);
					RETURN FALSE;
				END IF;
			END IF;

			IF x = 1 THEN
				oschema := s;
			ELSE
				rschema := s;
			END IF;
		END LOOP;

		-- reference raster
		rtn := _add_overview_constraint(oschema, $2, $3, rschema, $5, $6, $7);
		IF rtn IS FALSE THEN
			RAISE EXCEPTION 'Unable to add the overview constraint.  Is the schema name, table name or column name incorrect?';
			RETURN FALSE;
		END IF;

		RETURN TRUE;
	END;
	$_$;


ALTER FUNCTION public.addoverviewconstraints(ovschema name, ovtable name, ovcolumn name, refschema name, reftable name, refcolumn name, ovfactor integer) OWNER TO postgres;

--
-- Name: addrasterconstraints(name, name, text[]); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION addrasterconstraints(rasttable name, rastcolumn name, VARIADIC constraints text[]) RETURNS boolean
    LANGUAGE sql STRICT
    AS $_$ SELECT AddRasterConstraints('', $1, $2, VARIADIC $3) $_$;


ALTER FUNCTION public.addrasterconstraints(rasttable name, rastcolumn name, VARIADIC constraints text[]) OWNER TO postgres;

--
-- Name: addrasterconstraints(name, name, name, text[]); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION addrasterconstraints(rastschema name, rasttable name, rastcolumn name, VARIADIC constraints text[]) RETURNS boolean
    LANGUAGE plpgsql STRICT
    AS $_$
	DECLARE
		max int;
		cnt int;
		sql text;
		schema name;
		x int;
		kw text;
		rtn boolean;
	BEGIN
		cnt := 0;
		max := array_length(constraints, 1);
		IF max < 1 THEN
			RAISE NOTICE 'No constraints indicated to be added.  Doing nothing';
			RETURN TRUE;
		END IF;

		-- validate schema
		schema := NULL;
		IF length($1) > 0 THEN
			sql := 'SELECT nspname FROM pg_namespace '
				|| 'WHERE nspname = ' || quote_literal($1)
				|| 'LIMIT 1';
			EXECUTE sql INTO schema;

			IF schema IS NULL THEN
				RAISE EXCEPTION 'The value provided for schema is invalid';
				RETURN FALSE;
			END IF;
		END IF;

		IF schema IS NULL THEN
			sql := 'SELECT n.nspname AS schemaname '
				|| 'FROM pg_catalog.pg_class c '
				|| 'JOIN pg_catalog.pg_namespace n ON n.oid = c.relnamespace '
				|| 'WHERE c.relkind = ' || quote_literal('r')
				|| ' AND n.nspname NOT IN (' || quote_literal('pg_catalog')
				|| ', ' || quote_literal('pg_toast')
				|| ') AND pg_catalog.pg_table_is_visible(c.oid)'
				|| ' AND c.relname = ' || quote_literal($2);
			EXECUTE sql INTO schema;

			IF schema IS NULL THEN
				RAISE EXCEPTION 'The table % does not occur in the search_path', quote_literal($2);
				RETURN FALSE;
			END IF;
		END IF;

		<<kwloop>>
		FOR x in 1..max LOOP
			kw := trim(both from lower(constraints[x]));

			BEGIN
				CASE
					WHEN kw = 'srid' THEN
						RAISE NOTICE 'Adding SRID constraint';
						rtn := _add_raster_constraint_srid(schema, $2, $3);
					WHEN kw IN ('scale_x', 'scalex') THEN
						RAISE NOTICE 'Adding scale-X constraint';
						rtn := _add_raster_constraint_scale(schema, $2, $3, 'x');
					WHEN kw IN ('scale_y', 'scaley') THEN
						RAISE NOTICE 'Adding scale-Y constraint';
						rtn := _add_raster_constraint_scale(schema, $2, $3, 'y');
					WHEN kw = 'scale' THEN
						RAISE NOTICE 'Adding scale-X constraint';
						rtn := _add_raster_constraint_scale(schema, $2, $3, 'x');
						RAISE NOTICE 'Adding scale-Y constraint';
						rtn := _add_raster_constraint_scale(schema, $2, $3, 'y');
					WHEN kw IN ('blocksize_x', 'blocksizex', 'width') THEN
						RAISE NOTICE 'Adding blocksize-X constraint';
						rtn := _add_raster_constraint_blocksize(schema, $2, $3, 'width');
					WHEN kw IN ('blocksize_y', 'blocksizey', 'height') THEN
						RAISE NOTICE 'Adding blocksize-Y constraint';
						rtn := _add_raster_constraint_blocksize(schema, $2, $3, 'height');
					WHEN kw = 'blocksize' THEN
						RAISE NOTICE 'Adding blocksize-X constraint';
						rtn := _add_raster_constraint_blocksize(schema, $2, $3, 'width');
						RAISE NOTICE 'Adding blocksize-Y constraint';
						rtn := _add_raster_constraint_blocksize(schema, $2, $3, 'height');
					WHEN kw IN ('same_alignment', 'samealignment', 'alignment') THEN
						RAISE NOTICE 'Adding alignment constraint';
						rtn := _add_raster_constraint_alignment(schema, $2, $3);
					WHEN kw IN ('regular_blocking', 'regularblocking') THEN
						RAISE NOTICE 'Adding regular blocking constraint';
						rtn := _add_raster_constraint_regular_blocking(schema, $2, $3);
					WHEN kw IN ('num_bands', 'numbands') THEN
						RAISE NOTICE 'Adding number of bands constraint';
						rtn := _add_raster_constraint_num_bands(schema, $2, $3);
					WHEN kw IN ('pixel_types', 'pixeltypes') THEN
						RAISE NOTICE 'Adding pixel type constraint';
						rtn := _add_raster_constraint_pixel_types(schema, $2, $3);
					WHEN kw IN ('nodata_values', 'nodatavalues', 'nodata') THEN
						RAISE NOTICE 'Adding nodata value constraint';
						rtn := _add_raster_constraint_nodata_values(schema, $2, $3);
					WHEN kw IN ('out_db', 'outdb') THEN
						RAISE NOTICE 'Adding out-of-database constraint';
						rtn := _add_raster_constraint_out_db(schema, $2, $3);
					WHEN kw = 'extent' THEN
						RAISE NOTICE 'Adding maximum extent constraint';
						rtn := _add_raster_constraint_extent(schema, $2, $3);
					ELSE
						RAISE NOTICE 'Unknown constraint: %.  Skipping', quote_literal(constraints[x]);
						CONTINUE kwloop;
				END CASE;
			END;

			IF rtn IS FALSE THEN
				cnt := cnt + 1;
				RAISE WARNING 'Unable to add constraint: %.  Skipping', quote_literal(constraints[x]);
			END IF;

		END LOOP kwloop;

		IF cnt = max THEN
			RAISE EXCEPTION 'None of the constraints specified could be added.  Is the schema name, table name or column name incorrect?';
			RETURN FALSE;
		END IF;

		RETURN TRUE;
	END;
	$_$;


ALTER FUNCTION public.addrasterconstraints(rastschema name, rasttable name, rastcolumn name, VARIADIC constraints text[]) OWNER TO postgres;

--
-- Name: addrasterconstraints(name, name, boolean, boolean, boolean, boolean, boolean, boolean, boolean, boolean, boolean, boolean, boolean, boolean); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION addrasterconstraints(rasttable name, rastcolumn name, srid boolean DEFAULT true, scale_x boolean DEFAULT true, scale_y boolean DEFAULT true, blocksize_x boolean DEFAULT true, blocksize_y boolean DEFAULT true, same_alignment boolean DEFAULT true, regular_blocking boolean DEFAULT false, num_bands boolean DEFAULT true, pixel_types boolean DEFAULT true, nodata_values boolean DEFAULT true, out_db boolean DEFAULT true, extent boolean DEFAULT true) RETURNS boolean
    LANGUAGE sql STRICT
    AS $_$ SELECT AddRasterConstraints('', $1, $2, $3, $4, $5, $6, $7, $8, $9, $10, $11, $12, $13, $14) $_$;


ALTER FUNCTION public.addrasterconstraints(rasttable name, rastcolumn name, srid boolean, scale_x boolean, scale_y boolean, blocksize_x boolean, blocksize_y boolean, same_alignment boolean, regular_blocking boolean, num_bands boolean, pixel_types boolean, nodata_values boolean, out_db boolean, extent boolean) OWNER TO postgres;

--
-- Name: addrasterconstraints(name, name, name, boolean, boolean, boolean, boolean, boolean, boolean, boolean, boolean, boolean, boolean, boolean, boolean); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION addrasterconstraints(rastschema name, rasttable name, rastcolumn name, srid boolean DEFAULT true, scale_x boolean DEFAULT true, scale_y boolean DEFAULT true, blocksize_x boolean DEFAULT true, blocksize_y boolean DEFAULT true, same_alignment boolean DEFAULT true, regular_blocking boolean DEFAULT false, num_bands boolean DEFAULT true, pixel_types boolean DEFAULT true, nodata_values boolean DEFAULT true, out_db boolean DEFAULT true, extent boolean DEFAULT true) RETURNS boolean
    LANGUAGE plpgsql STRICT
    AS $_$
	DECLARE
		constraints text[];
	BEGIN
		IF srid IS TRUE THEN
			constraints := constraints || 'srid'::text;
		END IF;

		IF scale_x IS TRUE THEN
			constraints := constraints || 'scale_x'::text;
		END IF;

		IF scale_y IS TRUE THEN
			constraints := constraints || 'scale_y'::text;
		END IF;

		IF blocksize_x IS TRUE THEN
			constraints := constraints || 'blocksize_x'::text;
		END IF;

		IF blocksize_y IS TRUE THEN
			constraints := constraints || 'blocksize_y'::text;
		END IF;

		IF same_alignment IS TRUE THEN
			constraints := constraints || 'same_alignment'::text;
		END IF;

		IF regular_blocking IS TRUE THEN
			constraints := constraints || 'regular_blocking'::text;
		END IF;

		IF num_bands IS TRUE THEN
			constraints := constraints || 'num_bands'::text;
		END IF;

		IF pixel_types IS TRUE THEN
			constraints := constraints || 'pixel_types'::text;
		END IF;

		IF nodata_values IS TRUE THEN
			constraints := constraints || 'nodata_values'::text;
		END IF;

		IF out_db IS TRUE THEN
			constraints := constraints || 'out_db'::text;
		END IF;

		IF extent IS TRUE THEN
			constraints := constraints || 'extent'::text;
		END IF;

		RETURN AddRasterConstraints($1, $2, $3, VARIADIC constraints);
	END;
	$_$;


ALTER FUNCTION public.addrasterconstraints(rastschema name, rasttable name, rastcolumn name, srid boolean, scale_x boolean, scale_y boolean, blocksize_x boolean, blocksize_y boolean, same_alignment boolean, regular_blocking boolean, num_bands boolean, pixel_types boolean, nodata_values boolean, out_db boolean, extent boolean) OWNER TO postgres;

--
-- Name: appomatic_mapdata_ais_insert(); Type: FUNCTION; Schema: public; Owner: scraper
--

CREATE FUNCTION appomatic_mapdata_ais_insert() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
                declare
                  loc geometry;
                begin
                  loc := st_setsrid(st_makepointm(new.longitude, new.latitude, extract(epoch from new.datetime)), (4326));

                  if exists (select 1 from appomatic_mapdata_ais as ais where ais.mmsi = new.mmsi and ais.datetime = new.datetime) then
                    -- this record already exists.  Need to turn this into an update
                    -- and return null to cancel the insert
                    update
                      appomatic_mapdata_ais as ais
                    set
                      location = loc,
                      true_heading = new.true_heading,
                      sog = new.sog,
                      cog = new.cog,
                      latitude = new.latitude,
                      longitude = new.longitude
                    where
                      ais.mmsi = new.mmsi
                      and ais.datetime = new.datetime;
                    return null;
                  else
                    new.location := loc;
                    return new;
                  end if;
                end;
              $$;


ALTER FUNCTION public.appomatic_mapdata_ais_insert() OWNER TO scraper;

--
-- Name: box(geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION box(geometry) RETURNS box
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-2.0', 'LWGEOM_to_BOX';


ALTER FUNCTION public.box(geometry) OWNER TO postgres;

--
-- Name: box(box3d); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION box(box3d) RETURNS box
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-2.0', 'BOX3D_to_BOX';


ALTER FUNCTION public.box(box3d) OWNER TO postgres;

--
-- Name: box2d(geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION box2d(geometry) RETURNS box2d
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-2.0', 'LWGEOM_to_BOX2D';


ALTER FUNCTION public.box2d(geometry) OWNER TO postgres;

--
-- Name: box2d(box3d); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION box2d(box3d) RETURNS box2d
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-2.0', 'BOX3D_to_BOX2D';


ALTER FUNCTION public.box2d(box3d) OWNER TO postgres;

--
-- Name: box3d(geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION box3d(geometry) RETURNS box3d
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-2.0', 'LWGEOM_to_BOX3D';


ALTER FUNCTION public.box3d(geometry) OWNER TO postgres;

--
-- Name: box3d(box2d); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION box3d(box2d) RETURNS box3d
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-2.0', 'BOX2D_to_BOX3D';


ALTER FUNCTION public.box3d(box2d) OWNER TO postgres;

--
-- Name: box3d(raster); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION box3d(raster) RETURNS box3d
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$select box3d(st_convexhull($1))$_$;


ALTER FUNCTION public.box3d(raster) OWNER TO postgres;

--
-- Name: box3dtobox(box3d); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION box3dtobox(box3d) RETURNS box
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$SELECT box($1)$_$;


ALTER FUNCTION public.box3dtobox(box3d) OWNER TO postgres;

--
-- Name: bytea(geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION bytea(geometry) RETURNS bytea
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-2.0', 'LWGEOM_to_bytea';


ALTER FUNCTION public.bytea(geometry) OWNER TO postgres;

--
-- Name: bytea(geography); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION bytea(geography) RETURNS bytea
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-2.0', 'LWGEOM_to_bytea';


ALTER FUNCTION public.bytea(geography) OWNER TO postgres;

--
-- Name: bytea(raster); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION bytea(raster) RETURNS bytea
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/rtpostgis-2.0', 'RASTER_to_bytea';


ALTER FUNCTION public.bytea(raster) OWNER TO postgres;

--
-- Name: checkauth(text, text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION checkauth(text, text) RETURNS integer
    LANGUAGE sql
    AS $_$ SELECT CheckAuth('', $1, $2) $_$;


ALTER FUNCTION public.checkauth(text, text) OWNER TO postgres;

--
-- Name: checkauth(text, text, text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION checkauth(text, text, text) RETURNS integer
    LANGUAGE plpgsql
    AS $_$ 
DECLARE
	schema text;
BEGIN
	IF NOT LongTransactionsEnabled() THEN
		RAISE EXCEPTION 'Long transaction support disabled, use EnableLongTransaction() to enable.';
	END IF;

	if ( $1 != '' ) THEN
		schema = $1;
	ELSE
		SELECT current_schema() into schema;
	END IF;

	-- TODO: check for an already existing trigger ?

	EXECUTE 'CREATE TRIGGER check_auth BEFORE UPDATE OR DELETE ON ' 
		|| quote_ident(schema) || '.' || quote_ident($2)
		||' FOR EACH ROW EXECUTE PROCEDURE CheckAuthTrigger('
		|| quote_literal($3) || ')';

	RETURN 0;
END;
$_$;


ALTER FUNCTION public.checkauth(text, text, text) OWNER TO postgres;

--
-- Name: checkauthtrigger(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION checkauthtrigger() RETURNS trigger
    LANGUAGE c
    AS '$libdir/postgis-2.0', 'check_authorization';


ALTER FUNCTION public.checkauthtrigger() OWNER TO postgres;

--
-- Name: disablelongtransactions(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION disablelongtransactions() RETURNS text
    LANGUAGE plpgsql
    AS $$ 
DECLARE
	rec RECORD;

BEGIN

	--
	-- Drop all triggers applied by CheckAuth()
	--
	FOR rec IN
		SELECT c.relname, t.tgname, t.tgargs FROM pg_trigger t, pg_class c, pg_proc p
		WHERE p.proname = 'checkauthtrigger' and t.tgfoid = p.oid and t.tgrelid = c.oid
	LOOP
		EXECUTE 'DROP TRIGGER ' || quote_ident(rec.tgname) ||
			' ON ' || quote_ident(rec.relname);
	END LOOP;

	--
	-- Drop the authorization_table table
	--
	FOR rec IN SELECT * FROM pg_class WHERE relname = 'authorization_table' LOOP
		DROP TABLE authorization_table;
	END LOOP;

	--
	-- Drop the authorized_tables view
	--
	FOR rec IN SELECT * FROM pg_class WHERE relname = 'authorized_tables' LOOP
		DROP VIEW authorized_tables;
	END LOOP;

	RETURN 'Long transactions support disabled';
END;
$$;


ALTER FUNCTION public.disablelongtransactions() OWNER TO postgres;

--
-- Name: dropgeometrycolumn(character varying, character varying); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION dropgeometrycolumn(table_name character varying, column_name character varying) RETURNS text
    LANGUAGE plpgsql STRICT
    AS $_$
DECLARE
	ret text;
BEGIN
	SELECT DropGeometryColumn('','',$1,$2) into ret;
	RETURN ret;
END;
$_$;


ALTER FUNCTION public.dropgeometrycolumn(table_name character varying, column_name character varying) OWNER TO postgres;

--
-- Name: dropgeometrycolumn(character varying, character varying, character varying); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION dropgeometrycolumn(schema_name character varying, table_name character varying, column_name character varying) RETURNS text
    LANGUAGE plpgsql STRICT
    AS $_$
DECLARE
	ret text;
BEGIN
	SELECT DropGeometryColumn('',$1,$2,$3) into ret;
	RETURN ret;
END;
$_$;


ALTER FUNCTION public.dropgeometrycolumn(schema_name character varying, table_name character varying, column_name character varying) OWNER TO postgres;

--
-- Name: dropgeometrycolumn(character varying, character varying, character varying, character varying); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION dropgeometrycolumn(catalog_name character varying, schema_name character varying, table_name character varying, column_name character varying) RETURNS text
    LANGUAGE plpgsql STRICT
    AS $$
DECLARE
	myrec RECORD;
	okay boolean;
	real_schema name;

BEGIN


	-- Find, check or fix schema_name
	IF ( schema_name != '' ) THEN
		okay = false;

		FOR myrec IN SELECT nspname FROM pg_namespace WHERE text(nspname) = schema_name LOOP
			okay := true;
		END LOOP;

		IF ( okay <>  true ) THEN
			RAISE NOTICE 'Invalid schema name - using current_schema()';
			SELECT current_schema() into real_schema;
		ELSE
			real_schema = schema_name;
		END IF;
	ELSE
		SELECT current_schema() into real_schema;
	END IF;

	-- Find out if the column is in the geometry_columns table
	okay = false;
	FOR myrec IN SELECT * from geometry_columns where f_table_schema = text(real_schema) and f_table_name = table_name and f_geometry_column = column_name LOOP
		okay := true;
	END LOOP;
	IF (okay <> true) THEN
		RAISE EXCEPTION 'column not found in geometry_columns table';
		RETURN false;
	END IF;

	-- Remove table column
	EXECUTE 'ALTER TABLE ' || quote_ident(real_schema) || '.' ||
		quote_ident(table_name) || ' DROP COLUMN ' ||
		quote_ident(column_name);

	RETURN real_schema || '.' || table_name || '.' || column_name ||' effectively removed.';

END;
$$;


ALTER FUNCTION public.dropgeometrycolumn(catalog_name character varying, schema_name character varying, table_name character varying, column_name character varying) OWNER TO postgres;

--
-- Name: dropgeometrytable(character varying); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION dropgeometrytable(table_name character varying) RETURNS text
    LANGUAGE sql STRICT
    AS $_$ SELECT DropGeometryTable('','',$1) $_$;


ALTER FUNCTION public.dropgeometrytable(table_name character varying) OWNER TO postgres;

--
-- Name: dropgeometrytable(character varying, character varying); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION dropgeometrytable(schema_name character varying, table_name character varying) RETURNS text
    LANGUAGE sql STRICT
    AS $_$ SELECT DropGeometryTable('',$1,$2) $_$;


ALTER FUNCTION public.dropgeometrytable(schema_name character varying, table_name character varying) OWNER TO postgres;

--
-- Name: dropgeometrytable(character varying, character varying, character varying); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION dropgeometrytable(catalog_name character varying, schema_name character varying, table_name character varying) RETURNS text
    LANGUAGE plpgsql STRICT
    AS $$
DECLARE
	real_schema name;

BEGIN

	IF ( schema_name = '' ) THEN
		SELECT current_schema() into real_schema;
	ELSE
		real_schema = schema_name;
	END IF;

	-- TODO: Should we warn if table doesn't exist probably instead just saying dropped
	-- Remove table
	EXECUTE 'DROP TABLE IF EXISTS '
		|| quote_ident(real_schema) || '.' ||
		quote_ident(table_name) || ' RESTRICT';

	RETURN
		real_schema || '.' ||
		table_name ||' dropped.';

END;
$$;


ALTER FUNCTION public.dropgeometrytable(catalog_name character varying, schema_name character varying, table_name character varying) OWNER TO postgres;

--
-- Name: dropoverviewconstraints(name, name); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION dropoverviewconstraints(ovtable name, ovcolumn name) RETURNS boolean
    LANGUAGE sql STRICT
    AS $_$ SELECT DropOverviewConstraints('', $1, $2) $_$;


ALTER FUNCTION public.dropoverviewconstraints(ovtable name, ovcolumn name) OWNER TO postgres;

--
-- Name: dropoverviewconstraints(name, name, name); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION dropoverviewconstraints(ovschema name, ovtable name, ovcolumn name) RETURNS boolean
    LANGUAGE plpgsql STRICT
    AS $_$
	DECLARE
		schema name;
		sql text;
		rtn boolean;
	BEGIN
		-- validate schema
		schema := NULL;
		IF length($1) > 0 THEN
			sql := 'SELECT nspname FROM pg_namespace '
				|| 'WHERE nspname = ' || quote_literal($1)
				|| 'LIMIT 1';
			EXECUTE sql INTO schema;

			IF schema IS NULL THEN
				RAISE EXCEPTION 'The value provided for schema is invalid';
				RETURN FALSE;
			END IF;
		END IF;

		IF schema IS NULL THEN
			sql := 'SELECT n.nspname AS schemaname '
				|| 'FROM pg_catalog.pg_class c '
				|| 'JOIN pg_catalog.pg_namespace n ON n.oid = c.relnamespace '
				|| 'WHERE c.relkind = ' || quote_literal('r')
				|| ' AND n.nspname NOT IN (' || quote_literal('pg_catalog')
				|| ', ' || quote_literal('pg_toast')
				|| ') AND pg_catalog.pg_table_is_visible(c.oid)'
				|| ' AND c.relname = ' || quote_literal($2);
			EXECUTE sql INTO schema;

			IF schema IS NULL THEN
				RAISE EXCEPTION 'The table % does not occur in the search_path', quote_literal($2);
				RETURN FALSE;
			END IF;
		END IF;

		rtn := _drop_overview_constraint(schema, $2, $3);
		IF rtn IS FALSE THEN
			RAISE EXCEPTION 'Unable to drop the overview constraint .  Is the schema name, table name or column name incorrect?';
			RETURN FALSE;
		END IF;

		RETURN TRUE;
	END;
	$_$;


ALTER FUNCTION public.dropoverviewconstraints(ovschema name, ovtable name, ovcolumn name) OWNER TO postgres;

--
-- Name: droprasterconstraints(name, name, text[]); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION droprasterconstraints(rasttable name, rastcolumn name, VARIADIC constraints text[]) RETURNS boolean
    LANGUAGE sql STRICT
    AS $_$ SELECT DropRasterConstraints('', $1, $2, VARIADIC $3) $_$;


ALTER FUNCTION public.droprasterconstraints(rasttable name, rastcolumn name, VARIADIC constraints text[]) OWNER TO postgres;

--
-- Name: droprasterconstraints(name, name, name, text[]); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION droprasterconstraints(rastschema name, rasttable name, rastcolumn name, VARIADIC constraints text[]) RETURNS boolean
    LANGUAGE plpgsql STRICT
    AS $_$
	DECLARE
		max int;
		x int;
		schema name;
		sql text;
		kw text;
		rtn boolean;
		cnt int;
	BEGIN
		cnt := 0;
		max := array_length(constraints, 1);
		IF max < 1 THEN
			RAISE NOTICE 'No constraints indicated to be dropped.  Doing nothing';
			RETURN TRUE;
		END IF;

		-- validate schema
		schema := NULL;
		IF length($1) > 0 THEN
			sql := 'SELECT nspname FROM pg_namespace '
				|| 'WHERE nspname = ' || quote_literal($1)
				|| 'LIMIT 1';
			EXECUTE sql INTO schema;

			IF schema IS NULL THEN
				RAISE EXCEPTION 'The value provided for schema is invalid';
				RETURN FALSE;
			END IF;
		END IF;

		IF schema IS NULL THEN
			sql := 'SELECT n.nspname AS schemaname '
				|| 'FROM pg_catalog.pg_class c '
				|| 'JOIN pg_catalog.pg_namespace n ON n.oid = c.relnamespace '
				|| 'WHERE c.relkind = ' || quote_literal('r')
				|| ' AND n.nspname NOT IN (' || quote_literal('pg_catalog')
				|| ', ' || quote_literal('pg_toast')
				|| ') AND pg_catalog.pg_table_is_visible(c.oid)'
				|| ' AND c.relname = ' || quote_literal($2);
			EXECUTE sql INTO schema;

			IF schema IS NULL THEN
				RAISE EXCEPTION 'The table % does not occur in the search_path', quote_literal($2);
				RETURN FALSE;
			END IF;
		END IF;

		<<kwloop>>
		FOR x in 1..max LOOP
			kw := trim(both from lower(constraints[x]));

			BEGIN
				CASE
					WHEN kw = 'srid' THEN
						RAISE NOTICE 'Dropping SRID constraint';
						rtn := _drop_raster_constraint_srid(schema, $2, $3);
					WHEN kw IN ('scale_x', 'scalex') THEN
						RAISE NOTICE 'Dropping scale-X constraint';
						rtn := _drop_raster_constraint_scale(schema, $2, $3, 'x');
					WHEN kw IN ('scale_y', 'scaley') THEN
						RAISE NOTICE 'Dropping scale-Y constraint';
						rtn := _drop_raster_constraint_scale(schema, $2, $3, 'y');
					WHEN kw = 'scale' THEN
						RAISE NOTICE 'Dropping scale-X constraint';
						rtn := _drop_raster_constraint_scale(schema, $2, $3, 'x');
						RAISE NOTICE 'Dropping scale-Y constraint';
						rtn := _drop_raster_constraint_scale(schema, $2, $3, 'y');
					WHEN kw IN ('blocksize_x', 'blocksizex', 'width') THEN
						RAISE NOTICE 'Dropping blocksize-X constraint';
						rtn := _drop_raster_constraint_blocksize(schema, $2, $3, 'width');
					WHEN kw IN ('blocksize_y', 'blocksizey', 'height') THEN
						RAISE NOTICE 'Dropping blocksize-Y constraint';
						rtn := _drop_raster_constraint_blocksize(schema, $2, $3, 'height');
					WHEN kw = 'blocksize' THEN
						RAISE NOTICE 'Dropping blocksize-X constraint';
						rtn := _drop_raster_constraint_blocksize(schema, $2, $3, 'width');
						RAISE NOTICE 'Dropping blocksize-Y constraint';
						rtn := _drop_raster_constraint_blocksize(schema, $2, $3, 'height');
					WHEN kw IN ('same_alignment', 'samealignment', 'alignment') THEN
						RAISE NOTICE 'Dropping alignment constraint';
						rtn := _drop_raster_constraint_alignment(schema, $2, $3);
					WHEN kw IN ('regular_blocking', 'regularblocking') THEN
						RAISE NOTICE 'Dropping regular blocking constraint';
						rtn := _drop_raster_constraint_regular_blocking(schema, $2, $3);
					WHEN kw IN ('num_bands', 'numbands') THEN
						RAISE NOTICE 'Dropping number of bands constraint';
						rtn := _drop_raster_constraint_num_bands(schema, $2, $3);
					WHEN kw IN ('pixel_types', 'pixeltypes') THEN
						RAISE NOTICE 'Dropping pixel type constraint';
						rtn := _drop_raster_constraint_pixel_types(schema, $2, $3);
					WHEN kw IN ('nodata_values', 'nodatavalues', 'nodata') THEN
						RAISE NOTICE 'Dropping nodata value constraint';
						rtn := _drop_raster_constraint_nodata_values(schema, $2, $3);
					WHEN kw IN ('out_db', 'outdb') THEN
						RAISE NOTICE 'Dropping out-of-database constraint';
						rtn := _drop_raster_constraint_out_db(schema, $2, $3);
					WHEN kw = 'extent' THEN
						RAISE NOTICE 'Dropping maximum extent constraint';
						rtn := _drop_raster_constraint_extent(schema, $2, $3);
					ELSE
						RAISE NOTICE 'Unknown constraint: %.  Skipping', quote_literal(constraints[x]);
						CONTINUE kwloop;
				END CASE;
			END;

			IF rtn IS FALSE THEN
				cnt := cnt + 1;
				RAISE WARNING 'Unable to drop constraint: %.  Skipping', quote_literal(constraints[x]);
			END IF;

		END LOOP kwloop;

		IF cnt = max THEN
			RAISE EXCEPTION 'None of the constraints specified could be dropped.  Is the schema name, table name or column name incorrect?';
			RETURN FALSE;
		END IF;

		RETURN TRUE;
	END;
	$_$;


ALTER FUNCTION public.droprasterconstraints(rastschema name, rasttable name, rastcolumn name, VARIADIC constraints text[]) OWNER TO postgres;

--
-- Name: droprasterconstraints(name, name, boolean, boolean, boolean, boolean, boolean, boolean, boolean, boolean, boolean, boolean, boolean, boolean); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION droprasterconstraints(rasttable name, rastcolumn name, srid boolean DEFAULT true, scale_x boolean DEFAULT true, scale_y boolean DEFAULT true, blocksize_x boolean DEFAULT true, blocksize_y boolean DEFAULT true, same_alignment boolean DEFAULT true, regular_blocking boolean DEFAULT true, num_bands boolean DEFAULT true, pixel_types boolean DEFAULT true, nodata_values boolean DEFAULT true, out_db boolean DEFAULT true, extent boolean DEFAULT true) RETURNS boolean
    LANGUAGE sql STRICT
    AS $_$ SELECT DropRasterConstraints('', $1, $2, $3, $4, $5, $6, $7, $8, $9, $10, $11, $12, $13, $14) $_$;


ALTER FUNCTION public.droprasterconstraints(rasttable name, rastcolumn name, srid boolean, scale_x boolean, scale_y boolean, blocksize_x boolean, blocksize_y boolean, same_alignment boolean, regular_blocking boolean, num_bands boolean, pixel_types boolean, nodata_values boolean, out_db boolean, extent boolean) OWNER TO postgres;

--
-- Name: droprasterconstraints(name, name, name, boolean, boolean, boolean, boolean, boolean, boolean, boolean, boolean, boolean, boolean, boolean, boolean); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION droprasterconstraints(rastschema name, rasttable name, rastcolumn name, srid boolean DEFAULT true, scale_x boolean DEFAULT true, scale_y boolean DEFAULT true, blocksize_x boolean DEFAULT true, blocksize_y boolean DEFAULT true, same_alignment boolean DEFAULT true, regular_blocking boolean DEFAULT true, num_bands boolean DEFAULT true, pixel_types boolean DEFAULT true, nodata_values boolean DEFAULT true, out_db boolean DEFAULT true, extent boolean DEFAULT true) RETURNS boolean
    LANGUAGE plpgsql STRICT
    AS $_$
	DECLARE
		constraints text[];
	BEGIN
		IF srid IS TRUE THEN
			constraints := constraints || 'srid'::text;
		END IF;

		IF scale_x IS TRUE THEN
			constraints := constraints || 'scale_x'::text;
		END IF;

		IF scale_y IS TRUE THEN
			constraints := constraints || 'scale_y'::text;
		END IF;

		IF blocksize_x IS TRUE THEN
			constraints := constraints || 'blocksize_x'::text;
		END IF;

		IF blocksize_y IS TRUE THEN
			constraints := constraints || 'blocksize_y'::text;
		END IF;

		IF same_alignment IS TRUE THEN
			constraints := constraints || 'same_alignment'::text;
		END IF;

		IF regular_blocking IS TRUE THEN
			constraints := constraints || 'regular_blocking'::text;
		END IF;

		IF num_bands IS TRUE THEN
			constraints := constraints || 'num_bands'::text;
		END IF;

		IF pixel_types IS TRUE THEN
			constraints := constraints || 'pixel_types'::text;
		END IF;

		IF nodata_values IS TRUE THEN
			constraints := constraints || 'nodata_values'::text;
		END IF;

		IF out_db IS TRUE THEN
			constraints := constraints || 'out_db'::text;
		END IF;

		IF extent IS TRUE THEN
			constraints := constraints || 'extent'::text;
		END IF;

		RETURN DropRasterConstraints($1, $2, $3, VARIADIC constraints);
	END;
	$_$;


ALTER FUNCTION public.droprasterconstraints(rastschema name, rasttable name, rastcolumn name, srid boolean, scale_x boolean, scale_y boolean, blocksize_x boolean, blocksize_y boolean, same_alignment boolean, regular_blocking boolean, num_bands boolean, pixel_types boolean, nodata_values boolean, out_db boolean, extent boolean) OWNER TO postgres;

--
-- Name: enablelongtransactions(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION enablelongtransactions() RETURNS text
    LANGUAGE plpgsql
    AS $$ 
DECLARE
	"query" text;
	exists bool;
	rec RECORD;

BEGIN

	exists = 'f';
	FOR rec IN SELECT * FROM pg_class WHERE relname = 'authorization_table'
	LOOP
		exists = 't';
	END LOOP;

	IF NOT exists
	THEN
		"query" = 'CREATE TABLE authorization_table (
			toid oid, -- table oid
			rid text, -- row id
			expires timestamp,
			authid text
		)';
		EXECUTE "query";
	END IF;

	exists = 'f';
	FOR rec IN SELECT * FROM pg_class WHERE relname = 'authorized_tables'
	LOOP
		exists = 't';
	END LOOP;

	IF NOT exists THEN
		"query" = 'CREATE VIEW authorized_tables AS ' ||
			'SELECT ' ||
			'n.nspname as schema, ' ||
			'c.relname as table, trim(' ||
			quote_literal(chr(92) || '000') ||
			' from t.tgargs) as id_column ' ||
			'FROM pg_trigger t, pg_class c, pg_proc p ' ||
			', pg_namespace n ' ||
			'WHERE p.proname = ' || quote_literal('checkauthtrigger') ||
			' AND c.relnamespace = n.oid' ||
			' AND t.tgfoid = p.oid and t.tgrelid = c.oid';
		EXECUTE "query";
	END IF;

	RETURN 'Long transactions support enabled';
END;
$$;


ALTER FUNCTION public.enablelongtransactions() OWNER TO postgres;

--
-- Name: equals(geometry, geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION equals(geom1 geometry, geom2 geometry) RETURNS boolean
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-2.0', 'ST_Equals';


ALTER FUNCTION public.equals(geom1 geometry, geom2 geometry) OWNER TO postgres;

--
-- Name: find_srid(character varying, character varying, character varying); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION find_srid(character varying, character varying, character varying) RETURNS integer
    LANGUAGE plpgsql IMMUTABLE STRICT
    AS $_$
DECLARE
	schem text;
	tabl text;
	sr int4;
BEGIN
	IF $1 IS NULL THEN
	  RAISE EXCEPTION 'find_srid() - schema is NULL!';
	END IF;
	IF $2 IS NULL THEN
	  RAISE EXCEPTION 'find_srid() - table name is NULL!';
	END IF;
	IF $3 IS NULL THEN
	  RAISE EXCEPTION 'find_srid() - column name is NULL!';
	END IF;
	schem = $1;
	tabl = $2;
-- if the table contains a . and the schema is empty
-- split the table into a schema and a table
-- otherwise drop through to default behavior
	IF ( schem = '' and tabl LIKE '%.%' ) THEN
	 schem = substr(tabl,1,strpos(tabl,'.')-1);
	 tabl = substr(tabl,length(schem)+2);
	ELSE
	 schem = schem || '%';
	END IF;

	select SRID into sr from geometry_columns where f_table_schema like schem and f_table_name = tabl and f_geometry_column = $3;
	IF NOT FOUND THEN
	   RAISE EXCEPTION 'find_srid() - couldnt find the corresponding SRID - is the geometry registered in the GEOMETRY_COLUMNS table?  Is there an uppercase/lowercase missmatch?';
	END IF;
	return sr;
END;
$_$;


ALTER FUNCTION public.find_srid(character varying, character varying, character varying) OWNER TO postgres;

--
-- Name: geography(bytea); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION geography(bytea) RETURNS geography
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-2.0', 'LWGEOM_from_bytea';


ALTER FUNCTION public.geography(bytea) OWNER TO postgres;

--
-- Name: geography(geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION geography(geometry) RETURNS geography
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-2.0', 'geography_from_geometry';


ALTER FUNCTION public.geography(geometry) OWNER TO postgres;

--
-- Name: geography(geography, integer, boolean); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION geography(geography, integer, boolean) RETURNS geography
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-2.0', 'geography_enforce_typmod';


ALTER FUNCTION public.geography(geography, integer, boolean) OWNER TO postgres;

--
-- Name: geography_cmp(geography, geography); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION geography_cmp(geography, geography) RETURNS integer
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-2.0', 'geography_cmp';


ALTER FUNCTION public.geography_cmp(geography, geography) OWNER TO postgres;

--
-- Name: geography_eq(geography, geography); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION geography_eq(geography, geography) RETURNS boolean
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-2.0', 'geography_eq';


ALTER FUNCTION public.geography_eq(geography, geography) OWNER TO postgres;

--
-- Name: geography_ge(geography, geography); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION geography_ge(geography, geography) RETURNS boolean
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-2.0', 'geography_ge';


ALTER FUNCTION public.geography_ge(geography, geography) OWNER TO postgres;

--
-- Name: geography_gist_compress(internal); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION geography_gist_compress(internal) RETURNS internal
    LANGUAGE c
    AS '$libdir/postgis-2.0', 'gserialized_gist_compress';


ALTER FUNCTION public.geography_gist_compress(internal) OWNER TO postgres;

--
-- Name: geography_gist_consistent(internal, geography, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION geography_gist_consistent(internal, geography, integer) RETURNS boolean
    LANGUAGE c
    AS '$libdir/postgis-2.0', 'gserialized_gist_consistent';


ALTER FUNCTION public.geography_gist_consistent(internal, geography, integer) OWNER TO postgres;

--
-- Name: geography_gist_decompress(internal); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION geography_gist_decompress(internal) RETURNS internal
    LANGUAGE c
    AS '$libdir/postgis-2.0', 'gserialized_gist_decompress';


ALTER FUNCTION public.geography_gist_decompress(internal) OWNER TO postgres;

--
-- Name: geography_gist_join_selectivity(internal, oid, internal, smallint); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION geography_gist_join_selectivity(internal, oid, internal, smallint) RETURNS double precision
    LANGUAGE c
    AS '$libdir/postgis-2.0', 'geography_gist_selectivity';


ALTER FUNCTION public.geography_gist_join_selectivity(internal, oid, internal, smallint) OWNER TO postgres;

--
-- Name: geography_gist_penalty(internal, internal, internal); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION geography_gist_penalty(internal, internal, internal) RETURNS internal
    LANGUAGE c
    AS '$libdir/postgis-2.0', 'gserialized_gist_penalty';


ALTER FUNCTION public.geography_gist_penalty(internal, internal, internal) OWNER TO postgres;

--
-- Name: geography_gist_picksplit(internal, internal); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION geography_gist_picksplit(internal, internal) RETURNS internal
    LANGUAGE c
    AS '$libdir/postgis-2.0', 'gserialized_gist_picksplit';


ALTER FUNCTION public.geography_gist_picksplit(internal, internal) OWNER TO postgres;

--
-- Name: geography_gist_same(box2d, box2d, internal); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION geography_gist_same(box2d, box2d, internal) RETURNS internal
    LANGUAGE c
    AS '$libdir/postgis-2.0', 'gserialized_gist_same';


ALTER FUNCTION public.geography_gist_same(box2d, box2d, internal) OWNER TO postgres;

--
-- Name: geography_gist_selectivity(internal, oid, internal, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION geography_gist_selectivity(internal, oid, internal, integer) RETURNS double precision
    LANGUAGE c
    AS '$libdir/postgis-2.0', 'geography_gist_selectivity';


ALTER FUNCTION public.geography_gist_selectivity(internal, oid, internal, integer) OWNER TO postgres;

--
-- Name: geography_gist_union(bytea, internal); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION geography_gist_union(bytea, internal) RETURNS internal
    LANGUAGE c
    AS '$libdir/postgis-2.0', 'gserialized_gist_union';


ALTER FUNCTION public.geography_gist_union(bytea, internal) OWNER TO postgres;

--
-- Name: geography_gt(geography, geography); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION geography_gt(geography, geography) RETURNS boolean
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-2.0', 'geography_gt';


ALTER FUNCTION public.geography_gt(geography, geography) OWNER TO postgres;

--
-- Name: geography_le(geography, geography); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION geography_le(geography, geography) RETURNS boolean
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-2.0', 'geography_le';


ALTER FUNCTION public.geography_le(geography, geography) OWNER TO postgres;

--
-- Name: geography_lt(geography, geography); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION geography_lt(geography, geography) RETURNS boolean
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-2.0', 'geography_lt';


ALTER FUNCTION public.geography_lt(geography, geography) OWNER TO postgres;

--
-- Name: geography_overlaps(geography, geography); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION geography_overlaps(geography, geography) RETURNS boolean
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-2.0', 'gserialized_overlaps';


ALTER FUNCTION public.geography_overlaps(geography, geography) OWNER TO postgres;

--
-- Name: geometry(box2d); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION geometry(box2d) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-2.0', 'BOX2D_to_LWGEOM';


ALTER FUNCTION public.geometry(box2d) OWNER TO postgres;

--
-- Name: geometry(box3d); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION geometry(box3d) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-2.0', 'BOX3D_to_LWGEOM';


ALTER FUNCTION public.geometry(box3d) OWNER TO postgres;

--
-- Name: geometry(text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION geometry(text) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-2.0', 'parse_WKT_lwgeom';


ALTER FUNCTION public.geometry(text) OWNER TO postgres;

--
-- Name: geometry(bytea); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION geometry(bytea) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-2.0', 'LWGEOM_from_bytea';


ALTER FUNCTION public.geometry(bytea) OWNER TO postgres;

--
-- Name: geometry(geography); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION geometry(geography) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-2.0', 'geometry_from_geography';


ALTER FUNCTION public.geometry(geography) OWNER TO postgres;

--
-- Name: geometry(geometry, integer, boolean); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION geometry(geometry, integer, boolean) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-2.0', 'geometry_enforce_typmod';


ALTER FUNCTION public.geometry(geometry, integer, boolean) OWNER TO postgres;

--
-- Name: geometry_above(geometry, geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION geometry_above(geom1 geometry, geom2 geometry) RETURNS boolean
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-2.0', 'gserialized_above_2d';


ALTER FUNCTION public.geometry_above(geom1 geometry, geom2 geometry) OWNER TO postgres;

--
-- Name: geometry_below(geometry, geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION geometry_below(geom1 geometry, geom2 geometry) RETURNS boolean
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-2.0', 'gserialized_below_2d';


ALTER FUNCTION public.geometry_below(geom1 geometry, geom2 geometry) OWNER TO postgres;

--
-- Name: geometry_cmp(geometry, geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION geometry_cmp(geom1 geometry, geom2 geometry) RETURNS integer
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-2.0', 'lwgeom_cmp';


ALTER FUNCTION public.geometry_cmp(geom1 geometry, geom2 geometry) OWNER TO postgres;

--
-- Name: geometry_contains(geometry, geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION geometry_contains(geom1 geometry, geom2 geometry) RETURNS boolean
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-2.0', 'gserialized_contains_2d';


ALTER FUNCTION public.geometry_contains(geom1 geometry, geom2 geometry) OWNER TO postgres;

--
-- Name: geometry_distance_box(geometry, geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION geometry_distance_box(geom1 geometry, geom2 geometry) RETURNS double precision
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-2.0', 'gserialized_distance_box_2d';


ALTER FUNCTION public.geometry_distance_box(geom1 geometry, geom2 geometry) OWNER TO postgres;

--
-- Name: geometry_distance_centroid(geometry, geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION geometry_distance_centroid(geom1 geometry, geom2 geometry) RETURNS double precision
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-2.0', 'gserialized_distance_centroid_2d';


ALTER FUNCTION public.geometry_distance_centroid(geom1 geometry, geom2 geometry) OWNER TO postgres;

--
-- Name: geometry_eq(geometry, geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION geometry_eq(geom1 geometry, geom2 geometry) RETURNS boolean
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-2.0', 'lwgeom_eq';


ALTER FUNCTION public.geometry_eq(geom1 geometry, geom2 geometry) OWNER TO postgres;

--
-- Name: geometry_ge(geometry, geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION geometry_ge(geom1 geometry, geom2 geometry) RETURNS boolean
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-2.0', 'lwgeom_ge';


ALTER FUNCTION public.geometry_ge(geom1 geometry, geom2 geometry) OWNER TO postgres;

--
-- Name: geometry_gist_compress_2d(internal); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION geometry_gist_compress_2d(internal) RETURNS internal
    LANGUAGE c
    AS '$libdir/postgis-2.0', 'gserialized_gist_compress_2d';


ALTER FUNCTION public.geometry_gist_compress_2d(internal) OWNER TO postgres;

--
-- Name: geometry_gist_compress_nd(internal); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION geometry_gist_compress_nd(internal) RETURNS internal
    LANGUAGE c
    AS '$libdir/postgis-2.0', 'gserialized_gist_compress';


ALTER FUNCTION public.geometry_gist_compress_nd(internal) OWNER TO postgres;

--
-- Name: geometry_gist_consistent_2d(internal, geometry, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION geometry_gist_consistent_2d(internal, geometry, integer) RETURNS boolean
    LANGUAGE c
    AS '$libdir/postgis-2.0', 'gserialized_gist_consistent_2d';


ALTER FUNCTION public.geometry_gist_consistent_2d(internal, geometry, integer) OWNER TO postgres;

--
-- Name: geometry_gist_consistent_nd(internal, geometry, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION geometry_gist_consistent_nd(internal, geometry, integer) RETURNS boolean
    LANGUAGE c
    AS '$libdir/postgis-2.0', 'gserialized_gist_consistent';


ALTER FUNCTION public.geometry_gist_consistent_nd(internal, geometry, integer) OWNER TO postgres;

--
-- Name: geometry_gist_decompress_2d(internal); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION geometry_gist_decompress_2d(internal) RETURNS internal
    LANGUAGE c
    AS '$libdir/postgis-2.0', 'gserialized_gist_decompress_2d';


ALTER FUNCTION public.geometry_gist_decompress_2d(internal) OWNER TO postgres;

--
-- Name: geometry_gist_decompress_nd(internal); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION geometry_gist_decompress_nd(internal) RETURNS internal
    LANGUAGE c
    AS '$libdir/postgis-2.0', 'gserialized_gist_decompress';


ALTER FUNCTION public.geometry_gist_decompress_nd(internal) OWNER TO postgres;

--
-- Name: geometry_gist_distance_2d(internal, geometry, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION geometry_gist_distance_2d(internal, geometry, integer) RETURNS double precision
    LANGUAGE c
    AS '$libdir/postgis-2.0', 'gserialized_gist_distance_2d';


ALTER FUNCTION public.geometry_gist_distance_2d(internal, geometry, integer) OWNER TO postgres;

--
-- Name: geometry_gist_joinsel_2d(internal, oid, internal, smallint); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION geometry_gist_joinsel_2d(internal, oid, internal, smallint) RETURNS double precision
    LANGUAGE c
    AS '$libdir/postgis-2.0', 'geometry_gist_joinsel_2d';


ALTER FUNCTION public.geometry_gist_joinsel_2d(internal, oid, internal, smallint) OWNER TO postgres;

--
-- Name: geometry_gist_penalty_2d(internal, internal, internal); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION geometry_gist_penalty_2d(internal, internal, internal) RETURNS internal
    LANGUAGE c
    AS '$libdir/postgis-2.0', 'gserialized_gist_penalty_2d';


ALTER FUNCTION public.geometry_gist_penalty_2d(internal, internal, internal) OWNER TO postgres;

--
-- Name: geometry_gist_penalty_nd(internal, internal, internal); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION geometry_gist_penalty_nd(internal, internal, internal) RETURNS internal
    LANGUAGE c
    AS '$libdir/postgis-2.0', 'gserialized_gist_penalty';


ALTER FUNCTION public.geometry_gist_penalty_nd(internal, internal, internal) OWNER TO postgres;

--
-- Name: geometry_gist_picksplit_2d(internal, internal); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION geometry_gist_picksplit_2d(internal, internal) RETURNS internal
    LANGUAGE c
    AS '$libdir/postgis-2.0', 'gserialized_gist_picksplit_2d';


ALTER FUNCTION public.geometry_gist_picksplit_2d(internal, internal) OWNER TO postgres;

--
-- Name: geometry_gist_picksplit_nd(internal, internal); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION geometry_gist_picksplit_nd(internal, internal) RETURNS internal
    LANGUAGE c
    AS '$libdir/postgis-2.0', 'gserialized_gist_picksplit';


ALTER FUNCTION public.geometry_gist_picksplit_nd(internal, internal) OWNER TO postgres;

--
-- Name: geometry_gist_same_2d(geometry, geometry, internal); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION geometry_gist_same_2d(geom1 geometry, geom2 geometry, internal) RETURNS internal
    LANGUAGE c
    AS '$libdir/postgis-2.0', 'gserialized_gist_same_2d';


ALTER FUNCTION public.geometry_gist_same_2d(geom1 geometry, geom2 geometry, internal) OWNER TO postgres;

--
-- Name: geometry_gist_same_nd(geometry, geometry, internal); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION geometry_gist_same_nd(geometry, geometry, internal) RETURNS internal
    LANGUAGE c
    AS '$libdir/postgis-2.0', 'gserialized_gist_same';


ALTER FUNCTION public.geometry_gist_same_nd(geometry, geometry, internal) OWNER TO postgres;

--
-- Name: geometry_gist_sel_2d(internal, oid, internal, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION geometry_gist_sel_2d(internal, oid, internal, integer) RETURNS double precision
    LANGUAGE c
    AS '$libdir/postgis-2.0', 'geometry_gist_sel_2d';


ALTER FUNCTION public.geometry_gist_sel_2d(internal, oid, internal, integer) OWNER TO postgres;

--
-- Name: geometry_gist_union_2d(bytea, internal); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION geometry_gist_union_2d(bytea, internal) RETURNS internal
    LANGUAGE c
    AS '$libdir/postgis-2.0', 'gserialized_gist_union_2d';


ALTER FUNCTION public.geometry_gist_union_2d(bytea, internal) OWNER TO postgres;

--
-- Name: geometry_gist_union_nd(bytea, internal); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION geometry_gist_union_nd(bytea, internal) RETURNS internal
    LANGUAGE c
    AS '$libdir/postgis-2.0', 'gserialized_gist_union';


ALTER FUNCTION public.geometry_gist_union_nd(bytea, internal) OWNER TO postgres;

--
-- Name: geometry_gt(geometry, geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION geometry_gt(geom1 geometry, geom2 geometry) RETURNS boolean
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-2.0', 'lwgeom_gt';


ALTER FUNCTION public.geometry_gt(geom1 geometry, geom2 geometry) OWNER TO postgres;

--
-- Name: geometry_le(geometry, geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION geometry_le(geom1 geometry, geom2 geometry) RETURNS boolean
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-2.0', 'lwgeom_le';


ALTER FUNCTION public.geometry_le(geom1 geometry, geom2 geometry) OWNER TO postgres;

--
-- Name: geometry_left(geometry, geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION geometry_left(geom1 geometry, geom2 geometry) RETURNS boolean
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-2.0', 'gserialized_left_2d';


ALTER FUNCTION public.geometry_left(geom1 geometry, geom2 geometry) OWNER TO postgres;

--
-- Name: geometry_lt(geometry, geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION geometry_lt(geom1 geometry, geom2 geometry) RETURNS boolean
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-2.0', 'lwgeom_lt';


ALTER FUNCTION public.geometry_lt(geom1 geometry, geom2 geometry) OWNER TO postgres;

--
-- Name: geometry_overabove(geometry, geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION geometry_overabove(geom1 geometry, geom2 geometry) RETURNS boolean
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-2.0', 'gserialized_overabove_2d';


ALTER FUNCTION public.geometry_overabove(geom1 geometry, geom2 geometry) OWNER TO postgres;

--
-- Name: geometry_overbelow(geometry, geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION geometry_overbelow(geom1 geometry, geom2 geometry) RETURNS boolean
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-2.0', 'gserialized_overbelow_2d';


ALTER FUNCTION public.geometry_overbelow(geom1 geometry, geom2 geometry) OWNER TO postgres;

--
-- Name: geometry_overlaps(geometry, geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION geometry_overlaps(geom1 geometry, geom2 geometry) RETURNS boolean
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-2.0', 'gserialized_overlaps_2d';


ALTER FUNCTION public.geometry_overlaps(geom1 geometry, geom2 geometry) OWNER TO postgres;

--
-- Name: geometry_overlaps_nd(geometry, geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION geometry_overlaps_nd(geometry, geometry) RETURNS boolean
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-2.0', 'gserialized_overlaps';


ALTER FUNCTION public.geometry_overlaps_nd(geometry, geometry) OWNER TO postgres;

--
-- Name: geometry_overleft(geometry, geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION geometry_overleft(geom1 geometry, geom2 geometry) RETURNS boolean
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-2.0', 'gserialized_overleft_2d';


ALTER FUNCTION public.geometry_overleft(geom1 geometry, geom2 geometry) OWNER TO postgres;

--
-- Name: geometry_overright(geometry, geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION geometry_overright(geom1 geometry, geom2 geometry) RETURNS boolean
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-2.0', 'gserialized_overright_2d';


ALTER FUNCTION public.geometry_overright(geom1 geometry, geom2 geometry) OWNER TO postgres;

--
-- Name: geometry_raster_contain(geometry, raster); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION geometry_raster_contain(geometry, raster) RETURNS boolean
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$select $1 ~ $2::geometry$_$;


ALTER FUNCTION public.geometry_raster_contain(geometry, raster) OWNER TO postgres;

--
-- Name: geometry_raster_overlap(geometry, raster); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION geometry_raster_overlap(geometry, raster) RETURNS boolean
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$select $1 && $2::geometry$_$;


ALTER FUNCTION public.geometry_raster_overlap(geometry, raster) OWNER TO postgres;

--
-- Name: geometry_right(geometry, geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION geometry_right(geom1 geometry, geom2 geometry) RETURNS boolean
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-2.0', 'gserialized_right_2d';


ALTER FUNCTION public.geometry_right(geom1 geometry, geom2 geometry) OWNER TO postgres;

--
-- Name: geometry_same(geometry, geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION geometry_same(geom1 geometry, geom2 geometry) RETURNS boolean
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-2.0', 'gserialized_same_2d';


ALTER FUNCTION public.geometry_same(geom1 geometry, geom2 geometry) OWNER TO postgres;

--
-- Name: geometry_within(geometry, geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION geometry_within(geom1 geometry, geom2 geometry) RETURNS boolean
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-2.0', 'gserialized_within_2d';


ALTER FUNCTION public.geometry_within(geom1 geometry, geom2 geometry) OWNER TO postgres;

--
-- Name: geometrytype(geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION geometrytype(geometry) RETURNS text
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-2.0', 'LWGEOM_getTYPE';


ALTER FUNCTION public.geometrytype(geometry) OWNER TO postgres;

--
-- Name: geometrytype(geography); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION geometrytype(geography) RETURNS text
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-2.0', 'LWGEOM_getTYPE';


ALTER FUNCTION public.geometrytype(geography) OWNER TO postgres;

--
-- Name: geomfromewkb(bytea); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION geomfromewkb(bytea) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-2.0', 'LWGEOMFromWKB';


ALTER FUNCTION public.geomfromewkb(bytea) OWNER TO postgres;

--
-- Name: geomfromewkt(text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION geomfromewkt(text) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-2.0', 'parse_WKT_lwgeom';


ALTER FUNCTION public.geomfromewkt(text) OWNER TO postgres;

--
-- Name: get_proj4_from_srid(integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION get_proj4_from_srid(integer) RETURNS text
    LANGUAGE plpgsql IMMUTABLE STRICT
    AS $_$
BEGIN
	RETURN proj4text::text FROM spatial_ref_sys WHERE srid= $1;
END;
$_$;


ALTER FUNCTION public.get_proj4_from_srid(integer) OWNER TO postgres;

--
-- Name: gettransactionid(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION gettransactionid() RETURNS xid
    LANGUAGE c
    AS '$libdir/postgis-2.0', 'getTransactionID';


ALTER FUNCTION public.gettransactionid() OWNER TO postgres;

--
-- Name: lockrow(text, text, text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION lockrow(text, text, text) RETURNS integer
    LANGUAGE sql STRICT
    AS $_$ SELECT LockRow(current_schema(), $1, $2, $3, now()::timestamp+'1:00'); $_$;


ALTER FUNCTION public.lockrow(text, text, text) OWNER TO postgres;

--
-- Name: lockrow(text, text, text, text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION lockrow(text, text, text, text) RETURNS integer
    LANGUAGE sql STRICT
    AS $_$ SELECT LockRow($1, $2, $3, $4, now()::timestamp+'1:00'); $_$;


ALTER FUNCTION public.lockrow(text, text, text, text) OWNER TO postgres;

--
-- Name: lockrow(text, text, text, timestamp without time zone); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION lockrow(text, text, text, timestamp without time zone) RETURNS integer
    LANGUAGE sql STRICT
    AS $_$ SELECT LockRow(current_schema(), $1, $2, $3, $4); $_$;


ALTER FUNCTION public.lockrow(text, text, text, timestamp without time zone) OWNER TO postgres;

--
-- Name: lockrow(text, text, text, text, timestamp without time zone); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION lockrow(text, text, text, text, timestamp without time zone) RETURNS integer
    LANGUAGE plpgsql STRICT
    AS $_$ 
DECLARE
	myschema alias for $1;
	mytable alias for $2;
	myrid   alias for $3;
	authid alias for $4;
	expires alias for $5;
	ret int;
	mytoid oid;
	myrec RECORD;
	
BEGIN

	IF NOT LongTransactionsEnabled() THEN
		RAISE EXCEPTION 'Long transaction support disabled, use EnableLongTransaction() to enable.';
	END IF;

	EXECUTE 'DELETE FROM authorization_table WHERE expires < now()'; 

	SELECT c.oid INTO mytoid FROM pg_class c, pg_namespace n
		WHERE c.relname = mytable
		AND c.relnamespace = n.oid
		AND n.nspname = myschema;

	-- RAISE NOTICE 'toid: %', mytoid;

	FOR myrec IN SELECT * FROM authorization_table WHERE 
		toid = mytoid AND rid = myrid
	LOOP
		IF myrec.authid != authid THEN
			RETURN 0;
		ELSE
			RETURN 1;
		END IF;
	END LOOP;

	EXECUTE 'INSERT INTO authorization_table VALUES ('||
		quote_literal(mytoid::text)||','||quote_literal(myrid)||
		','||quote_literal(expires::text)||
		','||quote_literal(authid) ||')';

	GET DIAGNOSTICS ret = ROW_COUNT;

	RETURN ret;
END;
$_$;


ALTER FUNCTION public.lockrow(text, text, text, text, timestamp without time zone) OWNER TO postgres;

--
-- Name: longtransactionsenabled(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION longtransactionsenabled() RETURNS boolean
    LANGUAGE plpgsql
    AS $$ 
DECLARE
	rec RECORD;
BEGIN
	FOR rec IN SELECT oid FROM pg_class WHERE relname = 'authorized_tables'
	LOOP
		return 't';
	END LOOP;
	return 'f';
END;
$$;


ALTER FUNCTION public.longtransactionsenabled() OWNER TO postgres;

--
-- Name: pgis_geometry_accum_finalfn(pgis_abs); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION pgis_geometry_accum_finalfn(pgis_abs) RETURNS geometry[]
    LANGUAGE c
    AS '$libdir/postgis-2.0', 'pgis_geometry_accum_finalfn';


ALTER FUNCTION public.pgis_geometry_accum_finalfn(pgis_abs) OWNER TO postgres;

--
-- Name: pgis_geometry_accum_transfn(pgis_abs, geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION pgis_geometry_accum_transfn(pgis_abs, geometry) RETURNS pgis_abs
    LANGUAGE c
    AS '$libdir/postgis-2.0', 'pgis_geometry_accum_transfn';


ALTER FUNCTION public.pgis_geometry_accum_transfn(pgis_abs, geometry) OWNER TO postgres;

--
-- Name: pgis_geometry_collect_finalfn(pgis_abs); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION pgis_geometry_collect_finalfn(pgis_abs) RETURNS geometry
    LANGUAGE c
    AS '$libdir/postgis-2.0', 'pgis_geometry_collect_finalfn';


ALTER FUNCTION public.pgis_geometry_collect_finalfn(pgis_abs) OWNER TO postgres;

--
-- Name: pgis_geometry_makeline_finalfn(pgis_abs); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION pgis_geometry_makeline_finalfn(pgis_abs) RETURNS geometry
    LANGUAGE c
    AS '$libdir/postgis-2.0', 'pgis_geometry_makeline_finalfn';


ALTER FUNCTION public.pgis_geometry_makeline_finalfn(pgis_abs) OWNER TO postgres;

--
-- Name: pgis_geometry_polygonize_finalfn(pgis_abs); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION pgis_geometry_polygonize_finalfn(pgis_abs) RETURNS geometry
    LANGUAGE c
    AS '$libdir/postgis-2.0', 'pgis_geometry_polygonize_finalfn';


ALTER FUNCTION public.pgis_geometry_polygonize_finalfn(pgis_abs) OWNER TO postgres;

--
-- Name: pgis_geometry_union_finalfn(pgis_abs); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION pgis_geometry_union_finalfn(pgis_abs) RETURNS geometry
    LANGUAGE c
    AS '$libdir/postgis-2.0', 'pgis_geometry_union_finalfn';


ALTER FUNCTION public.pgis_geometry_union_finalfn(pgis_abs) OWNER TO postgres;

--
-- Name: populate_geometry_columns(boolean); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION populate_geometry_columns(use_typmod boolean DEFAULT true) RETURNS text
    LANGUAGE plpgsql
    AS $$
DECLARE
	inserted    integer;
	oldcount    integer;
	probed      integer;
	stale       integer;
	gcs         RECORD;
	gc          RECORD;
	gsrid       integer;
	gndims      integer;
	gtype       text;
	query       text;
	gc_is_valid boolean;

BEGIN
	SELECT count(*) INTO oldcount FROM geometry_columns;
	inserted := 0;

	-- Count the number of geometry columns in all tables and views
	SELECT count(DISTINCT c.oid) INTO probed
	FROM pg_class c,
		 pg_attribute a,
		 pg_type t,
		 pg_namespace n
	WHERE (c.relkind = 'r' OR c.relkind = 'v')
		AND t.typname = 'geometry'
		AND a.attisdropped = false
		AND a.atttypid = t.oid
		AND a.attrelid = c.oid
		AND c.relnamespace = n.oid
		AND n.nspname NOT ILIKE 'pg_temp%' AND c.relname != 'raster_columns' ;

	-- Iterate through all non-dropped geometry columns
	RAISE DEBUG 'Processing Tables.....';

	FOR gcs IN
	SELECT DISTINCT ON (c.oid) c.oid, n.nspname, c.relname
		FROM pg_class c,
			 pg_attribute a,
			 pg_type t,
			 pg_namespace n
		WHERE c.relkind = 'r'
		AND t.typname = 'geometry'
		AND a.attisdropped = false
		AND a.atttypid = t.oid
		AND a.attrelid = c.oid
		AND c.relnamespace = n.oid
		AND n.nspname NOT ILIKE 'pg_temp%' AND c.relname != 'raster_columns' 
	LOOP

		inserted := inserted + populate_geometry_columns(gcs.oid, use_typmod);
	END LOOP;

	IF oldcount > inserted THEN
	    stale = oldcount-inserted;
	ELSE
	    stale = 0;
	END IF;

	RETURN 'probed:' ||probed|| ' inserted:'||inserted;
END

$$;


ALTER FUNCTION public.populate_geometry_columns(use_typmod boolean) OWNER TO postgres;

--
-- Name: populate_geometry_columns(oid, boolean); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION populate_geometry_columns(tbl_oid oid, use_typmod boolean DEFAULT true) RETURNS integer
    LANGUAGE plpgsql
    AS $$
DECLARE
	gcs         RECORD;
	gc          RECORD;
	gc_old      RECORD;
	gsrid       integer;
	gndims      integer;
	gtype       text;
	query       text;
	gc_is_valid boolean;
	inserted    integer;
	constraint_successful boolean := false;

BEGIN
	inserted := 0;

	-- Iterate through all geometry columns in this table
	FOR gcs IN
	SELECT n.nspname, c.relname, a.attname
		FROM pg_class c,
			 pg_attribute a,
			 pg_type t,
			 pg_namespace n
		WHERE c.relkind = 'r'
		AND t.typname = 'geometry'
		AND a.attisdropped = false
		AND a.atttypid = t.oid
		AND a.attrelid = c.oid
		AND c.relnamespace = n.oid
		AND n.nspname NOT ILIKE 'pg_temp%'
		AND c.oid = tbl_oid
	LOOP

        RAISE DEBUG 'Processing table %.%.%', gcs.nspname, gcs.relname, gcs.attname;
    
        gc_is_valid := true;
        -- Find the srid, coord_dimension, and type of current geometry
        -- in geometry_columns -- which is now a view
        
        SELECT type, srid, coord_dimension INTO gc_old 
            FROM geometry_columns 
            WHERE f_table_schema = gcs.nspname AND f_table_name = gcs.relname AND f_geometry_column = gcs.attname; 
            
        IF upper(gc_old.type) = 'GEOMETRY' THEN
        -- This is an unconstrained geometry we need to do something
        -- We need to figure out what to set the type by inspecting the data
            EXECUTE 'SELECT st_srid(' || quote_ident(gcs.attname) || ') As srid, GeometryType(' || quote_ident(gcs.attname) || ') As type, ST_NDims(' || quote_ident(gcs.attname) || ') As dims ' ||
                     ' FROM ONLY ' || quote_ident(gcs.nspname) || '.' || quote_ident(gcs.relname) || 
                     ' WHERE ' || quote_ident(gcs.attname) || ' IS NOT NULL LIMIT 1;'
                INTO gc;
            IF gc IS NULL THEN -- there is no data so we can not determine geometry type
            	RAISE WARNING 'No data in table %.%, so no information to determine geometry type and srid', gcs.nspname, gcs.relname;
            	RETURN 0;
            END IF;
            gsrid := gc.srid; gtype := gc.type; gndims := gc.dims;
            	
            IF use_typmod THEN
                BEGIN
                    EXECUTE 'ALTER TABLE ' || quote_ident(gcs.nspname) || '.' || quote_ident(gcs.relname) || ' ALTER COLUMN ' || quote_ident(gcs.attname) || 
                        ' TYPE geometry(' || postgis_type_name(gtype, gndims, true) || ', ' || gsrid::text  || ') ';
                    inserted := inserted + 1;
                EXCEPTION
                        WHEN invalid_parameter_value THEN
                        RAISE WARNING 'Could not convert ''%'' in ''%.%'' to use typmod with srid %, type: % ', quote_ident(gcs.attname), quote_ident(gcs.nspname), quote_ident(gcs.relname), gsrid, postgis_type_name(gtype, gndims, true);
                            gc_is_valid := false;
                END;
                
            ELSE
                -- Try to apply srid check to column
            	constraint_successful = false;
                IF (gsrid > 0 AND postgis_constraint_srid(gcs.nspname, gcs.relname,gcs.attname) IS NULL ) THEN
                    BEGIN
                        EXECUTE 'ALTER TABLE ONLY ' || quote_ident(gcs.nspname) || '.' || quote_ident(gcs.relname) || 
                                 ' ADD CONSTRAINT ' || quote_ident('enforce_srid_' || gcs.attname) || 
                                 ' CHECK (st_srid(' || quote_ident(gcs.attname) || ') = ' || gsrid || ')';
                        constraint_successful := true;
                    EXCEPTION
                        WHEN check_violation THEN
                            RAISE WARNING 'Not inserting ''%'' in ''%.%'' into geometry_columns: could not apply constraint CHECK (st_srid(%) = %)', quote_ident(gcs.attname), quote_ident(gcs.nspname), quote_ident(gcs.relname), quote_ident(gcs.attname), gsrid;
                            gc_is_valid := false;
                    END;
                END IF;
                
                -- Try to apply ndims check to column
                IF (gndims IS NOT NULL AND postgis_constraint_dims(gcs.nspname, gcs.relname,gcs.attname) IS NULL ) THEN
                    BEGIN
                        EXECUTE 'ALTER TABLE ONLY ' || quote_ident(gcs.nspname) || '.' || quote_ident(gcs.relname) || '
                                 ADD CONSTRAINT ' || quote_ident('enforce_dims_' || gcs.attname) || '
                                 CHECK (st_ndims(' || quote_ident(gcs.attname) || ') = '||gndims||')';
                        constraint_successful := true;
                    EXCEPTION
                        WHEN check_violation THEN
                            RAISE WARNING 'Not inserting ''%'' in ''%.%'' into geometry_columns: could not apply constraint CHECK (st_ndims(%) = %)', quote_ident(gcs.attname), quote_ident(gcs.nspname), quote_ident(gcs.relname), quote_ident(gcs.attname), gndims;
                            gc_is_valid := false;
                    END;
                END IF;
    
                -- Try to apply geometrytype check to column
                IF (gtype IS NOT NULL AND postgis_constraint_type(gcs.nspname, gcs.relname,gcs.attname) IS NULL ) THEN
                    BEGIN
                        EXECUTE 'ALTER TABLE ONLY ' || quote_ident(gcs.nspname) || '.' || quote_ident(gcs.relname) || '
                        ADD CONSTRAINT ' || quote_ident('enforce_geotype_' || gcs.attname) || '
                        CHECK ((geometrytype(' || quote_ident(gcs.attname) || ') = ' || quote_literal(gtype) || ') OR (' || quote_ident(gcs.attname) || ' IS NULL))';
                        constraint_successful := true;
                    EXCEPTION
                        WHEN check_violation THEN
                            -- No geometry check can be applied. This column contains a number of geometry types.
                            RAISE WARNING 'Could not add geometry type check (%) to table column: %.%.%', gtype, quote_ident(gcs.nspname),quote_ident(gcs.relname),quote_ident(gcs.attname);
                    END;
                END IF;
                 --only count if we were successful in applying at least one constraint
                IF constraint_successful THEN
                	inserted := inserted + 1;
                END IF;
            END IF;	        
	    END IF;

	END LOOP;

	RETURN inserted;
END

$$;


ALTER FUNCTION public.populate_geometry_columns(tbl_oid oid, use_typmod boolean) OWNER TO postgres;

--
-- Name: postgis_addbbox(geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION postgis_addbbox(geometry) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-2.0', 'LWGEOM_addBBOX';


ALTER FUNCTION public.postgis_addbbox(geometry) OWNER TO postgres;

--
-- Name: postgis_cache_bbox(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION postgis_cache_bbox() RETURNS trigger
    LANGUAGE c
    AS '$libdir/postgis-2.0', 'cache_bbox';


ALTER FUNCTION public.postgis_cache_bbox() OWNER TO postgres;

--
-- Name: postgis_constraint_dims(text, text, text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION postgis_constraint_dims(geomschema text, geomtable text, geomcolumn text) RETURNS integer
    LANGUAGE sql STABLE STRICT
    AS $_$
SELECT  replace(split_part(s.consrc, ' = ', 2), ')', '')::integer
		 FROM pg_class c, pg_namespace n, pg_attribute a, pg_constraint s
		 WHERE n.nspname = $1
		 AND c.relname = $2
		 AND a.attname = $3
		 AND a.attrelid = c.oid
		 AND s.connamespace = n.oid
		 AND s.conrelid = c.oid
		 AND a.attnum = ANY (s.conkey)
		 AND s.consrc LIKE '%ndims(% = %';
$_$;


ALTER FUNCTION public.postgis_constraint_dims(geomschema text, geomtable text, geomcolumn text) OWNER TO postgres;

--
-- Name: postgis_constraint_srid(text, text, text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION postgis_constraint_srid(geomschema text, geomtable text, geomcolumn text) RETURNS integer
    LANGUAGE sql STABLE STRICT
    AS $_$
SELECT replace(replace(split_part(s.consrc, ' = ', 2), ')', ''), '(', '')::integer
		 FROM pg_class c, pg_namespace n, pg_attribute a, pg_constraint s
		 WHERE n.nspname = $1
		 AND c.relname = $2
		 AND a.attname = $3
		 AND a.attrelid = c.oid
		 AND s.connamespace = n.oid
		 AND s.conrelid = c.oid
		 AND a.attnum = ANY (s.conkey)
		 AND s.consrc LIKE '%srid(% = %';
$_$;


ALTER FUNCTION public.postgis_constraint_srid(geomschema text, geomtable text, geomcolumn text) OWNER TO postgres;

--
-- Name: postgis_constraint_type(text, text, text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION postgis_constraint_type(geomschema text, geomtable text, geomcolumn text) RETURNS character varying
    LANGUAGE sql STABLE STRICT
    AS $_$
SELECT  replace(split_part(s.consrc, '''', 2), ')', '')::varchar		
		 FROM pg_class c, pg_namespace n, pg_attribute a, pg_constraint s
		 WHERE n.nspname = $1
		 AND c.relname = $2
		 AND a.attname = $3
		 AND a.attrelid = c.oid
		 AND s.connamespace = n.oid
		 AND s.conrelid = c.oid
		 AND a.attnum = ANY (s.conkey)
		 AND s.consrc LIKE '%geometrytype(% = %';
$_$;


ALTER FUNCTION public.postgis_constraint_type(geomschema text, geomtable text, geomcolumn text) OWNER TO postgres;

--
-- Name: postgis_dropbbox(geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION postgis_dropbbox(geometry) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-2.0', 'LWGEOM_dropBBOX';


ALTER FUNCTION public.postgis_dropbbox(geometry) OWNER TO postgres;

--
-- Name: postgis_full_version(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION postgis_full_version() RETURNS text
    LANGUAGE plpgsql IMMUTABLE
    AS $$
DECLARE
	libver text;
	svnver text;
	projver text;
	geosver text;
	gdalver text;
	libxmlver text;
	dbproc text;
	relproc text;
	fullver text;
	rast_lib_ver text;
	rast_scr_ver text;
	topo_scr_ver text;
	json_lib_ver text;
BEGIN
	SELECT postgis_lib_version() INTO libver;
	SELECT postgis_proj_version() INTO projver;
	SELECT postgis_geos_version() INTO geosver;
	SELECT postgis_libjson_version() INTO json_lib_ver;
	BEGIN
		SELECT postgis_gdal_version() INTO gdalver;
	EXCEPTION
		WHEN undefined_function THEN
			gdalver := NULL;
			RAISE NOTICE 'Function postgis_gdal_version() not found.  Is raster support enabled and rtpostgis.sql installed?';
	END;
	SELECT postgis_libxml_version() INTO libxmlver;
	SELECT postgis_scripts_installed() INTO dbproc;
	SELECT postgis_scripts_released() INTO relproc;
	select postgis_svn_version() INTO svnver;
	BEGIN
		SELECT postgis_topology_scripts_installed() INTO topo_scr_ver;
	EXCEPTION
		WHEN undefined_function THEN
			topo_scr_ver := NULL;
			RAISE NOTICE 'Function postgis_topology_scripts_installed() not found. Is topology support enabled and topology.sql installed?';
	END;

	BEGIN
		SELECT postgis_raster_scripts_installed() INTO rast_scr_ver;
	EXCEPTION
		WHEN undefined_function THEN
			rast_scr_ver := NULL;
			RAISE NOTICE 'Function postgis_raster_scripts_installed() not found. Is raster support enabled and topology.sql installed?';
	END;

	BEGIN
		SELECT postgis_raster_lib_version() INTO rast_lib_ver;
	EXCEPTION
		WHEN undefined_function THEN
			rast_lib_ver := NULL;
			RAISE NOTICE 'Function postgis_raster_lib_version() not found. Is raster support enabled and topology.sql installed?';
	END;

	fullver = 'POSTGIS="' || libver;

	IF  svnver IS NOT NULL THEN
		fullver = fullver || ' r' || svnver;
	END IF;

	fullver = fullver || '"';

	IF  geosver IS NOT NULL THEN
		fullver = fullver || ' GEOS="' || geosver || '"';
	END IF;

	IF  projver IS NOT NULL THEN
		fullver = fullver || ' PROJ="' || projver || '"';
	END IF;

	IF  gdalver IS NOT NULL THEN
		fullver = fullver || ' GDAL="' || gdalver || '"';
	END IF;

	IF  libxmlver IS NOT NULL THEN
		fullver = fullver || ' LIBXML="' || libxmlver || '"';
	END IF;

	IF json_lib_ver IS NOT NULL THEN
		fullver = fullver || ' LIBJSON="' || json_lib_ver || '"';
	END IF;

	-- fullver = fullver || ' DBPROC="' || dbproc || '"';
	-- fullver = fullver || ' RELPROC="' || relproc || '"';

	IF dbproc != relproc THEN
		fullver = fullver || ' (core procs from "' || dbproc || '" need upgrade)';
	END IF;

	IF topo_scr_ver IS NOT NULL THEN
		fullver = fullver || ' TOPOLOGY';
		IF topo_scr_ver != relproc THEN
			fullver = fullver || ' (topology procs from "' || topo_scr_ver || '" need upgrade)';
		END IF;
	END IF;

	IF rast_lib_ver IS NOT NULL THEN
		fullver = fullver || ' RASTER';
		IF rast_lib_ver != relproc THEN
			fullver = fullver || ' (raster lib from "' || rast_lib_ver || '" need upgrade)';
		END IF;
	END IF;

	IF rast_scr_ver IS NOT NULL AND rast_scr_ver != relproc THEN
		fullver = fullver || ' (raster procs from "' || rast_scr_ver || '" need upgrade)';
	END IF;

	RETURN fullver;
END
$$;


ALTER FUNCTION public.postgis_full_version() OWNER TO postgres;

--
-- Name: postgis_gdal_version(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION postgis_gdal_version() RETURNS text
    LANGUAGE c IMMUTABLE
    AS '$libdir/rtpostgis-2.0', 'RASTER_gdal_version';


ALTER FUNCTION public.postgis_gdal_version() OWNER TO postgres;

--
-- Name: postgis_geos_version(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION postgis_geos_version() RETURNS text
    LANGUAGE c IMMUTABLE
    AS '$libdir/postgis-2.0', 'postgis_geos_version';


ALTER FUNCTION public.postgis_geos_version() OWNER TO postgres;

--
-- Name: postgis_getbbox(geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION postgis_getbbox(geometry) RETURNS box2d
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-2.0', 'LWGEOM_to_BOX2D';


ALTER FUNCTION public.postgis_getbbox(geometry) OWNER TO postgres;

--
-- Name: postgis_hasbbox(geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION postgis_hasbbox(geometry) RETURNS boolean
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-2.0', 'LWGEOM_hasBBOX';


ALTER FUNCTION public.postgis_hasbbox(geometry) OWNER TO postgres;

--
-- Name: postgis_lib_build_date(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION postgis_lib_build_date() RETURNS text
    LANGUAGE c IMMUTABLE
    AS '$libdir/postgis-2.0', 'postgis_lib_build_date';


ALTER FUNCTION public.postgis_lib_build_date() OWNER TO postgres;

--
-- Name: postgis_lib_version(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION postgis_lib_version() RETURNS text
    LANGUAGE c IMMUTABLE
    AS '$libdir/postgis-2.0', 'postgis_lib_version';


ALTER FUNCTION public.postgis_lib_version() OWNER TO postgres;

--
-- Name: postgis_libjson_version(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION postgis_libjson_version() RETURNS text
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-2.0', 'postgis_libjson_version';


ALTER FUNCTION public.postgis_libjson_version() OWNER TO postgres;

--
-- Name: postgis_libxml_version(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION postgis_libxml_version() RETURNS text
    LANGUAGE c IMMUTABLE
    AS '$libdir/postgis-2.0', 'postgis_libxml_version';


ALTER FUNCTION public.postgis_libxml_version() OWNER TO postgres;

--
-- Name: postgis_noop(geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION postgis_noop(geometry) RETURNS geometry
    LANGUAGE c STRICT
    AS '$libdir/postgis-2.0', 'LWGEOM_noop';


ALTER FUNCTION public.postgis_noop(geometry) OWNER TO postgres;

--
-- Name: postgis_proj_version(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION postgis_proj_version() RETURNS text
    LANGUAGE c IMMUTABLE
    AS '$libdir/postgis-2.0', 'postgis_proj_version';


ALTER FUNCTION public.postgis_proj_version() OWNER TO postgres;

--
-- Name: postgis_raster_lib_build_date(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION postgis_raster_lib_build_date() RETURNS text
    LANGUAGE c IMMUTABLE
    AS '$libdir/rtpostgis-2.0', 'RASTER_lib_build_date';


ALTER FUNCTION public.postgis_raster_lib_build_date() OWNER TO postgres;

--
-- Name: postgis_raster_lib_version(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION postgis_raster_lib_version() RETURNS text
    LANGUAGE c IMMUTABLE
    AS '$libdir/rtpostgis-2.0', 'RASTER_lib_version';


ALTER FUNCTION public.postgis_raster_lib_version() OWNER TO postgres;

--
-- Name: postgis_raster_scripts_installed(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION postgis_raster_scripts_installed() RETURNS text
    LANGUAGE sql IMMUTABLE
    AS $$ SELECT '2.0.0'::text || ' r' || 9605::text AS version $$;


ALTER FUNCTION public.postgis_raster_scripts_installed() OWNER TO postgres;

--
-- Name: postgis_scripts_build_date(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION postgis_scripts_build_date() RETURNS text
    LANGUAGE sql IMMUTABLE
    AS $$SELECT '2012-06-02 03:54:23'::text AS version$$;


ALTER FUNCTION public.postgis_scripts_build_date() OWNER TO postgres;

--
-- Name: postgis_scripts_installed(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION postgis_scripts_installed() RETURNS text
    LANGUAGE sql IMMUTABLE
    AS $$ SELECT '2.0.0'::text || ' r' || 9605::text AS version $$;


ALTER FUNCTION public.postgis_scripts_installed() OWNER TO postgres;

--
-- Name: postgis_scripts_released(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION postgis_scripts_released() RETURNS text
    LANGUAGE c IMMUTABLE
    AS '$libdir/postgis-2.0', 'postgis_scripts_released';


ALTER FUNCTION public.postgis_scripts_released() OWNER TO postgres;

--
-- Name: postgis_svn_version(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION postgis_svn_version() RETURNS text
    LANGUAGE c IMMUTABLE
    AS '$libdir/postgis-2.0', 'postgis_svn_version';


ALTER FUNCTION public.postgis_svn_version() OWNER TO postgres;

--
-- Name: postgis_transform_geometry(geometry, text, text, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION postgis_transform_geometry(geometry, text, text, integer) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-2.0', 'transform_geom';


ALTER FUNCTION public.postgis_transform_geometry(geometry, text, text, integer) OWNER TO postgres;

--
-- Name: postgis_type_name(character varying, integer, boolean); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION postgis_type_name(geomname character varying, coord_dimension integer, use_new_name boolean DEFAULT true) RETURNS character varying
    LANGUAGE sql IMMUTABLE STRICT COST 200
    AS $_$
 SELECT CASE WHEN $3 THEN new_name ELSE old_name END As geomname
 	FROM 
 	( VALUES
 		 ('GEOMETRY', 'Geometry', 2) ,
 		 	('GEOMETRY', 'GeometryZ', 3) ,
 		 	('GEOMETRY', 'GeometryZM', 4) ,
			('GEOMETRYCOLLECTION', 'GeometryCollection', 2) ,
			('GEOMETRYCOLLECTION', 'GeometryCollectionZ', 3) ,
			('GEOMETRYCOLLECTIONM', 'GeometryCollectionM', 3) ,
			('GEOMETRYCOLLECTION', 'GeometryCollectionZM', 4) ,
			
			('POINT', 'Point',2) ,
			('POINTM','PointM',3) ,
			('POINT', 'PointZ',3) ,
			('POINT', 'PointZM',4) ,
			
			('MULTIPOINT','MultiPoint',2) ,
			('MULTIPOINT','MultiPointZ',3) ,
			('MULTIPOINTM','MultiPointM',3) ,
			('MULTIPOINT','MultiPointZM',4) ,
			
			('POLYGON', 'Polygon',2) ,
			('POLYGON', 'PolygonZ',3) ,
			('POLYGONM', 'PolygonM',3) ,
			('POLYGON', 'PolygonZM',4) ,
			
			('MULTIPOLYGON', 'MultiPolygon',2) ,
			('MULTIPOLYGON', 'MultiPolygonZ',3) ,
			('MULTIPOLYGONM', 'MultiPolygonM',3) ,
			('MULTIPOLYGON', 'MultiPolygonZM',4) ,
			
			('MULTILINESTRING', 'MultiLineString',2) ,
			('MULTILINESTRING', 'MultiLineStringZ',3) ,
			('MULTILINESTRINGM', 'MultiLineStringM',3) ,
			('MULTILINESTRING', 'MultiLineStringZM',4) ,
			
			('LINESTRING', 'LineString',2) ,
			('LINESTRING', 'LineStringZ',3) ,
			('LINESTRINGM', 'LineStringM',3) ,
			('LINESTRING', 'LineStringZM',4) ,
			
			('CIRCULARSTRING', 'CircularString',2) ,
			('CIRCULARSTRING', 'CircularStringZ',3) ,
			('CIRCULARSTRINGM', 'CircularStringM',3) ,
			('CIRCULARSTRING', 'CircularStringZM',4) ,
			
			('COMPOUNDCURVE', 'CompoundCurve',2) ,
			('COMPOUNDCURVE', 'CompoundCurveZ',3) ,
			('COMPOUNDCURVEM', 'CompoundCurveM',3) ,
			('COMPOUNDCURVE', 'CompoundCurveZM',4) ,
			
			('CURVEPOLYGON', 'CurvePolygon',2) ,
			('CURVEPOLYGON', 'CurvePolygonZ',3) ,
			('CURVEPOLYGONM', 'CurvePolygonM',3) ,
			('CURVEPOLYGON', 'CurvePolygonZM',4) ,
			
			('MULTICURVE', 'MultiCurve',2 ) ,
			('MULTICURVE', 'MultiCurveZ',3 ) ,
			('MULTICURVEM', 'MultiCurveM',3 ) ,
			('MULTICURVE', 'MultiCurveZM',4 ) ,
			
			('MULTISURFACE', 'MultiSurface', 2) ,
			('MULTISURFACE', 'MultiSurfaceZ', 3) ,
			('MULTISURFACEM', 'MultiSurfaceM', 3) ,
			('MULTISURFACE', 'MultiSurfaceZM', 4) ,
			
			('POLYHEDRALSURFACE', 'PolyhedralSurface',2) ,
			('POLYHEDRALSURFACE', 'PolyhedralSurfaceZ',3) ,
			('POLYHEDRALSURFACEM', 'PolyhedralSurfaceM',3) ,
			('POLYHEDRALSURFACE', 'PolyhedralSurfaceZM',4) ,
			
			('TRIANGLE', 'Triangle',2) ,
			('TRIANGLE', 'TriangleZ',3) ,
			('TRIANGLEM', 'TriangleM',3) ,
			('TRIANGLE', 'TriangleZM',4) ,

			('TIN', 'Tin', 2),
			('TIN', 'TinZ', 3),
			('TIN', 'TinM', 3),
			('TIN', 'TinZM', 4) )
			 As g(old_name, new_name, coord_dimension)
		WHERE (upper(old_name) = upper($1) OR upper(new_name) = upper($1))
			AND coord_dimension = $2;
$_$;


ALTER FUNCTION public.postgis_type_name(geomname character varying, coord_dimension integer, use_new_name boolean) OWNER TO postgres;

--
-- Name: postgis_typmod_dims(integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION postgis_typmod_dims(integer) RETURNS integer
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-2.0', 'postgis_typmod_dims';


ALTER FUNCTION public.postgis_typmod_dims(integer) OWNER TO postgres;

--
-- Name: postgis_typmod_srid(integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION postgis_typmod_srid(integer) RETURNS integer
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-2.0', 'postgis_typmod_srid';


ALTER FUNCTION public.postgis_typmod_srid(integer) OWNER TO postgres;

--
-- Name: postgis_typmod_type(integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION postgis_typmod_type(integer) RETURNS text
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-2.0', 'postgis_typmod_type';


ALTER FUNCTION public.postgis_typmod_type(integer) OWNER TO postgres;

--
-- Name: postgis_version(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION postgis_version() RETURNS text
    LANGUAGE c IMMUTABLE
    AS '$libdir/postgis-2.0', 'postgis_version';


ALTER FUNCTION public.postgis_version() OWNER TO postgres;

--
-- Name: raster_above(raster, raster); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION raster_above(raster, raster) RETURNS boolean
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$select $1::geometry |>> $2::geometry$_$;


ALTER FUNCTION public.raster_above(raster, raster) OWNER TO postgres;

--
-- Name: raster_below(raster, raster); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION raster_below(raster, raster) RETURNS boolean
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$select $1::geometry <<| $2::geometry$_$;


ALTER FUNCTION public.raster_below(raster, raster) OWNER TO postgres;

--
-- Name: raster_contain(raster, raster); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION raster_contain(raster, raster) RETURNS boolean
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$select $1::geometry ~ $2::geometry$_$;


ALTER FUNCTION public.raster_contain(raster, raster) OWNER TO postgres;

--
-- Name: raster_contained(raster, raster); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION raster_contained(raster, raster) RETURNS boolean
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$select $1::geometry @ $2::geometry$_$;


ALTER FUNCTION public.raster_contained(raster, raster) OWNER TO postgres;

--
-- Name: raster_geometry_contain(raster, geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION raster_geometry_contain(raster, geometry) RETURNS boolean
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$select $1::geometry ~ $2$_$;


ALTER FUNCTION public.raster_geometry_contain(raster, geometry) OWNER TO postgres;

--
-- Name: raster_geometry_overlap(raster, geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION raster_geometry_overlap(raster, geometry) RETURNS boolean
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$select $1::geometry && $2$_$;


ALTER FUNCTION public.raster_geometry_overlap(raster, geometry) OWNER TO postgres;

--
-- Name: raster_left(raster, raster); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION raster_left(raster, raster) RETURNS boolean
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$select $1::geometry << $2::geometry$_$;


ALTER FUNCTION public.raster_left(raster, raster) OWNER TO postgres;

--
-- Name: raster_overabove(raster, raster); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION raster_overabove(raster, raster) RETURNS boolean
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$select $1::geometry |&> $2::geometry$_$;


ALTER FUNCTION public.raster_overabove(raster, raster) OWNER TO postgres;

--
-- Name: raster_overbelow(raster, raster); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION raster_overbelow(raster, raster) RETURNS boolean
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$select $1::geometry &<| $2::geometry$_$;


ALTER FUNCTION public.raster_overbelow(raster, raster) OWNER TO postgres;

--
-- Name: raster_overlap(raster, raster); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION raster_overlap(raster, raster) RETURNS boolean
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$select $1::geometry && $2::geometry$_$;


ALTER FUNCTION public.raster_overlap(raster, raster) OWNER TO postgres;

--
-- Name: raster_overleft(raster, raster); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION raster_overleft(raster, raster) RETURNS boolean
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$select $1::geometry &< $2::geometry$_$;


ALTER FUNCTION public.raster_overleft(raster, raster) OWNER TO postgres;

--
-- Name: raster_overright(raster, raster); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION raster_overright(raster, raster) RETURNS boolean
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$select $1::geometry &> $2::geometry$_$;


ALTER FUNCTION public.raster_overright(raster, raster) OWNER TO postgres;

--
-- Name: raster_right(raster, raster); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION raster_right(raster, raster) RETURNS boolean
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$select $1::geometry >> $2::geometry$_$;


ALTER FUNCTION public.raster_right(raster, raster) OWNER TO postgres;

--
-- Name: raster_same(raster, raster); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION raster_same(raster, raster) RETURNS boolean
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$select $1::geometry ~= $2::geometry$_$;


ALTER FUNCTION public.raster_same(raster, raster) OWNER TO postgres;

--
-- Name: st_3dclosestpoint(geometry, geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_3dclosestpoint(geom1 geometry, geom2 geometry) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT COST 100
    AS '$libdir/postgis-2.0', 'LWGEOM_closestpoint3d';


ALTER FUNCTION public.st_3dclosestpoint(geom1 geometry, geom2 geometry) OWNER TO postgres;

--
-- Name: st_3ddfullywithin(geometry, geometry, double precision); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_3ddfullywithin(geom1 geometry, geom2 geometry, double precision) RETURNS boolean
    LANGUAGE sql IMMUTABLE
    AS $_$SELECT $1 && ST_Expand($2,$3) AND $2 && ST_Expand($1,$3) AND _ST_3DDFullyWithin($1, $2, $3)$_$;


ALTER FUNCTION public.st_3ddfullywithin(geom1 geometry, geom2 geometry, double precision) OWNER TO postgres;

--
-- Name: st_3ddistance(geometry, geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_3ddistance(geom1 geometry, geom2 geometry) RETURNS double precision
    LANGUAGE c IMMUTABLE STRICT COST 100
    AS '$libdir/postgis-2.0', 'LWGEOM_mindistance3d';


ALTER FUNCTION public.st_3ddistance(geom1 geometry, geom2 geometry) OWNER TO postgres;

--
-- Name: st_3ddwithin(geometry, geometry, double precision); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_3ddwithin(geom1 geometry, geom2 geometry, double precision) RETURNS boolean
    LANGUAGE sql IMMUTABLE
    AS $_$SELECT $1 && ST_Expand($2,$3) AND $2 && ST_Expand($1,$3) AND _ST_3DDWithin($1, $2, $3)$_$;


ALTER FUNCTION public.st_3ddwithin(geom1 geometry, geom2 geometry, double precision) OWNER TO postgres;

--
-- Name: st_3dintersects(geometry, geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_3dintersects(geom1 geometry, geom2 geometry) RETURNS boolean
    LANGUAGE sql IMMUTABLE
    AS $_$SELECT $1 && $2 AND _ST_3DDWithin($1, $2, 0.0)$_$;


ALTER FUNCTION public.st_3dintersects(geom1 geometry, geom2 geometry) OWNER TO postgres;

--
-- Name: st_3dlength(geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_3dlength(geometry) RETURNS double precision
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-2.0', 'LWGEOM_length_linestring';


ALTER FUNCTION public.st_3dlength(geometry) OWNER TO postgres;

--
-- Name: st_3dlength_spheroid(geometry, spheroid); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_3dlength_spheroid(geometry, spheroid) RETURNS double precision
    LANGUAGE c IMMUTABLE STRICT COST 100
    AS '$libdir/postgis-2.0', 'LWGEOM_length_ellipsoid_linestring';


ALTER FUNCTION public.st_3dlength_spheroid(geometry, spheroid) OWNER TO postgres;

--
-- Name: st_3dlongestline(geometry, geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_3dlongestline(geom1 geometry, geom2 geometry) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT COST 100
    AS '$libdir/postgis-2.0', 'LWGEOM_longestline3d';


ALTER FUNCTION public.st_3dlongestline(geom1 geometry, geom2 geometry) OWNER TO postgres;

--
-- Name: st_3dmakebox(geometry, geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_3dmakebox(geom1 geometry, geom2 geometry) RETURNS box3d
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-2.0', 'BOX3D_construct';


ALTER FUNCTION public.st_3dmakebox(geom1 geometry, geom2 geometry) OWNER TO postgres;

--
-- Name: st_3dmaxdistance(geometry, geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_3dmaxdistance(geom1 geometry, geom2 geometry) RETURNS double precision
    LANGUAGE c IMMUTABLE STRICT COST 100
    AS '$libdir/postgis-2.0', 'LWGEOM_maxdistance3d';


ALTER FUNCTION public.st_3dmaxdistance(geom1 geometry, geom2 geometry) OWNER TO postgres;

--
-- Name: st_3dperimeter(geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_3dperimeter(geometry) RETURNS double precision
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-2.0', 'LWGEOM_perimeter_poly';


ALTER FUNCTION public.st_3dperimeter(geometry) OWNER TO postgres;

--
-- Name: st_3dshortestline(geometry, geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_3dshortestline(geom1 geometry, geom2 geometry) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT COST 100
    AS '$libdir/postgis-2.0', 'LWGEOM_shortestline3d';


ALTER FUNCTION public.st_3dshortestline(geom1 geometry, geom2 geometry) OWNER TO postgres;

--
-- Name: st_addband(raster, raster[], integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_addband(torast raster, fromrasts raster[], fromband integer DEFAULT 1) RETURNS raster
    LANGUAGE plpgsql
    AS $$
	DECLARE var_result raster := torast;
		var_num integer := array_upper(fromrasts,1);
		var_i integer := 1; 
	BEGIN 
		IF torast IS NULL AND var_num > 0 THEN
			var_result := ST_Band(fromrasts[1],fromband); 
			var_i := 2;
		END IF;
		WHILE var_i <= var_num LOOP
			var_result := ST_AddBand(var_result, fromrasts[var_i], 1);
			var_i := var_i + 1;
		END LOOP;
		
		RETURN var_result;
	END;
$$;


ALTER FUNCTION public.st_addband(torast raster, fromrasts raster[], fromband integer) OWNER TO postgres;

--
-- Name: st_addband(raster, text, double precision, double precision); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_addband(rast raster, pixeltype text, initialvalue double precision DEFAULT (0)::numeric, nodataval double precision DEFAULT NULL::double precision) RETURNS raster
    LANGUAGE sql IMMUTABLE
    AS $_$select st_addband($1, NULL, $2, $3, $4)$_$;


ALTER FUNCTION public.st_addband(rast raster, pixeltype text, initialvalue double precision, nodataval double precision) OWNER TO postgres;

--
-- Name: st_addband(raster, raster, integer, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_addband(torast raster, fromrast raster, fromband integer DEFAULT 1, torastindex integer DEFAULT NULL::integer) RETURNS raster
    LANGUAGE c IMMUTABLE
    AS '$libdir/rtpostgis-2.0', 'RASTER_copyband';


ALTER FUNCTION public.st_addband(torast raster, fromrast raster, fromband integer, torastindex integer) OWNER TO postgres;

--
-- Name: st_addband(raster, integer, text, double precision, double precision); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_addband(rast raster, index integer, pixeltype text, initialvalue double precision DEFAULT (0)::numeric, nodataval double precision DEFAULT NULL::double precision) RETURNS raster
    LANGUAGE c IMMUTABLE
    AS '$libdir/rtpostgis-2.0', 'RASTER_addband';


ALTER FUNCTION public.st_addband(rast raster, index integer, pixeltype text, initialvalue double precision, nodataval double precision) OWNER TO postgres;

--
-- Name: st_addmeasure(geometry, double precision, double precision); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_addmeasure(geometry, double precision, double precision) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-2.0', 'ST_AddMeasure';


ALTER FUNCTION public.st_addmeasure(geometry, double precision, double precision) OWNER TO postgres;

--
-- Name: st_addpoint(geometry, geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_addpoint(geom1 geometry, geom2 geometry) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-2.0', 'LWGEOM_addpoint';


ALTER FUNCTION public.st_addpoint(geom1 geometry, geom2 geometry) OWNER TO postgres;

--
-- Name: st_addpoint(geometry, geometry, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_addpoint(geom1 geometry, geom2 geometry, integer) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-2.0', 'LWGEOM_addpoint';


ALTER FUNCTION public.st_addpoint(geom1 geometry, geom2 geometry, integer) OWNER TO postgres;

--
-- Name: st_affine(geometry, double precision, double precision, double precision, double precision, double precision, double precision); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_affine(geometry, double precision, double precision, double precision, double precision, double precision, double precision) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$SELECT ST_Affine($1,  $2, $3, 0,  $4, $5, 0,  0, 0, 1,  $6, $7, 0)$_$;


ALTER FUNCTION public.st_affine(geometry, double precision, double precision, double precision, double precision, double precision, double precision) OWNER TO postgres;

--
-- Name: st_affine(geometry, double precision, double precision, double precision, double precision, double precision, double precision, double precision, double precision, double precision, double precision, double precision, double precision); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_affine(geometry, double precision, double precision, double precision, double precision, double precision, double precision, double precision, double precision, double precision, double precision, double precision, double precision) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-2.0', 'LWGEOM_affine';


ALTER FUNCTION public.st_affine(geometry, double precision, double precision, double precision, double precision, double precision, double precision, double precision, double precision, double precision, double precision, double precision, double precision) OWNER TO postgres;

--
-- Name: st_approxcount(raster, double precision); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_approxcount(rast raster, sample_percent double precision) RETURNS bigint
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$ SELECT _st_count($1, 1, TRUE, $2) $_$;


ALTER FUNCTION public.st_approxcount(rast raster, sample_percent double precision) OWNER TO postgres;

--
-- Name: st_approxcount(raster, integer, double precision); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_approxcount(rast raster, nband integer, sample_percent double precision) RETURNS bigint
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$ SELECT _st_count($1, $2, TRUE, $3) $_$;


ALTER FUNCTION public.st_approxcount(rast raster, nband integer, sample_percent double precision) OWNER TO postgres;

--
-- Name: st_approxcount(raster, boolean, double precision); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_approxcount(rast raster, exclude_nodata_value boolean, sample_percent double precision DEFAULT 0.1) RETURNS bigint
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$ SELECT _st_count($1, 1, $2, $3) $_$;


ALTER FUNCTION public.st_approxcount(rast raster, exclude_nodata_value boolean, sample_percent double precision) OWNER TO postgres;

--
-- Name: st_approxcount(text, text, double precision); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_approxcount(rastertable text, rastercolumn text, sample_percent double precision) RETURNS bigint
    LANGUAGE sql STABLE STRICT
    AS $_$ SELECT _st_count($1, $2, 1, TRUE, $3) $_$;


ALTER FUNCTION public.st_approxcount(rastertable text, rastercolumn text, sample_percent double precision) OWNER TO postgres;

--
-- Name: st_approxcount(raster, integer, boolean, double precision); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_approxcount(rast raster, nband integer DEFAULT 1, exclude_nodata_value boolean DEFAULT true, sample_percent double precision DEFAULT 0.1) RETURNS bigint
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$ SELECT _st_count($1, $2, $3, $4) $_$;


ALTER FUNCTION public.st_approxcount(rast raster, nband integer, exclude_nodata_value boolean, sample_percent double precision) OWNER TO postgres;

--
-- Name: st_approxcount(text, text, integer, double precision); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_approxcount(rastertable text, rastercolumn text, nband integer, sample_percent double precision) RETURNS bigint
    LANGUAGE sql STABLE STRICT
    AS $_$ SELECT _st_count($1, $2, $3, TRUE, $4) $_$;


ALTER FUNCTION public.st_approxcount(rastertable text, rastercolumn text, nband integer, sample_percent double precision) OWNER TO postgres;

--
-- Name: st_approxcount(text, text, boolean, double precision); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_approxcount(rastertable text, rastercolumn text, exclude_nodata_value boolean, sample_percent double precision DEFAULT 0.1) RETURNS bigint
    LANGUAGE sql STABLE STRICT
    AS $_$ SELECT _st_count($1, $2, 1, $3, $4) $_$;


ALTER FUNCTION public.st_approxcount(rastertable text, rastercolumn text, exclude_nodata_value boolean, sample_percent double precision) OWNER TO postgres;

--
-- Name: st_approxcount(text, text, integer, boolean, double precision); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_approxcount(rastertable text, rastercolumn text, nband integer DEFAULT 1, exclude_nodata_value boolean DEFAULT true, sample_percent double precision DEFAULT 0.1) RETURNS bigint
    LANGUAGE sql STABLE STRICT
    AS $_$ SELECT _st_count($1, $2, $3, $4, $5) $_$;


ALTER FUNCTION public.st_approxcount(rastertable text, rastercolumn text, nband integer, exclude_nodata_value boolean, sample_percent double precision) OWNER TO postgres;

--
-- Name: st_approxhistogram(raster, double precision); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_approxhistogram(rast raster, sample_percent double precision) RETURNS SETOF histogram
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$ SELECT min, max, count, percent FROM _st_histogram($1, 1, TRUE, $2, 0, NULL, FALSE) $_$;


ALTER FUNCTION public.st_approxhistogram(rast raster, sample_percent double precision) OWNER TO postgres;

--
-- Name: st_approxhistogram(raster, integer, double precision); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_approxhistogram(rast raster, nband integer, sample_percent double precision) RETURNS SETOF histogram
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$ SELECT min, max, count, percent FROM _st_histogram($1, $2, TRUE, $3, 0, NULL, FALSE) $_$;


ALTER FUNCTION public.st_approxhistogram(rast raster, nband integer, sample_percent double precision) OWNER TO postgres;

--
-- Name: st_approxhistogram(text, text, double precision); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_approxhistogram(rastertable text, rastercolumn text, sample_percent double precision) RETURNS SETOF histogram
    LANGUAGE sql STABLE STRICT
    AS $_$ SELECT _st_histogram($1, $2, 1, TRUE, $3, 0, NULL, FALSE) $_$;


ALTER FUNCTION public.st_approxhistogram(rastertable text, rastercolumn text, sample_percent double precision) OWNER TO postgres;

--
-- Name: st_approxhistogram(text, text, integer, double precision); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_approxhistogram(rastertable text, rastercolumn text, nband integer, sample_percent double precision) RETURNS SETOF histogram
    LANGUAGE sql STABLE STRICT
    AS $_$ SELECT _st_histogram($1, $2, $3, TRUE, $4, 0, NULL, FALSE) $_$;


ALTER FUNCTION public.st_approxhistogram(rastertable text, rastercolumn text, nband integer, sample_percent double precision) OWNER TO postgres;

--
-- Name: st_approxhistogram(raster, integer, double precision, integer, boolean); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_approxhistogram(rast raster, nband integer, sample_percent double precision, bins integer, "right" boolean) RETURNS SETOF histogram
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$ SELECT min, max, count, percent FROM _st_histogram($1, $2, TRUE, $3, $4, NULL, $5) $_$;


ALTER FUNCTION public.st_approxhistogram(rast raster, nband integer, sample_percent double precision, bins integer, "right" boolean) OWNER TO postgres;

--
-- Name: st_approxhistogram(raster, integer, boolean, double precision, integer, boolean); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_approxhistogram(rast raster, nband integer, exclude_nodata_value boolean, sample_percent double precision, bins integer, "right" boolean) RETURNS SETOF histogram
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$ SELECT min, max, count, percent FROM _st_histogram($1, $2, $3, $4, $5, NULL, $6) $_$;


ALTER FUNCTION public.st_approxhistogram(rast raster, nband integer, exclude_nodata_value boolean, sample_percent double precision, bins integer, "right" boolean) OWNER TO postgres;

--
-- Name: st_approxhistogram(raster, integer, double precision, integer, double precision[], boolean); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_approxhistogram(rast raster, nband integer, sample_percent double precision, bins integer, width double precision[] DEFAULT NULL::double precision[], "right" boolean DEFAULT false) RETURNS SETOF histogram
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$ SELECT min, max, count, percent FROM _st_histogram($1, $2, TRUE, $3, $4, $5, $6) $_$;


ALTER FUNCTION public.st_approxhistogram(rast raster, nband integer, sample_percent double precision, bins integer, width double precision[], "right" boolean) OWNER TO postgres;

--
-- Name: st_approxhistogram(text, text, integer, double precision, integer, boolean); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_approxhistogram(rastertable text, rastercolumn text, nband integer, sample_percent double precision, bins integer, "right" boolean) RETURNS SETOF histogram
    LANGUAGE sql STABLE STRICT
    AS $_$ SELECT _st_histogram($1, $2, $3, TRUE, $4, $5, NULL, $6) $_$;


ALTER FUNCTION public.st_approxhistogram(rastertable text, rastercolumn text, nband integer, sample_percent double precision, bins integer, "right" boolean) OWNER TO postgres;

--
-- Name: st_approxhistogram(raster, integer, boolean, double precision, integer, double precision[], boolean); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_approxhistogram(rast raster, nband integer DEFAULT 1, exclude_nodata_value boolean DEFAULT true, sample_percent double precision DEFAULT 0.1, bins integer DEFAULT 0, width double precision[] DEFAULT NULL::double precision[], "right" boolean DEFAULT false) RETURNS SETOF histogram
    LANGUAGE sql IMMUTABLE
    AS $_$ SELECT min, max, count, percent FROM _st_histogram($1, $2, $3, $4, $5, $6, $7) $_$;


ALTER FUNCTION public.st_approxhistogram(rast raster, nband integer, exclude_nodata_value boolean, sample_percent double precision, bins integer, width double precision[], "right" boolean) OWNER TO postgres;

--
-- Name: st_approxhistogram(text, text, integer, boolean, double precision, integer, boolean); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_approxhistogram(rastertable text, rastercolumn text, nband integer, exclude_nodata_value boolean, sample_percent double precision, bins integer, "right" boolean) RETURNS SETOF histogram
    LANGUAGE sql STABLE STRICT
    AS $_$ SELECT _st_histogram($1, $2, $3, $4, $5, $6, NULL, $7) $_$;


ALTER FUNCTION public.st_approxhistogram(rastertable text, rastercolumn text, nband integer, exclude_nodata_value boolean, sample_percent double precision, bins integer, "right" boolean) OWNER TO postgres;

--
-- Name: st_approxhistogram(text, text, integer, double precision, integer, double precision[], boolean); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_approxhistogram(rastertable text, rastercolumn text, nband integer, sample_percent double precision, bins integer, width double precision[] DEFAULT NULL::double precision[], "right" boolean DEFAULT false) RETURNS SETOF histogram
    LANGUAGE sql STABLE STRICT
    AS $_$ SELECT _st_histogram($1, $2, $3, TRUE, $4, $5, $6, $7) $_$;


ALTER FUNCTION public.st_approxhistogram(rastertable text, rastercolumn text, nband integer, sample_percent double precision, bins integer, width double precision[], "right" boolean) OWNER TO postgres;

--
-- Name: st_approxhistogram(text, text, integer, boolean, double precision, integer, double precision[], boolean); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_approxhistogram(rastertable text, rastercolumn text, nband integer DEFAULT 1, exclude_nodata_value boolean DEFAULT true, sample_percent double precision DEFAULT 0.1, bins integer DEFAULT 0, width double precision[] DEFAULT NULL::double precision[], "right" boolean DEFAULT false) RETURNS SETOF histogram
    LANGUAGE sql STABLE
    AS $_$ SELECT _st_histogram($1, $2, $3, $4, $5, $6, $7, $8) $_$;


ALTER FUNCTION public.st_approxhistogram(rastertable text, rastercolumn text, nband integer, exclude_nodata_value boolean, sample_percent double precision, bins integer, width double precision[], "right" boolean) OWNER TO postgres;

--
-- Name: st_approxquantile(raster, double precision[]); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_approxquantile(rast raster, quantiles double precision[]) RETURNS SETOF quantile
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$ SELECT _st_quantile($1, 1, TRUE, 0.1, $2) $_$;


ALTER FUNCTION public.st_approxquantile(rast raster, quantiles double precision[]) OWNER TO postgres;

--
-- Name: st_approxquantile(raster, double precision); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_approxquantile(rast raster, quantile double precision) RETURNS double precision
    LANGUAGE sql IMMUTABLE
    AS $_$ SELECT (_st_quantile($1, 1, TRUE, 0.1, ARRAY[$2]::double precision[])).value $_$;


ALTER FUNCTION public.st_approxquantile(rast raster, quantile double precision) OWNER TO postgres;

--
-- Name: st_approxquantile(raster, double precision, double precision[]); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_approxquantile(rast raster, sample_percent double precision, quantiles double precision[] DEFAULT NULL::double precision[]) RETURNS SETOF quantile
    LANGUAGE sql IMMUTABLE
    AS $_$ SELECT _st_quantile($1, 1, TRUE, $2, $3) $_$;


ALTER FUNCTION public.st_approxquantile(rast raster, sample_percent double precision, quantiles double precision[]) OWNER TO postgres;

--
-- Name: st_approxquantile(raster, double precision, double precision); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_approxquantile(rast raster, sample_percent double precision, quantile double precision) RETURNS double precision
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$ SELECT (_st_quantile($1, 1, TRUE, $2, ARRAY[$3]::double precision[])).value $_$;


ALTER FUNCTION public.st_approxquantile(rast raster, sample_percent double precision, quantile double precision) OWNER TO postgres;

--
-- Name: st_approxquantile(raster, boolean, double precision); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_approxquantile(rast raster, exclude_nodata_value boolean, quantile double precision DEFAULT NULL::double precision) RETURNS double precision
    LANGUAGE sql IMMUTABLE
    AS $_$ SELECT (_st_quantile($1, 1, $2, 0.1, ARRAY[$3]::double precision[])).value $_$;


ALTER FUNCTION public.st_approxquantile(rast raster, exclude_nodata_value boolean, quantile double precision) OWNER TO postgres;

--
-- Name: st_approxquantile(text, text, double precision[]); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_approxquantile(rastertable text, rastercolumn text, quantiles double precision[]) RETURNS SETOF quantile
    LANGUAGE sql STABLE STRICT
    AS $_$ SELECT _st_quantile($1, $2, 1, TRUE, 0.1, $3) $_$;


ALTER FUNCTION public.st_approxquantile(rastertable text, rastercolumn text, quantiles double precision[]) OWNER TO postgres;

--
-- Name: st_approxquantile(text, text, double precision); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_approxquantile(rastertable text, rastercolumn text, quantile double precision) RETURNS double precision
    LANGUAGE sql STABLE
    AS $_$ SELECT (_st_quantile($1, $2, 1, TRUE, 0.1, ARRAY[$3]::double precision[])).value $_$;


ALTER FUNCTION public.st_approxquantile(rastertable text, rastercolumn text, quantile double precision) OWNER TO postgres;

--
-- Name: st_approxquantile(raster, integer, double precision, double precision[]); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_approxquantile(rast raster, nband integer, sample_percent double precision, quantiles double precision[] DEFAULT NULL::double precision[]) RETURNS SETOF quantile
    LANGUAGE sql IMMUTABLE
    AS $_$ SELECT _st_quantile($1, $2, TRUE, $3, $4) $_$;


ALTER FUNCTION public.st_approxquantile(rast raster, nband integer, sample_percent double precision, quantiles double precision[]) OWNER TO postgres;

--
-- Name: st_approxquantile(raster, integer, double precision, double precision); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_approxquantile(rast raster, nband integer, sample_percent double precision, quantile double precision) RETURNS double precision
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$ SELECT (_st_quantile($1, $2, TRUE, $3, ARRAY[$4]::double precision[])).value $_$;


ALTER FUNCTION public.st_approxquantile(rast raster, nband integer, sample_percent double precision, quantile double precision) OWNER TO postgres;

--
-- Name: st_approxquantile(text, text, double precision, double precision[]); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_approxquantile(rastertable text, rastercolumn text, sample_percent double precision, quantiles double precision[] DEFAULT NULL::double precision[]) RETURNS SETOF quantile
    LANGUAGE sql STABLE
    AS $_$ SELECT _st_quantile($1, $2, 1, TRUE, $3, $4) $_$;


ALTER FUNCTION public.st_approxquantile(rastertable text, rastercolumn text, sample_percent double precision, quantiles double precision[]) OWNER TO postgres;

--
-- Name: st_approxquantile(text, text, double precision, double precision); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_approxquantile(rastertable text, rastercolumn text, sample_percent double precision, quantile double precision) RETURNS double precision
    LANGUAGE sql STABLE STRICT
    AS $_$ SELECT (_st_quantile($1, $2, 1, TRUE, $3, ARRAY[$4]::double precision[])).value $_$;


ALTER FUNCTION public.st_approxquantile(rastertable text, rastercolumn text, sample_percent double precision, quantile double precision) OWNER TO postgres;

--
-- Name: st_approxquantile(text, text, boolean, double precision); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_approxquantile(rastertable text, rastercolumn text, exclude_nodata_value boolean, quantile double precision DEFAULT NULL::double precision) RETURNS double precision
    LANGUAGE sql STABLE
    AS $_$ SELECT (_st_quantile($1, $2, 1, $3, 0.1, ARRAY[$4]::double precision[])).value $_$;


ALTER FUNCTION public.st_approxquantile(rastertable text, rastercolumn text, exclude_nodata_value boolean, quantile double precision) OWNER TO postgres;

--
-- Name: st_approxquantile(raster, integer, boolean, double precision, double precision[]); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_approxquantile(rast raster, nband integer DEFAULT 1, exclude_nodata_value boolean DEFAULT true, sample_percent double precision DEFAULT 0.1, quantiles double precision[] DEFAULT NULL::double precision[]) RETURNS SETOF quantile
    LANGUAGE sql IMMUTABLE
    AS $_$ SELECT _st_quantile($1, $2, $3, $4, $5) $_$;


ALTER FUNCTION public.st_approxquantile(rast raster, nband integer, exclude_nodata_value boolean, sample_percent double precision, quantiles double precision[]) OWNER TO postgres;

--
-- Name: st_approxquantile(raster, integer, boolean, double precision, double precision); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_approxquantile(rast raster, nband integer, exclude_nodata_value boolean, sample_percent double precision, quantile double precision) RETURNS double precision
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$ SELECT (_st_quantile($1, $2, $3, $4, ARRAY[$5]::double precision[])).value $_$;


ALTER FUNCTION public.st_approxquantile(rast raster, nband integer, exclude_nodata_value boolean, sample_percent double precision, quantile double precision) OWNER TO postgres;

--
-- Name: st_approxquantile(text, text, integer, double precision, double precision[]); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_approxquantile(rastertable text, rastercolumn text, nband integer, sample_percent double precision, quantiles double precision[] DEFAULT NULL::double precision[]) RETURNS SETOF quantile
    LANGUAGE sql STABLE
    AS $_$ SELECT _st_quantile($1, $2, $3, TRUE, $4, $5) $_$;


ALTER FUNCTION public.st_approxquantile(rastertable text, rastercolumn text, nband integer, sample_percent double precision, quantiles double precision[]) OWNER TO postgres;

--
-- Name: st_approxquantile(text, text, integer, double precision, double precision); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_approxquantile(rastertable text, rastercolumn text, nband integer, sample_percent double precision, quantile double precision) RETURNS double precision
    LANGUAGE sql STABLE STRICT
    AS $_$ SELECT (_st_quantile($1, $2, $3, TRUE, $4, ARRAY[$5]::double precision[])).value $_$;


ALTER FUNCTION public.st_approxquantile(rastertable text, rastercolumn text, nband integer, sample_percent double precision, quantile double precision) OWNER TO postgres;

--
-- Name: st_approxquantile(text, text, integer, boolean, double precision, double precision[]); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_approxquantile(rastertable text, rastercolumn text, nband integer DEFAULT 1, exclude_nodata_value boolean DEFAULT true, sample_percent double precision DEFAULT 0.1, quantiles double precision[] DEFAULT NULL::double precision[]) RETURNS SETOF quantile
    LANGUAGE sql STABLE
    AS $_$ SELECT _st_quantile($1, $2, $3, $4, $5, $6) $_$;


ALTER FUNCTION public.st_approxquantile(rastertable text, rastercolumn text, nband integer, exclude_nodata_value boolean, sample_percent double precision, quantiles double precision[]) OWNER TO postgres;

--
-- Name: st_approxquantile(text, text, integer, boolean, double precision, double precision); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_approxquantile(rastertable text, rastercolumn text, nband integer, exclude_nodata_value boolean, sample_percent double precision, quantile double precision) RETURNS double precision
    LANGUAGE sql STABLE STRICT
    AS $_$ SELECT (_st_quantile($1, $2, $3, $4, $5, ARRAY[$6]::double precision[])).value $_$;


ALTER FUNCTION public.st_approxquantile(rastertable text, rastercolumn text, nband integer, exclude_nodata_value boolean, sample_percent double precision, quantile double precision) OWNER TO postgres;

--
-- Name: st_approxsummarystats(raster, double precision); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_approxsummarystats(rast raster, sample_percent double precision) RETURNS summarystats
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$ SELECT _st_summarystats($1, 1, TRUE, $2) $_$;


ALTER FUNCTION public.st_approxsummarystats(rast raster, sample_percent double precision) OWNER TO postgres;

--
-- Name: st_approxsummarystats(raster, integer, double precision); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_approxsummarystats(rast raster, nband integer, sample_percent double precision) RETURNS summarystats
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$ SELECT _st_summarystats($1, $2, TRUE, $3) $_$;


ALTER FUNCTION public.st_approxsummarystats(rast raster, nband integer, sample_percent double precision) OWNER TO postgres;

--
-- Name: st_approxsummarystats(raster, boolean, double precision); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_approxsummarystats(rast raster, exclude_nodata_value boolean, sample_percent double precision DEFAULT 0.1) RETURNS summarystats
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$ SELECT _st_summarystats($1, 1, $2, $3) $_$;


ALTER FUNCTION public.st_approxsummarystats(rast raster, exclude_nodata_value boolean, sample_percent double precision) OWNER TO postgres;

--
-- Name: st_approxsummarystats(text, text, boolean); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_approxsummarystats(rastertable text, rastercolumn text, exclude_nodata_value boolean) RETURNS summarystats
    LANGUAGE sql STABLE STRICT
    AS $_$ SELECT _st_summarystats($1, $2, 1, $3, 0.1) $_$;


ALTER FUNCTION public.st_approxsummarystats(rastertable text, rastercolumn text, exclude_nodata_value boolean) OWNER TO postgres;

--
-- Name: st_approxsummarystats(text, text, double precision); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_approxsummarystats(rastertable text, rastercolumn text, sample_percent double precision) RETURNS summarystats
    LANGUAGE sql STABLE STRICT
    AS $_$ SELECT _st_summarystats($1, $2, 1, TRUE, $3) $_$;


ALTER FUNCTION public.st_approxsummarystats(rastertable text, rastercolumn text, sample_percent double precision) OWNER TO postgres;

--
-- Name: st_approxsummarystats(raster, integer, boolean, double precision); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_approxsummarystats(rast raster, nband integer DEFAULT 1, exclude_nodata_value boolean DEFAULT true, sample_percent double precision DEFAULT 0.1) RETURNS summarystats
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$ SELECT _st_summarystats($1, $2, $3, $4) $_$;


ALTER FUNCTION public.st_approxsummarystats(rast raster, nband integer, exclude_nodata_value boolean, sample_percent double precision) OWNER TO postgres;

--
-- Name: st_approxsummarystats(text, text, integer, double precision); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_approxsummarystats(rastertable text, rastercolumn text, nband integer, sample_percent double precision) RETURNS summarystats
    LANGUAGE sql STABLE STRICT
    AS $_$ SELECT _st_summarystats($1, $2, $3, TRUE, $4) $_$;


ALTER FUNCTION public.st_approxsummarystats(rastertable text, rastercolumn text, nband integer, sample_percent double precision) OWNER TO postgres;

--
-- Name: st_approxsummarystats(text, text, integer, boolean, double precision); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_approxsummarystats(rastertable text, rastercolumn text, nband integer DEFAULT 1, exclude_nodata_value boolean DEFAULT true, sample_percent double precision DEFAULT 0.1) RETURNS summarystats
    LANGUAGE sql STABLE STRICT
    AS $_$ SELECT _st_summarystats($1, $2, $3, $4, $5) $_$;


ALTER FUNCTION public.st_approxsummarystats(rastertable text, rastercolumn text, nband integer, exclude_nodata_value boolean, sample_percent double precision) OWNER TO postgres;

--
-- Name: st_area(geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_area(geometry) RETURNS double precision
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-2.0', 'LWGEOM_area_polygon';


ALTER FUNCTION public.st_area(geometry) OWNER TO postgres;

--
-- Name: st_area(text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_area(text) RETURNS double precision
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$ SELECT ST_Area($1::geometry);  $_$;


ALTER FUNCTION public.st_area(text) OWNER TO postgres;

--
-- Name: st_area(geography, boolean); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_area(geog geography, use_spheroid boolean DEFAULT true) RETURNS double precision
    LANGUAGE c IMMUTABLE STRICT COST 100
    AS '$libdir/postgis-2.0', 'geography_area';


ALTER FUNCTION public.st_area(geog geography, use_spheroid boolean) OWNER TO postgres;

--
-- Name: st_area2d(geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_area2d(geometry) RETURNS double precision
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-2.0', 'LWGEOM_area_polygon';


ALTER FUNCTION public.st_area2d(geometry) OWNER TO postgres;

--
-- Name: st_asbinary(geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_asbinary(geometry) RETURNS bytea
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-2.0', 'LWGEOM_asBinary';


ALTER FUNCTION public.st_asbinary(geometry) OWNER TO postgres;

--
-- Name: st_asbinary(geography); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_asbinary(geography) RETURNS bytea
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-2.0', 'LWGEOM_asBinary';


ALTER FUNCTION public.st_asbinary(geography) OWNER TO postgres;

--
-- Name: st_asbinary(raster); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_asbinary(raster) RETURNS bytea
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/rtpostgis-2.0', 'RASTER_to_binary';


ALTER FUNCTION public.st_asbinary(raster) OWNER TO postgres;

--
-- Name: st_asbinary(geometry, text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_asbinary(geometry, text) RETURNS bytea
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-2.0', 'LWGEOM_asBinary';


ALTER FUNCTION public.st_asbinary(geometry, text) OWNER TO postgres;

--
-- Name: st_asbinary(geography, text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_asbinary(geography, text) RETURNS bytea
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$ SELECT ST_AsBinary($1::geometry, $2);  $_$;


ALTER FUNCTION public.st_asbinary(geography, text) OWNER TO postgres;

--
-- Name: st_asewkb(geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_asewkb(geometry) RETURNS bytea
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-2.0', 'WKBFromLWGEOM';


ALTER FUNCTION public.st_asewkb(geometry) OWNER TO postgres;

--
-- Name: st_asewkb(geometry, text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_asewkb(geometry, text) RETURNS bytea
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-2.0', 'WKBFromLWGEOM';


ALTER FUNCTION public.st_asewkb(geometry, text) OWNER TO postgres;

--
-- Name: st_asewkt(geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_asewkt(geometry) RETURNS text
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-2.0', 'LWGEOM_asEWKT';


ALTER FUNCTION public.st_asewkt(geometry) OWNER TO postgres;

--
-- Name: st_asewkt(geography); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_asewkt(geography) RETURNS text
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-2.0', 'LWGEOM_asEWKT';


ALTER FUNCTION public.st_asewkt(geography) OWNER TO postgres;

--
-- Name: st_asewkt(text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_asewkt(text) RETURNS text
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$ SELECT ST_AsEWKT($1::geometry);  $_$;


ALTER FUNCTION public.st_asewkt(text) OWNER TO postgres;

--
-- Name: st_asgdalraster(raster, text, text[], integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_asgdalraster(rast raster, format text, options text[] DEFAULT NULL::text[], srid integer DEFAULT NULL::integer) RETURNS bytea
    LANGUAGE c IMMUTABLE
    AS '$libdir/rtpostgis-2.0', 'RASTER_asGDALRaster';


ALTER FUNCTION public.st_asgdalraster(rast raster, format text, options text[], srid integer) OWNER TO postgres;

--
-- Name: st_asgeojson(text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_asgeojson(text) RETURNS text
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$ SELECT _ST_AsGeoJson(1, $1::geometry,15,0);  $_$;


ALTER FUNCTION public.st_asgeojson(text) OWNER TO postgres;

--
-- Name: st_asgeojson(geometry, integer, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_asgeojson(geom geometry, maxdecimaldigits integer DEFAULT 15, options integer DEFAULT 0) RETURNS text
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$ SELECT _ST_AsGeoJson(1, $1, $2, $3); $_$;


ALTER FUNCTION public.st_asgeojson(geom geometry, maxdecimaldigits integer, options integer) OWNER TO postgres;

--
-- Name: st_asgeojson(geography, integer, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_asgeojson(geog geography, maxdecimaldigits integer DEFAULT 15, options integer DEFAULT 0) RETURNS text
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$ SELECT _ST_AsGeoJson(1, $1, $2, $3); $_$;


ALTER FUNCTION public.st_asgeojson(geog geography, maxdecimaldigits integer, options integer) OWNER TO postgres;

--
-- Name: st_asgeojson(integer, geometry, integer, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_asgeojson(gj_version integer, geom geometry, maxdecimaldigits integer DEFAULT 15, options integer DEFAULT 0) RETURNS text
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$ SELECT _ST_AsGeoJson($1, $2, $3, $4); $_$;


ALTER FUNCTION public.st_asgeojson(gj_version integer, geom geometry, maxdecimaldigits integer, options integer) OWNER TO postgres;

--
-- Name: st_asgeojson(integer, geography, integer, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_asgeojson(gj_version integer, geog geography, maxdecimaldigits integer DEFAULT 15, options integer DEFAULT 0) RETURNS text
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$ SELECT _ST_AsGeoJson($1, $2, $3, $4); $_$;


ALTER FUNCTION public.st_asgeojson(gj_version integer, geog geography, maxdecimaldigits integer, options integer) OWNER TO postgres;

--
-- Name: st_asgml(text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_asgml(text) RETURNS text
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$ SELECT _ST_AsGML(2,$1::geometry,15,0, NULL);  $_$;


ALTER FUNCTION public.st_asgml(text) OWNER TO postgres;

--
-- Name: st_asgml(geometry, integer, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_asgml(geom geometry, maxdecimaldigits integer DEFAULT 15, options integer DEFAULT 0) RETURNS text
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$ SELECT _ST_AsGML(2, $1, $2, $3, null); $_$;


ALTER FUNCTION public.st_asgml(geom geometry, maxdecimaldigits integer, options integer) OWNER TO postgres;

--
-- Name: st_asgml(geography, integer, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_asgml(geog geography, maxdecimaldigits integer DEFAULT 15, options integer DEFAULT 0) RETURNS text
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$SELECT _ST_AsGML(2, $1, $2, $3, null)$_$;


ALTER FUNCTION public.st_asgml(geog geography, maxdecimaldigits integer, options integer) OWNER TO postgres;

--
-- Name: st_asgml(integer, geometry, integer, integer, text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_asgml(version integer, geom geometry, maxdecimaldigits integer DEFAULT 15, options integer DEFAULT 0, nprefix text DEFAULT NULL::text) RETURNS text
    LANGUAGE sql IMMUTABLE
    AS $_$ SELECT _ST_AsGML($1, $2, $3, $4,$5); $_$;


ALTER FUNCTION public.st_asgml(version integer, geom geometry, maxdecimaldigits integer, options integer, nprefix text) OWNER TO postgres;

--
-- Name: st_asgml(integer, geography, integer, integer, text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_asgml(version integer, geog geography, maxdecimaldigits integer DEFAULT 15, options integer DEFAULT 0, nprefix text DEFAULT NULL::text) RETURNS text
    LANGUAGE sql IMMUTABLE
    AS $_$ SELECT _ST_AsGML($1, $2, $3, $4, $5);$_$;


ALTER FUNCTION public.st_asgml(version integer, geog geography, maxdecimaldigits integer, options integer, nprefix text) OWNER TO postgres;

--
-- Name: st_ashexewkb(geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_ashexewkb(geometry) RETURNS text
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-2.0', 'LWGEOM_asHEXEWKB';


ALTER FUNCTION public.st_ashexewkb(geometry) OWNER TO postgres;

--
-- Name: st_ashexewkb(geometry, text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_ashexewkb(geometry, text) RETURNS text
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-2.0', 'LWGEOM_asHEXEWKB';


ALTER FUNCTION public.st_ashexewkb(geometry, text) OWNER TO postgres;

--
-- Name: st_asjpeg(raster, text[]); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_asjpeg(rast raster, options text[] DEFAULT NULL::text[]) RETURNS bytea
    LANGUAGE plpgsql IMMUTABLE
    AS $_$
	DECLARE
		rast2 raster;
		num_bands int;
		i int;
	BEGIN
		num_bands := st_numbands($1);

		-- JPEG allows 1 or 3 bands
		IF num_bands <> 1 AND num_bands <> 3 THEN
			RAISE NOTICE 'The JPEG format only permits one or three bands.  The first band will be used.';
			rast2 := st_band(rast, ARRAY[1]);
			num_bands := st_numbands(rast);
		ELSE
			rast2 := rast;
		END IF;

		-- JPEG only supports 8BUI pixeltype
		FOR i IN 1..num_bands LOOP
			IF st_bandpixeltype(rast, i) != '8BUI' THEN
				RAISE EXCEPTION 'The pixel type of band % in the raster is not 8BUI.  The JPEG format can only be used with the 8BUI pixel type.', i;
			END IF;
		END LOOP;

		RETURN st_asgdalraster(rast2, 'JPEG', $2, NULL);
	END;
	$_$;


ALTER FUNCTION public.st_asjpeg(rast raster, options text[]) OWNER TO postgres;

--
-- Name: st_asjpeg(raster, integer[], text[]); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_asjpeg(rast raster, nbands integer[], options text[] DEFAULT NULL::text[]) RETURNS bytea
    LANGUAGE sql IMMUTABLE
    AS $_$ SELECT st_asjpeg(st_band($1, $2), $3) $_$;


ALTER FUNCTION public.st_asjpeg(rast raster, nbands integer[], options text[]) OWNER TO postgres;

--
-- Name: st_asjpeg(raster, integer[], integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_asjpeg(rast raster, nbands integer[], quality integer) RETURNS bytea
    LANGUAGE plpgsql IMMUTABLE STRICT
    AS $_$
	DECLARE
		quality2 int;
		options text[];
	BEGIN
		IF quality IS NOT NULL THEN
			IF quality > 100 THEN
				quality2 := 100;
			ELSEIF quality < 10 THEN
				quality2 := 10;
			ELSE
				quality2 := quality;
			END IF;

			options := array_append(options, 'QUALITY=' || quality2);
		END IF;

		RETURN st_asjpeg(st_band($1, $2), options);
	END;
	$_$;


ALTER FUNCTION public.st_asjpeg(rast raster, nbands integer[], quality integer) OWNER TO postgres;

--
-- Name: st_asjpeg(raster, integer, text[]); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_asjpeg(rast raster, nband integer, options text[] DEFAULT NULL::text[]) RETURNS bytea
    LANGUAGE sql IMMUTABLE
    AS $_$ SELECT st_asjpeg(st_band($1, $2), $3) $_$;


ALTER FUNCTION public.st_asjpeg(rast raster, nband integer, options text[]) OWNER TO postgres;

--
-- Name: st_asjpeg(raster, integer, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_asjpeg(rast raster, nband integer, quality integer) RETURNS bytea
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$ SELECT st_asjpeg($1, ARRAY[$2], $3) $_$;


ALTER FUNCTION public.st_asjpeg(rast raster, nband integer, quality integer) OWNER TO postgres;

--
-- Name: st_askml(text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_askml(text) RETURNS text
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$ SELECT _ST_AsKML(2, $1::geometry, 15, null);  $_$;


ALTER FUNCTION public.st_askml(text) OWNER TO postgres;

--
-- Name: st_askml(geometry, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_askml(geom geometry, maxdecimaldigits integer DEFAULT 15) RETURNS text
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$ SELECT _ST_AsKML(2, ST_Transform($1,4326), $2, null); $_$;


ALTER FUNCTION public.st_askml(geom geometry, maxdecimaldigits integer) OWNER TO postgres;

--
-- Name: st_askml(geography, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_askml(geog geography, maxdecimaldigits integer DEFAULT 15) RETURNS text
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$SELECT _ST_AsKML(2, $1, $2, null)$_$;


ALTER FUNCTION public.st_askml(geog geography, maxdecimaldigits integer) OWNER TO postgres;

--
-- Name: st_askml(integer, geometry, integer, text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_askml(version integer, geom geometry, maxdecimaldigits integer DEFAULT 15, nprefix text DEFAULT NULL::text) RETURNS text
    LANGUAGE sql IMMUTABLE
    AS $_$ SELECT _ST_AsKML($1, ST_Transform($2,4326), $3, $4); $_$;


ALTER FUNCTION public.st_askml(version integer, geom geometry, maxdecimaldigits integer, nprefix text) OWNER TO postgres;

--
-- Name: st_askml(integer, geography, integer, text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_askml(version integer, geog geography, maxdecimaldigits integer DEFAULT 15, nprefix text DEFAULT NULL::text) RETURNS text
    LANGUAGE sql IMMUTABLE
    AS $_$SELECT _ST_AsKML($1, $2, $3, $4)$_$;


ALTER FUNCTION public.st_askml(version integer, geog geography, maxdecimaldigits integer, nprefix text) OWNER TO postgres;

--
-- Name: st_aslatlontext(geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_aslatlontext(geometry) RETURNS text
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$ SELECT ST_AsLatLonText($1, '') $_$;


ALTER FUNCTION public.st_aslatlontext(geometry) OWNER TO postgres;

--
-- Name: st_aslatlontext(geometry, text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_aslatlontext(geometry, text) RETURNS text
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-2.0', 'LWGEOM_to_latlon';


ALTER FUNCTION public.st_aslatlontext(geometry, text) OWNER TO postgres;

--
-- Name: st_aspect(raster, integer, text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_aspect(rast raster, band integer, pixeltype text) RETURNS raster
    LANGUAGE sql STABLE
    AS $_$ SELECT st_mapalgebrafctngb($1, $2, $3, 1, 1, '_st_aspect4ma(float[][], text, text[])'::regprocedure, 'value', st_pixelwidth($1)::text, st_pixelheight($1)::text) $_$;


ALTER FUNCTION public.st_aspect(rast raster, band integer, pixeltype text) OWNER TO postgres;

--
-- Name: st_aspng(raster, text[]); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_aspng(rast raster, options text[] DEFAULT NULL::text[]) RETURNS bytea
    LANGUAGE plpgsql IMMUTABLE
    AS $_$
	DECLARE
		rast2 raster;
		num_bands int;
		i int;
		pt text;
	BEGIN
		num_bands := st_numbands($1);

		-- PNG allows 1, 3 or 4 bands
		IF num_bands <> 1 AND num_bands <> 3 AND num_bands <> 4 THEN
			RAISE NOTICE 'The PNG format only permits one, three or four bands.  The first band will be used.';
			rast2 := st_band($1, ARRAY[1]);
			num_bands := st_numbands(rast2);
		ELSE
			rast2 := rast;
		END IF;

		-- PNG only supports 8BUI and 16BUI pixeltype
		FOR i IN 1..num_bands LOOP
			pt = st_bandpixeltype(rast, i);
			IF pt != '8BUI' AND pt != '16BUI' THEN
				RAISE EXCEPTION 'The pixel type of band % in the raster is not 8BUI or 16BUI.  The PNG format can only be used with 8BUI and 16BUI pixel types.', i;
			END IF;
		END LOOP;

		RETURN st_asgdalraster(rast2, 'PNG', $2, NULL);
	END;
	$_$;


ALTER FUNCTION public.st_aspng(rast raster, options text[]) OWNER TO postgres;

--
-- Name: st_aspng(raster, integer[], text[]); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_aspng(rast raster, nbands integer[], options text[] DEFAULT NULL::text[]) RETURNS bytea
    LANGUAGE sql IMMUTABLE
    AS $_$ SELECT st_aspng(st_band($1, $2), $3) $_$;


ALTER FUNCTION public.st_aspng(rast raster, nbands integer[], options text[]) OWNER TO postgres;

--
-- Name: st_aspng(raster, integer[], integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_aspng(rast raster, nbands integer[], compression integer) RETURNS bytea
    LANGUAGE plpgsql IMMUTABLE STRICT
    AS $_$
	DECLARE
		compression2 int;
		options text[];
	BEGIN
		IF compression IS NOT NULL THEN
			IF compression > 9 THEN
				compression2 := 9;
			ELSEIF compression < 1 THEN
				compression2 := 1;
			ELSE
				compression2 := compression;
			END IF;

			options := array_append(options, 'ZLEVEL=' || compression2);
		END IF;

		RETURN st_aspng(st_band($1, $2), options);
	END;
	$_$;


ALTER FUNCTION public.st_aspng(rast raster, nbands integer[], compression integer) OWNER TO postgres;

--
-- Name: st_aspng(raster, integer, text[]); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_aspng(rast raster, nband integer, options text[] DEFAULT NULL::text[]) RETURNS bytea
    LANGUAGE sql IMMUTABLE
    AS $_$ SELECT st_aspng(st_band($1, $2), $3) $_$;


ALTER FUNCTION public.st_aspng(rast raster, nband integer, options text[]) OWNER TO postgres;

--
-- Name: st_aspng(raster, integer, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_aspng(rast raster, nband integer, compression integer) RETURNS bytea
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$ SELECT st_aspng($1, ARRAY[$2], $3) $_$;


ALTER FUNCTION public.st_aspng(rast raster, nband integer, compression integer) OWNER TO postgres;

--
-- Name: st_asraster(geometry, raster, text[], double precision[], double precision[], boolean); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_asraster(geom geometry, ref raster, pixeltype text[] DEFAULT ARRAY['8BUI'::text], value double precision[] DEFAULT ARRAY[(1)::double precision], nodataval double precision[] DEFAULT ARRAY[(0)::double precision], touched boolean DEFAULT false) RETURNS raster
    LANGUAGE plpgsql STABLE
    AS $_$
	DECLARE
		g geometry;
		g_srid integer;

		ul_x double precision;
		ul_y double precision;
		scale_x double precision;
		scale_y double precision;
		skew_x double precision;
		skew_y double precision;
		sr_id integer;
	BEGIN
		SELECT upperleftx, upperlefty, scalex, scaley, skewx, skewy, srid INTO ul_x, ul_y, scale_x, scale_y, skew_x, skew_y, sr_id FROM ST_Metadata(ref);
		--RAISE NOTICE '%, %, %, %, %, %, %', ul_x, ul_y, scale_x, scale_y, skew_x, skew_y, sr_id;

		-- geometry and raster has different SRID
		g_srid := ST_SRID(geom);
		IF g_srid != sr_id THEN
			RAISE NOTICE 'The geometry''s SRID (%) is not the same as the raster''s SRID (%).  The geometry will be transformed to the raster''s projection', g_srid, sr_id;
			g := ST_Transform(geom, sr_id);
		ELSE
			g := geom;
		END IF;

		RETURN _st_asraster(g, scale_x, scale_y, NULL, NULL, $3, $4, $5, NULL, NULL, ul_x, ul_y, skew_x, skew_y, $6);
	END;
	$_$;


ALTER FUNCTION public.st_asraster(geom geometry, ref raster, pixeltype text[], value double precision[], nodataval double precision[], touched boolean) OWNER TO postgres;

--
-- Name: st_asraster(geometry, raster, text, double precision, double precision, boolean); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_asraster(geom geometry, ref raster, pixeltype text, value double precision DEFAULT 1, nodataval double precision DEFAULT 0, touched boolean DEFAULT false) RETURNS raster
    LANGUAGE sql STABLE
    AS $_$ SELECT st_asraster($1, $2, ARRAY[$3]::text[], ARRAY[$4]::double precision[], ARRAY[$5]::double precision[], $6) $_$;


ALTER FUNCTION public.st_asraster(geom geometry, ref raster, pixeltype text, value double precision, nodataval double precision, touched boolean) OWNER TO postgres;

--
-- Name: st_asraster(geometry, double precision, double precision, double precision, double precision, text[], double precision[], double precision[], double precision, double precision, boolean); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_asraster(geom geometry, scalex double precision, scaley double precision, gridx double precision DEFAULT NULL::double precision, gridy double precision DEFAULT NULL::double precision, pixeltype text[] DEFAULT ARRAY['8BUI'::text], value double precision[] DEFAULT ARRAY[(1)::double precision], nodataval double precision[] DEFAULT ARRAY[(0)::double precision], skewx double precision DEFAULT 0, skewy double precision DEFAULT 0, touched boolean DEFAULT false) RETURNS raster
    LANGUAGE sql STABLE
    AS $_$ SELECT _st_asraster($1, $2, $3, NULL, NULL, $6, $7, $8, NULL, NULL, $4, $5, $9, $10, $11) $_$;


ALTER FUNCTION public.st_asraster(geom geometry, scalex double precision, scaley double precision, gridx double precision, gridy double precision, pixeltype text[], value double precision[], nodataval double precision[], skewx double precision, skewy double precision, touched boolean) OWNER TO postgres;

--
-- Name: st_asraster(geometry, double precision, double precision, text[], double precision[], double precision[], double precision, double precision, double precision, double precision, boolean); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_asraster(geom geometry, scalex double precision, scaley double precision, pixeltype text[], value double precision[] DEFAULT ARRAY[(1)::double precision], nodataval double precision[] DEFAULT ARRAY[(0)::double precision], upperleftx double precision DEFAULT NULL::double precision, upperlefty double precision DEFAULT NULL::double precision, skewx double precision DEFAULT 0, skewy double precision DEFAULT 0, touched boolean DEFAULT false) RETURNS raster
    LANGUAGE sql STABLE
    AS $_$ SELECT _st_asraster($1, $2, $3, NULL, NULL, $4, $5, $6, $7, $8, NULL, NULL,	$9, $10, $11) $_$;


ALTER FUNCTION public.st_asraster(geom geometry, scalex double precision, scaley double precision, pixeltype text[], value double precision[], nodataval double precision[], upperleftx double precision, upperlefty double precision, skewx double precision, skewy double precision, touched boolean) OWNER TO postgres;

--
-- Name: st_asraster(geometry, integer, integer, double precision, double precision, text[], double precision[], double precision[], double precision, double precision, boolean); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_asraster(geom geometry, width integer, height integer, gridx double precision DEFAULT NULL::double precision, gridy double precision DEFAULT NULL::double precision, pixeltype text[] DEFAULT ARRAY['8BUI'::text], value double precision[] DEFAULT ARRAY[(1)::double precision], nodataval double precision[] DEFAULT ARRAY[(0)::double precision], skewx double precision DEFAULT 0, skewy double precision DEFAULT 0, touched boolean DEFAULT false) RETURNS raster
    LANGUAGE sql STABLE
    AS $_$ SELECT _st_asraster($1, NULL, NULL, $2, $3, $6, $7, $8, NULL, NULL, $4, $5, $9, $10, $11) $_$;


ALTER FUNCTION public.st_asraster(geom geometry, width integer, height integer, gridx double precision, gridy double precision, pixeltype text[], value double precision[], nodataval double precision[], skewx double precision, skewy double precision, touched boolean) OWNER TO postgres;

--
-- Name: st_asraster(geometry, integer, integer, text[], double precision[], double precision[], double precision, double precision, double precision, double precision, boolean); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_asraster(geom geometry, width integer, height integer, pixeltype text[], value double precision[] DEFAULT ARRAY[(1)::double precision], nodataval double precision[] DEFAULT ARRAY[(0)::double precision], upperleftx double precision DEFAULT NULL::double precision, upperlefty double precision DEFAULT NULL::double precision, skewx double precision DEFAULT 0, skewy double precision DEFAULT 0, touched boolean DEFAULT false) RETURNS raster
    LANGUAGE sql STABLE
    AS $_$ SELECT _st_asraster($1, NULL, NULL, $2, $3, $4, $5, $6, $7, $8, NULL, NULL,	$9, $10, $11) $_$;


ALTER FUNCTION public.st_asraster(geom geometry, width integer, height integer, pixeltype text[], value double precision[], nodataval double precision[], upperleftx double precision, upperlefty double precision, skewx double precision, skewy double precision, touched boolean) OWNER TO postgres;

--
-- Name: st_asraster(geometry, double precision, double precision, double precision, double precision, text, double precision, double precision, double precision, double precision, boolean); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_asraster(geom geometry, scalex double precision, scaley double precision, gridx double precision, gridy double precision, pixeltype text, value double precision DEFAULT 1, nodataval double precision DEFAULT 0, skewx double precision DEFAULT 0, skewy double precision DEFAULT 0, touched boolean DEFAULT false) RETURNS raster
    LANGUAGE sql STABLE
    AS $_$ SELECT _st_asraster($1, $2, $3, NULL, NULL, ARRAY[$6]::text[], ARRAY[$7]::double precision[], ARRAY[$8]::double precision[], NULL, NULL, $4, $5, $9, $10, $11) $_$;


ALTER FUNCTION public.st_asraster(geom geometry, scalex double precision, scaley double precision, gridx double precision, gridy double precision, pixeltype text, value double precision, nodataval double precision, skewx double precision, skewy double precision, touched boolean) OWNER TO postgres;

--
-- Name: st_asraster(geometry, double precision, double precision, text, double precision, double precision, double precision, double precision, double precision, double precision, boolean); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_asraster(geom geometry, scalex double precision, scaley double precision, pixeltype text, value double precision DEFAULT 1, nodataval double precision DEFAULT 0, upperleftx double precision DEFAULT NULL::double precision, upperlefty double precision DEFAULT NULL::double precision, skewx double precision DEFAULT 0, skewy double precision DEFAULT 0, touched boolean DEFAULT false) RETURNS raster
    LANGUAGE sql STABLE
    AS $_$ SELECT _st_asraster($1, $2, $3, NULL, NULL, ARRAY[$4]::text[], ARRAY[$5]::double precision[], ARRAY[$6]::double precision[], $7, $8, NULL, NULL, $9, $10, $11) $_$;


ALTER FUNCTION public.st_asraster(geom geometry, scalex double precision, scaley double precision, pixeltype text, value double precision, nodataval double precision, upperleftx double precision, upperlefty double precision, skewx double precision, skewy double precision, touched boolean) OWNER TO postgres;

--
-- Name: st_asraster(geometry, integer, integer, double precision, double precision, text, double precision, double precision, double precision, double precision, boolean); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_asraster(geom geometry, width integer, height integer, gridx double precision, gridy double precision, pixeltype text, value double precision DEFAULT 1, nodataval double precision DEFAULT 0, skewx double precision DEFAULT 0, skewy double precision DEFAULT 0, touched boolean DEFAULT false) RETURNS raster
    LANGUAGE sql STABLE
    AS $_$ SELECT _st_asraster($1, NULL, NULL, $2, $3, ARRAY[$6]::text[], ARRAY[$7]::double precision[], ARRAY[$8]::double precision[], NULL, NULL, $4, $5, $9, $10, $11) $_$;


ALTER FUNCTION public.st_asraster(geom geometry, width integer, height integer, gridx double precision, gridy double precision, pixeltype text, value double precision, nodataval double precision, skewx double precision, skewy double precision, touched boolean) OWNER TO postgres;

--
-- Name: st_asraster(geometry, integer, integer, text, double precision, double precision, double precision, double precision, double precision, double precision, boolean); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_asraster(geom geometry, width integer, height integer, pixeltype text, value double precision DEFAULT 1, nodataval double precision DEFAULT 0, upperleftx double precision DEFAULT NULL::double precision, upperlefty double precision DEFAULT NULL::double precision, skewx double precision DEFAULT 0, skewy double precision DEFAULT 0, touched boolean DEFAULT false) RETURNS raster
    LANGUAGE sql STABLE
    AS $_$ SELECT _st_asraster($1, NULL, NULL, $2, $3, ARRAY[$4]::text[], ARRAY[$5]::double precision[], ARRAY[$6]::double precision[], $7, $8, NULL, NULL,$9, $10, $11) $_$;


ALTER FUNCTION public.st_asraster(geom geometry, width integer, height integer, pixeltype text, value double precision, nodataval double precision, upperleftx double precision, upperlefty double precision, skewx double precision, skewy double precision, touched boolean) OWNER TO postgres;

--
-- Name: st_assvg(text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_assvg(text) RETURNS text
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$ SELECT ST_AsSVG($1::geometry,0,15);  $_$;


ALTER FUNCTION public.st_assvg(text) OWNER TO postgres;

--
-- Name: st_assvg(geometry, integer, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_assvg(geom geometry, rel integer DEFAULT 0, maxdecimaldigits integer DEFAULT 15) RETURNS text
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-2.0', 'LWGEOM_asSVG';


ALTER FUNCTION public.st_assvg(geom geometry, rel integer, maxdecimaldigits integer) OWNER TO postgres;

--
-- Name: st_assvg(geography, integer, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_assvg(geog geography, rel integer DEFAULT 0, maxdecimaldigits integer DEFAULT 15) RETURNS text
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-2.0', 'geography_as_svg';


ALTER FUNCTION public.st_assvg(geog geography, rel integer, maxdecimaldigits integer) OWNER TO postgres;

--
-- Name: st_astext(geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_astext(geometry) RETURNS text
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-2.0', 'LWGEOM_asText';


ALTER FUNCTION public.st_astext(geometry) OWNER TO postgres;

--
-- Name: st_astext(geography); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_astext(geography) RETURNS text
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-2.0', 'LWGEOM_asText';


ALTER FUNCTION public.st_astext(geography) OWNER TO postgres;

--
-- Name: st_astext(text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_astext(text) RETURNS text
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$ SELECT ST_AsText($1::geometry);  $_$;


ALTER FUNCTION public.st_astext(text) OWNER TO postgres;

--
-- Name: st_astiff(raster, text[], integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_astiff(rast raster, options text[] DEFAULT NULL::text[], srid integer DEFAULT NULL::integer) RETURNS bytea
    LANGUAGE plpgsql IMMUTABLE
    AS $_$
	DECLARE
		i int;
		num_bands int;
		nodata double precision;
		last_nodata double precision;
	BEGIN
		num_bands := st_numbands($1);

		-- TIFF only allows one NODATA value for ALL bands
		FOR i IN 1..num_bands LOOP
			nodata := st_bandnodatavalue($1, i);
			IF last_nodata IS NULL THEN
				last_nodata := nodata;
			ELSEIF nodata != last_nodata THEN
				RAISE NOTICE 'The TIFF format only permits one NODATA value for all bands.  The value used will be the last band with a NODATA value.';
			END IF;
		END LOOP;

		RETURN st_asgdalraster($1, 'GTiff', $2, $3);
	END;
	$_$;


ALTER FUNCTION public.st_astiff(rast raster, options text[], srid integer) OWNER TO postgres;

--
-- Name: st_astiff(raster, text, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_astiff(rast raster, compression text, srid integer DEFAULT NULL::integer) RETURNS bytea
    LANGUAGE plpgsql IMMUTABLE
    AS $_$
	DECLARE
		compression2 text;
		c_type text;
		c_level int;
		i int;
		num_bands int;
		options text[];
	BEGIN
		compression2 := trim(both from upper(compression));

		IF length(compression2) > 0 THEN
			-- JPEG
			IF position('JPEG' in compression2) != 0 THEN
				c_type := 'JPEG';
				c_level := substring(compression2 from '[0-9]+$');

				IF c_level IS NOT NULL THEN
					IF c_level > 100 THEN
						c_level := 100;
					ELSEIF c_level < 1 THEN
						c_level := 1;
					END IF;

					options := array_append(options, 'JPEG_QUALITY=' || c_level);
				END IF;

				-- per band pixel type check
				num_bands := st_numbands($1);
				FOR i IN 1..num_bands LOOP
					IF st_bandpixeltype($1, i) != '8BUI' THEN
						RAISE EXCEPTION 'The pixel type of band % in the raster is not 8BUI.  JPEG compression can only be used with the 8BUI pixel type.', i;
					END IF;
				END LOOP;

			-- DEFLATE
			ELSEIF position('DEFLATE' in compression2) != 0 THEN
				c_type := 'DEFLATE';
				c_level := substring(compression2 from '[0-9]+$');

				IF c_level IS NOT NULL THEN
					IF c_level > 9 THEN
						c_level := 9;
					ELSEIF c_level < 1 THEN
						c_level := 1;
					END IF;

					options := array_append(options, 'ZLEVEL=' || c_level);
				END IF;

			ELSE
				c_type := compression2;

				-- CCITT
				IF position('CCITT' in compression2) THEN
					-- per band pixel type check
					num_bands := st_numbands($1);
					FOR i IN 1..num_bands LOOP
						IF st_bandpixeltype($1, i) != '1BB' THEN
							RAISE EXCEPTION 'The pixel type of band % in the raster is not 1BB.  CCITT compression can only be used with the 1BB pixel type.', i;
						END IF;
					END LOOP;
				END IF;

			END IF;

			-- compression type check
			IF ARRAY[c_type] <@ ARRAY['JPEG', 'LZW', 'PACKBITS', 'DEFLATE', 'CCITTRLE', 'CCITTFAX3', 'CCITTFAX4', 'NONE'] THEN
				options := array_append(options, 'COMPRESS=' || c_type);
			ELSE
				RAISE NOTICE 'Unknown compression type: %.  The outputted TIFF will not be COMPRESSED.', c_type;
			END IF;
		END IF;

		RETURN st_astiff($1, options, $3);
	END;
	$_$;


ALTER FUNCTION public.st_astiff(rast raster, compression text, srid integer) OWNER TO postgres;

--
-- Name: st_astiff(raster, integer[], text[], integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_astiff(rast raster, nbands integer[], options text[] DEFAULT NULL::text[], srid integer DEFAULT NULL::integer) RETURNS bytea
    LANGUAGE sql IMMUTABLE
    AS $_$ SELECT st_astiff(st_band($1, $2), $3, $4) $_$;


ALTER FUNCTION public.st_astiff(rast raster, nbands integer[], options text[], srid integer) OWNER TO postgres;

--
-- Name: st_astiff(raster, integer[], text, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_astiff(rast raster, nbands integer[], compression text, srid integer DEFAULT NULL::integer) RETURNS bytea
    LANGUAGE sql IMMUTABLE
    AS $_$ SELECT st_astiff(st_band($1, $2), $3, $4) $_$;


ALTER FUNCTION public.st_astiff(rast raster, nbands integer[], compression text, srid integer) OWNER TO postgres;

--
-- Name: st_asx3d(geometry, integer, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_asx3d(geom geometry, maxdecimaldigits integer DEFAULT 15, options integer DEFAULT 0) RETURNS text
    LANGUAGE sql IMMUTABLE
    AS $_$SELECT _ST_AsX3D(3,$1,$2,$3,'');$_$;


ALTER FUNCTION public.st_asx3d(geom geometry, maxdecimaldigits integer, options integer) OWNER TO postgres;

--
-- Name: st_azimuth(geometry, geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_azimuth(geom1 geometry, geom2 geometry) RETURNS double precision
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-2.0', 'LWGEOM_azimuth';


ALTER FUNCTION public.st_azimuth(geom1 geometry, geom2 geometry) OWNER TO postgres;

--
-- Name: st_azimuth(geography, geography); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_azimuth(geog1 geography, geog2 geography) RETURNS double precision
    LANGUAGE c IMMUTABLE STRICT COST 100
    AS '$libdir/postgis-2.0', 'geography_azimuth';


ALTER FUNCTION public.st_azimuth(geog1 geography, geog2 geography) OWNER TO postgres;

--
-- Name: st_band(raster, integer[]); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_band(rast raster, nbands integer[] DEFAULT ARRAY[1]) RETURNS raster
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/rtpostgis-2.0', 'RASTER_band';


ALTER FUNCTION public.st_band(rast raster, nbands integer[]) OWNER TO postgres;

--
-- Name: st_band(raster, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_band(rast raster, nband integer) RETURNS raster
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$ SELECT st_band($1, ARRAY[$2]) $_$;


ALTER FUNCTION public.st_band(rast raster, nband integer) OWNER TO postgres;

--
-- Name: st_band(raster, text, character); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_band(rast raster, nbands text, delimiter character DEFAULT ','::bpchar) RETURNS raster
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$ SELECT st_band($1, regexp_split_to_array(regexp_replace($2, '[[:space:]]', '', 'g'), $3)::int[]) $_$;


ALTER FUNCTION public.st_band(rast raster, nbands text, delimiter character) OWNER TO postgres;

--
-- Name: st_bandisnodata(raster, boolean); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_bandisnodata(rast raster, forcechecking boolean) RETURNS boolean
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$ SELECT st_bandisnodata($1, 1, $2) $_$;


ALTER FUNCTION public.st_bandisnodata(rast raster, forcechecking boolean) OWNER TO postgres;

--
-- Name: st_bandisnodata(raster, integer, boolean); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_bandisnodata(rast raster, band integer DEFAULT 1, forcechecking boolean DEFAULT false) RETURNS boolean
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/rtpostgis-2.0', 'RASTER_bandIsNoData';


ALTER FUNCTION public.st_bandisnodata(rast raster, band integer, forcechecking boolean) OWNER TO postgres;

--
-- Name: st_bandmetadata(raster, integer[]); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_bandmetadata(rast raster, band integer[], OUT bandnum integer, OUT pixeltype text, OUT nodatavalue double precision, OUT isoutdb boolean, OUT path text) RETURNS record
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/rtpostgis-2.0', 'RASTER_bandmetadata';


ALTER FUNCTION public.st_bandmetadata(rast raster, band integer[], OUT bandnum integer, OUT pixeltype text, OUT nodatavalue double precision, OUT isoutdb boolean, OUT path text) OWNER TO postgres;

--
-- Name: st_bandmetadata(raster, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_bandmetadata(rast raster, band integer DEFAULT 1, OUT pixeltype text, OUT nodatavalue double precision, OUT isoutdb boolean, OUT path text) RETURNS record
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$ SELECT pixeltype, nodatavalue, isoutdb, path FROM st_bandmetadata($1, ARRAY[$2]::int[]) LIMIT 1 $_$;


ALTER FUNCTION public.st_bandmetadata(rast raster, band integer, OUT pixeltype text, OUT nodatavalue double precision, OUT isoutdb boolean, OUT path text) OWNER TO postgres;

--
-- Name: st_bandnodatavalue(raster, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_bandnodatavalue(rast raster, band integer DEFAULT 1) RETURNS double precision
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/rtpostgis-2.0', 'RASTER_getBandNoDataValue';


ALTER FUNCTION public.st_bandnodatavalue(rast raster, band integer) OWNER TO postgres;

--
-- Name: st_bandpath(raster, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_bandpath(rast raster, band integer DEFAULT 1) RETURNS text
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/rtpostgis-2.0', 'RASTER_getBandPath';


ALTER FUNCTION public.st_bandpath(rast raster, band integer) OWNER TO postgres;

--
-- Name: st_bandpixeltype(raster, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_bandpixeltype(rast raster, band integer DEFAULT 1) RETURNS text
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/rtpostgis-2.0', 'RASTER_getBandPixelTypeName';


ALTER FUNCTION public.st_bandpixeltype(rast raster, band integer) OWNER TO postgres;

--
-- Name: st_bdmpolyfromtext(text, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_bdmpolyfromtext(text, integer) RETURNS geometry
    LANGUAGE plpgsql IMMUTABLE STRICT
    AS $_$
DECLARE
	geomtext alias for $1;
	srid alias for $2;
	mline geometry;
	geom geometry;
BEGIN
	mline := ST_MultiLineStringFromText(geomtext, srid);

	IF mline IS NULL
	THEN
		RAISE EXCEPTION 'Input is not a MultiLinestring';
	END IF;

	geom := ST_Multi(ST_BuildArea(mline));

	RETURN geom;
END;
$_$;


ALTER FUNCTION public.st_bdmpolyfromtext(text, integer) OWNER TO postgres;

--
-- Name: st_bdpolyfromtext(text, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_bdpolyfromtext(text, integer) RETURNS geometry
    LANGUAGE plpgsql IMMUTABLE STRICT
    AS $_$
DECLARE
	geomtext alias for $1;
	srid alias for $2;
	mline geometry;
	geom geometry;
BEGIN
	mline := ST_MultiLineStringFromText(geomtext, srid);

	IF mline IS NULL
	THEN
		RAISE EXCEPTION 'Input is not a MultiLinestring';
	END IF;

	geom := ST_BuildArea(mline);

	IF GeometryType(geom) != 'POLYGON'
	THEN
		RAISE EXCEPTION 'Input returns more then a single polygon, try using BdMPolyFromText instead';
	END IF;

	RETURN geom;
END;
$_$;


ALTER FUNCTION public.st_bdpolyfromtext(text, integer) OWNER TO postgres;

--
-- Name: st_boundary(geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_boundary(geometry) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-2.0', 'boundary';


ALTER FUNCTION public.st_boundary(geometry) OWNER TO postgres;

--
-- Name: st_buffer(geometry, double precision); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_buffer(geometry, double precision) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT COST 100
    AS '$libdir/postgis-2.0', 'buffer';


ALTER FUNCTION public.st_buffer(geometry, double precision) OWNER TO postgres;

--
-- Name: st_buffer(geography, double precision); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_buffer(geography, double precision) RETURNS geography
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$SELECT geography(ST_Transform(ST_Buffer(ST_Transform(geometry($1), _ST_BestSRID($1)), $2), 4326))$_$;


ALTER FUNCTION public.st_buffer(geography, double precision) OWNER TO postgres;

--
-- Name: st_buffer(text, double precision); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_buffer(text, double precision) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$ SELECT ST_Buffer($1::geometry, $2);  $_$;


ALTER FUNCTION public.st_buffer(text, double precision) OWNER TO postgres;

--
-- Name: st_buffer(geometry, double precision, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_buffer(geometry, double precision, integer) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$ SELECT _ST_Buffer($1, $2,
		CAST('quad_segs='||CAST($3 AS text) as cstring))
	   $_$;


ALTER FUNCTION public.st_buffer(geometry, double precision, integer) OWNER TO postgres;

--
-- Name: st_buffer(geometry, double precision, text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_buffer(geometry, double precision, text) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$ SELECT _ST_Buffer($1, $2,
		CAST( regexp_replace($3, '^[0123456789]+$',
			'quad_segs='||$3) AS cstring)
		)
	   $_$;


ALTER FUNCTION public.st_buffer(geometry, double precision, text) OWNER TO postgres;

--
-- Name: st_buildarea(geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_buildarea(geometry) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT COST 100
    AS '$libdir/postgis-2.0', 'ST_BuildArea';


ALTER FUNCTION public.st_buildarea(geometry) OWNER TO postgres;

--
-- Name: st_centroid(geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_centroid(geometry) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-2.0', 'centroid';


ALTER FUNCTION public.st_centroid(geometry) OWNER TO postgres;

--
-- Name: st_cleangeometry(geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_cleangeometry(geometry) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT COST 100
    AS '$libdir/postgis-2.0', 'ST_CleanGeometry';


ALTER FUNCTION public.st_cleangeometry(geometry) OWNER TO postgres;

--
-- Name: st_clip(raster, geometry, boolean); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_clip(rast raster, geom geometry, crop boolean) RETURNS raster
    LANGUAGE sql STABLE
    AS $_$ SELECT ST_Clip($1, NULL, $2, null::float8[], $3) $_$;


ALTER FUNCTION public.st_clip(rast raster, geom geometry, crop boolean) OWNER TO postgres;

--
-- Name: st_clip(raster, integer, geometry, boolean); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_clip(rast raster, band integer, geom geometry, crop boolean) RETURNS raster
    LANGUAGE sql STABLE
    AS $_$ SELECT ST_Clip($1, $2, $3, null::float8[], $4) $_$;


ALTER FUNCTION public.st_clip(rast raster, band integer, geom geometry, crop boolean) OWNER TO postgres;

--
-- Name: st_clip(raster, geometry, double precision[], boolean); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_clip(rast raster, geom geometry, nodataval double precision[] DEFAULT NULL::double precision[], crop boolean DEFAULT true) RETURNS raster
    LANGUAGE sql STABLE
    AS $_$ SELECT ST_Clip($1, NULL, $2, $3, $4) $_$;


ALTER FUNCTION public.st_clip(rast raster, geom geometry, nodataval double precision[], crop boolean) OWNER TO postgres;

--
-- Name: st_clip(raster, geometry, double precision, boolean); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_clip(rast raster, geom geometry, nodataval double precision, crop boolean DEFAULT true) RETURNS raster
    LANGUAGE sql STABLE
    AS $_$ SELECT ST_Clip($1, NULL, $2, ARRAY[$3], $4) $_$;


ALTER FUNCTION public.st_clip(rast raster, geom geometry, nodataval double precision, crop boolean) OWNER TO postgres;

--
-- Name: st_clip(raster, integer, geometry, double precision[], boolean); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_clip(rast raster, band integer, geom geometry, nodataval double precision[] DEFAULT NULL::double precision[], crop boolean DEFAULT true) RETURNS raster
    LANGUAGE plpgsql STABLE
    AS $$
	DECLARE
		newrast raster;
		geomrast raster;
		numband int;
		bandstart int;
		bandend int;
		newextent text;
		newnodataval double precision;
		newpixtype text;
		bandi int;
	BEGIN
		IF rast IS NULL THEN
			RETURN NULL;
		END IF;
		IF geom IS NULL THEN
			RETURN rast;
		END IF;
		numband := ST_Numbands(rast);
		IF band IS NULL THEN
			bandstart := 1;
			bandend := numband;
		ELSEIF ST_HasNoBand(rast, band) THEN
			RAISE NOTICE 'Raster do not have band %. Returning null', band;
			RETURN NULL;
		ELSE
			bandstart := band;
			bandend := band;
		END IF;

		newpixtype := ST_BandPixelType(rast, bandstart);
		newnodataval := coalesce(nodataval[1], ST_BandNodataValue(rast, bandstart), ST_MinPossibleValue(newpixtype));
		newextent := CASE WHEN crop THEN 'INTERSECTION' ELSE 'FIRST' END;

		-- Convert the geometry to a raster
		geomrast := ST_AsRaster(geom, rast, ST_BandPixelType(rast, band), 1, newnodataval);

		-- Compute the first raster band
		newrast := ST_MapAlgebraExpr(rast, bandstart, geomrast, 1, '[rast1.val]', newpixtype, newextent, newnodataval::text, newnodataval::text, newnodataval);
		-- Set the newnodataval
		newrast := ST_SetBandNodataValue(newrast, bandstart, newnodataval);

		FOR bandi IN bandstart+1..bandend LOOP
			-- for each band we must determine the nodata value
			newpixtype := ST_BandPixelType(rast, bandi);
			newnodataval := coalesce(nodataval[bandi], nodataval[array_upper(nodataval, 1)], ST_BandNodataValue(rast, bandi), ST_MinPossibleValue(newpixtype));
			newrast := ST_AddBand(newrast, ST_MapAlgebraExpr(rast, bandi, geomrast, 1, '[rast1.val]', newpixtype, newextent, newnodataval::text, newnodataval::text, newnodataval));
			newrast := ST_SetBandNodataValue(newrast, bandi, newnodataval);
		END LOOP;

		RETURN newrast;
	END;
	$$;


ALTER FUNCTION public.st_clip(rast raster, band integer, geom geometry, nodataval double precision[], crop boolean) OWNER TO postgres;

--
-- Name: st_clip(raster, integer, geometry, double precision, boolean); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_clip(rast raster, band integer, geom geometry, nodataval double precision, crop boolean DEFAULT true) RETURNS raster
    LANGUAGE sql STABLE
    AS $_$ SELECT ST_Clip($1, $2, $3, ARRAY[$4], $5) $_$;


ALTER FUNCTION public.st_clip(rast raster, band integer, geom geometry, nodataval double precision, crop boolean) OWNER TO postgres;

--
-- Name: st_closestpoint(geometry, geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_closestpoint(geom1 geometry, geom2 geometry) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-2.0', 'LWGEOM_closestpoint';


ALTER FUNCTION public.st_closestpoint(geom1 geometry, geom2 geometry) OWNER TO postgres;

--
-- Name: st_collect(geometry[]); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_collect(geometry[]) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-2.0', 'LWGEOM_collect_garray';


ALTER FUNCTION public.st_collect(geometry[]) OWNER TO postgres;

--
-- Name: st_collect(geometry, geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_collect(geom1 geometry, geom2 geometry) RETURNS geometry
    LANGUAGE c IMMUTABLE
    AS '$libdir/postgis-2.0', 'LWGEOM_collect';


ALTER FUNCTION public.st_collect(geom1 geometry, geom2 geometry) OWNER TO postgres;

--
-- Name: st_collectionextract(geometry, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_collectionextract(geometry, integer) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-2.0', 'ST_CollectionExtract';


ALTER FUNCTION public.st_collectionextract(geometry, integer) OWNER TO postgres;

--
-- Name: st_collectionhomogenize(geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_collectionhomogenize(geometry) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-2.0', 'ST_CollectionHomogenize';


ALTER FUNCTION public.st_collectionhomogenize(geometry) OWNER TO postgres;

--
-- Name: st_combine_bbox(box2d, geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_combine_bbox(box2d, geometry) RETURNS box2d
    LANGUAGE c IMMUTABLE
    AS '$libdir/postgis-2.0', 'BOX2D_combine';


ALTER FUNCTION public.st_combine_bbox(box2d, geometry) OWNER TO postgres;

--
-- Name: st_combine_bbox(box3d, geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_combine_bbox(box3d, geometry) RETURNS box3d
    LANGUAGE c IMMUTABLE
    AS '$libdir/postgis-2.0', 'BOX3D_combine';


ALTER FUNCTION public.st_combine_bbox(box3d, geometry) OWNER TO postgres;

--
-- Name: st_concavehull(geometry, double precision, boolean); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_concavehull(param_geom geometry, param_pctconvex double precision, param_allow_holes boolean DEFAULT false) RETURNS geometry
    LANGUAGE plpgsql IMMUTABLE STRICT
    AS $$
	DECLARE
		var_convhull geometry := ST_ConvexHull(param_geom);
		var_param_geom geometry := param_geom;
		var_initarea float := ST_Area(var_convhull);
		var_newarea float := var_initarea;
		var_div integer := 6; 
		var_tempgeom geometry;
		var_tempgeom2 geometry;
		var_cent geometry;
		var_geoms geometry[4]; 
		var_enline geometry;
		var_resultgeom geometry;
		var_atempgeoms geometry[];
		var_buf float := 1; 
	BEGIN
		-- We start with convex hull as our base
		var_resultgeom := var_convhull;
		
		IF param_pctconvex = 1 THEN
			return var_resultgeom;
		ELSIF ST_GeometryType(var_param_geom) = 'ST_Polygon' THEN -- it is as concave as it is going to get
			IF param_allow_holes THEN -- leave the holes
				RETURN var_param_geom;
			ELSE -- remove the holes
				var_resultgeom := ST_MakePolygon(ST_ExteriorRing(var_param_geom));
				RETURN var_resultgeom;
			END IF;
		END IF;
		IF ST_Dimension(var_resultgeom) > 1 AND param_pctconvex BETWEEN 0 and 0.98 THEN
		-- get linestring that forms envelope of geometry
			var_enline := ST_Boundary(ST_Envelope(var_param_geom));
			var_buf := ST_Length(var_enline)/1000.0;
			IF ST_GeometryType(var_param_geom) = 'ST_MultiPoint' AND ST_NumGeometries(var_param_geom) BETWEEN 4 and 200 THEN
			-- we make polygons out of points since they are easier to cave in. 
			-- Note we limit to between 4 and 200 points because this process is slow and gets quadratically slow
				var_buf := sqrt(ST_Area(var_convhull)*0.8/(ST_NumGeometries(var_param_geom)*ST_NumGeometries(var_param_geom)));
				var_atempgeoms := ARRAY(SELECT geom FROM ST_DumpPoints(var_param_geom));
				-- 5 and 10 and just fudge factors
				var_tempgeom := ST_Union(ARRAY(SELECT geom
						FROM (
						-- fuse near neighbors together
						SELECT DISTINCT ON (i) i,  ST_Distance(var_atempgeoms[i],var_atempgeoms[j]), ST_Buffer(ST_MakeLine(var_atempgeoms[i], var_atempgeoms[j]) , var_buf*5, 'quad_segs=3') As geom
								FROM generate_series(1,array_upper(var_atempgeoms, 1)) As i
									INNER JOIN generate_series(1,array_upper(var_atempgeoms, 1)) As j 
										ON (
								 NOT ST_Intersects(var_atempgeoms[i],var_atempgeoms[j])
									AND ST_DWithin(var_atempgeoms[i],var_atempgeoms[j], var_buf*10)
									)
								UNION ALL
						-- catch the ones with no near neighbors
								SELECT i, 0, ST_Buffer(var_atempgeoms[i] , var_buf*10, 'quad_segs=3') As geom
								FROM generate_series(1,array_upper(var_atempgeoms, 1)) As i
									LEFT JOIN generate_series(ceiling(array_upper(var_atempgeoms,1)/2)::integer,array_upper(var_atempgeoms, 1)) As j 
										ON (
								 NOT ST_Intersects(var_atempgeoms[i],var_atempgeoms[j])
									AND ST_DWithin(var_atempgeoms[i],var_atempgeoms[j], var_buf*10) 
									)
									WHERE j IS NULL
								ORDER BY 1, 2
							) As foo	) );
				IF ST_IsValid(var_tempgeom) AND ST_GeometryType(var_tempgeom) = 'ST_Polygon' THEN
					var_tempgeom := ST_Intersection(var_tempgeom, var_convhull);
					IF param_allow_holes THEN
						var_param_geom := var_tempgeom;
					ELSE
						var_param_geom := ST_MakePolygon(ST_ExteriorRing(var_tempgeom));
					END IF;
					return var_param_geom;
				ELSIF ST_IsValid(var_tempgeom) THEN
					var_param_geom := ST_Intersection(var_tempgeom, var_convhull);	
				END IF;
			END IF;

			IF ST_GeometryType(var_param_geom) = 'ST_Polygon' THEN
				IF NOT param_allow_holes THEN
					var_param_geom := ST_MakePolygon(ST_ExteriorRing(var_param_geom));
				END IF;
				return var_param_geom;
			END IF;
            var_cent := ST_Centroid(var_param_geom);
            IF (ST_XMax(var_enline) - ST_XMin(var_enline) ) > var_buf AND (ST_YMax(var_enline) - ST_YMin(var_enline) ) > var_buf THEN
                    IF ST_Dwithin(ST_Centroid(var_convhull) , ST_Centroid(ST_Envelope(var_param_geom)), var_buf/2) THEN
                -- If the geometric dimension is > 1 and the object is symettric (cutting at centroid will not work -- offset a bit)
                        var_cent := ST_Translate(var_cent, (ST_XMax(var_enline) - ST_XMin(var_enline))/1000,  (ST_YMAX(var_enline) - ST_YMin(var_enline))/1000);
                    ELSE
                        -- uses closest point on geometry to centroid. I can't explain why we are doing this
                        var_cent := ST_ClosestPoint(var_param_geom,var_cent);
                    END IF;
                    IF ST_DWithin(var_cent, var_enline,var_buf) THEN
                        var_cent := ST_centroid(ST_Envelope(var_param_geom));
                    END IF;
                    -- break envelope into 4 triangles about the centroid of the geometry and returned the clipped geometry in each quadrant
                    FOR i in 1 .. 4 LOOP
                       var_geoms[i] := ST_MakePolygon(ST_MakeLine(ARRAY[ST_PointN(var_enline,i), ST_PointN(var_enline,i+1), var_cent, ST_PointN(var_enline,i)]));
                       var_geoms[i] := ST_Intersection(var_param_geom, ST_Buffer(var_geoms[i],var_buf));
                       IF ST_IsValid(var_geoms[i]) THEN 
                            
                       ELSE
                            var_geoms[i] := ST_BuildArea(ST_MakeLine(ARRAY[ST_PointN(var_enline,i), ST_PointN(var_enline,i+1), var_cent, ST_PointN(var_enline,i)]));
                       END IF; 
                    END LOOP;
                    var_tempgeom := ST_Union(ARRAY[ST_ConvexHull(var_geoms[1]), ST_ConvexHull(var_geoms[2]) , ST_ConvexHull(var_geoms[3]), ST_ConvexHull(var_geoms[4])]); 
                    --RAISE NOTICE 'Curr vex % ', ST_AsText(var_tempgeom);
                    IF ST_Area(var_tempgeom) <= var_newarea AND ST_IsValid(var_tempgeom)  THEN --AND ST_GeometryType(var_tempgeom) ILIKE '%Polygon'
                        
                        var_tempgeom := ST_Buffer(ST_ConcaveHull(var_geoms[1],least(param_pctconvex + param_pctconvex/var_div),true),var_buf, 'quad_segs=2');
                        FOR i IN 1 .. 4 LOOP
                            var_geoms[i] := ST_Buffer(ST_ConcaveHull(var_geoms[i],least(param_pctconvex + param_pctconvex/var_div),true), var_buf, 'quad_segs=2');
                            IF ST_IsValid(var_geoms[i]) Then
                                var_tempgeom := ST_Union(var_tempgeom, var_geoms[i]);
                            ELSE
                                RAISE NOTICE 'Not valid % %', i, ST_AsText(var_tempgeom);
                                var_tempgeom := ST_Union(var_tempgeom, ST_ConvexHull(var_geoms[i]));
                            END IF; 
                        END LOOP;

                        --RAISE NOTICE 'Curr concave % ', ST_AsText(var_tempgeom);
                        IF ST_IsValid(var_tempgeom) THEN
                            var_resultgeom := var_tempgeom;
                        END IF;
                        var_newarea := ST_Area(var_resultgeom);
                    ELSIF ST_IsValid(var_tempgeom) THEN
                        var_resultgeom := var_tempgeom;
                    END IF;

                    IF ST_NumGeometries(var_resultgeom) > 1  THEN
                        var_tempgeom := _ST_ConcaveHull(var_resultgeom);
                        IF ST_IsValid(var_tempgeom) AND ST_GeometryType(var_tempgeom) ILIKE 'ST_Polygon' THEN
                            var_resultgeom := var_tempgeom;
                        ELSE
                            var_resultgeom := ST_Buffer(var_tempgeom,var_buf, 'quad_segs=2');
                        END IF;
                    END IF;
                    IF param_allow_holes = false THEN 
                    -- only keep exterior ring since we do not want holes
                        var_resultgeom := ST_MakePolygon(ST_ExteriorRing(var_resultgeom));
                    END IF;
                ELSE
                    var_resultgeom := ST_Buffer(var_resultgeom,var_buf);
                END IF;
                var_resultgeom := ST_Intersection(var_resultgeom, ST_ConvexHull(var_param_geom));
            ELSE
                -- dimensions are too small to cut
                var_resultgeom := _ST_ConcaveHull(var_param_geom);
            END IF;
            RETURN var_resultgeom;
	END;
$$;


ALTER FUNCTION public.st_concavehull(param_geom geometry, param_pctconvex double precision, param_allow_holes boolean) OWNER TO postgres;

--
-- Name: st_contains(geometry, geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_contains(geom1 geometry, geom2 geometry) RETURNS boolean
    LANGUAGE sql IMMUTABLE
    AS $_$SELECT $1 && $2 AND _ST_Contains($1,$2)$_$;


ALTER FUNCTION public.st_contains(geom1 geometry, geom2 geometry) OWNER TO postgres;

--
-- Name: st_containsproperly(geometry, geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_containsproperly(geom1 geometry, geom2 geometry) RETURNS boolean
    LANGUAGE sql IMMUTABLE
    AS $_$SELECT $1 && $2 AND _ST_ContainsProperly($1,$2)$_$;


ALTER FUNCTION public.st_containsproperly(geom1 geometry, geom2 geometry) OWNER TO postgres;

--
-- Name: st_convexhull(geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_convexhull(geometry) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT COST 100
    AS '$libdir/postgis-2.0', 'convexhull';


ALTER FUNCTION public.st_convexhull(geometry) OWNER TO postgres;

--
-- Name: st_convexhull(raster); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_convexhull(raster) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/rtpostgis-2.0', 'RASTER_convex_hull';


ALTER FUNCTION public.st_convexhull(raster) OWNER TO postgres;

--
-- Name: st_coorddim(geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_coorddim(geometry geometry) RETURNS smallint
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-2.0', 'LWGEOM_ndims';


ALTER FUNCTION public.st_coorddim(geometry geometry) OWNER TO postgres;

--
-- Name: st_count(raster, boolean); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_count(rast raster, exclude_nodata_value boolean) RETURNS bigint
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$ SELECT _st_count($1, 1, $2, 1) $_$;


ALTER FUNCTION public.st_count(rast raster, exclude_nodata_value boolean) OWNER TO postgres;

--
-- Name: st_count(raster, integer, boolean); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_count(rast raster, nband integer DEFAULT 1, exclude_nodata_value boolean DEFAULT true) RETURNS bigint
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$ SELECT _st_count($1, $2, $3, 1) $_$;


ALTER FUNCTION public.st_count(rast raster, nband integer, exclude_nodata_value boolean) OWNER TO postgres;

--
-- Name: st_count(text, text, boolean); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_count(rastertable text, rastercolumn text, exclude_nodata_value boolean) RETURNS bigint
    LANGUAGE sql STABLE STRICT
    AS $_$ SELECT _st_count($1, $2, 1, $3, 1) $_$;


ALTER FUNCTION public.st_count(rastertable text, rastercolumn text, exclude_nodata_value boolean) OWNER TO postgres;

--
-- Name: st_count(text, text, integer, boolean); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_count(rastertable text, rastercolumn text, nband integer DEFAULT 1, exclude_nodata_value boolean DEFAULT true) RETURNS bigint
    LANGUAGE sql STABLE STRICT
    AS $_$ SELECT _st_count($1, $2, $3, $4, 1) $_$;


ALTER FUNCTION public.st_count(rastertable text, rastercolumn text, nband integer, exclude_nodata_value boolean) OWNER TO postgres;

--
-- Name: st_coveredby(geometry, geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_coveredby(geom1 geometry, geom2 geometry) RETURNS boolean
    LANGUAGE sql IMMUTABLE
    AS $_$SELECT $1 && $2 AND _ST_CoveredBy($1,$2)$_$;


ALTER FUNCTION public.st_coveredby(geom1 geometry, geom2 geometry) OWNER TO postgres;

--
-- Name: st_coveredby(geography, geography); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_coveredby(geography, geography) RETURNS boolean
    LANGUAGE sql IMMUTABLE
    AS $_$SELECT $1 && $2 AND _ST_Covers($2, $1)$_$;


ALTER FUNCTION public.st_coveredby(geography, geography) OWNER TO postgres;

--
-- Name: st_coveredby(text, text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_coveredby(text, text) RETURNS boolean
    LANGUAGE sql IMMUTABLE
    AS $_$ SELECT ST_CoveredBy($1::geometry, $2::geometry);  $_$;


ALTER FUNCTION public.st_coveredby(text, text) OWNER TO postgres;

--
-- Name: st_covers(geometry, geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_covers(geom1 geometry, geom2 geometry) RETURNS boolean
    LANGUAGE sql IMMUTABLE
    AS $_$SELECT $1 && $2 AND _ST_Covers($1,$2)$_$;


ALTER FUNCTION public.st_covers(geom1 geometry, geom2 geometry) OWNER TO postgres;

--
-- Name: st_covers(geography, geography); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_covers(geography, geography) RETURNS boolean
    LANGUAGE sql IMMUTABLE
    AS $_$SELECT $1 && $2 AND _ST_Covers($1, $2)$_$;


ALTER FUNCTION public.st_covers(geography, geography) OWNER TO postgres;

--
-- Name: st_covers(text, text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_covers(text, text) RETURNS boolean
    LANGUAGE sql IMMUTABLE
    AS $_$ SELECT ST_Covers($1::geometry, $2::geometry);  $_$;


ALTER FUNCTION public.st_covers(text, text) OWNER TO postgres;

--
-- Name: st_crosses(geometry, geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_crosses(geom1 geometry, geom2 geometry) RETURNS boolean
    LANGUAGE sql IMMUTABLE
    AS $_$SELECT $1 && $2 AND _ST_Crosses($1,$2)$_$;


ALTER FUNCTION public.st_crosses(geom1 geometry, geom2 geometry) OWNER TO postgres;

--
-- Name: st_curvetoline(geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_curvetoline(geometry) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$SELECT ST_CurveToLine($1, 32)$_$;


ALTER FUNCTION public.st_curvetoline(geometry) OWNER TO postgres;

--
-- Name: st_curvetoline(geometry, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_curvetoline(geometry, integer) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-2.0', 'LWGEOM_curve_segmentize';


ALTER FUNCTION public.st_curvetoline(geometry, integer) OWNER TO postgres;

--
-- Name: st_dfullywithin(geometry, geometry, double precision); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_dfullywithin(geom1 geometry, geom2 geometry, double precision) RETURNS boolean
    LANGUAGE sql IMMUTABLE
    AS $_$SELECT $1 && ST_Expand($2,$3) AND $2 && ST_Expand($1,$3) AND _ST_DFullyWithin(ST_ConvexHull($1), ST_ConvexHull($2), $3)$_$;


ALTER FUNCTION public.st_dfullywithin(geom1 geometry, geom2 geometry, double precision) OWNER TO postgres;

--
-- Name: st_difference(geometry, geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_difference(geom1 geometry, geom2 geometry) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-2.0', 'difference';


ALTER FUNCTION public.st_difference(geom1 geometry, geom2 geometry) OWNER TO postgres;

--
-- Name: st_dimension(geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_dimension(geometry) RETURNS integer
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-2.0', 'LWGEOM_dimension';


ALTER FUNCTION public.st_dimension(geometry) OWNER TO postgres;

--
-- Name: st_disjoint(geometry, geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_disjoint(geom1 geometry, geom2 geometry) RETURNS boolean
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-2.0', 'disjoint';


ALTER FUNCTION public.st_disjoint(geom1 geometry, geom2 geometry) OWNER TO postgres;

--
-- Name: st_distance(geometry, geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_distance(geom1 geometry, geom2 geometry) RETURNS double precision
    LANGUAGE c IMMUTABLE STRICT COST 100
    AS '$libdir/postgis-2.0', 'LWGEOM_mindistance2d';


ALTER FUNCTION public.st_distance(geom1 geometry, geom2 geometry) OWNER TO postgres;

--
-- Name: st_distance(geography, geography); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_distance(geography, geography) RETURNS double precision
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$SELECT _ST_Distance($1, $2, 0.0, true)$_$;


ALTER FUNCTION public.st_distance(geography, geography) OWNER TO postgres;

--
-- Name: st_distance(text, text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_distance(text, text) RETURNS double precision
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$ SELECT ST_Distance($1::geometry, $2::geometry);  $_$;


ALTER FUNCTION public.st_distance(text, text) OWNER TO postgres;

--
-- Name: st_distance(geography, geography, boolean); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_distance(geography, geography, boolean) RETURNS double precision
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$SELECT _ST_Distance($1, $2, 0.0, $3)$_$;


ALTER FUNCTION public.st_distance(geography, geography, boolean) OWNER TO postgres;

--
-- Name: st_distance_sphere(geometry, geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_distance_sphere(geom1 geometry, geom2 geometry) RETURNS double precision
    LANGUAGE sql IMMUTABLE STRICT COST 300
    AS $_$
	select st_distance(geography($1),geography($2),false)
	$_$;


ALTER FUNCTION public.st_distance_sphere(geom1 geometry, geom2 geometry) OWNER TO postgres;

--
-- Name: st_distance_spheroid(geometry, geometry, spheroid); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_distance_spheroid(geom1 geometry, geom2 geometry, spheroid) RETURNS double precision
    LANGUAGE c IMMUTABLE STRICT COST 100
    AS '$libdir/postgis-2.0', 'LWGEOM_distance_ellipsoid';


ALTER FUNCTION public.st_distance_spheroid(geom1 geometry, geom2 geometry, spheroid) OWNER TO postgres;

--
-- Name: st_distinct4ma(double precision[], text, text[]); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_distinct4ma(matrix double precision[], nodatamode text, VARIADIC args text[]) RETURNS double precision
    LANGUAGE sql IMMUTABLE
    AS $_$ SELECT COUNT(DISTINCT unnest)::float FROM unnest($1) $_$;


ALTER FUNCTION public.st_distinct4ma(matrix double precision[], nodatamode text, VARIADIC args text[]) OWNER TO postgres;

--
-- Name: st_dump(geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_dump(geometry) RETURNS SETOF geometry_dump
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-2.0', 'LWGEOM_dump';


ALTER FUNCTION public.st_dump(geometry) OWNER TO postgres;

--
-- Name: st_dumpaspolygons(raster, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_dumpaspolygons(rast raster, band integer DEFAULT 1) RETURNS SETOF geomval
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/rtpostgis-2.0', 'RASTER_dumpAsPolygons';


ALTER FUNCTION public.st_dumpaspolygons(rast raster, band integer) OWNER TO postgres;

--
-- Name: st_dumppoints(geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_dumppoints(geometry) RETURNS SETOF geometry_dump
    LANGUAGE sql STRICT
    AS $_$
  SELECT * FROM _ST_DumpPoints($1, NULL);
$_$;


ALTER FUNCTION public.st_dumppoints(geometry) OWNER TO postgres;

--
-- Name: st_dumprings(geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_dumprings(geometry) RETURNS SETOF geometry_dump
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-2.0', 'LWGEOM_dump_rings';


ALTER FUNCTION public.st_dumprings(geometry) OWNER TO postgres;

--
-- Name: st_dwithin(geometry, geometry, double precision); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_dwithin(geom1 geometry, geom2 geometry, double precision) RETURNS boolean
    LANGUAGE sql IMMUTABLE
    AS $_$SELECT $1 && ST_Expand($2,$3) AND $2 && ST_Expand($1,$3) AND _ST_DWithin($1, $2, $3)$_$;


ALTER FUNCTION public.st_dwithin(geom1 geometry, geom2 geometry, double precision) OWNER TO postgres;

--
-- Name: st_dwithin(geography, geography, double precision); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_dwithin(geography, geography, double precision) RETURNS boolean
    LANGUAGE sql IMMUTABLE
    AS $_$SELECT $1 && _ST_Expand($2,$3) AND $2 && _ST_Expand($1,$3) AND _ST_DWithin($1, $2, $3, true)$_$;


ALTER FUNCTION public.st_dwithin(geography, geography, double precision) OWNER TO postgres;

--
-- Name: st_dwithin(text, text, double precision); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_dwithin(text, text, double precision) RETURNS boolean
    LANGUAGE sql IMMUTABLE
    AS $_$ SELECT ST_DWithin($1::geometry, $2::geometry, $3);  $_$;


ALTER FUNCTION public.st_dwithin(text, text, double precision) OWNER TO postgres;

--
-- Name: st_dwithin(geography, geography, double precision, boolean); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_dwithin(geography, geography, double precision, boolean) RETURNS boolean
    LANGUAGE sql IMMUTABLE
    AS $_$SELECT $1 && _ST_Expand($2,$3) AND $2 && _ST_Expand($1,$3) AND _ST_DWithin($1, $2, $3, $4)$_$;


ALTER FUNCTION public.st_dwithin(geography, geography, double precision, boolean) OWNER TO postgres;

--
-- Name: st_endpoint(geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_endpoint(geometry) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-2.0', 'LWGEOM_endpoint_linestring';


ALTER FUNCTION public.st_endpoint(geometry) OWNER TO postgres;

--
-- Name: st_envelope(geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_envelope(geometry) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-2.0', 'LWGEOM_envelope';


ALTER FUNCTION public.st_envelope(geometry) OWNER TO postgres;

--
-- Name: st_envelope(raster); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_envelope(raster) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$select st_envelope(st_convexhull($1))$_$;


ALTER FUNCTION public.st_envelope(raster) OWNER TO postgres;

--
-- Name: st_equals(geometry, geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_equals(geom1 geometry, geom2 geometry) RETURNS boolean
    LANGUAGE sql IMMUTABLE
    AS $_$SELECT $1 ~= $2 AND _ST_Equals($1,$2)$_$;


ALTER FUNCTION public.st_equals(geom1 geometry, geom2 geometry) OWNER TO postgres;

--
-- Name: st_estimated_extent(text, text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_estimated_extent(text, text) RETURNS box2d
    LANGUAGE c IMMUTABLE STRICT SECURITY DEFINER
    AS '$libdir/postgis-2.0', 'geometry_estimated_extent';


ALTER FUNCTION public.st_estimated_extent(text, text) OWNER TO postgres;

--
-- Name: st_estimated_extent(text, text, text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_estimated_extent(text, text, text) RETURNS box2d
    LANGUAGE c IMMUTABLE STRICT SECURITY DEFINER
    AS '$libdir/postgis-2.0', 'geometry_estimated_extent';


ALTER FUNCTION public.st_estimated_extent(text, text, text) OWNER TO postgres;

--
-- Name: st_expand(box2d, double precision); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_expand(box2d, double precision) RETURNS box2d
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-2.0', 'BOX2D_expand';


ALTER FUNCTION public.st_expand(box2d, double precision) OWNER TO postgres;

--
-- Name: st_expand(box3d, double precision); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_expand(box3d, double precision) RETURNS box3d
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-2.0', 'BOX3D_expand';


ALTER FUNCTION public.st_expand(box3d, double precision) OWNER TO postgres;

--
-- Name: st_expand(geometry, double precision); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_expand(geometry, double precision) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-2.0', 'LWGEOM_expand';


ALTER FUNCTION public.st_expand(geometry, double precision) OWNER TO postgres;

--
-- Name: st_exteriorring(geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_exteriorring(geometry) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-2.0', 'LWGEOM_exteriorring_polygon';


ALTER FUNCTION public.st_exteriorring(geometry) OWNER TO postgres;

--
-- Name: st_find_extent(text, text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_find_extent(text, text) RETURNS box2d
    LANGUAGE plpgsql IMMUTABLE STRICT
    AS $_$
DECLARE
	tablename alias for $1;
	columnname alias for $2;
	myrec RECORD;

BEGIN
	FOR myrec IN EXECUTE 'SELECT ST_Extent("' || columnname || '") As extent FROM "' || tablename || '"' LOOP
		return myrec.extent;
	END LOOP;
END;
$_$;


ALTER FUNCTION public.st_find_extent(text, text) OWNER TO postgres;

--
-- Name: st_find_extent(text, text, text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_find_extent(text, text, text) RETURNS box2d
    LANGUAGE plpgsql IMMUTABLE STRICT
    AS $_$
DECLARE
	schemaname alias for $1;
	tablename alias for $2;
	columnname alias for $3;
	myrec RECORD;

BEGIN
	FOR myrec IN EXECUTE 'SELECT ST_Extent("' || columnname || '") As extent FROM "' || schemaname || '"."' || tablename || '"' LOOP
		return myrec.extent;
	END LOOP;
END;
$_$;


ALTER FUNCTION public.st_find_extent(text, text, text) OWNER TO postgres;

--
-- Name: st_flipcoordinates(geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_flipcoordinates(geometry) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-2.0', 'ST_FlipCoordinates';


ALTER FUNCTION public.st_flipcoordinates(geometry) OWNER TO postgres;

--
-- Name: st_force_2d(geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_force_2d(geometry) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-2.0', 'LWGEOM_force_2d';


ALTER FUNCTION public.st_force_2d(geometry) OWNER TO postgres;

--
-- Name: st_force_3d(geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_force_3d(geometry) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-2.0', 'LWGEOM_force_3dz';


ALTER FUNCTION public.st_force_3d(geometry) OWNER TO postgres;

--
-- Name: st_force_3dm(geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_force_3dm(geometry) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-2.0', 'LWGEOM_force_3dm';


ALTER FUNCTION public.st_force_3dm(geometry) OWNER TO postgres;

--
-- Name: st_force_3dz(geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_force_3dz(geometry) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-2.0', 'LWGEOM_force_3dz';


ALTER FUNCTION public.st_force_3dz(geometry) OWNER TO postgres;

--
-- Name: st_force_4d(geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_force_4d(geometry) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-2.0', 'LWGEOM_force_4d';


ALTER FUNCTION public.st_force_4d(geometry) OWNER TO postgres;

--
-- Name: st_force_collection(geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_force_collection(geometry) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-2.0', 'LWGEOM_force_collection';


ALTER FUNCTION public.st_force_collection(geometry) OWNER TO postgres;

--
-- Name: st_forcerhr(geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_forcerhr(geometry) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-2.0', 'LWGEOM_force_clockwise_poly';


ALTER FUNCTION public.st_forcerhr(geometry) OWNER TO postgres;

--
-- Name: st_gdaldrivers(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_gdaldrivers(OUT idx integer, OUT short_name text, OUT long_name text, OUT create_options text) RETURNS SETOF record
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/rtpostgis-2.0', 'RASTER_getGDALDrivers';


ALTER FUNCTION public.st_gdaldrivers(OUT idx integer, OUT short_name text, OUT long_name text, OUT create_options text) OWNER TO postgres;

--
-- Name: st_geogfromtext(text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_geogfromtext(text) RETURNS geography
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-2.0', 'geography_from_text';


ALTER FUNCTION public.st_geogfromtext(text) OWNER TO postgres;

--
-- Name: st_geogfromwkb(bytea); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_geogfromwkb(bytea) RETURNS geography
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-2.0', 'geography_from_binary';


ALTER FUNCTION public.st_geogfromwkb(bytea) OWNER TO postgres;

--
-- Name: st_geographyfromtext(text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_geographyfromtext(text) RETURNS geography
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-2.0', 'geography_from_text';


ALTER FUNCTION public.st_geographyfromtext(text) OWNER TO postgres;

--
-- Name: st_geohash(geometry, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_geohash(geom geometry, maxchars integer DEFAULT 0) RETURNS text
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-2.0', 'ST_GeoHash';


ALTER FUNCTION public.st_geohash(geom geometry, maxchars integer) OWNER TO postgres;

--
-- Name: st_geomcollfromtext(text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_geomcollfromtext(text) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$
	SELECT CASE
	WHEN geometrytype(ST_GeomFromText($1)) = 'GEOMETRYCOLLECTION'
	THEN ST_GeomFromText($1)
	ELSE NULL END
	$_$;


ALTER FUNCTION public.st_geomcollfromtext(text) OWNER TO postgres;

--
-- Name: st_geomcollfromtext(text, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_geomcollfromtext(text, integer) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$
	SELECT CASE
	WHEN geometrytype(ST_GeomFromText($1, $2)) = 'GEOMETRYCOLLECTION'
	THEN ST_GeomFromText($1,$2)
	ELSE NULL END
	$_$;


ALTER FUNCTION public.st_geomcollfromtext(text, integer) OWNER TO postgres;

--
-- Name: st_geomcollfromwkb(bytea); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_geomcollfromwkb(bytea) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$
	SELECT CASE
	WHEN geometrytype(ST_GeomFromWKB($1)) = 'GEOMETRYCOLLECTION'
	THEN ST_GeomFromWKB($1)
	ELSE NULL END
	$_$;


ALTER FUNCTION public.st_geomcollfromwkb(bytea) OWNER TO postgres;

--
-- Name: st_geomcollfromwkb(bytea, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_geomcollfromwkb(bytea, integer) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$
	SELECT CASE
	WHEN geometrytype(ST_GeomFromWKB($1, $2)) = 'GEOMETRYCOLLECTION'
	THEN ST_GeomFromWKB($1, $2)
	ELSE NULL END
	$_$;


ALTER FUNCTION public.st_geomcollfromwkb(bytea, integer) OWNER TO postgres;

--
-- Name: st_geometryfromtext(text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_geometryfromtext(text) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-2.0', 'LWGEOM_from_text';


ALTER FUNCTION public.st_geometryfromtext(text) OWNER TO postgres;

--
-- Name: st_geometryfromtext(text, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_geometryfromtext(text, integer) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-2.0', 'LWGEOM_from_text';


ALTER FUNCTION public.st_geometryfromtext(text, integer) OWNER TO postgres;

--
-- Name: st_geometryn(geometry, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_geometryn(geometry, integer) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-2.0', 'LWGEOM_geometryn_collection';


ALTER FUNCTION public.st_geometryn(geometry, integer) OWNER TO postgres;

--
-- Name: st_geometrytype(geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_geometrytype(geometry) RETURNS text
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-2.0', 'geometry_geometrytype';


ALTER FUNCTION public.st_geometrytype(geometry) OWNER TO postgres;

--
-- Name: st_geomfromewkb(bytea); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_geomfromewkb(bytea) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-2.0', 'LWGEOMFromWKB';


ALTER FUNCTION public.st_geomfromewkb(bytea) OWNER TO postgres;

--
-- Name: st_geomfromewkt(text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_geomfromewkt(text) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-2.0', 'parse_WKT_lwgeom';


ALTER FUNCTION public.st_geomfromewkt(text) OWNER TO postgres;

--
-- Name: st_geomfromgeojson(text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_geomfromgeojson(text) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-2.0', 'geom_from_geojson';


ALTER FUNCTION public.st_geomfromgeojson(text) OWNER TO postgres;

--
-- Name: st_geomfromgml(text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_geomfromgml(text) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$SELECT _ST_GeomFromGML($1, 0)$_$;


ALTER FUNCTION public.st_geomfromgml(text) OWNER TO postgres;

--
-- Name: st_geomfromgml(text, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_geomfromgml(text, integer) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-2.0', 'geom_from_gml';


ALTER FUNCTION public.st_geomfromgml(text, integer) OWNER TO postgres;

--
-- Name: st_geomfromkml(text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_geomfromkml(text) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-2.0', 'geom_from_kml';


ALTER FUNCTION public.st_geomfromkml(text) OWNER TO postgres;

--
-- Name: st_geomfromtext(text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_geomfromtext(text) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-2.0', 'LWGEOM_from_text';


ALTER FUNCTION public.st_geomfromtext(text) OWNER TO postgres;

--
-- Name: st_geomfromtext(text, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_geomfromtext(text, integer) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-2.0', 'LWGEOM_from_text';


ALTER FUNCTION public.st_geomfromtext(text, integer) OWNER TO postgres;

--
-- Name: st_geomfromwkb(bytea); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_geomfromwkb(bytea) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-2.0', 'LWGEOM_from_WKB';


ALTER FUNCTION public.st_geomfromwkb(bytea) OWNER TO postgres;

--
-- Name: st_geomfromwkb(bytea, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_geomfromwkb(bytea, integer) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$SELECT ST_SetSRID(ST_GeomFromWKB($1), $2)$_$;


ALTER FUNCTION public.st_geomfromwkb(bytea, integer) OWNER TO postgres;

--
-- Name: st_georeference(raster, text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_georeference(rast raster, format text DEFAULT 'GDAL'::text) RETURNS text
    LANGUAGE plpgsql IMMUTABLE STRICT
    AS $$
    DECLARE
				scale_x numeric;
				scale_y numeric;
				skew_x numeric;
				skew_y numeric;
				ul_x numeric;
				ul_y numeric;

        result text;
    BEGIN
			SELECT scalex::numeric, scaley::numeric, skewx::numeric, skewy::numeric, upperleftx::numeric, upperlefty::numeric
				INTO scale_x, scale_y, skew_x, skew_y, ul_x, ul_y FROM ST_Metadata(rast);

						-- scale x
            result := trunc(scale_x, 10) || E'\n';

						-- skew y
            result := result || trunc(skew_y, 10) || E'\n';

						-- skew x
            result := result || trunc(skew_x, 10) || E'\n';

						-- scale y
            result := result || trunc(scale_y, 10) || E'\n';

        IF format = 'ESRI' THEN
						-- upper left x
            result := result || trunc((ul_x + scale_x * 0.5), 10) || E'\n';

						-- upper left y
            result = result || trunc((ul_y + scale_y * 0.5), 10) || E'\n';
        ELSE -- IF format = 'GDAL' THEN
						-- upper left x
            result := result || trunc(ul_x, 10) || E'\n';

						-- upper left y
            result := result || trunc(ul_y, 10) || E'\n';
        END IF;

        RETURN result;
    END;
    $$;


ALTER FUNCTION public.st_georeference(rast raster, format text) OWNER TO postgres;

--
-- Name: st_geotransform(raster); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_geotransform(raster, OUT imag double precision, OUT jmag double precision, OUT theta_i double precision, OUT theta_ij double precision, OUT xoffset double precision, OUT yoffset double precision) RETURNS record
    LANGUAGE c IMMUTABLE
    AS '$libdir/rtpostgis-2.0', 'RASTER_getGeotransform';


ALTER FUNCTION public.st_geotransform(raster, OUT imag double precision, OUT jmag double precision, OUT theta_i double precision, OUT theta_ij double precision, OUT xoffset double precision, OUT yoffset double precision) OWNER TO postgres;

--
-- Name: st_gmltosql(text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_gmltosql(text) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$SELECT _ST_GeomFromGML($1, 0)$_$;


ALTER FUNCTION public.st_gmltosql(text) OWNER TO postgres;

--
-- Name: st_gmltosql(text, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_gmltosql(text, integer) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-2.0', 'geom_from_gml';


ALTER FUNCTION public.st_gmltosql(text, integer) OWNER TO postgres;

--
-- Name: st_hasarc(geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_hasarc(geometry geometry) RETURNS boolean
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-2.0', 'LWGEOM_has_arc';


ALTER FUNCTION public.st_hasarc(geometry geometry) OWNER TO postgres;

--
-- Name: st_hasnoband(raster, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_hasnoband(rast raster, nband integer DEFAULT 1) RETURNS boolean
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/rtpostgis-2.0', 'RASTER_hasNoBand';


ALTER FUNCTION public.st_hasnoband(rast raster, nband integer) OWNER TO postgres;

--
-- Name: st_hausdorffdistance(geometry, geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_hausdorffdistance(geom1 geometry, geom2 geometry) RETURNS double precision
    LANGUAGE c IMMUTABLE STRICT COST 100
    AS '$libdir/postgis-2.0', 'hausdorffdistance';


ALTER FUNCTION public.st_hausdorffdistance(geom1 geometry, geom2 geometry) OWNER TO postgres;

--
-- Name: st_hausdorffdistance(geometry, geometry, double precision); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_hausdorffdistance(geom1 geometry, geom2 geometry, double precision) RETURNS double precision
    LANGUAGE c IMMUTABLE STRICT COST 100
    AS '$libdir/postgis-2.0', 'hausdorffdistancedensify';


ALTER FUNCTION public.st_hausdorffdistance(geom1 geometry, geom2 geometry, double precision) OWNER TO postgres;

--
-- Name: st_height(raster); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_height(raster) RETURNS integer
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/rtpostgis-2.0', 'RASTER_getHeight';


ALTER FUNCTION public.st_height(raster) OWNER TO postgres;

--
-- Name: st_hillshade(raster, integer, text, double precision, double precision, double precision, double precision); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_hillshade(rast raster, band integer, pixeltype text, azimuth double precision, altitude double precision, max_bright double precision DEFAULT 255.0, elevation_scale double precision DEFAULT 1.0) RETURNS raster
    LANGUAGE sql STABLE
    AS $_$ SELECT st_mapalgebrafctngb($1, $2, $3, 1, 1, '_st_hillshade4ma(float[][], text, text[])'::regprocedure, 'value', st_pixelwidth($1)::text, st_pixelheight($1)::text, $4::text, $5::text, $6::text, $7::text) $_$;


ALTER FUNCTION public.st_hillshade(rast raster, band integer, pixeltype text, azimuth double precision, altitude double precision, max_bright double precision, elevation_scale double precision) OWNER TO postgres;

--
-- Name: st_histogram(raster, integer, integer, boolean); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_histogram(rast raster, nband integer, bins integer, "right" boolean) RETURNS SETOF histogram
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$ SELECT min, max, count, percent FROM _st_histogram($1, $2, TRUE, 1, $3, NULL, $4) $_$;


ALTER FUNCTION public.st_histogram(rast raster, nband integer, bins integer, "right" boolean) OWNER TO postgres;

--
-- Name: st_histogram(raster, integer, boolean, integer, boolean); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_histogram(rast raster, nband integer, exclude_nodata_value boolean, bins integer, "right" boolean) RETURNS SETOF histogram
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$ SELECT min, max, count, percent FROM _st_histogram($1, $2, $3, 1, $4, NULL, $5) $_$;


ALTER FUNCTION public.st_histogram(rast raster, nband integer, exclude_nodata_value boolean, bins integer, "right" boolean) OWNER TO postgres;

--
-- Name: st_histogram(raster, integer, integer, double precision[], boolean); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_histogram(rast raster, nband integer, bins integer, width double precision[] DEFAULT NULL::double precision[], "right" boolean DEFAULT false) RETURNS SETOF histogram
    LANGUAGE sql IMMUTABLE
    AS $_$ SELECT min, max, count, percent FROM _st_histogram($1, $2, TRUE, 1, $3, $4, $5) $_$;


ALTER FUNCTION public.st_histogram(rast raster, nband integer, bins integer, width double precision[], "right" boolean) OWNER TO postgres;

--
-- Name: st_histogram(text, text, integer, integer, boolean); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_histogram(rastertable text, rastercolumn text, nband integer, bins integer, "right" boolean) RETURNS SETOF histogram
    LANGUAGE sql STABLE STRICT
    AS $_$ SELECT _st_histogram($1, $2, $3, TRUE, 1, $4, NULL, $5) $_$;


ALTER FUNCTION public.st_histogram(rastertable text, rastercolumn text, nband integer, bins integer, "right" boolean) OWNER TO postgres;

--
-- Name: st_histogram(raster, integer, boolean, integer, double precision[], boolean); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_histogram(rast raster, nband integer DEFAULT 1, exclude_nodata_value boolean DEFAULT true, bins integer DEFAULT 0, width double precision[] DEFAULT NULL::double precision[], "right" boolean DEFAULT false) RETURNS SETOF histogram
    LANGUAGE sql IMMUTABLE
    AS $_$ SELECT min, max, count, percent FROM _st_histogram($1, $2, $3, 1, $4, $5, $6) $_$;


ALTER FUNCTION public.st_histogram(rast raster, nband integer, exclude_nodata_value boolean, bins integer, width double precision[], "right" boolean) OWNER TO postgres;

--
-- Name: st_histogram(text, text, integer, boolean, integer, boolean); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_histogram(rastertable text, rastercolumn text, nband integer, exclude_nodata_value boolean, bins integer, "right" boolean) RETURNS SETOF histogram
    LANGUAGE sql STABLE STRICT
    AS $_$ SELECT _st_histogram($1, $2, $3, $4, 1, $5, NULL, $6) $_$;


ALTER FUNCTION public.st_histogram(rastertable text, rastercolumn text, nband integer, exclude_nodata_value boolean, bins integer, "right" boolean) OWNER TO postgres;

--
-- Name: st_histogram(text, text, integer, integer, double precision[], boolean); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_histogram(rastertable text, rastercolumn text, nband integer, bins integer, width double precision[] DEFAULT NULL::double precision[], "right" boolean DEFAULT false) RETURNS SETOF histogram
    LANGUAGE sql STABLE
    AS $_$ SELECT _st_histogram($1, $2, $3, TRUE, 1, $4, $5, $6) $_$;


ALTER FUNCTION public.st_histogram(rastertable text, rastercolumn text, nband integer, bins integer, width double precision[], "right" boolean) OWNER TO postgres;

--
-- Name: st_histogram(text, text, integer, boolean, integer, double precision[], boolean); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_histogram(rastertable text, rastercolumn text, nband integer DEFAULT 1, exclude_nodata_value boolean DEFAULT true, bins integer DEFAULT 0, width double precision[] DEFAULT NULL::double precision[], "right" boolean DEFAULT false) RETURNS SETOF histogram
    LANGUAGE sql STABLE
    AS $_$ SELECT _st_histogram($1, $2, $3, $4, 1, $5, $6, $7) $_$;


ALTER FUNCTION public.st_histogram(rastertable text, rastercolumn text, nband integer, exclude_nodata_value boolean, bins integer, width double precision[], "right" boolean) OWNER TO postgres;

--
-- Name: st_interiorringn(geometry, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_interiorringn(geometry, integer) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-2.0', 'LWGEOM_interiorringn_polygon';


ALTER FUNCTION public.st_interiorringn(geometry, integer) OWNER TO postgres;

--
-- Name: st_interpolatepoint(geometry, geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_interpolatepoint(line geometry, point geometry) RETURNS double precision
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-2.0', 'ST_InterpolatePoint';


ALTER FUNCTION public.st_interpolatepoint(line geometry, point geometry) OWNER TO postgres;

--
-- Name: st_intersection(geometry, geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_intersection(geom1 geometry, geom2 geometry) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT COST 100
    AS '$libdir/postgis-2.0', 'intersection';


ALTER FUNCTION public.st_intersection(geom1 geometry, geom2 geometry) OWNER TO postgres;

--
-- Name: st_intersection(geography, geography); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_intersection(geography, geography) RETURNS geography
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$SELECT geography(ST_Transform(ST_Intersection(ST_Transform(geometry($1), _ST_BestSRID($1, $2)), ST_Transform(geometry($2), _ST_BestSRID($1, $2))), 4326))$_$;


ALTER FUNCTION public.st_intersection(geography, geography) OWNER TO postgres;

--
-- Name: st_intersection(text, text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_intersection(text, text) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$ SELECT ST_Intersection($1::geometry, $2::geometry);  $_$;


ALTER FUNCTION public.st_intersection(text, text) OWNER TO postgres;

--
-- Name: st_intersection(raster, geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_intersection(rast raster, geomin geometry) RETURNS SETOF geomval
    LANGUAGE sql STABLE
    AS $_$ SELECT st_intersection($2, $1, 1) $_$;


ALTER FUNCTION public.st_intersection(rast raster, geomin geometry) OWNER TO postgres;

--
-- Name: st_intersection(geometry, raster, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_intersection(geomin geometry, rast raster, band integer DEFAULT 1) RETURNS SETOF geomval
    LANGUAGE plpgsql IMMUTABLE STRICT
    AS $_$
	DECLARE
		intersects boolean := FALSE;
	BEGIN
		intersects := ST_Intersects(geomin, rast, band);
		IF intersects THEN
			-- Return the intersections of the geometry with the vectorized parts of
			-- the raster and the values associated with those parts, if really their
			-- intersection is not empty.
			RETURN QUERY
				SELECT
					intgeom,
					val
				FROM (
					SELECT
						ST_Intersection((gv).geom, geomin) AS intgeom,
						(gv).val
					FROM ST_DumpAsPolygons(rast, band) gv
					WHERE ST_Intersects((gv).geom, geomin)
				) foo
				WHERE NOT ST_IsEmpty(intgeom);
		ELSE
			-- If the geometry does not intersect with the raster, return an empty
			-- geometry and a null value
			RETURN QUERY
				SELECT
					emptygeom,
					NULL::float8
				FROM ST_GeomCollFromText('GEOMETRYCOLLECTION EMPTY', ST_SRID($1)) emptygeom;
		END IF;
	END;
	$_$;


ALTER FUNCTION public.st_intersection(geomin geometry, rast raster, band integer) OWNER TO postgres;

--
-- Name: st_intersection(raster, integer, geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_intersection(rast raster, band integer, geomin geometry) RETURNS SETOF geomval
    LANGUAGE sql STABLE
    AS $_$ SELECT st_intersection($3, $1, $2) $_$;


ALTER FUNCTION public.st_intersection(rast raster, band integer, geomin geometry) OWNER TO postgres;

--
-- Name: st_intersection(raster, raster, double precision[]); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_intersection(rast1 raster, rast2 raster, nodataval double precision[]) RETURNS raster
    LANGUAGE sql STABLE
    AS $_$ SELECT st_intersection($1, 1, $2, 1, 'BOTH', $3) $_$;


ALTER FUNCTION public.st_intersection(rast1 raster, rast2 raster, nodataval double precision[]) OWNER TO postgres;

--
-- Name: st_intersection(raster, raster, double precision); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_intersection(rast1 raster, rast2 raster, nodataval double precision) RETURNS raster
    LANGUAGE sql STABLE
    AS $_$ SELECT st_intersection($1, 1, $2, 1, 'BOTH', ARRAY[$3, $3]) $_$;


ALTER FUNCTION public.st_intersection(rast1 raster, rast2 raster, nodataval double precision) OWNER TO postgres;

--
-- Name: st_intersection(raster, raster, text, double precision[]); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_intersection(rast1 raster, rast2 raster, returnband text DEFAULT 'BOTH'::text, nodataval double precision[] DEFAULT NULL::double precision[]) RETURNS raster
    LANGUAGE sql STABLE
    AS $_$ SELECT st_intersection($1, 1, $2, 1, $3, $4) $_$;


ALTER FUNCTION public.st_intersection(rast1 raster, rast2 raster, returnband text, nodataval double precision[]) OWNER TO postgres;

--
-- Name: st_intersection(raster, raster, text, double precision); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_intersection(rast1 raster, rast2 raster, returnband text, nodataval double precision) RETURNS raster
    LANGUAGE sql STABLE
    AS $_$ SELECT st_intersection($1, 1, $2, 1, $3, ARRAY[$4, $4]) $_$;


ALTER FUNCTION public.st_intersection(rast1 raster, rast2 raster, returnband text, nodataval double precision) OWNER TO postgres;

--
-- Name: st_intersection(raster, integer, raster, integer, double precision[]); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_intersection(rast1 raster, band1 integer, rast2 raster, band2 integer, nodataval double precision[]) RETURNS raster
    LANGUAGE sql STABLE
    AS $_$ SELECT st_intersection($1, $2, $3, $4, 'BOTH', $5) $_$;


ALTER FUNCTION public.st_intersection(rast1 raster, band1 integer, rast2 raster, band2 integer, nodataval double precision[]) OWNER TO postgres;

--
-- Name: st_intersection(raster, integer, raster, integer, double precision); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_intersection(rast1 raster, band1 integer, rast2 raster, band2 integer, nodataval double precision) RETURNS raster
    LANGUAGE sql STABLE
    AS $_$ SELECT st_intersection($1, $2, $3, $4, 'BOTH', ARRAY[$5, $5]) $_$;


ALTER FUNCTION public.st_intersection(rast1 raster, band1 integer, rast2 raster, band2 integer, nodataval double precision) OWNER TO postgres;

--
-- Name: st_intersection(raster, integer, raster, integer, text, double precision[]); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_intersection(rast1 raster, band1 integer, rast2 raster, band2 integer, returnband text DEFAULT 'BOTH'::text, nodataval double precision[] DEFAULT NULL::double precision[]) RETURNS raster
    LANGUAGE plpgsql STABLE
    AS $$
	DECLARE
		rtn raster;
		_returnband text;
		newnodata1 float8;
		newnodata2 float8;
	BEGIN
		newnodata1 := coalesce(nodataval[1], ST_BandNodataValue(rast1, band1), ST_MinPossibleValue(ST_BandPixelType(rast1, band1)));
		newnodata2 := coalesce(nodataval[2], ST_BandNodataValue(rast2, band2), ST_MinPossibleValue(ST_BandPixelType(rast2, band2)));
		
		_returnband := upper(returnband);

		rtn := NULL;
		CASE
			WHEN _returnband = 'BAND1' THEN
				rtn := ST_MapAlgebraExpr(rast1, band1, rast2, band2, '[rast1.val]', ST_BandPixelType(rast1, band1), 'INTERSECTION', newnodata1::text, newnodata1::text, newnodata1);
				rtn := ST_SetBandNodataValue(rtn, 1, newnodata1);
			WHEN _returnband = 'BAND2' THEN
				rtn := ST_MapAlgebraExpr(rast1, band1, rast2, band2, '[rast2.val]', ST_BandPixelType(rast2, band2), 'INTERSECTION', newnodata2::text, newnodata2::text, newnodata2);
				rtn := ST_SetBandNodataValue(rtn, 1, newnodata2);
			WHEN _returnband = 'BOTH' THEN
				rtn := ST_MapAlgebraExpr(rast1, band1, rast2, band2, '[rast1.val]', ST_BandPixelType(rast1, band1), 'INTERSECTION', newnodata1::text, newnodata1::text, newnodata1);
				rtn := ST_SetBandNodataValue(rtn, 1, newnodata1);
				rtn := ST_AddBand(rtn, ST_MapAlgebraExpr(rast1, band1, rast2, band2, '[rast2.val]', ST_BandPixelType(rast2, band2), 'INTERSECTION', newnodata2::text, newnodata2::text, newnodata2));
				rtn := ST_SetBandNodataValue(rtn, 2, newnodata2);
			ELSE
				RAISE EXCEPTION 'Unknown value provided for returnband: %', returnband;
				RETURN NULL;
		END CASE;

		RETURN rtn;
	END;
	$$;


ALTER FUNCTION public.st_intersection(rast1 raster, band1 integer, rast2 raster, band2 integer, returnband text, nodataval double precision[]) OWNER TO postgres;

--
-- Name: st_intersection(raster, integer, raster, integer, text, double precision); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_intersection(rast1 raster, band1 integer, rast2 raster, band2 integer, returnband text, nodataval double precision) RETURNS raster
    LANGUAGE sql STABLE
    AS $_$ SELECT st_intersection($1, $2, $3, $4, $5, ARRAY[$6, $6]) $_$;


ALTER FUNCTION public.st_intersection(rast1 raster, band1 integer, rast2 raster, band2 integer, returnband text, nodataval double precision) OWNER TO postgres;

--
-- Name: st_intersects(geometry, geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_intersects(geom1 geometry, geom2 geometry) RETURNS boolean
    LANGUAGE sql IMMUTABLE
    AS $_$SELECT $1 && $2 AND _ST_Intersects($1,$2)$_$;


ALTER FUNCTION public.st_intersects(geom1 geometry, geom2 geometry) OWNER TO postgres;

--
-- Name: st_intersects(geography, geography); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_intersects(geography, geography) RETURNS boolean
    LANGUAGE sql IMMUTABLE
    AS $_$SELECT $1 && $2 AND _ST_Distance($1, $2, 0.0, false) < 0.00001$_$;


ALTER FUNCTION public.st_intersects(geography, geography) OWNER TO postgres;

--
-- Name: st_intersects(text, text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_intersects(text, text) RETURNS boolean
    LANGUAGE sql IMMUTABLE
    AS $_$ SELECT ST_Intersects($1::geometry, $2::geometry);  $_$;


ALTER FUNCTION public.st_intersects(text, text) OWNER TO postgres;

--
-- Name: st_intersects(raster, raster); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_intersects(rast1 raster, rast2 raster) RETURNS boolean
    LANGUAGE sql IMMUTABLE COST 1000
    AS $_$ SELECT $1 && $2 AND _st_intersects($1, 1, $2, 1) $_$;


ALTER FUNCTION public.st_intersects(rast1 raster, rast2 raster) OWNER TO postgres;

--
-- Name: st_intersects(raster, geometry, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_intersects(rast raster, geom geometry, nband integer DEFAULT NULL::integer) RETURNS boolean
    LANGUAGE sql IMMUTABLE COST 1000
    AS $_$ SELECT $1::geometry && $2 AND _st_intersects($1, $2, $3) $_$;


ALTER FUNCTION public.st_intersects(rast raster, geom geometry, nband integer) OWNER TO postgres;

--
-- Name: st_intersects(raster, integer, geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_intersects(rast raster, nband integer, geom geometry) RETURNS boolean
    LANGUAGE sql IMMUTABLE COST 1000
    AS $_$ SELECT $1::geometry && $3 AND _st_intersects($1, $3, $2) $_$;


ALTER FUNCTION public.st_intersects(rast raster, nband integer, geom geometry) OWNER TO postgres;

--
-- Name: st_intersects(geometry, raster, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_intersects(geom geometry, rast raster, nband integer DEFAULT NULL::integer) RETURNS boolean
    LANGUAGE sql IMMUTABLE COST 1000
    AS $_$ SELECT $1 && $2::geometry AND _st_intersects($1, $2, $3); $_$;


ALTER FUNCTION public.st_intersects(geom geometry, rast raster, nband integer) OWNER TO postgres;

--
-- Name: st_intersects(raster, integer, raster, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_intersects(rast1 raster, nband1 integer, rast2 raster, nband2 integer) RETURNS boolean
    LANGUAGE sql IMMUTABLE COST 1000
    AS $_$ SELECT $1 && $3 AND CASE WHEN $2 IS NULL OR $4 IS NULL THEN TRUE ELSE _st_intersects($1, $2, $3, $4) END $_$;


ALTER FUNCTION public.st_intersects(rast1 raster, nband1 integer, rast2 raster, nband2 integer) OWNER TO postgres;

--
-- Name: st_isclosed(geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_isclosed(geometry) RETURNS boolean
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-2.0', 'LWGEOM_isclosed';


ALTER FUNCTION public.st_isclosed(geometry) OWNER TO postgres;

--
-- Name: st_iscollection(geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_iscollection(geometry) RETURNS boolean
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-2.0', 'ST_IsCollection';


ALTER FUNCTION public.st_iscollection(geometry) OWNER TO postgres;

--
-- Name: st_isempty(geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_isempty(geometry) RETURNS boolean
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-2.0', 'LWGEOM_isempty';


ALTER FUNCTION public.st_isempty(geometry) OWNER TO postgres;

--
-- Name: st_isempty(raster); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_isempty(rast raster) RETURNS boolean
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/rtpostgis-2.0', 'RASTER_isEmpty';


ALTER FUNCTION public.st_isempty(rast raster) OWNER TO postgres;

--
-- Name: st_isring(geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_isring(geometry) RETURNS boolean
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-2.0', 'isring';


ALTER FUNCTION public.st_isring(geometry) OWNER TO postgres;

--
-- Name: st_issimple(geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_issimple(geometry) RETURNS boolean
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-2.0', 'issimple';


ALTER FUNCTION public.st_issimple(geometry) OWNER TO postgres;

--
-- Name: st_isvalid(geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_isvalid(geometry) RETURNS boolean
    LANGUAGE c IMMUTABLE STRICT COST 100
    AS '$libdir/postgis-2.0', 'isvalid';


ALTER FUNCTION public.st_isvalid(geometry) OWNER TO postgres;

--
-- Name: st_isvalid(geometry, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_isvalid(geometry, integer) RETURNS boolean
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$SELECT (ST_isValidDetail($1, $2)).valid$_$;


ALTER FUNCTION public.st_isvalid(geometry, integer) OWNER TO postgres;

--
-- Name: st_isvaliddetail(geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_isvaliddetail(geometry) RETURNS valid_detail
    LANGUAGE c IMMUTABLE STRICT COST 100
    AS '$libdir/postgis-2.0', 'isvaliddetail';


ALTER FUNCTION public.st_isvaliddetail(geometry) OWNER TO postgres;

--
-- Name: st_isvaliddetail(geometry, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_isvaliddetail(geometry, integer) RETURNS valid_detail
    LANGUAGE c IMMUTABLE STRICT COST 100
    AS '$libdir/postgis-2.0', 'isvaliddetail';


ALTER FUNCTION public.st_isvaliddetail(geometry, integer) OWNER TO postgres;

--
-- Name: st_isvalidreason(geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_isvalidreason(geometry) RETURNS text
    LANGUAGE c IMMUTABLE STRICT COST 100
    AS '$libdir/postgis-2.0', 'isvalidreason';


ALTER FUNCTION public.st_isvalidreason(geometry) OWNER TO postgres;

--
-- Name: st_isvalidreason(geometry, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_isvalidreason(geometry, integer) RETURNS text
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$
SELECT CASE WHEN valid THEN 'Valid Geometry' ELSE reason END FROM (
	SELECT (ST_isValidDetail($1, $2)).*
) foo
	$_$;


ALTER FUNCTION public.st_isvalidreason(geometry, integer) OWNER TO postgres;

--
-- Name: st_length(geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_length(geometry) RETURNS double precision
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-2.0', 'LWGEOM_length2d_linestring';


ALTER FUNCTION public.st_length(geometry) OWNER TO postgres;

--
-- Name: st_length(text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_length(text) RETURNS double precision
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$ SELECT ST_Length($1::geometry);  $_$;


ALTER FUNCTION public.st_length(text) OWNER TO postgres;

--
-- Name: st_length(geography, boolean); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_length(geog geography, use_spheroid boolean DEFAULT true) RETURNS double precision
    LANGUAGE c IMMUTABLE STRICT COST 100
    AS '$libdir/postgis-2.0', 'geography_length';


ALTER FUNCTION public.st_length(geog geography, use_spheroid boolean) OWNER TO postgres;

--
-- Name: st_length2d(geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_length2d(geometry) RETURNS double precision
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-2.0', 'LWGEOM_length2d_linestring';


ALTER FUNCTION public.st_length2d(geometry) OWNER TO postgres;

--
-- Name: st_length2d_spheroid(geometry, spheroid); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_length2d_spheroid(geometry, spheroid) RETURNS double precision
    LANGUAGE c IMMUTABLE STRICT COST 100
    AS '$libdir/postgis-2.0', 'LWGEOM_length2d_ellipsoid';


ALTER FUNCTION public.st_length2d_spheroid(geometry, spheroid) OWNER TO postgres;

--
-- Name: st_length_spheroid(geometry, spheroid); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_length_spheroid(geometry, spheroid) RETURNS double precision
    LANGUAGE c IMMUTABLE STRICT COST 100
    AS '$libdir/postgis-2.0', 'LWGEOM_length_ellipsoid_linestring';


ALTER FUNCTION public.st_length_spheroid(geometry, spheroid) OWNER TO postgres;

--
-- Name: st_line_interpolate_point(geometry, double precision); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_line_interpolate_point(geometry, double precision) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-2.0', 'LWGEOM_line_interpolate_point';


ALTER FUNCTION public.st_line_interpolate_point(geometry, double precision) OWNER TO postgres;

--
-- Name: st_line_locate_point(geometry, geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_line_locate_point(geom1 geometry, geom2 geometry) RETURNS double precision
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-2.0', 'LWGEOM_line_locate_point';


ALTER FUNCTION public.st_line_locate_point(geom1 geometry, geom2 geometry) OWNER TO postgres;

--
-- Name: st_line_substring(geometry, double precision, double precision); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_line_substring(geometry, double precision, double precision) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-2.0', 'LWGEOM_line_substring';


ALTER FUNCTION public.st_line_substring(geometry, double precision, double precision) OWNER TO postgres;

--
-- Name: st_linecrossingdirection(geometry, geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_linecrossingdirection(geom1 geometry, geom2 geometry) RETURNS integer
    LANGUAGE sql IMMUTABLE
    AS $_$ SELECT CASE WHEN NOT $1 && $2 THEN 0 ELSE _ST_LineCrossingDirection($1,$2) END $_$;


ALTER FUNCTION public.st_linecrossingdirection(geom1 geometry, geom2 geometry) OWNER TO postgres;

--
-- Name: st_linefrommultipoint(geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_linefrommultipoint(geometry) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-2.0', 'LWGEOM_line_from_mpoint';


ALTER FUNCTION public.st_linefrommultipoint(geometry) OWNER TO postgres;

--
-- Name: st_linefromtext(text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_linefromtext(text) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$
	SELECT CASE WHEN geometrytype(ST_GeomFromText($1)) = 'LINESTRING'
	THEN ST_GeomFromText($1)
	ELSE NULL END
	$_$;


ALTER FUNCTION public.st_linefromtext(text) OWNER TO postgres;

--
-- Name: st_linefromtext(text, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_linefromtext(text, integer) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$
	SELECT CASE WHEN geometrytype(ST_GeomFromText($1, $2)) = 'LINESTRING'
	THEN ST_GeomFromText($1,$2)
	ELSE NULL END
	$_$;


ALTER FUNCTION public.st_linefromtext(text, integer) OWNER TO postgres;

--
-- Name: st_linefromwkb(bytea); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_linefromwkb(bytea) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$
	SELECT CASE WHEN geometrytype(ST_GeomFromWKB($1)) = 'LINESTRING'
	THEN ST_GeomFromWKB($1)
	ELSE NULL END
	$_$;


ALTER FUNCTION public.st_linefromwkb(bytea) OWNER TO postgres;

--
-- Name: st_linefromwkb(bytea, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_linefromwkb(bytea, integer) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$
	SELECT CASE WHEN geometrytype(ST_GeomFromWKB($1, $2)) = 'LINESTRING'
	THEN ST_GeomFromWKB($1, $2)
	ELSE NULL END
	$_$;


ALTER FUNCTION public.st_linefromwkb(bytea, integer) OWNER TO postgres;

--
-- Name: st_linemerge(geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_linemerge(geometry) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT COST 100
    AS '$libdir/postgis-2.0', 'linemerge';


ALTER FUNCTION public.st_linemerge(geometry) OWNER TO postgres;

--
-- Name: st_linestringfromwkb(bytea); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_linestringfromwkb(bytea) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$
	SELECT CASE WHEN geometrytype(ST_GeomFromWKB($1)) = 'LINESTRING'
	THEN ST_GeomFromWKB($1)
	ELSE NULL END
	$_$;


ALTER FUNCTION public.st_linestringfromwkb(bytea) OWNER TO postgres;

--
-- Name: st_linestringfromwkb(bytea, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_linestringfromwkb(bytea, integer) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$
	SELECT CASE WHEN geometrytype(ST_GeomFromWKB($1, $2)) = 'LINESTRING'
	THEN ST_GeomFromWKB($1, $2)
	ELSE NULL END
	$_$;


ALTER FUNCTION public.st_linestringfromwkb(bytea, integer) OWNER TO postgres;

--
-- Name: st_linetocurve(geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_linetocurve(geometry geometry) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-2.0', 'LWGEOM_line_desegmentize';


ALTER FUNCTION public.st_linetocurve(geometry geometry) OWNER TO postgres;

--
-- Name: st_locate_along_measure(geometry, double precision); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_locate_along_measure(geometry, double precision) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$ SELECT ST_locate_between_measures($1, $2, $2) $_$;


ALTER FUNCTION public.st_locate_along_measure(geometry, double precision) OWNER TO postgres;

--
-- Name: st_locate_between_measures(geometry, double precision, double precision); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_locate_between_measures(geometry, double precision, double precision) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-2.0', 'LWGEOM_locate_between_m';


ALTER FUNCTION public.st_locate_between_measures(geometry, double precision, double precision) OWNER TO postgres;

--
-- Name: st_locatealong(geometry, double precision, double precision); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_locatealong(geometry geometry, measure double precision, leftrightoffset double precision DEFAULT 0.0) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-2.0', 'ST_LocateAlong';


ALTER FUNCTION public.st_locatealong(geometry geometry, measure double precision, leftrightoffset double precision) OWNER TO postgres;

--
-- Name: st_locatebetween(geometry, double precision, double precision, double precision); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_locatebetween(geometry geometry, frommeasure double precision, tomeasure double precision, leftrightoffset double precision DEFAULT 0.0) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-2.0', 'ST_LocateBetween';


ALTER FUNCTION public.st_locatebetween(geometry geometry, frommeasure double precision, tomeasure double precision, leftrightoffset double precision) OWNER TO postgres;

--
-- Name: st_locatebetweenelevations(geometry, double precision, double precision); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_locatebetweenelevations(geometry geometry, fromelevation double precision, toelevation double precision) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-2.0', 'ST_LocateBetweenElevations';


ALTER FUNCTION public.st_locatebetweenelevations(geometry geometry, fromelevation double precision, toelevation double precision) OWNER TO postgres;

--
-- Name: st_longestline(geometry, geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_longestline(geom1 geometry, geom2 geometry) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$SELECT _ST_LongestLine(ST_ConvexHull($1), ST_ConvexHull($2))$_$;


ALTER FUNCTION public.st_longestline(geom1 geometry, geom2 geometry) OWNER TO postgres;

--
-- Name: st_m(geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_m(geometry) RETURNS double precision
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-2.0', 'LWGEOM_m_point';


ALTER FUNCTION public.st_m(geometry) OWNER TO postgres;

--
-- Name: st_makebox2d(geometry, geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_makebox2d(geom1 geometry, geom2 geometry) RETURNS box2d
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-2.0', 'BOX2D_construct';


ALTER FUNCTION public.st_makebox2d(geom1 geometry, geom2 geometry) OWNER TO postgres;

--
-- Name: st_makeemptyraster(raster); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_makeemptyraster(rast raster) RETURNS raster
    LANGUAGE plpgsql IMMUTABLE STRICT
    AS $$
		DECLARE
			w int;
			h int;
			ul_x double precision;
			ul_y double precision;
			scale_x double precision;
			scale_y double precision;
			skew_x double precision;
			skew_y double precision;
			sr_id int;
		BEGIN
			SELECT width, height, upperleftx, upperlefty, scalex, scaley, skewx, skewy, srid INTO w, h, ul_x, ul_y, scale_x, scale_y, skew_x, skew_y, sr_id FROM ST_Metadata(rast);
			RETURN st_makeemptyraster(w, h, ul_x, ul_y, scale_x, scale_y, skew_x, skew_y, sr_id);
		END;
    $$;


ALTER FUNCTION public.st_makeemptyraster(rast raster) OWNER TO postgres;

--
-- Name: st_makeemptyraster(integer, integer, double precision, double precision, double precision); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_makeemptyraster(width integer, height integer, upperleftx double precision, upperlefty double precision, pixelsize double precision) RETURNS raster
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$ SELECT st_makeemptyraster($1, $2, $3, $4, $5, -($5), 0, 0, ST_SRID('POINT(0 0)'::geometry)) $_$;


ALTER FUNCTION public.st_makeemptyraster(width integer, height integer, upperleftx double precision, upperlefty double precision, pixelsize double precision) OWNER TO postgres;

--
-- Name: st_makeemptyraster(integer, integer, double precision, double precision, double precision, double precision, double precision, double precision, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_makeemptyraster(width integer, height integer, upperleftx double precision, upperlefty double precision, scalex double precision, scaley double precision, skewx double precision, skewy double precision, srid integer DEFAULT 0) RETURNS raster
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/rtpostgis-2.0', 'RASTER_makeEmpty';


ALTER FUNCTION public.st_makeemptyraster(width integer, height integer, upperleftx double precision, upperlefty double precision, scalex double precision, scaley double precision, skewx double precision, skewy double precision, srid integer) OWNER TO postgres;

--
-- Name: st_makeenvelope(double precision, double precision, double precision, double precision, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_makeenvelope(double precision, double precision, double precision, double precision, integer DEFAULT 0) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-2.0', 'ST_MakeEnvelope';


ALTER FUNCTION public.st_makeenvelope(double precision, double precision, double precision, double precision, integer) OWNER TO postgres;

--
-- Name: st_makeline(geometry[]); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_makeline(geometry[]) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-2.0', 'LWGEOM_makeline_garray';


ALTER FUNCTION public.st_makeline(geometry[]) OWNER TO postgres;

--
-- Name: st_makeline(geometry, geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_makeline(geom1 geometry, geom2 geometry) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-2.0', 'LWGEOM_makeline';


ALTER FUNCTION public.st_makeline(geom1 geometry, geom2 geometry) OWNER TO postgres;

--
-- Name: st_makepoint(double precision, double precision); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_makepoint(double precision, double precision) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-2.0', 'LWGEOM_makepoint';


ALTER FUNCTION public.st_makepoint(double precision, double precision) OWNER TO postgres;

--
-- Name: st_makepoint(double precision, double precision, double precision); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_makepoint(double precision, double precision, double precision) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-2.0', 'LWGEOM_makepoint';


ALTER FUNCTION public.st_makepoint(double precision, double precision, double precision) OWNER TO postgres;

--
-- Name: st_makepoint(double precision, double precision, double precision, double precision); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_makepoint(double precision, double precision, double precision, double precision) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-2.0', 'LWGEOM_makepoint';


ALTER FUNCTION public.st_makepoint(double precision, double precision, double precision, double precision) OWNER TO postgres;

--
-- Name: st_makepointm(double precision, double precision, double precision); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_makepointm(double precision, double precision, double precision) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-2.0', 'LWGEOM_makepoint3dm';


ALTER FUNCTION public.st_makepointm(double precision, double precision, double precision) OWNER TO postgres;

--
-- Name: st_makepolygon(geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_makepolygon(geometry) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-2.0', 'LWGEOM_makepoly';


ALTER FUNCTION public.st_makepolygon(geometry) OWNER TO postgres;

--
-- Name: st_makepolygon(geometry, geometry[]); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_makepolygon(geometry, geometry[]) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-2.0', 'LWGEOM_makepoly';


ALTER FUNCTION public.st_makepolygon(geometry, geometry[]) OWNER TO postgres;

--
-- Name: st_makevalid(geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_makevalid(geometry) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT COST 100
    AS '$libdir/postgis-2.0', 'ST_MakeValid';


ALTER FUNCTION public.st_makevalid(geometry) OWNER TO postgres;

--
-- Name: st_mapalgebraexpr(raster, text, text, double precision); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_mapalgebraexpr(rast raster, pixeltype text, expression text, nodataval double precision DEFAULT NULL::double precision) RETURNS raster
    LANGUAGE sql
    AS $_$ SELECT st_mapalgebraexpr($1, 1, $2, $3, $4) $_$;


ALTER FUNCTION public.st_mapalgebraexpr(rast raster, pixeltype text, expression text, nodataval double precision) OWNER TO postgres;

--
-- Name: st_mapalgebraexpr(raster, integer, text, text, double precision); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_mapalgebraexpr(rast raster, band integer, pixeltype text, expression text, nodataval double precision DEFAULT NULL::double precision) RETURNS raster
    LANGUAGE c IMMUTABLE
    AS '$libdir/rtpostgis-2.0', 'RASTER_mapAlgebraExpr';


ALTER FUNCTION public.st_mapalgebraexpr(rast raster, band integer, pixeltype text, expression text, nodataval double precision) OWNER TO postgres;

--
-- Name: st_mapalgebraexpr(raster, raster, text, text, text, text, text, double precision); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_mapalgebraexpr(rast1 raster, rast2 raster, expression text, pixeltype text DEFAULT NULL::text, extenttype text DEFAULT 'INTERSECTION'::text, nodata1expr text DEFAULT NULL::text, nodata2expr text DEFAULT NULL::text, nodatanodataval double precision DEFAULT NULL::double precision) RETURNS raster
    LANGUAGE sql STABLE
    AS $_$ SELECT st_mapalgebraexpr($1, 1, $2, 1, $3, $4, $5, $6, $7, $8) $_$;


ALTER FUNCTION public.st_mapalgebraexpr(rast1 raster, rast2 raster, expression text, pixeltype text, extenttype text, nodata1expr text, nodata2expr text, nodatanodataval double precision) OWNER TO postgres;

--
-- Name: st_mapalgebraexpr(raster, integer, raster, integer, text, text, text, text, text, double precision); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_mapalgebraexpr(rast1 raster, band1 integer, rast2 raster, band2 integer, expression text, pixeltype text DEFAULT NULL::text, extenttype text DEFAULT 'INTERSECTION'::text, nodata1expr text DEFAULT NULL::text, nodata2expr text DEFAULT NULL::text, nodatanodataval double precision DEFAULT NULL::double precision) RETURNS raster
    LANGUAGE c STABLE
    AS '$libdir/rtpostgis-2.0', 'RASTER_mapAlgebra2';


ALTER FUNCTION public.st_mapalgebraexpr(rast1 raster, band1 integer, rast2 raster, band2 integer, expression text, pixeltype text, extenttype text, nodata1expr text, nodata2expr text, nodatanodataval double precision) OWNER TO postgres;

--
-- Name: st_mapalgebrafct(raster, regprocedure); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_mapalgebrafct(rast raster, onerastuserfunc regprocedure) RETURNS raster
    LANGUAGE sql
    AS $_$ SELECT st_mapalgebrafct($1, 1, NULL, $2, NULL) $_$;


ALTER FUNCTION public.st_mapalgebrafct(rast raster, onerastuserfunc regprocedure) OWNER TO postgres;

--
-- Name: st_mapalgebrafct(raster, integer, regprocedure); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_mapalgebrafct(rast raster, band integer, onerastuserfunc regprocedure) RETURNS raster
    LANGUAGE sql
    AS $_$ SELECT st_mapalgebrafct($1, $2, NULL, $3, NULL) $_$;


ALTER FUNCTION public.st_mapalgebrafct(rast raster, band integer, onerastuserfunc regprocedure) OWNER TO postgres;

--
-- Name: st_mapalgebrafct(raster, text, regprocedure); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_mapalgebrafct(rast raster, pixeltype text, onerastuserfunc regprocedure) RETURNS raster
    LANGUAGE sql
    AS $_$ SELECT st_mapalgebrafct($1, 1, $2, $3, NULL) $_$;


ALTER FUNCTION public.st_mapalgebrafct(rast raster, pixeltype text, onerastuserfunc regprocedure) OWNER TO postgres;

--
-- Name: st_mapalgebrafct(raster, regprocedure, text[]); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_mapalgebrafct(rast raster, onerastuserfunc regprocedure, VARIADIC args text[]) RETURNS raster
    LANGUAGE sql
    AS $_$ SELECT st_mapalgebrafct($1, 1, NULL, $2, VARIADIC $3) $_$;


ALTER FUNCTION public.st_mapalgebrafct(rast raster, onerastuserfunc regprocedure, VARIADIC args text[]) OWNER TO postgres;

--
-- Name: st_mapalgebrafct(raster, integer, text, regprocedure); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_mapalgebrafct(rast raster, band integer, pixeltype text, onerastuserfunc regprocedure) RETURNS raster
    LANGUAGE sql
    AS $_$ SELECT st_mapalgebrafct($1, $2, $3, $4, NULL) $_$;


ALTER FUNCTION public.st_mapalgebrafct(rast raster, band integer, pixeltype text, onerastuserfunc regprocedure) OWNER TO postgres;

--
-- Name: st_mapalgebrafct(raster, integer, regprocedure, text[]); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_mapalgebrafct(rast raster, band integer, onerastuserfunc regprocedure, VARIADIC args text[]) RETURNS raster
    LANGUAGE sql
    AS $_$ SELECT st_mapalgebrafct($1, $2, NULL, $3, VARIADIC $4) $_$;


ALTER FUNCTION public.st_mapalgebrafct(rast raster, band integer, onerastuserfunc regprocedure, VARIADIC args text[]) OWNER TO postgres;

--
-- Name: st_mapalgebrafct(raster, text, regprocedure, text[]); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_mapalgebrafct(rast raster, pixeltype text, onerastuserfunc regprocedure, VARIADIC args text[]) RETURNS raster
    LANGUAGE sql
    AS $_$ SELECT st_mapalgebrafct($1, 1, $2, $3, VARIADIC $4) $_$;


ALTER FUNCTION public.st_mapalgebrafct(rast raster, pixeltype text, onerastuserfunc regprocedure, VARIADIC args text[]) OWNER TO postgres;

--
-- Name: st_mapalgebrafct(raster, integer, text, regprocedure, text[]); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_mapalgebrafct(rast raster, band integer, pixeltype text, onerastuserfunc regprocedure, VARIADIC args text[]) RETURNS raster
    LANGUAGE c IMMUTABLE
    AS '$libdir/rtpostgis-2.0', 'RASTER_mapAlgebraFct';


ALTER FUNCTION public.st_mapalgebrafct(rast raster, band integer, pixeltype text, onerastuserfunc regprocedure, VARIADIC args text[]) OWNER TO postgres;

--
-- Name: st_mapalgebrafct(raster, raster, regprocedure, text, text, text[]); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_mapalgebrafct(rast1 raster, rast2 raster, tworastuserfunc regprocedure, pixeltype text DEFAULT NULL::text, extenttype text DEFAULT 'INTERSECTION'::text, VARIADIC userargs text[] DEFAULT NULL::text[]) RETURNS raster
    LANGUAGE sql STABLE
    AS $_$ SELECT st_mapalgebrafct($1, 1, $2, 1, $3, $4, $5, VARIADIC $6) $_$;


ALTER FUNCTION public.st_mapalgebrafct(rast1 raster, rast2 raster, tworastuserfunc regprocedure, pixeltype text, extenttype text, VARIADIC userargs text[]) OWNER TO postgres;

--
-- Name: st_mapalgebrafct(raster, integer, raster, integer, regprocedure, text, text, text[]); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_mapalgebrafct(rast1 raster, band1 integer, rast2 raster, band2 integer, tworastuserfunc regprocedure, pixeltype text DEFAULT NULL::text, extenttype text DEFAULT 'INTERSECTION'::text, VARIADIC userargs text[] DEFAULT NULL::text[]) RETURNS raster
    LANGUAGE c STABLE
    AS '$libdir/rtpostgis-2.0', 'RASTER_mapAlgebra2';


ALTER FUNCTION public.st_mapalgebrafct(rast1 raster, band1 integer, rast2 raster, band2 integer, tworastuserfunc regprocedure, pixeltype text, extenttype text, VARIADIC userargs text[]) OWNER TO postgres;

--
-- Name: st_mapalgebrafctngb(raster, integer, text, integer, integer, regprocedure, text, text[]); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_mapalgebrafctngb(rast raster, band integer, pixeltype text, ngbwidth integer, ngbheight integer, onerastngbuserfunc regprocedure, nodatamode text, VARIADIC args text[]) RETURNS raster
    LANGUAGE c IMMUTABLE
    AS '$libdir/rtpostgis-2.0', 'RASTER_mapAlgebraFctNgb';


ALTER FUNCTION public.st_mapalgebrafctngb(rast raster, band integer, pixeltype text, ngbwidth integer, ngbheight integer, onerastngbuserfunc regprocedure, nodatamode text, VARIADIC args text[]) OWNER TO postgres;

--
-- Name: st_max4ma(double precision[], text, text[]); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_max4ma(matrix double precision[], nodatamode text, VARIADIC args text[]) RETURNS double precision
    LANGUAGE plpgsql IMMUTABLE
    AS $$
    DECLARE
        _matrix float[][];
        max float;
    BEGIN
        _matrix := matrix;
        max := '-Infinity'::float;
        FOR x in array_lower(_matrix, 1)..array_upper(_matrix, 1) LOOP
            FOR y in array_lower(_matrix, 2)..array_upper(_matrix, 2) LOOP
                IF _matrix[x][y] IS NULL THEN
                    IF NOT nodatamode = 'ignore' THEN
                        _matrix[x][y] := nodatamode::float;
                    END IF;
                END IF;
                IF max < _matrix[x][y] THEN
                    max := _matrix[x][y];
                END IF;
            END LOOP;
        END LOOP;
        RETURN max;
    END;
    $$;


ALTER FUNCTION public.st_max4ma(matrix double precision[], nodatamode text, VARIADIC args text[]) OWNER TO postgres;

--
-- Name: st_maxdistance(geometry, geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_maxdistance(geom1 geometry, geom2 geometry) RETURNS double precision
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$SELECT _ST_MaxDistance(ST_ConvexHull($1), ST_ConvexHull($2))$_$;


ALTER FUNCTION public.st_maxdistance(geom1 geometry, geom2 geometry) OWNER TO postgres;

--
-- Name: st_mean4ma(double precision[], text, text[]); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_mean4ma(matrix double precision[], nodatamode text, VARIADIC args text[]) RETURNS double precision
    LANGUAGE plpgsql IMMUTABLE
    AS $$
    DECLARE
        _matrix float[][];
        sum float;
        count float;
    BEGIN
        _matrix := matrix;
        sum := 0;
        count := 0;
        FOR x in array_lower(matrix, 1)..array_upper(matrix, 1) LOOP
            FOR y in array_lower(matrix, 2)..array_upper(matrix, 2) LOOP
                IF _matrix[x][y] IS NULL THEN
                    IF nodatamode = 'ignore' THEN
                        _matrix[x][y] := 0;
                    ELSE
                        _matrix[x][y] := nodatamode::float;
                        count := count + 1;
                    END IF;
                ELSE
                    count := count + 1;
                END IF;
                sum := sum + _matrix[x][y];
            END LOOP;
        END LOOP;
        IF count = 0 THEN
            RETURN NULL;
        END IF;
        RETURN sum / count;
    END;
    $$;


ALTER FUNCTION public.st_mean4ma(matrix double precision[], nodatamode text, VARIADIC args text[]) OWNER TO postgres;

--
-- Name: st_mem_size(geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_mem_size(geometry) RETURNS integer
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-2.0', 'LWGEOM_mem_size';


ALTER FUNCTION public.st_mem_size(geometry) OWNER TO postgres;

--
-- Name: st_metadata(raster); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_metadata(rast raster, OUT upperleftx double precision, OUT upperlefty double precision, OUT width integer, OUT height integer, OUT scalex double precision, OUT scaley double precision, OUT skewx double precision, OUT skewy double precision, OUT srid integer, OUT numbands integer) RETURNS record
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/rtpostgis-2.0', 'RASTER_metadata';


ALTER FUNCTION public.st_metadata(rast raster, OUT upperleftx double precision, OUT upperlefty double precision, OUT width integer, OUT height integer, OUT scalex double precision, OUT scaley double precision, OUT skewx double precision, OUT skewy double precision, OUT srid integer, OUT numbands integer) OWNER TO postgres;

--
-- Name: st_min4ma(double precision[], text, text[]); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_min4ma(matrix double precision[], nodatamode text, VARIADIC args text[]) RETURNS double precision
    LANGUAGE plpgsql IMMUTABLE
    AS $$
    DECLARE
        _matrix float[][];
        min float;
    BEGIN
        _matrix := matrix;
        min := 'Infinity'::float;
        FOR x in array_lower(_matrix, 1)..array_upper(_matrix, 1) LOOP
            FOR y in array_lower(_matrix, 2)..array_upper(_matrix, 2) LOOP
                IF _matrix[x][y] IS NULL THEN
                    IF NOT nodatamode = 'ignore' THEN
                        _matrix[x][y] := nodatamode::float;
                    END IF;
                END IF;
                IF min > _matrix[x][y] THEN
                    min := _matrix[x][y];
                END IF;
            END LOOP;
        END LOOP;
        RETURN min;
    END;
    $$;


ALTER FUNCTION public.st_min4ma(matrix double precision[], nodatamode text, VARIADIC args text[]) OWNER TO postgres;

--
-- Name: st_minimumboundingcircle(geometry, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_minimumboundingcircle(inputgeom geometry, segs_per_quarter integer DEFAULT 48) RETURNS geometry
    LANGUAGE plpgsql IMMUTABLE STRICT
    AS $$
	DECLARE
	hull GEOMETRY;
	ring GEOMETRY;
	center GEOMETRY;
	radius DOUBLE PRECISION;
	dist DOUBLE PRECISION;
	d DOUBLE PRECISION;
	idx1 integer;
	idx2 integer;
	l1 GEOMETRY;
	l2 GEOMETRY;
	p1 GEOMETRY;
	p2 GEOMETRY;
	a1 DOUBLE PRECISION;
	a2 DOUBLE PRECISION;


	BEGIN

	-- First compute the ConvexHull of the geometry
	hull = ST_ConvexHull(inputgeom);
	--A point really has no MBC
	IF ST_GeometryType(hull) = 'ST_Point' THEN
		RETURN hull;
	END IF;
	-- convert the hull perimeter to a linestring so we can manipulate individual points
	--If its already a linestring force it to a closed linestring
	ring = CASE WHEN ST_GeometryType(hull) = 'ST_LineString' THEN ST_AddPoint(hull, ST_StartPoint(hull)) ELSE ST_ExteriorRing(hull) END;

	dist = 0;
	-- Brute Force - check every pair
	FOR i in 1 .. (ST_NumPoints(ring)-2)
		LOOP
			FOR j in i .. (ST_NumPoints(ring)-1)
				LOOP
				d = ST_Distance(ST_PointN(ring,i),ST_PointN(ring,j));
				-- Check the distance and update if larger
				IF (d > dist) THEN
					dist = d;
					idx1 = i;
					idx2 = j;
				END IF;
			END LOOP;
		END LOOP;

	-- We now have the diameter of the convex hull.  The following line returns it if desired.
	-- RETURN ST_MakeLine(ST_PointN(ring,idx1),ST_PointN(ring,idx2));

	-- Now for the Minimum Bounding Circle.  Since we know the two points furthest from each
	-- other, the MBC must go through those two points. Start with those points as a diameter of a circle.

	-- The radius is half the distance between them and the center is midway between them
	radius = ST_Distance(ST_PointN(ring,idx1),ST_PointN(ring,idx2)) / 2.0;
	center = ST_Line_interpolate_point(ST_MakeLine(ST_PointN(ring,idx1),ST_PointN(ring,idx2)),0.5);

	-- Loop through each vertex and check if the distance from the center to the point
	-- is greater than the current radius.
	FOR k in 1 .. (ST_NumPoints(ring)-1)
		LOOP
		IF(k <> idx1 and k <> idx2) THEN
			dist = ST_Distance(center,ST_PointN(ring,k));
			IF (dist > radius) THEN
				-- We have to expand the circle.  The new circle must pass trhough
				-- three points - the two original diameters and this point.

				-- Draw a line from the first diameter to this point
				l1 = ST_Makeline(ST_PointN(ring,idx1),ST_PointN(ring,k));
				-- Compute the midpoint
				p1 = ST_line_interpolate_point(l1,0.5);
				-- Rotate the line 90 degrees around the midpoint (perpendicular bisector)
				l1 = ST_Rotate(l1,pi()/2,p1);
				--  Compute the azimuth of the bisector
				a1 = ST_Azimuth(ST_PointN(l1,1),ST_PointN(l1,2));
				--  Extend the line in each direction the new computed distance to insure they will intersect
				l1 = ST_AddPoint(l1,ST_Makepoint(ST_X(ST_PointN(l1,2))+sin(a1)*dist,ST_Y(ST_PointN(l1,2))+cos(a1)*dist),-1);
				l1 = ST_AddPoint(l1,ST_Makepoint(ST_X(ST_PointN(l1,1))-sin(a1)*dist,ST_Y(ST_PointN(l1,1))-cos(a1)*dist),0);

				-- Repeat for the line from the point to the other diameter point
				l2 = ST_Makeline(ST_PointN(ring,idx2),ST_PointN(ring,k));
				p2 = ST_Line_interpolate_point(l2,0.5);
				l2 = ST_Rotate(l2,pi()/2,p2);
				a2 = ST_Azimuth(ST_PointN(l2,1),ST_PointN(l2,2));
				l2 = ST_AddPoint(l2,ST_Makepoint(ST_X(ST_PointN(l2,2))+sin(a2)*dist,ST_Y(ST_PointN(l2,2))+cos(a2)*dist),-1);
				l2 = ST_AddPoint(l2,ST_Makepoint(ST_X(ST_PointN(l2,1))-sin(a2)*dist,ST_Y(ST_PointN(l2,1))-cos(a2)*dist),0);

				-- The new center is the intersection of the two bisectors
				center = ST_Intersection(l1,l2);
				-- The new radius is the distance to any of the three points
				radius = ST_Distance(center,ST_PointN(ring,idx1));
			END IF;
		END IF;
		END LOOP;
	--DONE!!  Return the MBC via the buffer command
	RETURN ST_Buffer(center,radius,segs_per_quarter);

	END;
$$;


ALTER FUNCTION public.st_minimumboundingcircle(inputgeom geometry, segs_per_quarter integer) OWNER TO postgres;

--
-- Name: st_minpossiblevalue(text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_minpossiblevalue(pixeltype text) RETURNS double precision
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/rtpostgis-2.0', 'RASTER_minPossibleValue';


ALTER FUNCTION public.st_minpossiblevalue(pixeltype text) OWNER TO postgres;

--
-- Name: st_mlinefromtext(text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_mlinefromtext(text) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$
	SELECT CASE WHEN geometrytype(ST_GeomFromText($1)) = 'MULTILINESTRING'
	THEN ST_GeomFromText($1)
	ELSE NULL END
	$_$;


ALTER FUNCTION public.st_mlinefromtext(text) OWNER TO postgres;

--
-- Name: st_mlinefromtext(text, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_mlinefromtext(text, integer) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$
	SELECT CASE
	WHEN geometrytype(ST_GeomFromText($1, $2)) = 'MULTILINESTRING'
	THEN ST_GeomFromText($1,$2)
	ELSE NULL END
	$_$;


ALTER FUNCTION public.st_mlinefromtext(text, integer) OWNER TO postgres;

--
-- Name: st_mlinefromwkb(bytea); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_mlinefromwkb(bytea) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$
	SELECT CASE WHEN geometrytype(ST_GeomFromWKB($1)) = 'MULTILINESTRING'
	THEN ST_GeomFromWKB($1)
	ELSE NULL END
	$_$;


ALTER FUNCTION public.st_mlinefromwkb(bytea) OWNER TO postgres;

--
-- Name: st_mlinefromwkb(bytea, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_mlinefromwkb(bytea, integer) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$
	SELECT CASE WHEN geometrytype(ST_GeomFromWKB($1, $2)) = 'MULTILINESTRING'
	THEN ST_GeomFromWKB($1, $2)
	ELSE NULL END
	$_$;


ALTER FUNCTION public.st_mlinefromwkb(bytea, integer) OWNER TO postgres;

--
-- Name: st_mpointfromtext(text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_mpointfromtext(text) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$
	SELECT CASE WHEN geometrytype(ST_GeomFromText($1)) = 'MULTIPOINT'
	THEN ST_GeomFromText($1)
	ELSE NULL END
	$_$;


ALTER FUNCTION public.st_mpointfromtext(text) OWNER TO postgres;

--
-- Name: st_mpointfromtext(text, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_mpointfromtext(text, integer) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$
	SELECT CASE WHEN geometrytype(ST_GeomFromText($1, $2)) = 'MULTIPOINT'
	THEN ST_GeomFromText($1, $2)
	ELSE NULL END
	$_$;


ALTER FUNCTION public.st_mpointfromtext(text, integer) OWNER TO postgres;

--
-- Name: st_mpointfromwkb(bytea); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_mpointfromwkb(bytea) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$
	SELECT CASE WHEN geometrytype(ST_GeomFromWKB($1)) = 'MULTIPOINT'
	THEN ST_GeomFromWKB($1)
	ELSE NULL END
	$_$;


ALTER FUNCTION public.st_mpointfromwkb(bytea) OWNER TO postgres;

--
-- Name: st_mpointfromwkb(bytea, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_mpointfromwkb(bytea, integer) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$
	SELECT CASE WHEN geometrytype(ST_GeomFromWKB($1, $2)) = 'MULTIPOINT'
	THEN ST_GeomFromWKB($1, $2)
	ELSE NULL END
	$_$;


ALTER FUNCTION public.st_mpointfromwkb(bytea, integer) OWNER TO postgres;

--
-- Name: st_mpolyfromtext(text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_mpolyfromtext(text) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$
	SELECT CASE WHEN geometrytype(ST_GeomFromText($1)) = 'MULTIPOLYGON'
	THEN ST_GeomFromText($1)
	ELSE NULL END
	$_$;


ALTER FUNCTION public.st_mpolyfromtext(text) OWNER TO postgres;

--
-- Name: st_mpolyfromtext(text, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_mpolyfromtext(text, integer) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$
	SELECT CASE WHEN geometrytype(ST_GeomFromText($1, $2)) = 'MULTIPOLYGON'
	THEN ST_GeomFromText($1,$2)
	ELSE NULL END
	$_$;


ALTER FUNCTION public.st_mpolyfromtext(text, integer) OWNER TO postgres;

--
-- Name: st_mpolyfromwkb(bytea); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_mpolyfromwkb(bytea) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$
	SELECT CASE WHEN geometrytype(ST_GeomFromWKB($1)) = 'MULTIPOLYGON'
	THEN ST_GeomFromWKB($1)
	ELSE NULL END
	$_$;


ALTER FUNCTION public.st_mpolyfromwkb(bytea) OWNER TO postgres;

--
-- Name: st_mpolyfromwkb(bytea, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_mpolyfromwkb(bytea, integer) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$
	SELECT CASE WHEN geometrytype(ST_GeomFromWKB($1, $2)) = 'MULTIPOLYGON'
	THEN ST_GeomFromWKB($1, $2)
	ELSE NULL END
	$_$;


ALTER FUNCTION public.st_mpolyfromwkb(bytea, integer) OWNER TO postgres;

--
-- Name: st_multi(geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_multi(geometry) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-2.0', 'LWGEOM_force_multi';


ALTER FUNCTION public.st_multi(geometry) OWNER TO postgres;

--
-- Name: st_multilinefromwkb(bytea); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_multilinefromwkb(bytea) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$
	SELECT CASE WHEN geometrytype(ST_GeomFromWKB($1)) = 'MULTILINESTRING'
	THEN ST_GeomFromWKB($1)
	ELSE NULL END
	$_$;


ALTER FUNCTION public.st_multilinefromwkb(bytea) OWNER TO postgres;

--
-- Name: st_multilinestringfromtext(text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_multilinestringfromtext(text) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$SELECT ST_MLineFromText($1)$_$;


ALTER FUNCTION public.st_multilinestringfromtext(text) OWNER TO postgres;

--
-- Name: st_multilinestringfromtext(text, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_multilinestringfromtext(text, integer) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$SELECT ST_MLineFromText($1, $2)$_$;


ALTER FUNCTION public.st_multilinestringfromtext(text, integer) OWNER TO postgres;

--
-- Name: st_multipointfromtext(text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_multipointfromtext(text) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$SELECT ST_MPointFromText($1)$_$;


ALTER FUNCTION public.st_multipointfromtext(text) OWNER TO postgres;

--
-- Name: st_multipointfromwkb(bytea); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_multipointfromwkb(bytea) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$
	SELECT CASE WHEN geometrytype(ST_GeomFromWKB($1)) = 'MULTIPOINT'
	THEN ST_GeomFromWKB($1)
	ELSE NULL END
	$_$;


ALTER FUNCTION public.st_multipointfromwkb(bytea) OWNER TO postgres;

--
-- Name: st_multipointfromwkb(bytea, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_multipointfromwkb(bytea, integer) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$
	SELECT CASE WHEN geometrytype(ST_GeomFromWKB($1,$2)) = 'MULTIPOINT'
	THEN ST_GeomFromWKB($1, $2)
	ELSE NULL END
	$_$;


ALTER FUNCTION public.st_multipointfromwkb(bytea, integer) OWNER TO postgres;

--
-- Name: st_multipolyfromwkb(bytea); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_multipolyfromwkb(bytea) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$
	SELECT CASE WHEN geometrytype(ST_GeomFromWKB($1)) = 'MULTIPOLYGON'
	THEN ST_GeomFromWKB($1)
	ELSE NULL END
	$_$;


ALTER FUNCTION public.st_multipolyfromwkb(bytea) OWNER TO postgres;

--
-- Name: st_multipolyfromwkb(bytea, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_multipolyfromwkb(bytea, integer) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$
	SELECT CASE WHEN geometrytype(ST_GeomFromWKB($1, $2)) = 'MULTIPOLYGON'
	THEN ST_GeomFromWKB($1, $2)
	ELSE NULL END
	$_$;


ALTER FUNCTION public.st_multipolyfromwkb(bytea, integer) OWNER TO postgres;

--
-- Name: st_multipolygonfromtext(text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_multipolygonfromtext(text) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$SELECT ST_MPolyFromText($1)$_$;


ALTER FUNCTION public.st_multipolygonfromtext(text) OWNER TO postgres;

--
-- Name: st_multipolygonfromtext(text, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_multipolygonfromtext(text, integer) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$SELECT ST_MPolyFromText($1, $2)$_$;


ALTER FUNCTION public.st_multipolygonfromtext(text, integer) OWNER TO postgres;

--
-- Name: st_ndims(geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_ndims(geometry) RETURNS smallint
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-2.0', 'LWGEOM_ndims';


ALTER FUNCTION public.st_ndims(geometry) OWNER TO postgres;

--
-- Name: st_node(geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_node(g geometry) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT COST 100
    AS '$libdir/postgis-2.0', 'ST_Node';


ALTER FUNCTION public.st_node(g geometry) OWNER TO postgres;

--
-- Name: st_npoints(geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_npoints(geometry) RETURNS integer
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-2.0', 'LWGEOM_npoints';


ALTER FUNCTION public.st_npoints(geometry) OWNER TO postgres;

--
-- Name: st_nrings(geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_nrings(geometry) RETURNS integer
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-2.0', 'LWGEOM_nrings';


ALTER FUNCTION public.st_nrings(geometry) OWNER TO postgres;

--
-- Name: st_numbands(raster); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_numbands(raster) RETURNS integer
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/rtpostgis-2.0', 'RASTER_getNumBands';


ALTER FUNCTION public.st_numbands(raster) OWNER TO postgres;

--
-- Name: st_numgeometries(geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_numgeometries(geometry) RETURNS integer
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-2.0', 'LWGEOM_numgeometries_collection';


ALTER FUNCTION public.st_numgeometries(geometry) OWNER TO postgres;

--
-- Name: st_numinteriorring(geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_numinteriorring(geometry) RETURNS integer
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-2.0', 'LWGEOM_numinteriorrings_polygon';


ALTER FUNCTION public.st_numinteriorring(geometry) OWNER TO postgres;

--
-- Name: st_numinteriorrings(geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_numinteriorrings(geometry) RETURNS integer
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-2.0', 'LWGEOM_numinteriorrings_polygon';


ALTER FUNCTION public.st_numinteriorrings(geometry) OWNER TO postgres;

--
-- Name: st_numpatches(geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_numpatches(geometry) RETURNS integer
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$
	SELECT CASE WHEN ST_GeometryType($1) = 'ST_PolyhedralSurface'
	THEN ST_NumGeometries($1)
	ELSE NULL END
	$_$;


ALTER FUNCTION public.st_numpatches(geometry) OWNER TO postgres;

--
-- Name: st_numpoints(geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_numpoints(geometry) RETURNS integer
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-2.0', 'LWGEOM_numpoints_linestring';


ALTER FUNCTION public.st_numpoints(geometry) OWNER TO postgres;

--
-- Name: st_offsetcurve(geometry, double precision, text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_offsetcurve(line geometry, distance double precision, params text DEFAULT ''::text) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT COST 100
    AS '$libdir/postgis-2.0', 'ST_OffsetCurve';


ALTER FUNCTION public.st_offsetcurve(line geometry, distance double precision, params text) OWNER TO postgres;

--
-- Name: st_orderingequals(geometry, geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_orderingequals(geometrya geometry, geometryb geometry) RETURNS boolean
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$ 
	SELECT $1 ~= $2 AND _ST_OrderingEquals($1, $2)
	$_$;


ALTER FUNCTION public.st_orderingequals(geometrya geometry, geometryb geometry) OWNER TO postgres;

--
-- Name: st_overlaps(geometry, geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_overlaps(geom1 geometry, geom2 geometry) RETURNS boolean
    LANGUAGE sql IMMUTABLE
    AS $_$SELECT $1 && $2 AND _ST_Overlaps($1,$2)$_$;


ALTER FUNCTION public.st_overlaps(geom1 geometry, geom2 geometry) OWNER TO postgres;

--
-- Name: st_patchn(geometry, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_patchn(geometry, integer) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$
	SELECT CASE WHEN ST_GeometryType($1) = 'ST_PolyhedralSurface'
	THEN ST_GeometryN($1, $2)
	ELSE NULL END
	$_$;


ALTER FUNCTION public.st_patchn(geometry, integer) OWNER TO postgres;

--
-- Name: st_perimeter(geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_perimeter(geometry) RETURNS double precision
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-2.0', 'LWGEOM_perimeter2d_poly';


ALTER FUNCTION public.st_perimeter(geometry) OWNER TO postgres;

--
-- Name: st_perimeter(geography, boolean); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_perimeter(geog geography, use_spheroid boolean DEFAULT true) RETURNS double precision
    LANGUAGE c IMMUTABLE STRICT COST 100
    AS '$libdir/postgis-2.0', 'geography_perimeter';


ALTER FUNCTION public.st_perimeter(geog geography, use_spheroid boolean) OWNER TO postgres;

--
-- Name: st_perimeter2d(geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_perimeter2d(geometry) RETURNS double precision
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-2.0', 'LWGEOM_perimeter2d_poly';


ALTER FUNCTION public.st_perimeter2d(geometry) OWNER TO postgres;

--
-- Name: st_pixelaspolygon(raster, integer, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_pixelaspolygon(rast raster, x integer, y integer) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/rtpostgis-2.0', 'RASTER_getPixelPolygon';


ALTER FUNCTION public.st_pixelaspolygon(rast raster, x integer, y integer) OWNER TO postgres;

--
-- Name: st_pixelaspolygons(raster, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_pixelaspolygons(rast raster, band integer DEFAULT 1, OUT geom geometry, OUT val double precision, OUT x integer, OUT y integer) RETURNS SETOF record
    LANGUAGE plpgsql
    AS $_$
    DECLARE
        rast alias for $1;
        var_w integer;
        var_h integer;
        var_x integer;
        var_y integer;
        value float8 := NULL;
        hasband boolean := TRUE;
    BEGIN
        IF rast IS NOT NULL AND NOT ST_IsEmpty(rast) THEN
            IF ST_HasNoBand(rast, band) THEN
                RAISE NOTICE 'Raster do not have band %. Returning null values', band;
                hasband := false;
            END IF;
            SELECT ST_Width(rast), ST_Height(rast) INTO var_w, var_h;
            FOR var_x IN 1..var_w LOOP
                FOR var_y IN 1..var_h LOOP
                    IF hasband THEN
                        value := ST_Value(rast, band, var_x, var_y);
                    END IF;
                    SELECT ST_PixelAsPolygon(rast, var_x, var_y), value, var_x, var_y INTO geom,val,x,y;
                    RETURN NEXT;
                END LOOP;
            END LOOP;
        END IF;
        RETURN;
    END;
    $_$;


ALTER FUNCTION public.st_pixelaspolygons(rast raster, band integer, OUT geom geometry, OUT val double precision, OUT x integer, OUT y integer) OWNER TO postgres;

--
-- Name: st_pixelheight(raster); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_pixelheight(raster) RETURNS double precision
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/rtpostgis-2.0', 'RASTER_getPixelHeight';


ALTER FUNCTION public.st_pixelheight(raster) OWNER TO postgres;

--
-- Name: st_pixelwidth(raster); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_pixelwidth(raster) RETURNS double precision
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/rtpostgis-2.0', 'RASTER_getPixelWidth';


ALTER FUNCTION public.st_pixelwidth(raster) OWNER TO postgres;

--
-- Name: st_point(double precision, double precision); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_point(double precision, double precision) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-2.0', 'LWGEOM_makepoint';


ALTER FUNCTION public.st_point(double precision, double precision) OWNER TO postgres;

--
-- Name: st_point_inside_circle(geometry, double precision, double precision, double precision); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_point_inside_circle(geometry, double precision, double precision, double precision) RETURNS boolean
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-2.0', 'LWGEOM_inside_circle_point';


ALTER FUNCTION public.st_point_inside_circle(geometry, double precision, double precision, double precision) OWNER TO postgres;

--
-- Name: st_pointfromtext(text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_pointfromtext(text) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$
	SELECT CASE WHEN geometrytype(ST_GeomFromText($1)) = 'POINT'
	THEN ST_GeomFromText($1)
	ELSE NULL END
	$_$;


ALTER FUNCTION public.st_pointfromtext(text) OWNER TO postgres;

--
-- Name: st_pointfromtext(text, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_pointfromtext(text, integer) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$
	SELECT CASE WHEN geometrytype(ST_GeomFromText($1, $2)) = 'POINT'
	THEN ST_GeomFromText($1, $2)
	ELSE NULL END
	$_$;


ALTER FUNCTION public.st_pointfromtext(text, integer) OWNER TO postgres;

--
-- Name: st_pointfromwkb(bytea); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_pointfromwkb(bytea) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$
	SELECT CASE WHEN geometrytype(ST_GeomFromWKB($1)) = 'POINT'
	THEN ST_GeomFromWKB($1)
	ELSE NULL END
	$_$;


ALTER FUNCTION public.st_pointfromwkb(bytea) OWNER TO postgres;

--
-- Name: st_pointfromwkb(bytea, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_pointfromwkb(bytea, integer) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$
	SELECT CASE WHEN geometrytype(ST_GeomFromWKB($1, $2)) = 'POINT'
	THEN ST_GeomFromWKB($1, $2)
	ELSE NULL END
	$_$;


ALTER FUNCTION public.st_pointfromwkb(bytea, integer) OWNER TO postgres;

--
-- Name: st_pointn(geometry, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_pointn(geometry, integer) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-2.0', 'LWGEOM_pointn_linestring';


ALTER FUNCTION public.st_pointn(geometry, integer) OWNER TO postgres;

--
-- Name: st_pointonsurface(geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_pointonsurface(geometry) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT COST 100
    AS '$libdir/postgis-2.0', 'pointonsurface';


ALTER FUNCTION public.st_pointonsurface(geometry) OWNER TO postgres;

--
-- Name: st_polyfromtext(text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_polyfromtext(text) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$
	SELECT CASE WHEN geometrytype(ST_GeomFromText($1)) = 'POLYGON'
	THEN ST_GeomFromText($1)
	ELSE NULL END
	$_$;


ALTER FUNCTION public.st_polyfromtext(text) OWNER TO postgres;

--
-- Name: st_polyfromtext(text, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_polyfromtext(text, integer) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$
	SELECT CASE WHEN geometrytype(ST_GeomFromText($1, $2)) = 'POLYGON'
	THEN ST_GeomFromText($1, $2)
	ELSE NULL END
	$_$;


ALTER FUNCTION public.st_polyfromtext(text, integer) OWNER TO postgres;

--
-- Name: st_polyfromwkb(bytea); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_polyfromwkb(bytea) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$
	SELECT CASE WHEN geometrytype(ST_GeomFromWKB($1)) = 'POLYGON'
	THEN ST_GeomFromWKB($1)
	ELSE NULL END
	$_$;


ALTER FUNCTION public.st_polyfromwkb(bytea) OWNER TO postgres;

--
-- Name: st_polyfromwkb(bytea, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_polyfromwkb(bytea, integer) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$
	SELECT CASE WHEN geometrytype(ST_GeomFromWKB($1, $2)) = 'POLYGON'
	THEN ST_GeomFromWKB($1, $2)
	ELSE NULL END
	$_$;


ALTER FUNCTION public.st_polyfromwkb(bytea, integer) OWNER TO postgres;

--
-- Name: st_polygon(geometry, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_polygon(geometry, integer) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$ 
	SELECT ST_SetSRID(ST_MakePolygon($1), $2)
	$_$;


ALTER FUNCTION public.st_polygon(geometry, integer) OWNER TO postgres;

--
-- Name: st_polygon(raster, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_polygon(rast raster, band integer DEFAULT 1) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$
    SELECT st_union(f.geom) AS singlegeom
    FROM (SELECT (st_dumpaspolygons($1, $2)).geom AS geom) AS f;
    $_$;


ALTER FUNCTION public.st_polygon(rast raster, band integer) OWNER TO postgres;

--
-- Name: st_polygonfromtext(text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_polygonfromtext(text) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$SELECT ST_PolyFromText($1)$_$;


ALTER FUNCTION public.st_polygonfromtext(text) OWNER TO postgres;

--
-- Name: st_polygonfromtext(text, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_polygonfromtext(text, integer) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$SELECT ST_PolyFromText($1, $2)$_$;


ALTER FUNCTION public.st_polygonfromtext(text, integer) OWNER TO postgres;

--
-- Name: st_polygonfromwkb(bytea); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_polygonfromwkb(bytea) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$
	SELECT CASE WHEN geometrytype(ST_GeomFromWKB($1)) = 'POLYGON'
	THEN ST_GeomFromWKB($1)
	ELSE NULL END
	$_$;


ALTER FUNCTION public.st_polygonfromwkb(bytea) OWNER TO postgres;

--
-- Name: st_polygonfromwkb(bytea, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_polygonfromwkb(bytea, integer) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$
	SELECT CASE WHEN geometrytype(ST_GeomFromWKB($1,$2)) = 'POLYGON'
	THEN ST_GeomFromWKB($1, $2)
	ELSE NULL END
	$_$;


ALTER FUNCTION public.st_polygonfromwkb(bytea, integer) OWNER TO postgres;

--
-- Name: st_polygonize(geometry[]); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_polygonize(geometry[]) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT COST 100
    AS '$libdir/postgis-2.0', 'polygonize_garray';


ALTER FUNCTION public.st_polygonize(geometry[]) OWNER TO postgres;

--
-- Name: st_project(geography, double precision, double precision); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_project(geog geography, distance double precision, azimuth double precision) RETURNS geography
    LANGUAGE c IMMUTABLE COST 100
    AS '$libdir/postgis-2.0', 'geography_project';


ALTER FUNCTION public.st_project(geog geography, distance double precision, azimuth double precision) OWNER TO postgres;

--
-- Name: st_quantile(raster, double precision[]); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_quantile(rast raster, quantiles double precision[]) RETURNS SETOF quantile
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$ SELECT _st_quantile($1, 1, TRUE, 1, $2) $_$;


ALTER FUNCTION public.st_quantile(rast raster, quantiles double precision[]) OWNER TO postgres;

--
-- Name: st_quantile(raster, double precision); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_quantile(rast raster, quantile double precision) RETURNS double precision
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$ SELECT (_st_quantile($1, 1, TRUE, 1, ARRAY[$2]::double precision[])).value $_$;


ALTER FUNCTION public.st_quantile(rast raster, quantile double precision) OWNER TO postgres;

--
-- Name: st_quantile(raster, integer, double precision[]); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_quantile(rast raster, nband integer, quantiles double precision[]) RETURNS SETOF quantile
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$ SELECT _st_quantile($1, $2, TRUE, 1, $3) $_$;


ALTER FUNCTION public.st_quantile(rast raster, nband integer, quantiles double precision[]) OWNER TO postgres;

--
-- Name: st_quantile(raster, integer, double precision); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_quantile(rast raster, nband integer, quantile double precision) RETURNS double precision
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$ SELECT (_st_quantile($1, $2, TRUE, 1, ARRAY[$3]::double precision[])).value $_$;


ALTER FUNCTION public.st_quantile(rast raster, nband integer, quantile double precision) OWNER TO postgres;

--
-- Name: st_quantile(raster, boolean, double precision); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_quantile(rast raster, exclude_nodata_value boolean, quantile double precision DEFAULT NULL::double precision) RETURNS double precision
    LANGUAGE sql IMMUTABLE
    AS $_$ SELECT (_st_quantile($1, 1, $2, 1, ARRAY[$3]::double precision[])).value $_$;


ALTER FUNCTION public.st_quantile(rast raster, exclude_nodata_value boolean, quantile double precision) OWNER TO postgres;

--
-- Name: st_quantile(text, text, double precision[]); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_quantile(rastertable text, rastercolumn text, quantiles double precision[]) RETURNS SETOF quantile
    LANGUAGE sql STABLE STRICT
    AS $_$ SELECT _st_quantile($1, $2, 1, TRUE, 1, $3) $_$;


ALTER FUNCTION public.st_quantile(rastertable text, rastercolumn text, quantiles double precision[]) OWNER TO postgres;

--
-- Name: st_quantile(text, text, double precision); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_quantile(rastertable text, rastercolumn text, quantile double precision) RETURNS double precision
    LANGUAGE sql STABLE STRICT
    AS $_$ SELECT (_st_quantile($1, $2, 1, TRUE, 1, ARRAY[$3]::double precision[])).value $_$;


ALTER FUNCTION public.st_quantile(rastertable text, rastercolumn text, quantile double precision) OWNER TO postgres;

--
-- Name: st_quantile(raster, integer, boolean, double precision[]); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_quantile(rast raster, nband integer DEFAULT 1, exclude_nodata_value boolean DEFAULT true, quantiles double precision[] DEFAULT NULL::double precision[]) RETURNS SETOF quantile
    LANGUAGE sql IMMUTABLE
    AS $_$ SELECT _st_quantile($1, $2, $3, 1, $4) $_$;


ALTER FUNCTION public.st_quantile(rast raster, nband integer, exclude_nodata_value boolean, quantiles double precision[]) OWNER TO postgres;

--
-- Name: st_quantile(raster, integer, boolean, double precision); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_quantile(rast raster, nband integer, exclude_nodata_value boolean, quantile double precision) RETURNS double precision
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$ SELECT (_st_quantile($1, $2, $3, 1, ARRAY[$4]::double precision[])).value $_$;


ALTER FUNCTION public.st_quantile(rast raster, nband integer, exclude_nodata_value boolean, quantile double precision) OWNER TO postgres;

--
-- Name: st_quantile(text, text, integer, double precision[]); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_quantile(rastertable text, rastercolumn text, nband integer, quantiles double precision[]) RETURNS SETOF quantile
    LANGUAGE sql STABLE STRICT
    AS $_$ SELECT _st_quantile($1, $2, $3, TRUE, 1, $4) $_$;


ALTER FUNCTION public.st_quantile(rastertable text, rastercolumn text, nband integer, quantiles double precision[]) OWNER TO postgres;

--
-- Name: st_quantile(text, text, integer, double precision); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_quantile(rastertable text, rastercolumn text, nband integer, quantile double precision) RETURNS double precision
    LANGUAGE sql STABLE STRICT
    AS $_$ SELECT (_st_quantile($1, $2, $3, TRUE, 1, ARRAY[$4]::double precision[])).value $_$;


ALTER FUNCTION public.st_quantile(rastertable text, rastercolumn text, nband integer, quantile double precision) OWNER TO postgres;

--
-- Name: st_quantile(text, text, boolean, double precision); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_quantile(rastertable text, rastercolumn text, exclude_nodata_value boolean, quantile double precision DEFAULT NULL::double precision) RETURNS double precision
    LANGUAGE sql STABLE
    AS $_$ SELECT (_st_quantile($1, $2, 1, $3, 1, ARRAY[$4]::double precision[])).value $_$;


ALTER FUNCTION public.st_quantile(rastertable text, rastercolumn text, exclude_nodata_value boolean, quantile double precision) OWNER TO postgres;

--
-- Name: st_quantile(text, text, integer, boolean, double precision[]); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_quantile(rastertable text, rastercolumn text, nband integer DEFAULT 1, exclude_nodata_value boolean DEFAULT true, quantiles double precision[] DEFAULT NULL::double precision[]) RETURNS SETOF quantile
    LANGUAGE sql STABLE
    AS $_$ SELECT _st_quantile($1, $2, $3, $4, 1, $5) $_$;


ALTER FUNCTION public.st_quantile(rastertable text, rastercolumn text, nband integer, exclude_nodata_value boolean, quantiles double precision[]) OWNER TO postgres;

--
-- Name: st_quantile(text, text, integer, boolean, double precision); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_quantile(rastertable text, rastercolumn text, nband integer, exclude_nodata_value boolean, quantile double precision) RETURNS double precision
    LANGUAGE sql STABLE STRICT
    AS $_$ SELECT (_st_quantile($1, $2, $3, $4, 1, ARRAY[$5]::double precision[])).value $_$;


ALTER FUNCTION public.st_quantile(rastertable text, rastercolumn text, nband integer, exclude_nodata_value boolean, quantile double precision) OWNER TO postgres;

--
-- Name: st_range4ma(double precision[], text, text[]); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_range4ma(matrix double precision[], nodatamode text, VARIADIC args text[]) RETURNS double precision
    LANGUAGE plpgsql IMMUTABLE
    AS $$
    DECLARE
        _matrix float[][];
        min float;
        max float;
    BEGIN
        _matrix := matrix;
        min := 'Infinity'::float;
        max := '-Infinity'::float;
        FOR x in array_lower(matrix, 1)..array_upper(matrix, 1) LOOP
            FOR y in array_lower(matrix, 2)..array_upper(matrix, 2) LOOP
                IF _matrix[x][y] IS NULL THEN
                    IF NOT nodatamode = 'ignore' THEN
                        _matrix[x][y] := nodatamode::float;
                    END IF;
                END IF;
                IF min > _matrix[x][y] THEN
                    min = _matrix[x][y];
                END IF;
                IF max < _matrix[x][y] THEN
                    max = _matrix[x][y];
                END IF;
            END LOOP;
        END LOOP;
        IF max = '-Infinity'::float OR min = 'Infinity'::float THEN
            RETURN NULL;
        END IF;
        RETURN max - min;
    END;
    $$;


ALTER FUNCTION public.st_range4ma(matrix double precision[], nodatamode text, VARIADIC args text[]) OWNER TO postgres;

--
-- Name: st_raster2worldcoordx(raster, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_raster2worldcoordx(rast raster, xr integer) RETURNS double precision
    LANGUAGE plpgsql IMMUTABLE STRICT
    AS $$
    DECLARE
        a float8 := 0.0;
        b float8 := 0.0;
        c float8 := 0.0;
        xw numeric := 0.0;
    BEGIN
				SELECT scalex, skewx, upperleftx INTO a, b, c FROM ST_Metadata(rast);
        IF ( b != 0 ) THEN
            RAISE EXCEPTION 'Attempting to compute raster coordinates on a raster with rotation providing X only. A Y coordinate must also be provided';
        END IF;
        xw := (a::numeric * (xr::numeric - 1.0) + c::numeric)::numeric;
        RETURN xw;
    END;
    $$;


ALTER FUNCTION public.st_raster2worldcoordx(rast raster, xr integer) OWNER TO postgres;

--
-- Name: st_raster2worldcoordx(raster, integer, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_raster2worldcoordx(rast raster, xr integer, yr integer) RETURNS double precision
    LANGUAGE plpgsql IMMUTABLE STRICT
    AS $$
    DECLARE
        a float8 := 0.0;
        b float8 := 0.0;
        c float8 := 0.0;
        xw numeric := 0.0;
    BEGIN
				SELECT scalex, skewx, upperleftx INTO a, b, c FROM ST_Metadata(rast);
        xw := (a::numeric * (xr::numeric - 1.0) + b::numeric * (yr::numeric - 1.0) + c::numeric)::numeric;
        RETURN xw;
    END;
    $$;


ALTER FUNCTION public.st_raster2worldcoordx(rast raster, xr integer, yr integer) OWNER TO postgres;

--
-- Name: st_raster2worldcoordy(raster, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_raster2worldcoordy(rast raster, yr integer) RETURNS double precision
    LANGUAGE plpgsql IMMUTABLE STRICT
    AS $$
    DECLARE
        d float8 := 0.0;
        e float8 := 0.0;
        f float8 := 0.0;
        yw numeric := 0.0;
    BEGIN
				SELECT skewy, scaley, upperlefty INTO d, e, f FROM ST_Metadata(rast);
        IF ( d != 0 ) THEN
            RAISE EXCEPTION 'Attempting to compute raster coordinates on a raster with rotation providing Y only. An X coordinate must also be provided';
        END IF;
        yw := (e::numeric * (yr::numeric - 1.0) + f::numeric)::numeric;
        RETURN yw;
    END;
    $$;


ALTER FUNCTION public.st_raster2worldcoordy(rast raster, yr integer) OWNER TO postgres;

--
-- Name: st_raster2worldcoordy(raster, integer, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_raster2worldcoordy(rast raster, xr integer, yr integer) RETURNS double precision
    LANGUAGE plpgsql IMMUTABLE STRICT
    AS $$
    DECLARE
        d float8 := 0.0;
        e float8 := 0.0;
        f float8 := 0.0;
        yw numeric := 0.0;
    BEGIN
				SELECT skewy, scaley, upperlefty INTO d, e, f FROM ST_Metadata(rast);
        yw := (d::numeric * (xr::numeric - 1.0) + e::numeric * (yr::numeric - 1.0) + f::numeric)::numeric;
        RETURN yw;
    END;
    $$;


ALTER FUNCTION public.st_raster2worldcoordy(rast raster, xr integer, yr integer) OWNER TO postgres;

--
-- Name: st_reclass(raster, reclassarg[]); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_reclass(rast raster, VARIADIC reclassargset reclassarg[]) RETURNS raster
    LANGUAGE plpgsql IMMUTABLE STRICT
    AS $_$
	DECLARE
		i int;
		expr text;
	BEGIN
		-- for each reclassarg, validate elements as all except nodataval cannot be NULL
		FOR i IN SELECT * FROM generate_subscripts($2, 1) LOOP
			IF $2[i].nband IS NULL OR $2[i].reclassexpr IS NULL OR $2[i].pixeltype IS NULL THEN
				RAISE WARNING 'Values are required for the nband, reclassexpr and pixeltype attributes.';
				RETURN rast;
			END IF;
		END LOOP;

		RETURN _st_reclass($1, VARIADIC $2);
	END;
	$_$;


ALTER FUNCTION public.st_reclass(rast raster, VARIADIC reclassargset reclassarg[]) OWNER TO postgres;

--
-- Name: st_reclass(raster, text, text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_reclass(rast raster, reclassexpr text, pixeltype text) RETURNS raster
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$ SELECT st_reclass($1, ROW(1, $2, $3, NULL)) $_$;


ALTER FUNCTION public.st_reclass(rast raster, reclassexpr text, pixeltype text) OWNER TO postgres;

--
-- Name: st_reclass(raster, integer, text, text, double precision); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_reclass(rast raster, nband integer, reclassexpr text, pixeltype text, nodataval double precision DEFAULT NULL::double precision) RETURNS raster
    LANGUAGE sql IMMUTABLE
    AS $_$ SELECT st_reclass($1, ROW($2, $3, $4, $5)) $_$;


ALTER FUNCTION public.st_reclass(rast raster, nband integer, reclassexpr text, pixeltype text, nodataval double precision) OWNER TO postgres;

--
-- Name: st_relate(geometry, geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_relate(geom1 geometry, geom2 geometry) RETURNS text
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-2.0', 'relate_full';


ALTER FUNCTION public.st_relate(geom1 geometry, geom2 geometry) OWNER TO postgres;

--
-- Name: st_relate(geometry, geometry, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_relate(geom1 geometry, geom2 geometry, integer) RETURNS text
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-2.0', 'relate_full';


ALTER FUNCTION public.st_relate(geom1 geometry, geom2 geometry, integer) OWNER TO postgres;

--
-- Name: st_relate(geometry, geometry, text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_relate(geom1 geometry, geom2 geometry, text) RETURNS boolean
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-2.0', 'relate_pattern';


ALTER FUNCTION public.st_relate(geom1 geometry, geom2 geometry, text) OWNER TO postgres;

--
-- Name: st_relatematch(text, text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_relatematch(text, text) RETURNS boolean
    LANGUAGE c IMMUTABLE STRICT COST 100
    AS '$libdir/postgis-2.0', 'ST_RelateMatch';


ALTER FUNCTION public.st_relatematch(text, text) OWNER TO postgres;

--
-- Name: st_removepoint(geometry, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_removepoint(geometry, integer) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-2.0', 'LWGEOM_removepoint';


ALTER FUNCTION public.st_removepoint(geometry, integer) OWNER TO postgres;

--
-- Name: st_removerepeatedpoints(geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_removerepeatedpoints(geometry) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT COST 100
    AS '$libdir/postgis-2.0', 'ST_RemoveRepeatedPoints';


ALTER FUNCTION public.st_removerepeatedpoints(geometry) OWNER TO postgres;

--
-- Name: st_resample(raster, raster, text, double precision, boolean); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_resample(rast raster, ref raster, algorithm text DEFAULT 'NearestNeighbour'::text, maxerr double precision DEFAULT 0.125, usescale boolean DEFAULT true) RETURNS raster
    LANGUAGE plpgsql STABLE STRICT
    AS $_$
	DECLARE
		sr_id int;
		dim_x int;
		dim_y int;
		scale_x double precision;
		scale_y double precision;
		grid_x double precision;
		grid_y double precision;
		skew_x double precision;
		skew_y double precision;
	BEGIN
		SELECT srid, width, height, scalex, scaley, upperleftx, upperlefty, skewx, skewy INTO sr_id, dim_x, dim_y, scale_x, scale_y, grid_x, grid_y, skew_x, skew_y FROM st_metadata($2);

		IF usescale IS TRUE THEN
			dim_x := NULL;
			dim_y := NULL;
		ELSE
			scale_x := NULL;
			scale_y := NULL;
		END IF;

		RETURN _st_resample($1, $3, $4, sr_id, scale_x, scale_y, grid_x, grid_y, skew_x, skew_y, dim_x, dim_y);
	END;
	$_$;


ALTER FUNCTION public.st_resample(rast raster, ref raster, algorithm text, maxerr double precision, usescale boolean) OWNER TO postgres;

--
-- Name: st_resample(raster, raster, boolean, text, double precision); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_resample(rast raster, ref raster, usescale boolean, algorithm text DEFAULT 'NearestNeighbour'::text, maxerr double precision DEFAULT 0.125) RETURNS raster
    LANGUAGE sql STABLE STRICT
    AS $_$ SELECT st_resample($1, $2, $4, $5, $3) $_$;


ALTER FUNCTION public.st_resample(rast raster, ref raster, usescale boolean, algorithm text, maxerr double precision) OWNER TO postgres;

--
-- Name: st_resample(raster, integer, double precision, double precision, double precision, double precision, double precision, double precision, text, double precision); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_resample(rast raster, srid integer DEFAULT NULL::integer, scalex double precision DEFAULT 0, scaley double precision DEFAULT 0, gridx double precision DEFAULT NULL::double precision, gridy double precision DEFAULT NULL::double precision, skewx double precision DEFAULT 0, skewy double precision DEFAULT 0, algorithm text DEFAULT 'NearestNeighbour'::text, maxerr double precision DEFAULT 0.125) RETURNS raster
    LANGUAGE sql STABLE
    AS $_$ SELECT _st_resample($1, $9,	$10, $2, $3, $4, $5, $6, $7, $8) $_$;


ALTER FUNCTION public.st_resample(rast raster, srid integer, scalex double precision, scaley double precision, gridx double precision, gridy double precision, skewx double precision, skewy double precision, algorithm text, maxerr double precision) OWNER TO postgres;

--
-- Name: st_resample(raster, integer, integer, integer, double precision, double precision, double precision, double precision, text, double precision); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_resample(rast raster, width integer, height integer, srid integer DEFAULT NULL::integer, gridx double precision DEFAULT NULL::double precision, gridy double precision DEFAULT NULL::double precision, skewx double precision DEFAULT 0, skewy double precision DEFAULT 0, algorithm text DEFAULT 'NearestNeighbour'::text, maxerr double precision DEFAULT 0.125) RETURNS raster
    LANGUAGE sql STABLE
    AS $_$ SELECT _st_resample($1, $9,	$10, $4, NULL, NULL, $5, $6, $7, $8, $2, $3) $_$;


ALTER FUNCTION public.st_resample(rast raster, width integer, height integer, srid integer, gridx double precision, gridy double precision, skewx double precision, skewy double precision, algorithm text, maxerr double precision) OWNER TO postgres;

--
-- Name: st_rescale(raster, double precision, text, double precision); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_rescale(rast raster, scalexy double precision, algorithm text DEFAULT 'NearestNeighbour'::text, maxerr double precision DEFAULT 0.125) RETURNS raster
    LANGUAGE sql STABLE STRICT
    AS $_$ SELECT _st_resample($1, $3, $4, NULL, $2, $2) $_$;


ALTER FUNCTION public.st_rescale(rast raster, scalexy double precision, algorithm text, maxerr double precision) OWNER TO postgres;

--
-- Name: st_rescale(raster, double precision, double precision, text, double precision); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_rescale(rast raster, scalex double precision, scaley double precision, algorithm text DEFAULT 'NearestNeighbour'::text, maxerr double precision DEFAULT 0.125) RETURNS raster
    LANGUAGE sql STABLE STRICT
    AS $_$ SELECT _st_resample($1, $4, $5, NULL, $2, $3) $_$;


ALTER FUNCTION public.st_rescale(rast raster, scalex double precision, scaley double precision, algorithm text, maxerr double precision) OWNER TO postgres;

--
-- Name: st_reskew(raster, double precision, text, double precision); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_reskew(rast raster, skewxy double precision, algorithm text DEFAULT 'NearestNeighbour'::text, maxerr double precision DEFAULT 0.125) RETURNS raster
    LANGUAGE sql STABLE STRICT
    AS $_$ SELECT _st_resample($1, $3, $4, NULL, 0, 0, NULL, NULL, $2, $2) $_$;


ALTER FUNCTION public.st_reskew(rast raster, skewxy double precision, algorithm text, maxerr double precision) OWNER TO postgres;

--
-- Name: st_reskew(raster, double precision, double precision, text, double precision); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_reskew(rast raster, skewx double precision, skewy double precision, algorithm text DEFAULT 'NearestNeighbour'::text, maxerr double precision DEFAULT 0.125) RETURNS raster
    LANGUAGE sql STABLE STRICT
    AS $_$ SELECT _st_resample($1, $4, $5, NULL, 0, 0, NULL, NULL, $2, $3) $_$;


ALTER FUNCTION public.st_reskew(rast raster, skewx double precision, skewy double precision, algorithm text, maxerr double precision) OWNER TO postgres;

--
-- Name: st_reverse(geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_reverse(geometry) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-2.0', 'LWGEOM_reverse';


ALTER FUNCTION public.st_reverse(geometry) OWNER TO postgres;

--
-- Name: st_rotate(geometry, double precision); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_rotate(geometry, double precision) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$SELECT ST_Affine($1,  cos($2), -sin($2), 0,  sin($2), cos($2), 0,  0, 0, 1,  0, 0, 0)$_$;


ALTER FUNCTION public.st_rotate(geometry, double precision) OWNER TO postgres;

--
-- Name: st_rotate(geometry, double precision, geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_rotate(geometry, double precision, geometry) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$SELECT ST_Affine($1,  cos($2), -sin($2), 0,  sin($2),  cos($2), 0, 0, 0, 1, ST_X($3) - cos($2) * ST_X($3) + sin($2) * ST_Y($3), ST_Y($3) - sin($2) * ST_X($3) - cos($2) * ST_Y($3), 0)$_$;


ALTER FUNCTION public.st_rotate(geometry, double precision, geometry) OWNER TO postgres;

--
-- Name: st_rotate(geometry, double precision, double precision, double precision); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_rotate(geometry, double precision, double precision, double precision) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$SELECT ST_Affine($1,  cos($2), -sin($2), 0,  sin($2),  cos($2), 0, 0, 0, 1,	$3 - cos($2) * $3 + sin($2) * $4, $4 - sin($2) * $3 - cos($2) * $4, 0)$_$;


ALTER FUNCTION public.st_rotate(geometry, double precision, double precision, double precision) OWNER TO postgres;

--
-- Name: st_rotatex(geometry, double precision); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_rotatex(geometry, double precision) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$SELECT ST_Affine($1, 1, 0, 0, 0, cos($2), -sin($2), 0, sin($2), cos($2), 0, 0, 0)$_$;


ALTER FUNCTION public.st_rotatex(geometry, double precision) OWNER TO postgres;

--
-- Name: st_rotatey(geometry, double precision); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_rotatey(geometry, double precision) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$SELECT ST_Affine($1,  cos($2), 0, sin($2),  0, 1, 0,  -sin($2), 0, cos($2), 0,  0, 0)$_$;


ALTER FUNCTION public.st_rotatey(geometry, double precision) OWNER TO postgres;

--
-- Name: st_rotatez(geometry, double precision); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_rotatez(geometry, double precision) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$SELECT ST_Rotate($1, $2)$_$;


ALTER FUNCTION public.st_rotatez(geometry, double precision) OWNER TO postgres;

--
-- Name: st_rotation(raster); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_rotation(raster) RETURNS double precision
    LANGUAGE sql
    AS $_$ SELECT (ST_Geotransform($1)).theta_i $_$;


ALTER FUNCTION public.st_rotation(raster) OWNER TO postgres;

--
-- Name: st_samealignment(raster, raster); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_samealignment(rast1 raster, rast2 raster) RETURNS boolean
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/rtpostgis-2.0', 'RASTER_sameAlignment';


ALTER FUNCTION public.st_samealignment(rast1 raster, rast2 raster) OWNER TO postgres;

--
-- Name: st_samealignment(double precision, double precision, double precision, double precision, double precision, double precision, double precision, double precision, double precision, double precision, double precision, double precision); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_samealignment(ulx1 double precision, uly1 double precision, scalex1 double precision, scaley1 double precision, skewx1 double precision, skewy1 double precision, ulx2 double precision, uly2 double precision, scalex2 double precision, scaley2 double precision, skewx2 double precision, skewy2 double precision) RETURNS boolean
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$ SELECT st_samealignment(st_makeemptyraster(1, 1, $1, $2, $3, $4, $5, $6), st_makeemptyraster(1, 1, $7, $8, $9, $10, $11, $12)) $_$;


ALTER FUNCTION public.st_samealignment(ulx1 double precision, uly1 double precision, scalex1 double precision, scaley1 double precision, skewx1 double precision, skewy1 double precision, ulx2 double precision, uly2 double precision, scalex2 double precision, scaley2 double precision, skewx2 double precision, skewy2 double precision) OWNER TO postgres;

--
-- Name: st_scale(geometry, double precision, double precision); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_scale(geometry, double precision, double precision) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$SELECT ST_Scale($1, $2, $3, 1)$_$;


ALTER FUNCTION public.st_scale(geometry, double precision, double precision) OWNER TO postgres;

--
-- Name: st_scale(geometry, double precision, double precision, double precision); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_scale(geometry, double precision, double precision, double precision) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$SELECT ST_Affine($1,  $2, 0, 0,  0, $3, 0,  0, 0, $4,  0, 0, 0)$_$;


ALTER FUNCTION public.st_scale(geometry, double precision, double precision, double precision) OWNER TO postgres;

--
-- Name: st_scalex(raster); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_scalex(raster) RETURNS double precision
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/rtpostgis-2.0', 'RASTER_getXScale';


ALTER FUNCTION public.st_scalex(raster) OWNER TO postgres;

--
-- Name: st_scaley(raster); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_scaley(raster) RETURNS double precision
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/rtpostgis-2.0', 'RASTER_getYScale';


ALTER FUNCTION public.st_scaley(raster) OWNER TO postgres;

--
-- Name: st_segmentize(geometry, double precision); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_segmentize(geometry, double precision) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-2.0', 'LWGEOM_segmentize2d';


ALTER FUNCTION public.st_segmentize(geometry, double precision) OWNER TO postgres;

--
-- Name: st_setbandisnodata(raster, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_setbandisnodata(rast raster, band integer DEFAULT 1) RETURNS raster
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/rtpostgis-2.0', 'RASTER_setBandIsNoData';


ALTER FUNCTION public.st_setbandisnodata(rast raster, band integer) OWNER TO postgres;

--
-- Name: st_setbandnodatavalue(raster, double precision); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_setbandnodatavalue(rast raster, nodatavalue double precision) RETURNS raster
    LANGUAGE sql
    AS $_$ SELECT st_setbandnodatavalue($1, 1, $2, FALSE) $_$;


ALTER FUNCTION public.st_setbandnodatavalue(rast raster, nodatavalue double precision) OWNER TO postgres;

--
-- Name: st_setbandnodatavalue(raster, integer, double precision, boolean); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_setbandnodatavalue(rast raster, band integer, nodatavalue double precision, forcechecking boolean DEFAULT false) RETURNS raster
    LANGUAGE c IMMUTABLE
    AS '$libdir/rtpostgis-2.0', 'RASTER_setBandNoDataValue';


ALTER FUNCTION public.st_setbandnodatavalue(rast raster, band integer, nodatavalue double precision, forcechecking boolean) OWNER TO postgres;

--
-- Name: st_setgeoreference(raster, text, text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_setgeoreference(rast raster, georef text, format text DEFAULT 'GDAL'::text) RETURNS raster
    LANGUAGE plpgsql IMMUTABLE STRICT
    AS $$
    DECLARE
        params text[];
        rastout raster;
    BEGIN
        IF rast IS NULL THEN
            RAISE WARNING 'Cannot set georeferencing on a null raster in st_setgeoreference.';
            RETURN rastout;
        END IF;

        SELECT regexp_matches(georef,
            E'(-?\\d+(?:\\.\\d+)?)\\s(-?\\d+(?:\\.\\d+)?)\\s(-?\\d+(?:\\.\\d+)?)\\s' ||
            E'(-?\\d+(?:\\.\\d+)?)\\s(-?\\d+(?:\\.\\d+)?)\\s(-?\\d+(?:\\.\\d+)?)') INTO params;

        IF NOT FOUND THEN
            RAISE EXCEPTION 'st_setgeoreference requires a string with 6 floating point values.';
        END IF;

        IF format = 'ESRI' THEN
            -- params array is now:
            -- {scalex, skewy, skewx, scaley, upperleftx, upperlefty}
            rastout := st_setscale(rast, params[1]::float8, params[4]::float8);
            rastout := st_setskew(rastout, params[3]::float8, params[2]::float8);
            rastout := st_setupperleft(rastout,
                                   params[5]::float8 - (params[1]::float8 * 0.5),
                                   params[6]::float8 - (params[4]::float8 * 0.5));
        ELSE
            IF format != 'GDAL' THEN
                RAISE WARNING E'Format \'%\' is not recognized, defaulting to GDAL format.', format;
            END IF;
            -- params array is now:
            -- {scalex, skewy, skewx, scaley, upperleftx, upperlefty}

            rastout := st_setscale(rast, params[1]::float8, params[4]::float8);
            rastout := st_setskew( rastout, params[3]::float8, params[2]::float8);
            rastout := st_setupperleft(rastout, params[5]::float8, params[6]::float8);
        END IF;
        RETURN rastout;
    END;
    $$;


ALTER FUNCTION public.st_setgeoreference(rast raster, georef text, format text) OWNER TO postgres;

--
-- Name: st_setgeotransform(raster, double precision, double precision, double precision, double precision, double precision, double precision); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_setgeotransform(rast raster, imag double precision, jmag double precision, theta_i double precision, theta_ij double precision, xoffset double precision, yoffset double precision) RETURNS raster
    LANGUAGE c IMMUTABLE
    AS '$libdir/rtpostgis-2.0', 'RASTER_setGeotransform';


ALTER FUNCTION public.st_setgeotransform(rast raster, imag double precision, jmag double precision, theta_i double precision, theta_ij double precision, xoffset double precision, yoffset double precision) OWNER TO postgres;

--
-- Name: st_setpoint(geometry, integer, geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_setpoint(geometry, integer, geometry) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-2.0', 'LWGEOM_setpoint_linestring';


ALTER FUNCTION public.st_setpoint(geometry, integer, geometry) OWNER TO postgres;

--
-- Name: st_setrotation(raster, double precision); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_setrotation(rast raster, rotation double precision) RETURNS raster
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/rtpostgis-2.0', 'RASTER_setRotation';


ALTER FUNCTION public.st_setrotation(rast raster, rotation double precision) OWNER TO postgres;

--
-- Name: st_setscale(raster, double precision); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_setscale(rast raster, scale double precision) RETURNS raster
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/rtpostgis-2.0', 'RASTER_setScale';


ALTER FUNCTION public.st_setscale(rast raster, scale double precision) OWNER TO postgres;

--
-- Name: st_setscale(raster, double precision, double precision); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_setscale(rast raster, scalex double precision, scaley double precision) RETURNS raster
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/rtpostgis-2.0', 'RASTER_setScaleXY';


ALTER FUNCTION public.st_setscale(rast raster, scalex double precision, scaley double precision) OWNER TO postgres;

--
-- Name: st_setskew(raster, double precision); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_setskew(rast raster, skew double precision) RETURNS raster
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/rtpostgis-2.0', 'RASTER_setSkew';


ALTER FUNCTION public.st_setskew(rast raster, skew double precision) OWNER TO postgres;

--
-- Name: st_setskew(raster, double precision, double precision); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_setskew(rast raster, skewx double precision, skewy double precision) RETURNS raster
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/rtpostgis-2.0', 'RASTER_setSkewXY';


ALTER FUNCTION public.st_setskew(rast raster, skewx double precision, skewy double precision) OWNER TO postgres;

--
-- Name: st_setsrid(geometry, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_setsrid(geometry, integer) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-2.0', 'LWGEOM_set_srid';


ALTER FUNCTION public.st_setsrid(geometry, integer) OWNER TO postgres;

--
-- Name: st_setsrid(raster, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_setsrid(rast raster, srid integer) RETURNS raster
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/rtpostgis-2.0', 'RASTER_setSRID';


ALTER FUNCTION public.st_setsrid(rast raster, srid integer) OWNER TO postgres;

--
-- Name: st_setupperleft(raster, double precision, double precision); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_setupperleft(rast raster, upperleftx double precision, upperlefty double precision) RETURNS raster
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/rtpostgis-2.0', 'RASTER_setUpperLeftXY';


ALTER FUNCTION public.st_setupperleft(rast raster, upperleftx double precision, upperlefty double precision) OWNER TO postgres;

--
-- Name: st_setvalue(raster, geometry, double precision); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_setvalue(rast raster, pt geometry, newvalue double precision) RETURNS raster
    LANGUAGE sql
    AS $_$ SELECT st_setvalue($1, 1, $2, $3) $_$;


ALTER FUNCTION public.st_setvalue(rast raster, pt geometry, newvalue double precision) OWNER TO postgres;

--
-- Name: st_setvalue(raster, integer, integer, double precision); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_setvalue(rast raster, x integer, y integer, newvalue double precision) RETURNS raster
    LANGUAGE sql
    AS $_$ SELECT st_setvalue($1, 1, $2, $3, $4) $_$;


ALTER FUNCTION public.st_setvalue(rast raster, x integer, y integer, newvalue double precision) OWNER TO postgres;

--
-- Name: st_setvalue(raster, integer, geometry, double precision); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_setvalue(rast raster, band integer, pt geometry, newvalue double precision) RETURNS raster
    LANGUAGE plpgsql IMMUTABLE
    AS $$
    DECLARE
        x float8;
        y float8;
        gtype text;
    BEGIN
        gtype := st_geometrytype(pt);
        IF ( gtype != 'ST_Point' ) THEN
            RAISE EXCEPTION 'Attempting to get the value of a pixel with a non-point geometry';
        END IF;
        x := st_x(pt);
        y := st_y(pt);
        RETURN st_setvalue(rast,
                           band,
                           st_world2rastercoordx(rast, x, y),
                           st_world2rastercoordy(rast, x, y),
                           newvalue);
    END;
    $$;


ALTER FUNCTION public.st_setvalue(rast raster, band integer, pt geometry, newvalue double precision) OWNER TO postgres;

--
-- Name: st_setvalue(raster, integer, integer, integer, double precision); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_setvalue(rast raster, band integer, x integer, y integer, newvalue double precision) RETURNS raster
    LANGUAGE c IMMUTABLE
    AS '$libdir/rtpostgis-2.0', 'RASTER_setPixelValue';


ALTER FUNCTION public.st_setvalue(rast raster, band integer, x integer, y integer, newvalue double precision) OWNER TO postgres;

--
-- Name: st_sharedpaths(geometry, geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_sharedpaths(geom1 geometry, geom2 geometry) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT COST 100
    AS '$libdir/postgis-2.0', 'ST_SharedPaths';


ALTER FUNCTION public.st_sharedpaths(geom1 geometry, geom2 geometry) OWNER TO postgres;

--
-- Name: st_shift_longitude(geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_shift_longitude(geometry) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-2.0', 'LWGEOM_longitude_shift';


ALTER FUNCTION public.st_shift_longitude(geometry) OWNER TO postgres;

--
-- Name: st_shortestline(geometry, geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_shortestline(geom1 geometry, geom2 geometry) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-2.0', 'LWGEOM_shortestline2d';


ALTER FUNCTION public.st_shortestline(geom1 geometry, geom2 geometry) OWNER TO postgres;

--
-- Name: st_simplify(geometry, double precision); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_simplify(geometry, double precision) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-2.0', 'LWGEOM_simplify2d';


ALTER FUNCTION public.st_simplify(geometry, double precision) OWNER TO postgres;

--
-- Name: st_simplifypreservetopology(geometry, double precision); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_simplifypreservetopology(geometry, double precision) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT COST 100
    AS '$libdir/postgis-2.0', 'topologypreservesimplify';


ALTER FUNCTION public.st_simplifypreservetopology(geometry, double precision) OWNER TO postgres;

--
-- Name: st_skewx(raster); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_skewx(raster) RETURNS double precision
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/rtpostgis-2.0', 'RASTER_getXSkew';


ALTER FUNCTION public.st_skewx(raster) OWNER TO postgres;

--
-- Name: st_skewy(raster); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_skewy(raster) RETURNS double precision
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/rtpostgis-2.0', 'RASTER_getYSkew';


ALTER FUNCTION public.st_skewy(raster) OWNER TO postgres;

--
-- Name: st_slope(raster, integer, text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_slope(rast raster, band integer, pixeltype text) RETURNS raster
    LANGUAGE sql STABLE
    AS $_$ SELECT st_mapalgebrafctngb($1, $2, $3, 1, 1, '_st_slope4ma(float[][], text, text[])'::regprocedure, 'value', st_pixelwidth($1)::text, st_pixelheight($1)::text) $_$;


ALTER FUNCTION public.st_slope(rast raster, band integer, pixeltype text) OWNER TO postgres;

--
-- Name: st_snap(geometry, geometry, double precision); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_snap(geom1 geometry, geom2 geometry, double precision) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT COST 100
    AS '$libdir/postgis-2.0', 'ST_Snap';


ALTER FUNCTION public.st_snap(geom1 geometry, geom2 geometry, double precision) OWNER TO postgres;

--
-- Name: st_snaptogrid(geometry, double precision); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_snaptogrid(geometry, double precision) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$SELECT ST_SnapToGrid($1, 0, 0, $2, $2)$_$;


ALTER FUNCTION public.st_snaptogrid(geometry, double precision) OWNER TO postgres;

--
-- Name: st_snaptogrid(geometry, double precision, double precision); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_snaptogrid(geometry, double precision, double precision) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$SELECT ST_SnapToGrid($1, 0, 0, $2, $3)$_$;


ALTER FUNCTION public.st_snaptogrid(geometry, double precision, double precision) OWNER TO postgres;

--
-- Name: st_snaptogrid(geometry, double precision, double precision, double precision, double precision); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_snaptogrid(geometry, double precision, double precision, double precision, double precision) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-2.0', 'LWGEOM_snaptogrid';


ALTER FUNCTION public.st_snaptogrid(geometry, double precision, double precision, double precision, double precision) OWNER TO postgres;

--
-- Name: st_snaptogrid(geometry, geometry, double precision, double precision, double precision, double precision); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_snaptogrid(geom1 geometry, geom2 geometry, double precision, double precision, double precision, double precision) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-2.0', 'LWGEOM_snaptogrid_pointoff';


ALTER FUNCTION public.st_snaptogrid(geom1 geometry, geom2 geometry, double precision, double precision, double precision, double precision) OWNER TO postgres;

--
-- Name: st_snaptogrid(raster, double precision, double precision, double precision, text, double precision); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_snaptogrid(rast raster, gridx double precision, gridy double precision, scalexy double precision, algorithm text DEFAULT 'NearestNeighbour'::text, maxerr double precision DEFAULT 0.125) RETURNS raster
    LANGUAGE sql STABLE STRICT
    AS $_$ SELECT _st_resample($1, $5, $6, NULL, $4, $4, $2, $3) $_$;


ALTER FUNCTION public.st_snaptogrid(rast raster, gridx double precision, gridy double precision, scalexy double precision, algorithm text, maxerr double precision) OWNER TO postgres;

--
-- Name: st_snaptogrid(raster, double precision, double precision, text, double precision, double precision, double precision); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_snaptogrid(rast raster, gridx double precision, gridy double precision, algorithm text DEFAULT 'NearestNeighbour'::text, maxerr double precision DEFAULT 0.125, scalex double precision DEFAULT 0, scaley double precision DEFAULT 0) RETURNS raster
    LANGUAGE sql STABLE STRICT
    AS $_$ SELECT _st_resample($1, $4, $5, NULL, $6, $7, $2, $3) $_$;


ALTER FUNCTION public.st_snaptogrid(rast raster, gridx double precision, gridy double precision, algorithm text, maxerr double precision, scalex double precision, scaley double precision) OWNER TO postgres;

--
-- Name: st_snaptogrid(raster, double precision, double precision, double precision, double precision, text, double precision); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_snaptogrid(rast raster, gridx double precision, gridy double precision, scalex double precision, scaley double precision, algorithm text DEFAULT 'NearestNeighbour'::text, maxerr double precision DEFAULT 0.125) RETURNS raster
    LANGUAGE sql STABLE STRICT
    AS $_$ SELECT _st_resample($1, $6, $7, NULL, $4, $5, $2, $3) $_$;


ALTER FUNCTION public.st_snaptogrid(rast raster, gridx double precision, gridy double precision, scalex double precision, scaley double precision, algorithm text, maxerr double precision) OWNER TO postgres;

--
-- Name: st_split(geometry, geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_split(geom1 geometry, geom2 geometry) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT COST 100
    AS '$libdir/postgis-2.0', 'ST_Split';


ALTER FUNCTION public.st_split(geom1 geometry, geom2 geometry) OWNER TO postgres;

--
-- Name: st_srid(geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_srid(geometry) RETURNS integer
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-2.0', 'LWGEOM_get_srid';


ALTER FUNCTION public.st_srid(geometry) OWNER TO postgres;

--
-- Name: st_srid(raster); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_srid(raster) RETURNS integer
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/rtpostgis-2.0', 'RASTER_getSRID';


ALTER FUNCTION public.st_srid(raster) OWNER TO postgres;

--
-- Name: st_startpoint(geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_startpoint(geometry) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-2.0', 'LWGEOM_startpoint_linestring';


ALTER FUNCTION public.st_startpoint(geometry) OWNER TO postgres;

--
-- Name: st_stddev4ma(double precision[], text, text[]); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_stddev4ma(matrix double precision[], nodatamode text, VARIADIC args text[]) RETURNS double precision
    LANGUAGE sql IMMUTABLE
    AS $_$ SELECT stddev(unnest) FROM unnest($1) $_$;


ALTER FUNCTION public.st_stddev4ma(matrix double precision[], nodatamode text, VARIADIC args text[]) OWNER TO postgres;

--
-- Name: st_sum4ma(double precision[], text, text[]); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_sum4ma(matrix double precision[], nodatamode text, VARIADIC args text[]) RETURNS double precision
    LANGUAGE plpgsql IMMUTABLE
    AS $$
    DECLARE
        _matrix float[][];
        sum float;
    BEGIN
        _matrix := matrix;
        sum := 0;
        FOR x in array_lower(matrix, 1)..array_upper(matrix, 1) LOOP
            FOR y in array_lower(matrix, 2)..array_upper(matrix, 2) LOOP
                IF _matrix[x][y] IS NULL THEN
                    IF nodatamode = 'ignore' THEN
                        _matrix[x][y] := 0;
                    ELSE
                        _matrix[x][y] := nodatamode::float;
                    END IF;
                END IF;
                sum := sum + _matrix[x][y];
            END LOOP;
        END LOOP;
        RETURN sum;
    END;
    $$;


ALTER FUNCTION public.st_sum4ma(matrix double precision[], nodatamode text, VARIADIC args text[]) OWNER TO postgres;

--
-- Name: st_summary(geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_summary(geometry) RETURNS text
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-2.0', 'LWGEOM_summary';


ALTER FUNCTION public.st_summary(geometry) OWNER TO postgres;

--
-- Name: st_summary(geography); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_summary(geography) RETURNS text
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-2.0', 'LWGEOM_summary';


ALTER FUNCTION public.st_summary(geography) OWNER TO postgres;

--
-- Name: st_summarystats(raster, boolean); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_summarystats(rast raster, exclude_nodata_value boolean) RETURNS summarystats
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$ SELECT _st_summarystats($1, 1, $2, 1) $_$;


ALTER FUNCTION public.st_summarystats(rast raster, exclude_nodata_value boolean) OWNER TO postgres;

--
-- Name: st_summarystats(raster, integer, boolean); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_summarystats(rast raster, nband integer DEFAULT 1, exclude_nodata_value boolean DEFAULT true) RETURNS summarystats
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$ SELECT _st_summarystats($1, $2, $3, 1) $_$;


ALTER FUNCTION public.st_summarystats(rast raster, nband integer, exclude_nodata_value boolean) OWNER TO postgres;

--
-- Name: st_summarystats(text, text, boolean); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_summarystats(rastertable text, rastercolumn text, exclude_nodata_value boolean) RETURNS summarystats
    LANGUAGE sql STABLE STRICT
    AS $_$ SELECT _st_summarystats($1, $2, 1, $3, 1) $_$;


ALTER FUNCTION public.st_summarystats(rastertable text, rastercolumn text, exclude_nodata_value boolean) OWNER TO postgres;

--
-- Name: st_summarystats(text, text, integer, boolean); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_summarystats(rastertable text, rastercolumn text, nband integer DEFAULT 1, exclude_nodata_value boolean DEFAULT true) RETURNS summarystats
    LANGUAGE sql STABLE STRICT
    AS $_$ SELECT _st_summarystats($1, $2, $3, $4, 1) $_$;


ALTER FUNCTION public.st_summarystats(rastertable text, rastercolumn text, nband integer, exclude_nodata_value boolean) OWNER TO postgres;

--
-- Name: st_symdifference(geometry, geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_symdifference(geom1 geometry, geom2 geometry) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-2.0', 'symdifference';


ALTER FUNCTION public.st_symdifference(geom1 geometry, geom2 geometry) OWNER TO postgres;

--
-- Name: st_symmetricdifference(geometry, geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_symmetricdifference(geom1 geometry, geom2 geometry) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-2.0', 'symdifference';


ALTER FUNCTION public.st_symmetricdifference(geom1 geometry, geom2 geometry) OWNER TO postgres;

--
-- Name: st_touches(geometry, geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_touches(geom1 geometry, geom2 geometry) RETURNS boolean
    LANGUAGE sql IMMUTABLE
    AS $_$SELECT $1 && $2 AND _ST_Touches($1,$2)$_$;


ALTER FUNCTION public.st_touches(geom1 geometry, geom2 geometry) OWNER TO postgres;

--
-- Name: st_transform(geometry, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_transform(geometry, integer) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-2.0', 'transform';


ALTER FUNCTION public.st_transform(geometry, integer) OWNER TO postgres;

--
-- Name: st_transform(raster, integer, double precision, text, double precision); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_transform(rast raster, srid integer, scalexy double precision, algorithm text DEFAULT 'NearestNeighbour'::text, maxerr double precision DEFAULT 0.125) RETURNS raster
    LANGUAGE sql STABLE STRICT
    AS $_$ SELECT _st_resample($1, $4, $5, $2, $3, $3) $_$;


ALTER FUNCTION public.st_transform(rast raster, srid integer, scalexy double precision, algorithm text, maxerr double precision) OWNER TO postgres;

--
-- Name: st_transform(raster, integer, text, double precision, double precision, double precision); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_transform(rast raster, srid integer, algorithm text DEFAULT 'NearestNeighbour'::text, maxerr double precision DEFAULT 0.125, scalex double precision DEFAULT 0, scaley double precision DEFAULT 0) RETURNS raster
    LANGUAGE sql STABLE STRICT
    AS $_$ SELECT _st_resample($1, $3, $4, $2, $5, $6) $_$;


ALTER FUNCTION public.st_transform(rast raster, srid integer, algorithm text, maxerr double precision, scalex double precision, scaley double precision) OWNER TO postgres;

--
-- Name: st_transform(raster, integer, double precision, double precision, text, double precision); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_transform(rast raster, srid integer, scalex double precision, scaley double precision, algorithm text DEFAULT 'NearestNeighbour'::text, maxerr double precision DEFAULT 0.125) RETURNS raster
    LANGUAGE sql STABLE STRICT
    AS $_$ SELECT _st_resample($1, $5, $6, $2, $3, $4) $_$;


ALTER FUNCTION public.st_transform(rast raster, srid integer, scalex double precision, scaley double precision, algorithm text, maxerr double precision) OWNER TO postgres;

--
-- Name: st_translate(geometry, double precision, double precision); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_translate(geometry, double precision, double precision) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$SELECT ST_Translate($1, $2, $3, 0)$_$;


ALTER FUNCTION public.st_translate(geometry, double precision, double precision) OWNER TO postgres;

--
-- Name: st_translate(geometry, double precision, double precision, double precision); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_translate(geometry, double precision, double precision, double precision) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$SELECT ST_Affine($1, 1, 0, 0, 0, 1, 0, 0, 0, 1, $2, $3, $4)$_$;


ALTER FUNCTION public.st_translate(geometry, double precision, double precision, double precision) OWNER TO postgres;

--
-- Name: st_transscale(geometry, double precision, double precision, double precision, double precision); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_transscale(geometry, double precision, double precision, double precision, double precision) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$SELECT ST_Affine($1,  $4, 0, 0,  0, $5, 0,
		0, 0, 1,  $2 * $4, $3 * $5, 0)$_$;


ALTER FUNCTION public.st_transscale(geometry, double precision, double precision, double precision, double precision) OWNER TO postgres;

--
-- Name: st_unaryunion(geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_unaryunion(geometry) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-2.0', 'ST_UnaryUnion';


ALTER FUNCTION public.st_unaryunion(geometry) OWNER TO postgres;

--
-- Name: st_union(geometry[]); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_union(geometry[]) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-2.0', 'pgis_union_geometry_array';


ALTER FUNCTION public.st_union(geometry[]) OWNER TO postgres;

--
-- Name: st_union(geometry, geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_union(geom1 geometry, geom2 geometry) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-2.0', 'geomunion';


ALTER FUNCTION public.st_union(geom1 geometry, geom2 geometry) OWNER TO postgres;

--
-- Name: st_upperleftx(raster); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_upperleftx(raster) RETURNS double precision
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/rtpostgis-2.0', 'RASTER_getXUpperLeft';


ALTER FUNCTION public.st_upperleftx(raster) OWNER TO postgres;

--
-- Name: st_upperlefty(raster); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_upperlefty(raster) RETURNS double precision
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/rtpostgis-2.0', 'RASTER_getYUpperLeft';


ALTER FUNCTION public.st_upperlefty(raster) OWNER TO postgres;

--
-- Name: st_value(raster, geometry, boolean); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_value(rast raster, pt geometry, hasnodata boolean DEFAULT true) RETURNS double precision
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$ SELECT st_value($1, 1, $2, $3) $_$;


ALTER FUNCTION public.st_value(rast raster, pt geometry, hasnodata boolean) OWNER TO postgres;

--
-- Name: st_value(raster, integer, integer, boolean); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_value(rast raster, x integer, y integer, hasnodata boolean DEFAULT true) RETURNS double precision
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$ SELECT st_value($1, 1, $2, $3, $4) $_$;


ALTER FUNCTION public.st_value(rast raster, x integer, y integer, hasnodata boolean) OWNER TO postgres;

--
-- Name: st_value(raster, integer, geometry, boolean); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_value(rast raster, band integer, pt geometry, hasnodata boolean DEFAULT true) RETURNS double precision
    LANGUAGE plpgsql IMMUTABLE STRICT
    AS $$
    DECLARE
        x float8;
        y float8;
        gtype text;
    BEGIN
        gtype := st_geometrytype(pt);
        IF ( gtype != 'ST_Point' ) THEN
            RAISE EXCEPTION 'Attempting to get the value of a pixel with a non-point geometry';
        END IF;
        x := st_x(pt);
        y := st_y(pt);
        RETURN st_value(rast,
                        band,
                        st_world2rastercoordx(rast, x, y),
                        st_world2rastercoordy(rast, x, y),
                        hasnodata);
    END;
    $$;


ALTER FUNCTION public.st_value(rast raster, band integer, pt geometry, hasnodata boolean) OWNER TO postgres;

--
-- Name: st_value(raster, integer, integer, integer, boolean); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_value(rast raster, band integer, x integer, y integer, hasnodata boolean DEFAULT true) RETURNS double precision
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/rtpostgis-2.0', 'RASTER_getPixelValue';


ALTER FUNCTION public.st_value(rast raster, band integer, x integer, y integer, hasnodata boolean) OWNER TO postgres;

--
-- Name: st_valuecount(raster, double precision[], double precision); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_valuecount(rast raster, searchvalues double precision[], roundto double precision DEFAULT 0, OUT value double precision, OUT count integer) RETURNS SETOF record
    LANGUAGE sql IMMUTABLE
    AS $_$ SELECT value, count FROM _st_valuecount($1, 1, TRUE, $2, $3) $_$;


ALTER FUNCTION public.st_valuecount(rast raster, searchvalues double precision[], roundto double precision, OUT value double precision, OUT count integer) OWNER TO postgres;

--
-- Name: st_valuecount(raster, double precision, double precision); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_valuecount(rast raster, searchvalue double precision, roundto double precision DEFAULT 0) RETURNS integer
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$ SELECT (_st_valuecount($1, 1, TRUE, ARRAY[$2]::double precision[], $3)).count $_$;


ALTER FUNCTION public.st_valuecount(rast raster, searchvalue double precision, roundto double precision) OWNER TO postgres;

--
-- Name: st_valuecount(raster, integer, double precision[], double precision); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_valuecount(rast raster, nband integer, searchvalues double precision[], roundto double precision DEFAULT 0, OUT value double precision, OUT count integer) RETURNS SETOF record
    LANGUAGE sql IMMUTABLE
    AS $_$ SELECT value, count FROM _st_valuecount($1, $2, TRUE, $3, $4) $_$;


ALTER FUNCTION public.st_valuecount(rast raster, nband integer, searchvalues double precision[], roundto double precision, OUT value double precision, OUT count integer) OWNER TO postgres;

--
-- Name: st_valuecount(raster, integer, double precision, double precision); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_valuecount(rast raster, nband integer, searchvalue double precision, roundto double precision DEFAULT 0) RETURNS integer
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$ SELECT (_st_valuecount($1, $2, TRUE, ARRAY[$3]::double precision[], $4)).count $_$;


ALTER FUNCTION public.st_valuecount(rast raster, nband integer, searchvalue double precision, roundto double precision) OWNER TO postgres;

--
-- Name: st_valuecount(text, text, double precision[], double precision); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_valuecount(rastertable text, rastercolumn text, searchvalues double precision[], roundto double precision DEFAULT 0, OUT value double precision, OUT count integer) RETURNS SETOF record
    LANGUAGE sql STABLE
    AS $_$ SELECT value, count FROM _st_valuecount($1, $2, 1, TRUE, $3, $4) $_$;


ALTER FUNCTION public.st_valuecount(rastertable text, rastercolumn text, searchvalues double precision[], roundto double precision, OUT value double precision, OUT count integer) OWNER TO postgres;

--
-- Name: st_valuecount(text, text, double precision, double precision); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_valuecount(rastertable text, rastercolumn text, searchvalue double precision, roundto double precision DEFAULT 0) RETURNS integer
    LANGUAGE sql STABLE STRICT
    AS $_$ SELECT (_st_valuecount($1, $2, 1, TRUE, ARRAY[$3]::double precision[], $4)).count $_$;


ALTER FUNCTION public.st_valuecount(rastertable text, rastercolumn text, searchvalue double precision, roundto double precision) OWNER TO postgres;

--
-- Name: st_valuecount(raster, integer, boolean, double precision[], double precision); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_valuecount(rast raster, nband integer DEFAULT 1, exclude_nodata_value boolean DEFAULT true, searchvalues double precision[] DEFAULT NULL::double precision[], roundto double precision DEFAULT 0, OUT value double precision, OUT count integer) RETURNS SETOF record
    LANGUAGE sql IMMUTABLE
    AS $_$ SELECT value, count FROM _st_valuecount($1, $2, $3, $4, $5) $_$;


ALTER FUNCTION public.st_valuecount(rast raster, nband integer, exclude_nodata_value boolean, searchvalues double precision[], roundto double precision, OUT value double precision, OUT count integer) OWNER TO postgres;

--
-- Name: st_valuecount(raster, integer, boolean, double precision, double precision); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_valuecount(rast raster, nband integer, exclude_nodata_value boolean, searchvalue double precision, roundto double precision DEFAULT 0) RETURNS integer
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$ SELECT (_st_valuecount($1, $2, $3, ARRAY[$4]::double precision[], $5)).count $_$;


ALTER FUNCTION public.st_valuecount(rast raster, nband integer, exclude_nodata_value boolean, searchvalue double precision, roundto double precision) OWNER TO postgres;

--
-- Name: st_valuecount(text, text, integer, double precision[], double precision); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_valuecount(rastertable text, rastercolumn text, nband integer, searchvalues double precision[], roundto double precision DEFAULT 0, OUT value double precision, OUT count integer) RETURNS SETOF record
    LANGUAGE sql STABLE
    AS $_$ SELECT value, count FROM _st_valuecount($1, $2, $3, TRUE, $4, $5) $_$;


ALTER FUNCTION public.st_valuecount(rastertable text, rastercolumn text, nband integer, searchvalues double precision[], roundto double precision, OUT value double precision, OUT count integer) OWNER TO postgres;

--
-- Name: st_valuecount(text, text, integer, double precision, double precision); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_valuecount(rastertable text, rastercolumn text, nband integer, searchvalue double precision, roundto double precision DEFAULT 0) RETURNS integer
    LANGUAGE sql STABLE STRICT
    AS $_$ SELECT (_st_valuecount($1, $2, $3, TRUE, ARRAY[$4]::double precision[], $5)).count $_$;


ALTER FUNCTION public.st_valuecount(rastertable text, rastercolumn text, nband integer, searchvalue double precision, roundto double precision) OWNER TO postgres;

--
-- Name: st_valuecount(text, text, integer, boolean, double precision[], double precision); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_valuecount(rastertable text, rastercolumn text, nband integer DEFAULT 1, exclude_nodata_value boolean DEFAULT true, searchvalues double precision[] DEFAULT NULL::double precision[], roundto double precision DEFAULT 0, OUT value double precision, OUT count integer) RETURNS SETOF record
    LANGUAGE sql STABLE
    AS $_$ SELECT value, count FROM _st_valuecount($1, $2, $3, $4, $5, $6) $_$;


ALTER FUNCTION public.st_valuecount(rastertable text, rastercolumn text, nband integer, exclude_nodata_value boolean, searchvalues double precision[], roundto double precision, OUT value double precision, OUT count integer) OWNER TO postgres;

--
-- Name: st_valuecount(text, text, integer, boolean, double precision, double precision); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_valuecount(rastertable text, rastercolumn text, nband integer, exclude_nodata_value boolean, searchvalue double precision, roundto double precision DEFAULT 0) RETURNS integer
    LANGUAGE sql STABLE STRICT
    AS $_$ SELECT (_st_valuecount($1, $2, $3, $4, ARRAY[$5]::double precision[], $6)).count $_$;


ALTER FUNCTION public.st_valuecount(rastertable text, rastercolumn text, nband integer, exclude_nodata_value boolean, searchvalue double precision, roundto double precision) OWNER TO postgres;

--
-- Name: st_valuepercent(raster, double precision[], double precision); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_valuepercent(rast raster, searchvalues double precision[], roundto double precision DEFAULT 0, OUT value double precision, OUT percent double precision) RETURNS SETOF record
    LANGUAGE sql IMMUTABLE
    AS $_$ SELECT value, percent FROM _st_valuecount($1, 1, TRUE, $2, $3) $_$;


ALTER FUNCTION public.st_valuepercent(rast raster, searchvalues double precision[], roundto double precision, OUT value double precision, OUT percent double precision) OWNER TO postgres;

--
-- Name: st_valuepercent(raster, double precision, double precision); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_valuepercent(rast raster, searchvalue double precision, roundto double precision DEFAULT 0) RETURNS double precision
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$ SELECT (_st_valuecount($1, 1, TRUE, ARRAY[$2]::double precision[], $3)).percent $_$;


ALTER FUNCTION public.st_valuepercent(rast raster, searchvalue double precision, roundto double precision) OWNER TO postgres;

--
-- Name: st_valuepercent(raster, integer, double precision[], double precision); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_valuepercent(rast raster, nband integer, searchvalues double precision[], roundto double precision DEFAULT 0, OUT value double precision, OUT percent double precision) RETURNS SETOF record
    LANGUAGE sql IMMUTABLE
    AS $_$ SELECT value, percent FROM _st_valuecount($1, $2, TRUE, $3, $4) $_$;


ALTER FUNCTION public.st_valuepercent(rast raster, nband integer, searchvalues double precision[], roundto double precision, OUT value double precision, OUT percent double precision) OWNER TO postgres;

--
-- Name: st_valuepercent(raster, integer, double precision, double precision); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_valuepercent(rast raster, nband integer, searchvalue double precision, roundto double precision DEFAULT 0) RETURNS double precision
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$ SELECT (_st_valuecount($1, $2, TRUE, ARRAY[$3]::double precision[], $4)).percent $_$;


ALTER FUNCTION public.st_valuepercent(rast raster, nband integer, searchvalue double precision, roundto double precision) OWNER TO postgres;

--
-- Name: st_valuepercent(text, text, double precision[], double precision); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_valuepercent(rastertable text, rastercolumn text, searchvalues double precision[], roundto double precision DEFAULT 0, OUT value double precision, OUT percent double precision) RETURNS SETOF record
    LANGUAGE sql STABLE
    AS $_$ SELECT value, percent FROM _st_valuecount($1, $2, 1, TRUE, $3, $4) $_$;


ALTER FUNCTION public.st_valuepercent(rastertable text, rastercolumn text, searchvalues double precision[], roundto double precision, OUT value double precision, OUT percent double precision) OWNER TO postgres;

--
-- Name: st_valuepercent(text, text, double precision, double precision); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_valuepercent(rastertable text, rastercolumn text, searchvalue double precision, roundto double precision DEFAULT 0) RETURNS double precision
    LANGUAGE sql STABLE STRICT
    AS $_$ SELECT (_st_valuecount($1, $2, 1, TRUE, ARRAY[$3]::double precision[], $4)).percent $_$;


ALTER FUNCTION public.st_valuepercent(rastertable text, rastercolumn text, searchvalue double precision, roundto double precision) OWNER TO postgres;

--
-- Name: st_valuepercent(raster, integer, boolean, double precision[], double precision); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_valuepercent(rast raster, nband integer DEFAULT 1, exclude_nodata_value boolean DEFAULT true, searchvalues double precision[] DEFAULT NULL::double precision[], roundto double precision DEFAULT 0, OUT value double precision, OUT percent double precision) RETURNS SETOF record
    LANGUAGE sql IMMUTABLE
    AS $_$ SELECT value, percent FROM _st_valuecount($1, $2, $3, $4, $5) $_$;


ALTER FUNCTION public.st_valuepercent(rast raster, nband integer, exclude_nodata_value boolean, searchvalues double precision[], roundto double precision, OUT value double precision, OUT percent double precision) OWNER TO postgres;

--
-- Name: st_valuepercent(raster, integer, boolean, double precision, double precision); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_valuepercent(rast raster, nband integer, exclude_nodata_value boolean, searchvalue double precision, roundto double precision DEFAULT 0) RETURNS double precision
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$ SELECT (_st_valuecount($1, $2, $3, ARRAY[$4]::double precision[], $5)).percent $_$;


ALTER FUNCTION public.st_valuepercent(rast raster, nband integer, exclude_nodata_value boolean, searchvalue double precision, roundto double precision) OWNER TO postgres;

--
-- Name: st_valuepercent(text, text, integer, double precision[], double precision); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_valuepercent(rastertable text, rastercolumn text, nband integer, searchvalues double precision[], roundto double precision DEFAULT 0, OUT value double precision, OUT percent double precision) RETURNS SETOF record
    LANGUAGE sql STABLE
    AS $_$ SELECT value, percent FROM _st_valuecount($1, $2, $3, TRUE, $4, $5) $_$;


ALTER FUNCTION public.st_valuepercent(rastertable text, rastercolumn text, nband integer, searchvalues double precision[], roundto double precision, OUT value double precision, OUT percent double precision) OWNER TO postgres;

--
-- Name: st_valuepercent(text, text, integer, double precision, double precision); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_valuepercent(rastertable text, rastercolumn text, nband integer, searchvalue double precision, roundto double precision DEFAULT 0) RETURNS double precision
    LANGUAGE sql STABLE STRICT
    AS $_$ SELECT (_st_valuecount($1, $2, $3, TRUE, ARRAY[$4]::double precision[], $5)).percent $_$;


ALTER FUNCTION public.st_valuepercent(rastertable text, rastercolumn text, nband integer, searchvalue double precision, roundto double precision) OWNER TO postgres;

--
-- Name: st_valuepercent(text, text, integer, boolean, double precision[], double precision); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_valuepercent(rastertable text, rastercolumn text, nband integer DEFAULT 1, exclude_nodata_value boolean DEFAULT true, searchvalues double precision[] DEFAULT NULL::double precision[], roundto double precision DEFAULT 0, OUT value double precision, OUT percent double precision) RETURNS SETOF record
    LANGUAGE sql STABLE
    AS $_$ SELECT value, percent FROM _st_valuecount($1, $2, $3, $4, $5, $6) $_$;


ALTER FUNCTION public.st_valuepercent(rastertable text, rastercolumn text, nband integer, exclude_nodata_value boolean, searchvalues double precision[], roundto double precision, OUT value double precision, OUT percent double precision) OWNER TO postgres;

--
-- Name: st_valuepercent(text, text, integer, boolean, double precision, double precision); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_valuepercent(rastertable text, rastercolumn text, nband integer, exclude_nodata_value boolean, searchvalue double precision, roundto double precision DEFAULT 0) RETURNS double precision
    LANGUAGE sql STABLE STRICT
    AS $_$ SELECT (_st_valuecount($1, $2, $3, $4, ARRAY[$5]::double precision[], $6)).percent $_$;


ALTER FUNCTION public.st_valuepercent(rastertable text, rastercolumn text, nband integer, exclude_nodata_value boolean, searchvalue double precision, roundto double precision) OWNER TO postgres;

--
-- Name: st_width(raster); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_width(raster) RETURNS integer
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/rtpostgis-2.0', 'RASTER_getWidth';


ALTER FUNCTION public.st_width(raster) OWNER TO postgres;

--
-- Name: st_within(geometry, geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_within(geom1 geometry, geom2 geometry) RETURNS boolean
    LANGUAGE sql IMMUTABLE
    AS $_$SELECT $1 && $2 AND _ST_Contains($2,$1)$_$;


ALTER FUNCTION public.st_within(geom1 geometry, geom2 geometry) OWNER TO postgres;

--
-- Name: st_wkbtosql(bytea); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_wkbtosql(wkb bytea) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-2.0', 'LWGEOM_from_WKB';


ALTER FUNCTION public.st_wkbtosql(wkb bytea) OWNER TO postgres;

--
-- Name: st_wkttosql(text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_wkttosql(text) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-2.0', 'LWGEOM_from_text';


ALTER FUNCTION public.st_wkttosql(text) OWNER TO postgres;

--
-- Name: st_world2rastercoordx(raster, double precision); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_world2rastercoordx(rast raster, xw double precision) RETURNS integer
    LANGUAGE plpgsql IMMUTABLE STRICT
    AS $$
    DECLARE
        a float8 := 0.0;
        b float8 := 0.0;
        c float8 := 0.0;
        d float8 := 0.0;
        e float8 := 0.0;
        f float8 := 0.0;
        xr numeric := 0.0;
    BEGIN
 				SELECT scalex, skewx, upperleftx, skewy, scaley, upperlefty INTO a, b, c, d, e, f FROM ST_Metadata(rast);
        IF ( b * d - a * e = 0 ) THEN
            RAISE EXCEPTION 'Attempting to compute raster coordinate on a raster with scale equal to 0';
        END IF;
        IF ( b != 0 OR d != 0) THEN
            RAISE EXCEPTION 'Attempting to compute raster coordinate on a raster with rotation providing x only. A y must also be provided';
        END IF;
        xr := (e * (xw - c)) / (a * e);
        RETURN floor(xr) + 1;
    END;
    $$;


ALTER FUNCTION public.st_world2rastercoordx(rast raster, xw double precision) OWNER TO postgres;

--
-- Name: st_world2rastercoordx(raster, geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_world2rastercoordx(rast raster, pt geometry) RETURNS integer
    LANGUAGE plpgsql IMMUTABLE STRICT
    AS $_$
    DECLARE
    BEGIN
        IF ( st_geometrytype(pt) != 'ST_Point' ) THEN
            RAISE EXCEPTION 'Attempting to compute raster coordinate with a non-point geometry';
        END IF;
        RETURN st_world2rastercoordx($1, st_x(pt), st_y(pt));
    END;
    $_$;


ALTER FUNCTION public.st_world2rastercoordx(rast raster, pt geometry) OWNER TO postgres;

--
-- Name: st_world2rastercoordx(raster, double precision, double precision); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_world2rastercoordx(rast raster, xw double precision, yw double precision) RETURNS integer
    LANGUAGE plpgsql IMMUTABLE STRICT
    AS $$
    DECLARE
        a float8 := 0.0;
        b float8 := 0.0;
        c float8 := 0.0;
        d float8 := 0.0;
        e float8 := 0.0;
        f float8 := 0.0;
        xr numeric := 0.0;
    BEGIN
				SELECT scalex, skewx, upperleftx, skewy, scaley, upperlefty INTO a, b, c, d, e, f FROM ST_Metadata(rast);
        IF ( b * d - a * e = 0 ) THEN
            RAISE EXCEPTION 'Attempting to compute raster coordinate on a raster with scale equal to 0';
        END IF;
        xr := (b * (yw - f) - e * (xw - c)) / (b * d - a * e);
        RETURN floor(xr) + 1;
    END;
    $$;


ALTER FUNCTION public.st_world2rastercoordx(rast raster, xw double precision, yw double precision) OWNER TO postgres;

--
-- Name: st_world2rastercoordy(raster, double precision); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_world2rastercoordy(rast raster, yw double precision) RETURNS integer
    LANGUAGE plpgsql IMMUTABLE STRICT
    AS $$
    DECLARE
        a float8 := 0.0;
        b float8 := 0.0;
        c float8 := 0.0;
        d float8 := 0.0;
        e float8 := 0.0;
        f float8 := 0.0;
        yr numeric := 0.0;
    BEGIN
 				SELECT scalex, skewx, upperleftx, skewy, scaley, upperlefty INTO a, b, c, d, e, f FROM ST_Metadata(rast);
        IF ( b * d - a * e = 0 ) THEN
            RAISE EXCEPTION 'Attempting to compute raster coordinate on a raster with scale equal to 0';
        END IF;
        IF ( b != 0 OR d != 0) THEN
            RAISE EXCEPTION 'Attempting to compute raster coordinate on a raster with rotation providing y only. A x must also be provided';
        END IF;
        yr := (a * (yw - f)) / (a * e);
        RETURN floor(yr) + 1;
    END;
    $$;


ALTER FUNCTION public.st_world2rastercoordy(rast raster, yw double precision) OWNER TO postgres;

--
-- Name: st_world2rastercoordy(raster, geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_world2rastercoordy(rast raster, pt geometry) RETURNS integer
    LANGUAGE plpgsql IMMUTABLE STRICT
    AS $_$
    DECLARE
    BEGIN
        IF ( st_geometrytype(pt) != 'ST_Point' ) THEN
            RAISE EXCEPTION 'Attempting to compute raster coordinate with a non-point geometry';
        END IF;
        RETURN st_world2rastercoordy($1, st_x(pt), st_y(pt));
    END;
    $_$;


ALTER FUNCTION public.st_world2rastercoordy(rast raster, pt geometry) OWNER TO postgres;

--
-- Name: st_world2rastercoordy(raster, double precision, double precision); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_world2rastercoordy(rast raster, xw double precision, yw double precision) RETURNS integer
    LANGUAGE plpgsql IMMUTABLE STRICT
    AS $$
    DECLARE
        a float8 := 0.0;
        b float8 := 0.0;
        c float8 := 0.0;
        d float8 := 0.0;
        e float8 := 0.0;
        f float8 := 0.0;
        yr numeric := 0.0;
    BEGIN
 				SELECT scalex, skewx, upperleftx, skewy, scaley, upperlefty INTO a, b, c, d, e, f FROM ST_Metadata(rast);
        IF ( b * d - a * e = 0 ) THEN
            RAISE EXCEPTION 'Attempting to compute raster coordinate on a raster with scale equal to 0';
        END IF;
        yr := (a * (yw - f) + d * (c - xw)) / (a * e - b * d);
        RETURN floor(yr) + 1;
    END;
    $$;


ALTER FUNCTION public.st_world2rastercoordy(rast raster, xw double precision, yw double precision) OWNER TO postgres;

--
-- Name: st_x(geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_x(geometry) RETURNS double precision
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-2.0', 'LWGEOM_x_point';


ALTER FUNCTION public.st_x(geometry) OWNER TO postgres;

--
-- Name: st_xmax(box3d); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_xmax(box3d) RETURNS double precision
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-2.0', 'BOX3D_xmax';


ALTER FUNCTION public.st_xmax(box3d) OWNER TO postgres;

--
-- Name: st_xmin(box3d); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_xmin(box3d) RETURNS double precision
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-2.0', 'BOX3D_xmin';


ALTER FUNCTION public.st_xmin(box3d) OWNER TO postgres;

--
-- Name: st_y(geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_y(geometry) RETURNS double precision
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-2.0', 'LWGEOM_y_point';


ALTER FUNCTION public.st_y(geometry) OWNER TO postgres;

--
-- Name: st_ymax(box3d); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_ymax(box3d) RETURNS double precision
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-2.0', 'BOX3D_ymax';


ALTER FUNCTION public.st_ymax(box3d) OWNER TO postgres;

--
-- Name: st_ymin(box3d); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_ymin(box3d) RETURNS double precision
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-2.0', 'BOX3D_ymin';


ALTER FUNCTION public.st_ymin(box3d) OWNER TO postgres;

--
-- Name: st_z(geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_z(geometry) RETURNS double precision
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-2.0', 'LWGEOM_z_point';


ALTER FUNCTION public.st_z(geometry) OWNER TO postgres;

--
-- Name: st_zmax(box3d); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_zmax(box3d) RETURNS double precision
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-2.0', 'BOX3D_zmax';


ALTER FUNCTION public.st_zmax(box3d) OWNER TO postgres;

--
-- Name: st_zmflag(geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_zmflag(geometry) RETURNS smallint
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-2.0', 'LWGEOM_zmflag';


ALTER FUNCTION public.st_zmflag(geometry) OWNER TO postgres;

--
-- Name: st_zmin(box3d); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_zmin(box3d) RETURNS double precision
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-2.0', 'BOX3D_zmin';


ALTER FUNCTION public.st_zmin(box3d) OWNER TO postgres;

--
-- Name: text(geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION text(geometry) RETURNS text
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-2.0', 'LWGEOM_to_text';


ALTER FUNCTION public.text(geometry) OWNER TO postgres;

--
-- Name: unlockrows(text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION unlockrows(text) RETURNS integer
    LANGUAGE plpgsql STRICT
    AS $_$ 
DECLARE
	ret int;
BEGIN

	IF NOT LongTransactionsEnabled() THEN
		RAISE EXCEPTION 'Long transaction support disabled, use EnableLongTransaction() to enable.';
	END IF;

	EXECUTE 'DELETE FROM authorization_table where authid = ' ||
		quote_literal($1);

	GET DIAGNOSTICS ret = ROW_COUNT;

	RETURN ret;
END;
$_$;


ALTER FUNCTION public.unlockrows(text) OWNER TO postgres;

--
-- Name: updategeometrysrid(character varying, character varying, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION updategeometrysrid(character varying, character varying, integer) RETURNS text
    LANGUAGE plpgsql STRICT
    AS $_$
DECLARE
	ret  text;
BEGIN
	SELECT UpdateGeometrySRID('','',$1,$2,$3) into ret;
	RETURN ret;
END;
$_$;


ALTER FUNCTION public.updategeometrysrid(character varying, character varying, integer) OWNER TO postgres;

--
-- Name: updategeometrysrid(character varying, character varying, character varying, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION updategeometrysrid(character varying, character varying, character varying, integer) RETURNS text
    LANGUAGE plpgsql STRICT
    AS $_$
DECLARE
	ret  text;
BEGIN
	SELECT UpdateGeometrySRID('',$1,$2,$3,$4) into ret;
	RETURN ret;
END;
$_$;


ALTER FUNCTION public.updategeometrysrid(character varying, character varying, character varying, integer) OWNER TO postgres;

--
-- Name: updategeometrysrid(character varying, character varying, character varying, character varying, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION updategeometrysrid(catalogn_name character varying, schema_name character varying, table_name character varying, column_name character varying, new_srid_in integer) RETURNS text
    LANGUAGE plpgsql STRICT
    AS $$
DECLARE
	myrec RECORD;
	okay boolean;
	cname varchar;
	real_schema name;
	unknown_srid integer;
	new_srid integer := new_srid_in;

BEGIN


	-- Find, check or fix schema_name
	IF ( schema_name != '' ) THEN
		okay = false;

		FOR myrec IN SELECT nspname FROM pg_namespace WHERE text(nspname) = schema_name LOOP
			okay := true;
		END LOOP;

		IF ( okay <> true ) THEN
			RAISE EXCEPTION 'Invalid schema name';
		ELSE
			real_schema = schema_name;
		END IF;
	ELSE
		SELECT INTO real_schema current_schema()::text;
	END IF;

	-- Ensure that column_name is in geometry_columns
	okay = false;
	FOR myrec IN SELECT type, coord_dimension FROM geometry_columns WHERE f_table_schema = text(real_schema) and f_table_name = table_name and f_geometry_column = column_name LOOP
		okay := true;
	END LOOP;
	IF (NOT okay) THEN
		RAISE EXCEPTION 'column not found in geometry_columns table';
		RETURN false;
	END IF;

	-- Ensure that new_srid is valid
	IF ( new_srid > 0 ) THEN
		IF ( SELECT count(*) = 0 from spatial_ref_sys where srid = new_srid ) THEN
			RAISE EXCEPTION 'invalid SRID: % not found in spatial_ref_sys', new_srid;
			RETURN false;
		END IF;
	ELSE
		unknown_srid := ST_SRID('POINT EMPTY'::geometry);
		IF ( new_srid != unknown_srid ) THEN
			new_srid := unknown_srid;
			RAISE NOTICE 'SRID value % converted to the officially unknown SRID value %', new_srid_in, new_srid;
		END IF;
	END IF;

	IF postgis_constraint_srid(schema_name, table_name, column_name) IS NOT NULL THEN 
	-- srid was enforced with constraints before, keep it that way.
        -- Make up constraint name
        cname = 'enforce_srid_'  || column_name;
    
        -- Drop enforce_srid constraint
        EXECUTE 'ALTER TABLE ' || quote_ident(real_schema) ||
            '.' || quote_ident(table_name) ||
            ' DROP constraint ' || quote_ident(cname);
    
        -- Update geometries SRID
        EXECUTE 'UPDATE ' || quote_ident(real_schema) ||
            '.' || quote_ident(table_name) ||
            ' SET ' || quote_ident(column_name) ||
            ' = ST_SetSRID(' || quote_ident(column_name) ||
            ', ' || new_srid::text || ')';
            
        -- Reset enforce_srid constraint
        EXECUTE 'ALTER TABLE ' || quote_ident(real_schema) ||
            '.' || quote_ident(table_name) ||
            ' ADD constraint ' || quote_ident(cname) ||
            ' CHECK (st_srid(' || quote_ident(column_name) ||
            ') = ' || new_srid::text || ')';
    ELSE 
        -- We will use typmod to enforce if no srid constraints
        -- We are using postgis_type_name to lookup the new name 
        -- (in case Paul changes his mind and flips geometry_columns to return old upper case name) 
        EXECUTE 'ALTER TABLE ' || quote_ident(real_schema) || '.' || quote_ident(table_name) || 
        ' ALTER COLUMN ' || quote_ident(column_name) || ' TYPE  geometry(' || postgis_type_name(myrec.type, myrec.coord_dimension, true) || ', ' || new_srid::text || ') USING ST_SetSRID(' || quote_ident(column_name) || ',' || new_srid::text || ');' ;
    END IF;

	RETURN real_schema || '.' || table_name || '.' || column_name ||' SRID changed to ' || new_srid::text;

END;
$$;


ALTER FUNCTION public.updategeometrysrid(catalogn_name character varying, schema_name character varying, table_name character varying, column_name character varying, new_srid_in integer) OWNER TO postgres;

SET search_path = scraper, pg_catalog;

--
-- Name: appomatic_mapdata_ais_insert(); Type: FUNCTION; Schema: scraper; Owner: scraper
--

CREATE FUNCTION appomatic_mapdata_ais_insert() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
                declare
                  loc geometry;
                begin
                  loc := st_setsrid(st_makepointm(new.longitude, new.latitude, extract(epoch from new.datetime)), (4326));

                  if exists (select 1 from appomatic_mapdata_ais as ais where ais.mmsi = new.mmsi and ais.datetime = new.datetime) then
                    -- this record already exists.  Need to turn this into an update
                    -- and return null to cancel the insert
                    update
                      appomatic_mapdata_ais as ais
                    set
                      location = loc,
                      true_heading = new.true_heading,
                      sog = new.sog,
                      cog = new.cog,
                      latitude = new.latitude,
                      longitude = new.longitude
                    where
                      ais.mmsi = new.mmsi
                      and ais.datetime = new.datetime;
                    return null;
                  else
                    new.location := loc;
                    return new;
                  end if;
                end;
              $$;


ALTER FUNCTION scraper.appomatic_mapdata_ais_insert() OWNER TO scraper;

--
-- Name: feedentry_insert(); Type: FUNCTION; Schema: scraper; Owner: postgres
--

CREATE FUNCTION feedentry_insert() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
    DECLARE
        pub      timestamp;
        loc      geometry;
        reg      integer[];
    BEGIN
	loc := st_setsrid(st_makepoint(NEW.lng, NEW.lat), (4326));
	reg := ARRAY( SELECT region.id FROM region 
		WHERE st_contains(region.the_geom, loc));
	pub := (( SELECT to_timestamp(GREATEST(floor(date_part('epoch'::text, now())), date_part('epoch'::text, max(feedentry.published))) + 0.001::double precision) AS to_timestamp
		FROM feedentry));

	IF EXISTS ( SELECT 1 FROM feedentry WHERE feedentry.id = NEW.id) THEN
		-- this record already exists.  Need to turn this into an update
		-- and return null to cancel the insert
		UPDATE feedentry SET
			title = NEW.title, 
			link = NEW.link, 
			summary = NEW.summary, 
			content = NEW.content, 
			lat = NEW.lat, 
			lng = NEW.lng, 
			source_id = NEW.source_id, 
			source_item_id = NEW.source_item_id, 
			kml_url = NEW.kml_url, 
			incident_datetime = NEW.incident_datetime, 
			tags = NEW.tags,
			the_geom = loc,
			regions = reg
		WHERE id = NEW.id;
		return NULL;
	ELSE
		NEW.published := pub;
		NEW.the_geom := loc;
		NEW.regions := reg;
		return NEW;
	END IF;
    END;
$$;


ALTER FUNCTION scraper.feedentry_insert() OWNER TO postgres;

--
-- Name: update_time_stamp_column(); Type: FUNCTION; Schema: scraper; Owner: scraper
--

CREATE FUNCTION update_time_stamp_column() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
    BEGIN
	NEW.time_stamp = now();
	return NEW;
    END;
$$;


ALTER FUNCTION scraper.update_time_stamp_column() OWNER TO scraper;

SET search_path = public, pg_catalog;

--
-- Name: st_3dextent(geometry); Type: AGGREGATE; Schema: public; Owner: postgres
--

CREATE AGGREGATE st_3dextent(geometry) (
    SFUNC = public.st_combine_bbox,
    STYPE = box3d
);


ALTER AGGREGATE public.st_3dextent(geometry) OWNER TO postgres;

--
-- Name: st_accum(geometry); Type: AGGREGATE; Schema: public; Owner: postgres
--

CREATE AGGREGATE st_accum(geometry) (
    SFUNC = pgis_geometry_accum_transfn,
    STYPE = pgis_abs,
    FINALFUNC = pgis_geometry_accum_finalfn
);


ALTER AGGREGATE public.st_accum(geometry) OWNER TO postgres;

--
-- Name: st_collect(geometry); Type: AGGREGATE; Schema: public; Owner: postgres
--

CREATE AGGREGATE st_collect(geometry) (
    SFUNC = pgis_geometry_accum_transfn,
    STYPE = pgis_abs,
    FINALFUNC = pgis_geometry_collect_finalfn
);


ALTER AGGREGATE public.st_collect(geometry) OWNER TO postgres;

--
-- Name: st_extent(geometry); Type: AGGREGATE; Schema: public; Owner: postgres
--

CREATE AGGREGATE st_extent(geometry) (
    SFUNC = public.st_combine_bbox,
    STYPE = box3d,
    FINALFUNC = public.box2d
);


ALTER AGGREGATE public.st_extent(geometry) OWNER TO postgres;

--
-- Name: st_makeline(geometry); Type: AGGREGATE; Schema: public; Owner: postgres
--

CREATE AGGREGATE st_makeline(geometry) (
    SFUNC = pgis_geometry_accum_transfn,
    STYPE = pgis_abs,
    FINALFUNC = pgis_geometry_makeline_finalfn
);


ALTER AGGREGATE public.st_makeline(geometry) OWNER TO postgres;

--
-- Name: st_memcollect(geometry); Type: AGGREGATE; Schema: public; Owner: postgres
--

CREATE AGGREGATE st_memcollect(geometry) (
    SFUNC = public.st_collect,
    STYPE = geometry
);


ALTER AGGREGATE public.st_memcollect(geometry) OWNER TO postgres;

--
-- Name: st_memunion(geometry); Type: AGGREGATE; Schema: public; Owner: postgres
--

CREATE AGGREGATE st_memunion(geometry) (
    SFUNC = public.st_union,
    STYPE = geometry
);


ALTER AGGREGATE public.st_memunion(geometry) OWNER TO postgres;

--
-- Name: st_polygonize(geometry); Type: AGGREGATE; Schema: public; Owner: postgres
--

CREATE AGGREGATE st_polygonize(geometry) (
    SFUNC = pgis_geometry_accum_transfn,
    STYPE = pgis_abs,
    FINALFUNC = pgis_geometry_polygonize_finalfn
);


ALTER AGGREGATE public.st_polygonize(geometry) OWNER TO postgres;

--
-- Name: st_union(geometry); Type: AGGREGATE; Schema: public; Owner: postgres
--

CREATE AGGREGATE st_union(geometry) (
    SFUNC = pgis_geometry_accum_transfn,
    STYPE = pgis_abs,
    FINALFUNC = pgis_geometry_union_finalfn
);


ALTER AGGREGATE public.st_union(geometry) OWNER TO postgres;

--
-- Name: st_union(raster); Type: AGGREGATE; Schema: public; Owner: postgres
--

CREATE AGGREGATE st_union(raster) (
    SFUNC = public._st_mapalgebra4unionstate,
    STYPE = raster,
    FINALFUNC = _st_mapalgebra4unionfinal1
);


ALTER AGGREGATE public.st_union(raster) OWNER TO postgres;

--
-- Name: st_union(raster, integer); Type: AGGREGATE; Schema: public; Owner: postgres
--

CREATE AGGREGATE st_union(raster, integer) (
    SFUNC = public._st_mapalgebra4unionstate,
    STYPE = raster,
    FINALFUNC = _st_mapalgebra4unionfinal1
);


ALTER AGGREGATE public.st_union(raster, integer) OWNER TO postgres;

--
-- Name: st_union(raster, text); Type: AGGREGATE; Schema: public; Owner: postgres
--

CREATE AGGREGATE st_union(raster, text) (
    SFUNC = public._st_mapalgebra4unionstate,
    STYPE = raster,
    FINALFUNC = _st_mapalgebra4unionfinal1
);


ALTER AGGREGATE public.st_union(raster, text) OWNER TO postgres;

--
-- Name: st_union(raster, integer, text); Type: AGGREGATE; Schema: public; Owner: postgres
--

CREATE AGGREGATE st_union(raster, integer, text) (
    SFUNC = public._st_mapalgebra4unionstate,
    STYPE = raster,
    FINALFUNC = _st_mapalgebra4unionfinal1
);


ALTER AGGREGATE public.st_union(raster, integer, text) OWNER TO postgres;

--
-- Name: &&; Type: OPERATOR; Schema: public; Owner: postgres
--

CREATE OPERATOR && (
    PROCEDURE = geometry_overlaps,
    LEFTARG = geometry,
    RIGHTARG = geometry,
    COMMUTATOR = &&,
    RESTRICT = geometry_gist_sel_2d,
    JOIN = geometry_gist_joinsel_2d
);


ALTER OPERATOR public.&& (geometry, geometry) OWNER TO postgres;

--
-- Name: &&; Type: OPERATOR; Schema: public; Owner: postgres
--

CREATE OPERATOR && (
    PROCEDURE = geography_overlaps,
    LEFTARG = geography,
    RIGHTARG = geography,
    COMMUTATOR = &&,
    RESTRICT = geography_gist_selectivity,
    JOIN = geography_gist_join_selectivity
);


ALTER OPERATOR public.&& (geography, geography) OWNER TO postgres;

--
-- Name: &&; Type: OPERATOR; Schema: public; Owner: postgres
--

CREATE OPERATOR && (
    PROCEDURE = raster_overlap,
    LEFTARG = raster,
    RIGHTARG = raster,
    COMMUTATOR = &&,
    RESTRICT = contsel,
    JOIN = contjoinsel
);


ALTER OPERATOR public.&& (raster, raster) OWNER TO postgres;

--
-- Name: &&; Type: OPERATOR; Schema: public; Owner: postgres
--

CREATE OPERATOR && (
    PROCEDURE = raster_geometry_overlap,
    LEFTARG = raster,
    RIGHTARG = geometry,
    COMMUTATOR = &&,
    RESTRICT = contsel,
    JOIN = contjoinsel
);


ALTER OPERATOR public.&& (raster, geometry) OWNER TO postgres;

--
-- Name: &&; Type: OPERATOR; Schema: public; Owner: postgres
--

CREATE OPERATOR && (
    PROCEDURE = geometry_raster_overlap,
    LEFTARG = geometry,
    RIGHTARG = raster,
    COMMUTATOR = &&,
    RESTRICT = contsel,
    JOIN = contjoinsel
);


ALTER OPERATOR public.&& (geometry, raster) OWNER TO postgres;

--
-- Name: &&&; Type: OPERATOR; Schema: public; Owner: postgres
--

CREATE OPERATOR &&& (
    PROCEDURE = geometry_overlaps_nd,
    LEFTARG = geometry,
    RIGHTARG = geometry,
    COMMUTATOR = &&&,
    RESTRICT = contsel,
    JOIN = contjoinsel
);


ALTER OPERATOR public.&&& (geometry, geometry) OWNER TO postgres;

--
-- Name: &<; Type: OPERATOR; Schema: public; Owner: postgres
--

CREATE OPERATOR &< (
    PROCEDURE = geometry_overleft,
    LEFTARG = geometry,
    RIGHTARG = geometry,
    COMMUTATOR = &>,
    RESTRICT = positionsel,
    JOIN = positionjoinsel
);


ALTER OPERATOR public.&< (geometry, geometry) OWNER TO postgres;

--
-- Name: &<; Type: OPERATOR; Schema: public; Owner: postgres
--

CREATE OPERATOR &< (
    PROCEDURE = raster_overleft,
    LEFTARG = raster,
    RIGHTARG = raster,
    COMMUTATOR = &>,
    RESTRICT = positionsel,
    JOIN = positionjoinsel
);


ALTER OPERATOR public.&< (raster, raster) OWNER TO postgres;

--
-- Name: &<|; Type: OPERATOR; Schema: public; Owner: postgres
--

CREATE OPERATOR &<| (
    PROCEDURE = geometry_overbelow,
    LEFTARG = geometry,
    RIGHTARG = geometry,
    COMMUTATOR = |&>,
    RESTRICT = positionsel,
    JOIN = positionjoinsel
);


ALTER OPERATOR public.&<| (geometry, geometry) OWNER TO postgres;

--
-- Name: &<|; Type: OPERATOR; Schema: public; Owner: postgres
--

CREATE OPERATOR &<| (
    PROCEDURE = raster_overbelow,
    LEFTARG = raster,
    RIGHTARG = raster,
    COMMUTATOR = |&>,
    RESTRICT = positionsel,
    JOIN = positionjoinsel
);


ALTER OPERATOR public.&<| (raster, raster) OWNER TO postgres;

--
-- Name: &>; Type: OPERATOR; Schema: public; Owner: postgres
--

CREATE OPERATOR &> (
    PROCEDURE = geometry_overright,
    LEFTARG = geometry,
    RIGHTARG = geometry,
    COMMUTATOR = &<,
    RESTRICT = positionsel,
    JOIN = positionjoinsel
);


ALTER OPERATOR public.&> (geometry, geometry) OWNER TO postgres;

--
-- Name: &>; Type: OPERATOR; Schema: public; Owner: postgres
--

CREATE OPERATOR &> (
    PROCEDURE = raster_overright,
    LEFTARG = raster,
    RIGHTARG = raster,
    COMMUTATOR = &<,
    RESTRICT = positionsel,
    JOIN = positionjoinsel
);


ALTER OPERATOR public.&> (raster, raster) OWNER TO postgres;

--
-- Name: <; Type: OPERATOR; Schema: public; Owner: postgres
--

CREATE OPERATOR < (
    PROCEDURE = geometry_lt,
    LEFTARG = geometry,
    RIGHTARG = geometry,
    COMMUTATOR = >,
    NEGATOR = >=,
    RESTRICT = contsel,
    JOIN = contjoinsel
);


ALTER OPERATOR public.< (geometry, geometry) OWNER TO postgres;

--
-- Name: <; Type: OPERATOR; Schema: public; Owner: postgres
--

CREATE OPERATOR < (
    PROCEDURE = geography_lt,
    LEFTARG = geography,
    RIGHTARG = geography,
    COMMUTATOR = >,
    NEGATOR = >=,
    RESTRICT = contsel,
    JOIN = contjoinsel
);


ALTER OPERATOR public.< (geography, geography) OWNER TO postgres;

--
-- Name: <#>; Type: OPERATOR; Schema: public; Owner: postgres
--

CREATE OPERATOR <#> (
    PROCEDURE = geometry_distance_box,
    LEFTARG = geometry,
    RIGHTARG = geometry,
    COMMUTATOR = <#>
);


ALTER OPERATOR public.<#> (geometry, geometry) OWNER TO postgres;

--
-- Name: <->; Type: OPERATOR; Schema: public; Owner: postgres
--

CREATE OPERATOR <-> (
    PROCEDURE = geometry_distance_centroid,
    LEFTARG = geometry,
    RIGHTARG = geometry,
    COMMUTATOR = <->
);


ALTER OPERATOR public.<-> (geometry, geometry) OWNER TO postgres;

--
-- Name: <<; Type: OPERATOR; Schema: public; Owner: postgres
--

CREATE OPERATOR << (
    PROCEDURE = geometry_left,
    LEFTARG = geometry,
    RIGHTARG = geometry,
    COMMUTATOR = >>,
    RESTRICT = positionsel,
    JOIN = positionjoinsel
);


ALTER OPERATOR public.<< (geometry, geometry) OWNER TO postgres;

--
-- Name: <<; Type: OPERATOR; Schema: public; Owner: postgres
--

CREATE OPERATOR << (
    PROCEDURE = raster_left,
    LEFTARG = raster,
    RIGHTARG = raster,
    COMMUTATOR = >>,
    RESTRICT = positionsel,
    JOIN = positionjoinsel
);


ALTER OPERATOR public.<< (raster, raster) OWNER TO postgres;

--
-- Name: <<|; Type: OPERATOR; Schema: public; Owner: postgres
--

CREATE OPERATOR <<| (
    PROCEDURE = geometry_below,
    LEFTARG = geometry,
    RIGHTARG = geometry,
    COMMUTATOR = |>>,
    RESTRICT = positionsel,
    JOIN = positionjoinsel
);


ALTER OPERATOR public.<<| (geometry, geometry) OWNER TO postgres;

--
-- Name: <<|; Type: OPERATOR; Schema: public; Owner: postgres
--

CREATE OPERATOR <<| (
    PROCEDURE = raster_below,
    LEFTARG = raster,
    RIGHTARG = raster,
    COMMUTATOR = |>>,
    RESTRICT = positionsel,
    JOIN = positionjoinsel
);


ALTER OPERATOR public.<<| (raster, raster) OWNER TO postgres;

--
-- Name: <=; Type: OPERATOR; Schema: public; Owner: postgres
--

CREATE OPERATOR <= (
    PROCEDURE = geometry_le,
    LEFTARG = geometry,
    RIGHTARG = geometry,
    COMMUTATOR = >=,
    NEGATOR = >,
    RESTRICT = contsel,
    JOIN = contjoinsel
);


ALTER OPERATOR public.<= (geometry, geometry) OWNER TO postgres;

--
-- Name: <=; Type: OPERATOR; Schema: public; Owner: postgres
--

CREATE OPERATOR <= (
    PROCEDURE = geography_le,
    LEFTARG = geography,
    RIGHTARG = geography,
    COMMUTATOR = >=,
    NEGATOR = >,
    RESTRICT = contsel,
    JOIN = contjoinsel
);


ALTER OPERATOR public.<= (geography, geography) OWNER TO postgres;

--
-- Name: =; Type: OPERATOR; Schema: public; Owner: postgres
--

CREATE OPERATOR = (
    PROCEDURE = geometry_eq,
    LEFTARG = geometry,
    RIGHTARG = geometry,
    COMMUTATOR = =,
    RESTRICT = contsel,
    JOIN = contjoinsel
);


ALTER OPERATOR public.= (geometry, geometry) OWNER TO postgres;

--
-- Name: =; Type: OPERATOR; Schema: public; Owner: postgres
--

CREATE OPERATOR = (
    PROCEDURE = geography_eq,
    LEFTARG = geography,
    RIGHTARG = geography,
    COMMUTATOR = =,
    RESTRICT = contsel,
    JOIN = contjoinsel
);


ALTER OPERATOR public.= (geography, geography) OWNER TO postgres;

--
-- Name: >; Type: OPERATOR; Schema: public; Owner: postgres
--

CREATE OPERATOR > (
    PROCEDURE = geometry_gt,
    LEFTARG = geometry,
    RIGHTARG = geometry,
    COMMUTATOR = <,
    NEGATOR = <=,
    RESTRICT = contsel,
    JOIN = contjoinsel
);


ALTER OPERATOR public.> (geometry, geometry) OWNER TO postgres;

--
-- Name: >; Type: OPERATOR; Schema: public; Owner: postgres
--

CREATE OPERATOR > (
    PROCEDURE = geography_gt,
    LEFTARG = geography,
    RIGHTARG = geography,
    COMMUTATOR = <,
    NEGATOR = <=,
    RESTRICT = contsel,
    JOIN = contjoinsel
);


ALTER OPERATOR public.> (geography, geography) OWNER TO postgres;

--
-- Name: >=; Type: OPERATOR; Schema: public; Owner: postgres
--

CREATE OPERATOR >= (
    PROCEDURE = geometry_ge,
    LEFTARG = geometry,
    RIGHTARG = geometry,
    COMMUTATOR = <=,
    NEGATOR = <,
    RESTRICT = contsel,
    JOIN = contjoinsel
);


ALTER OPERATOR public.>= (geometry, geometry) OWNER TO postgres;

--
-- Name: >=; Type: OPERATOR; Schema: public; Owner: postgres
--

CREATE OPERATOR >= (
    PROCEDURE = geography_ge,
    LEFTARG = geography,
    RIGHTARG = geography,
    COMMUTATOR = <=,
    NEGATOR = <,
    RESTRICT = contsel,
    JOIN = contjoinsel
);


ALTER OPERATOR public.>= (geography, geography) OWNER TO postgres;

--
-- Name: >>; Type: OPERATOR; Schema: public; Owner: postgres
--

CREATE OPERATOR >> (
    PROCEDURE = geometry_right,
    LEFTARG = geometry,
    RIGHTARG = geometry,
    COMMUTATOR = <<,
    RESTRICT = positionsel,
    JOIN = positionjoinsel
);


ALTER OPERATOR public.>> (geometry, geometry) OWNER TO postgres;

--
-- Name: >>; Type: OPERATOR; Schema: public; Owner: postgres
--

CREATE OPERATOR >> (
    PROCEDURE = raster_right,
    LEFTARG = raster,
    RIGHTARG = raster,
    COMMUTATOR = <<,
    RESTRICT = positionsel,
    JOIN = positionjoinsel
);


ALTER OPERATOR public.>> (raster, raster) OWNER TO postgres;

--
-- Name: @; Type: OPERATOR; Schema: public; Owner: postgres
--

CREATE OPERATOR @ (
    PROCEDURE = geometry_within,
    LEFTARG = geometry,
    RIGHTARG = geometry,
    COMMUTATOR = ~,
    RESTRICT = contsel,
    JOIN = contjoinsel
);


ALTER OPERATOR public.@ (geometry, geometry) OWNER TO postgres;

--
-- Name: @; Type: OPERATOR; Schema: public; Owner: postgres
--

CREATE OPERATOR @ (
    PROCEDURE = raster_contained,
    LEFTARG = raster,
    RIGHTARG = raster,
    COMMUTATOR = ~,
    RESTRICT = contsel,
    JOIN = contjoinsel
);


ALTER OPERATOR public.@ (raster, raster) OWNER TO postgres;

--
-- Name: |&>; Type: OPERATOR; Schema: public; Owner: postgres
--

CREATE OPERATOR |&> (
    PROCEDURE = geometry_overabove,
    LEFTARG = geometry,
    RIGHTARG = geometry,
    COMMUTATOR = &<|,
    RESTRICT = positionsel,
    JOIN = positionjoinsel
);


ALTER OPERATOR public.|&> (geometry, geometry) OWNER TO postgres;

--
-- Name: |&>; Type: OPERATOR; Schema: public; Owner: postgres
--

CREATE OPERATOR |&> (
    PROCEDURE = raster_overabove,
    LEFTARG = raster,
    RIGHTARG = raster,
    COMMUTATOR = &<|,
    RESTRICT = positionsel,
    JOIN = positionjoinsel
);


ALTER OPERATOR public.|&> (raster, raster) OWNER TO postgres;

--
-- Name: |>>; Type: OPERATOR; Schema: public; Owner: postgres
--

CREATE OPERATOR |>> (
    PROCEDURE = geometry_above,
    LEFTARG = geometry,
    RIGHTARG = geometry,
    COMMUTATOR = <<|,
    RESTRICT = positionsel,
    JOIN = positionjoinsel
);


ALTER OPERATOR public.|>> (geometry, geometry) OWNER TO postgres;

--
-- Name: |>>; Type: OPERATOR; Schema: public; Owner: postgres
--

CREATE OPERATOR |>> (
    PROCEDURE = raster_above,
    LEFTARG = raster,
    RIGHTARG = raster,
    COMMUTATOR = <<|,
    RESTRICT = positionsel,
    JOIN = positionjoinsel
);


ALTER OPERATOR public.|>> (raster, raster) OWNER TO postgres;

--
-- Name: ~; Type: OPERATOR; Schema: public; Owner: postgres
--

CREATE OPERATOR ~ (
    PROCEDURE = geometry_contains,
    LEFTARG = geometry,
    RIGHTARG = geometry,
    COMMUTATOR = @,
    RESTRICT = contsel,
    JOIN = contjoinsel
);


ALTER OPERATOR public.~ (geometry, geometry) OWNER TO postgres;

--
-- Name: ~; Type: OPERATOR; Schema: public; Owner: postgres
--

CREATE OPERATOR ~ (
    PROCEDURE = raster_contain,
    LEFTARG = raster,
    RIGHTARG = raster,
    COMMUTATOR = @,
    RESTRICT = contsel,
    JOIN = contjoinsel
);


ALTER OPERATOR public.~ (raster, raster) OWNER TO postgres;

--
-- Name: ~; Type: OPERATOR; Schema: public; Owner: postgres
--

CREATE OPERATOR ~ (
    PROCEDURE = raster_geometry_contain,
    LEFTARG = raster,
    RIGHTARG = geometry,
    COMMUTATOR = @,
    RESTRICT = contsel,
    JOIN = contjoinsel
);


ALTER OPERATOR public.~ (raster, geometry) OWNER TO postgres;

--
-- Name: ~; Type: OPERATOR; Schema: public; Owner: postgres
--

CREATE OPERATOR ~ (
    PROCEDURE = geometry_raster_contain,
    LEFTARG = geometry,
    RIGHTARG = raster,
    COMMUTATOR = @,
    RESTRICT = contsel,
    JOIN = contjoinsel
);


ALTER OPERATOR public.~ (geometry, raster) OWNER TO postgres;

--
-- Name: ~=; Type: OPERATOR; Schema: public; Owner: postgres
--

CREATE OPERATOR ~= (
    PROCEDURE = geometry_same,
    LEFTARG = geometry,
    RIGHTARG = geometry,
    RESTRICT = contsel,
    JOIN = contjoinsel
);


ALTER OPERATOR public.~= (geometry, geometry) OWNER TO postgres;

--
-- Name: ~=; Type: OPERATOR; Schema: public; Owner: postgres
--

CREATE OPERATOR ~= (
    PROCEDURE = raster_same,
    LEFTARG = raster,
    RIGHTARG = raster,
    COMMUTATOR = ~=,
    RESTRICT = eqsel,
    JOIN = eqjoinsel
);


ALTER OPERATOR public.~= (raster, raster) OWNER TO postgres;

--
-- Name: btree_geography_ops; Type: OPERATOR CLASS; Schema: public; Owner: postgres
--

CREATE OPERATOR CLASS btree_geography_ops
    DEFAULT FOR TYPE geography USING btree AS
    OPERATOR 1 <(geography,geography) ,
    OPERATOR 2 <=(geography,geography) ,
    OPERATOR 3 =(geography,geography) ,
    OPERATOR 4 >=(geography,geography) ,
    OPERATOR 5 >(geography,geography) ,
    FUNCTION 1 geography_cmp(geography,geography);


ALTER OPERATOR CLASS public.btree_geography_ops USING btree OWNER TO postgres;

--
-- Name: btree_geometry_ops; Type: OPERATOR CLASS; Schema: public; Owner: postgres
--

CREATE OPERATOR CLASS btree_geometry_ops
    DEFAULT FOR TYPE geometry USING btree AS
    OPERATOR 1 <(geometry,geometry) ,
    OPERATOR 2 <=(geometry,geometry) ,
    OPERATOR 3 =(geometry,geometry) ,
    OPERATOR 4 >=(geometry,geometry) ,
    OPERATOR 5 >(geometry,geometry) ,
    FUNCTION 1 geometry_cmp(geometry,geometry);


ALTER OPERATOR CLASS public.btree_geometry_ops USING btree OWNER TO postgres;

--
-- Name: gist_geography_ops; Type: OPERATOR CLASS; Schema: public; Owner: postgres
--

CREATE OPERATOR CLASS gist_geography_ops
    DEFAULT FOR TYPE geography USING gist AS
    STORAGE gidx ,
    OPERATOR 3 &&(geography,geography) ,
    FUNCTION 1 geography_gist_consistent(internal,geography,integer) ,
    FUNCTION 2 geography_gist_union(bytea,internal) ,
    FUNCTION 3 geography_gist_compress(internal) ,
    FUNCTION 4 geography_gist_decompress(internal) ,
    FUNCTION 5 geography_gist_penalty(internal,internal,internal) ,
    FUNCTION 6 geography_gist_picksplit(internal,internal) ,
    FUNCTION 7 geography_gist_same(box2d,box2d,internal);


ALTER OPERATOR CLASS public.gist_geography_ops USING gist OWNER TO postgres;

--
-- Name: gist_geometry_ops_2d; Type: OPERATOR CLASS; Schema: public; Owner: postgres
--

CREATE OPERATOR CLASS gist_geometry_ops_2d
    DEFAULT FOR TYPE geometry USING gist AS
    STORAGE box2df ,
    OPERATOR 1 <<(geometry,geometry) ,
    OPERATOR 2 &<(geometry,geometry) ,
    OPERATOR 3 &&(geometry,geometry) ,
    OPERATOR 4 &>(geometry,geometry) ,
    OPERATOR 5 >>(geometry,geometry) ,
    OPERATOR 6 ~=(geometry,geometry) ,
    OPERATOR 7 ~(geometry,geometry) ,
    OPERATOR 8 @(geometry,geometry) ,
    OPERATOR 9 &<|(geometry,geometry) ,
    OPERATOR 10 <<|(geometry,geometry) ,
    OPERATOR 11 |>>(geometry,geometry) ,
    OPERATOR 12 |&>(geometry,geometry) ,
    OPERATOR 13 <->(geometry,geometry) FOR ORDER BY pg_catalog.float_ops ,
    OPERATOR 14 <#>(geometry,geometry) FOR ORDER BY pg_catalog.float_ops ,
    FUNCTION 1 geometry_gist_consistent_2d(internal,geometry,integer) ,
    FUNCTION 2 geometry_gist_union_2d(bytea,internal) ,
    FUNCTION 3 geometry_gist_compress_2d(internal) ,
    FUNCTION 4 geometry_gist_decompress_2d(internal) ,
    FUNCTION 5 geometry_gist_penalty_2d(internal,internal,internal) ,
    FUNCTION 6 geometry_gist_picksplit_2d(internal,internal) ,
    FUNCTION 7 geometry_gist_same_2d(geometry,geometry,internal) ,
    FUNCTION 8 geometry_gist_distance_2d(internal,geometry,integer);


ALTER OPERATOR CLASS public.gist_geometry_ops_2d USING gist OWNER TO postgres;

--
-- Name: gist_geometry_ops_nd; Type: OPERATOR CLASS; Schema: public; Owner: postgres
--

CREATE OPERATOR CLASS gist_geometry_ops_nd
    FOR TYPE geometry USING gist AS
    STORAGE gidx ,
    OPERATOR 3 &&&(geometry,geometry) ,
    FUNCTION 1 geometry_gist_consistent_nd(internal,geometry,integer) ,
    FUNCTION 2 geometry_gist_union_nd(bytea,internal) ,
    FUNCTION 3 geometry_gist_compress_nd(internal) ,
    FUNCTION 4 geometry_gist_decompress_nd(internal) ,
    FUNCTION 5 geometry_gist_penalty_nd(internal,internal,internal) ,
    FUNCTION 6 geometry_gist_picksplit_nd(internal,internal) ,
    FUNCTION 7 geometry_gist_same_nd(geometry,geometry,internal);


ALTER OPERATOR CLASS public.gist_geometry_ops_nd USING gist OWNER TO postgres;

SET search_path = pg_catalog;

--
-- Name: CAST (public.box2d AS public.box3d); Type: CAST; Schema: pg_catalog; Owner: 
--

CREATE CAST (public.box2d AS public.box3d) WITH FUNCTION public.box3d(public.box2d) AS IMPLICIT;


--
-- Name: CAST (public.box2d AS public.geometry); Type: CAST; Schema: pg_catalog; Owner: 
--

CREATE CAST (public.box2d AS public.geometry) WITH FUNCTION public.geometry(public.box2d) AS IMPLICIT;


--
-- Name: CAST (public.box3d AS box); Type: CAST; Schema: pg_catalog; Owner: 
--

CREATE CAST (public.box3d AS box) WITH FUNCTION public.box(public.box3d) AS IMPLICIT;


--
-- Name: CAST (public.box3d AS public.box2d); Type: CAST; Schema: pg_catalog; Owner: 
--

CREATE CAST (public.box3d AS public.box2d) WITH FUNCTION public.box2d(public.box3d) AS IMPLICIT;


--
-- Name: CAST (public.box3d AS public.geometry); Type: CAST; Schema: pg_catalog; Owner: 
--

CREATE CAST (public.box3d AS public.geometry) WITH FUNCTION public.geometry(public.box3d) AS IMPLICIT;


--
-- Name: CAST (bytea AS public.geography); Type: CAST; Schema: pg_catalog; Owner: 
--

CREATE CAST (bytea AS public.geography) WITH FUNCTION public.geography(bytea) AS IMPLICIT;


--
-- Name: CAST (bytea AS public.geometry); Type: CAST; Schema: pg_catalog; Owner: 
--

CREATE CAST (bytea AS public.geometry) WITH FUNCTION public.geometry(bytea) AS IMPLICIT;


--
-- Name: CAST (public.geography AS bytea); Type: CAST; Schema: pg_catalog; Owner: 
--

CREATE CAST (public.geography AS bytea) WITH FUNCTION public.bytea(public.geography) AS IMPLICIT;


--
-- Name: CAST (public.geography AS public.geography); Type: CAST; Schema: pg_catalog; Owner: 
--

CREATE CAST (public.geography AS public.geography) WITH FUNCTION public.geography(public.geography, integer, boolean) AS IMPLICIT;


--
-- Name: CAST (public.geography AS public.geometry); Type: CAST; Schema: pg_catalog; Owner: 
--

CREATE CAST (public.geography AS public.geometry) WITH FUNCTION public.geometry(public.geography);


--
-- Name: CAST (public.geometry AS box); Type: CAST; Schema: pg_catalog; Owner: 
--

CREATE CAST (public.geometry AS box) WITH FUNCTION public.box(public.geometry) AS IMPLICIT;


--
-- Name: CAST (public.geometry AS public.box2d); Type: CAST; Schema: pg_catalog; Owner: 
--

CREATE CAST (public.geometry AS public.box2d) WITH FUNCTION public.box2d(public.geometry) AS IMPLICIT;


--
-- Name: CAST (public.geometry AS public.box3d); Type: CAST; Schema: pg_catalog; Owner: 
--

CREATE CAST (public.geometry AS public.box3d) WITH FUNCTION public.box3d(public.geometry) AS IMPLICIT;


--
-- Name: CAST (public.geometry AS bytea); Type: CAST; Schema: pg_catalog; Owner: 
--

CREATE CAST (public.geometry AS bytea) WITH FUNCTION public.bytea(public.geometry) AS IMPLICIT;


--
-- Name: CAST (public.geometry AS public.geography); Type: CAST; Schema: pg_catalog; Owner: 
--

CREATE CAST (public.geometry AS public.geography) WITH FUNCTION public.geography(public.geometry) AS IMPLICIT;


--
-- Name: CAST (public.geometry AS public.geometry); Type: CAST; Schema: pg_catalog; Owner: 
--

CREATE CAST (public.geometry AS public.geometry) WITH FUNCTION public.geometry(public.geometry, integer, boolean) AS IMPLICIT;


--
-- Name: CAST (public.geometry AS text); Type: CAST; Schema: pg_catalog; Owner: 
--

CREATE CAST (public.geometry AS text) WITH FUNCTION public.text(public.geometry) AS IMPLICIT;


--
-- Name: CAST (public.raster AS public.box3d); Type: CAST; Schema: pg_catalog; Owner: 
--

CREATE CAST (public.raster AS public.box3d) WITH FUNCTION public.box3d(public.raster) AS ASSIGNMENT;


--
-- Name: CAST (public.raster AS bytea); Type: CAST; Schema: pg_catalog; Owner: 
--

CREATE CAST (public.raster AS bytea) WITH FUNCTION public.bytea(public.raster) AS ASSIGNMENT;


--
-- Name: CAST (public.raster AS public.geometry); Type: CAST; Schema: pg_catalog; Owner: 
--

CREATE CAST (public.raster AS public.geometry) WITH FUNCTION public.st_convexhull(public.raster) AS ASSIGNMENT;


--
-- Name: CAST (text AS public.geometry); Type: CAST; Schema: pg_catalog; Owner: 
--

CREATE CAST (text AS public.geometry) WITH FUNCTION public.geometry(text) AS IMPLICIT;


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: NrcAnalysis; Type: TABLE; Schema: public; Owner: scraper; Tablespace: 
--

CREATE TABLE "NrcAnalysis" (
    reportnum integer NOT NULL,
    sheen_length double precision,
    sheen_width double precision,
    reported_spill_volume double precision,
    min_spill_volume double precision,
    calltype character varying(20),
    severity character varying(20),
    region character varying(20),
    release_type character varying(20)
);


ALTER TABLE public."NrcAnalysis" OWNER TO scraper;

--
-- Name: NrcGeocode; Type: TABLE; Schema: public; Owner: scraper; Tablespace: 
--

CREATE TABLE "NrcGeocode" (
    reportnum integer DEFAULT 0 NOT NULL,
    source character(16) NOT NULL,
    lat double precision DEFAULT 0 NOT NULL,
    lng double precision DEFAULT 0 NOT NULL,
    "precision" numeric(16,0) DEFAULT 0 NOT NULL
);


ALTER TABLE public."NrcGeocode" OWNER TO scraper;

--
-- Name: NrcParsedReport; Type: TABLE; Schema: public; Owner: scraper; Tablespace: 
--

CREATE TABLE "NrcParsedReport" (
    reportnum integer NOT NULL,
    latitude double precision,
    longitude double precision,
    areaid character varying(32),
    blockid character varying(32),
    zip character varying(16),
    platform_letter character varying(16),
    sheen_size_length character varying(16),
    sheen_size_width character varying(16),
    affected_area character varying(32),
    county character varying(32),
    time_stamp timestamp without time zone DEFAULT now() NOT NULL,
    ft_id integer
);


ALTER TABLE public."NrcParsedReport" OWNER TO scraper;

--
-- Name: NrcScrapedReport; Type: TABLE; Schema: public; Owner: scraper; Tablespace: 
--

CREATE TABLE "NrcScrapedReport" (
    reportnum integer NOT NULL,
    calltype character varying(16),
    recieved_datetime timestamp without time zone,
    description text,
    incident_datetime timestamp without time zone,
    incidenttype character varying(32),
    cause character varying(32),
    location character varying(255),
    state character varying(255),
    nearestcity character varying(255),
    county character varying(255),
    suspected_responsible_company character varying(255),
    medium_affected character varying(255),
    material_name character varying(255),
    full_report_url character varying(255),
    materials_url character varying(255),
    time_stamp timestamp without time zone DEFAULT now() NOT NULL,
    ft_id integer
);


ALTER TABLE public."NrcScrapedReport" OWNER TO scraper;

--
-- Name: NrcReleaseIncidents; Type: VIEW; Schema: public; Owner: scraper
--

CREATE VIEW "NrcReleaseIncidents" AS
    SELECT r.reportnum, r.calltype, r.recieved_datetime, replace(replace(replace(r.description, '\t'::text, ' '::text), '\\n'::text, ' '::text), '\\r'::text, ' '::text) AS description, r.incident_datetime, r.incidenttype, r.cause, replace(replace((r.location)::text, '\t'::text, ' '::text), '\\n'::text, ' '::text) AS location, r.state, r.nearestcity, r.county, r.suspected_responsible_company, r.medium_affected, r.material_name, r.full_report_url, r.materials_url, a.sheen_length, a.sheen_width, a.reported_spill_volume, a.min_spill_volume, a.severity, a.region, a.release_type, p.areaid, p.blockid, p.platform_letter, p.zip, p.affected_area, g.source AS geocode_source, g.lat, g.lng FROM ((("NrcScrapedReport" r JOIN "NrcAnalysis" a ON ((r.reportnum = a.reportnum))) JOIN "NrcParsedReport" p ON ((r.reportnum = p.reportnum))) LEFT JOIN "NrcGeocode" g ON ((r.reportnum = g.reportnum))) WHERE ((((a.calltype)::text = 'INCIDENT'::text) AND ((r.incidenttype)::text <> 'RAILROAD NON-RELEASE'::text)) AND ((r.medium_affected)::text <> ALL (ARRAY[('NON-RELEASE (N/A)'::character varying)::text, ('RAIL REPORT (N/A)'::character varying)::text])));


ALTER TABLE public."NrcReleaseIncidents" OWNER TO scraper;

--
-- Name: 23051_Incidents; Type: VIEW; Schema: public; Owner: scraper
--

CREATE VIEW "23051_Incidents" AS
    SELECT "NrcReleaseIncidents".reportnum, "NrcReleaseIncidents".calltype, "NrcReleaseIncidents".recieved_datetime, "NrcReleaseIncidents".description, "NrcReleaseIncidents".incident_datetime, "NrcReleaseIncidents".incidenttype, "NrcReleaseIncidents".cause, "NrcReleaseIncidents".location, "NrcReleaseIncidents".state, "NrcReleaseIncidents".nearestcity, "NrcReleaseIncidents".county, "NrcReleaseIncidents".suspected_responsible_company, "NrcReleaseIncidents".medium_affected, "NrcReleaseIncidents".material_name, "NrcReleaseIncidents".full_report_url, "NrcReleaseIncidents".materials_url, "NrcReleaseIncidents".sheen_length, "NrcReleaseIncidents".sheen_width, "NrcReleaseIncidents".reported_spill_volume, "NrcReleaseIncidents".min_spill_volume, "NrcReleaseIncidents".areaid, "NrcReleaseIncidents".blockid, "NrcReleaseIncidents".platform_letter, "NrcReleaseIncidents".zip, "NrcReleaseIncidents".affected_area, "NrcReleaseIncidents".geocode_source, "NrcReleaseIncidents".lat, "NrcReleaseIncidents".lng FROM "NrcReleaseIncidents" WHERE ((((((("NrcReleaseIncidents".areaid)::text ~~ 'MISSISSIPPI%'::text) AND (("NrcReleaseIncidents".blockid)::text = '20'::text)) OR ((("NrcReleaseIncidents".lat >= (28.922)::double precision) AND ("NrcReleaseIncidents".lat <= (28.954)::double precision)) AND (("NrcReleaseIncidents".lng >= ((-88.9945))::double precision) AND ("NrcReleaseIncidents".lng <= ((-88.956))::double precision)))) OR (((("NrcReleaseIncidents".suspected_responsible_company)::text ~~ 'TAYLOR EN%'::text) AND ("NrcReleaseIncidents".blockid IS NULL)) AND ("NrcReleaseIncidents".lat IS NULL))) AND (("NrcReleaseIncidents".medium_affected)::text = 'WATER'::text)) AND ("NrcReleaseIncidents".incident_datetime > '2004-09-15 00:00:00'::timestamp without time zone));


ALTER TABLE public."23051_Incidents" OWNER TO scraper;

--
-- Name: areacodemap_id_seq; Type: SEQUENCE; Schema: public; Owner: scraper
--

CREATE SEQUENCE areacodemap_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.areacodemap_id_seq OWNER TO scraper;

--
-- Name: AreaCodeMap; Type: TABLE; Schema: public; Owner: scraper; Tablespace: 
--

CREATE TABLE "AreaCodeMap" (
    id integer DEFAULT nextval('areacodemap_id_seq'::regclass) NOT NULL,
    pattern character varying(64) NOT NULL,
    area_code character(2) NOT NULL
);


ALTER TABLE public."AreaCodeMap" OWNER TO scraper;

--
-- Name: Boemre_sizes; Type: TABLE; Schema: public; Owner: scraper; Tablespace: 
--

CREATE TABLE "Boemre_sizes" (
    id integer,
    min_gal numeric(11,0),
    max_gal numeric(11,0),
    label character varying(20)
);


ALTER TABLE public."Boemre_sizes" OWNER TO scraper;

--
-- Name: BotTask; Type: TABLE; Schema: public; Owner: scraper; Tablespace: 
--

CREATE TABLE "BotTask" (
    id integer NOT NULL,
    bot character varying(20) NOT NULL,
    name character varying(32) NOT NULL,
    process_interval_secs integer DEFAULT 0 NOT NULL
);


ALTER TABLE public."BotTask" OWNER TO scraper;

--
-- Name: BotTaskError; Type: TABLE; Schema: public; Owner: scraper; Tablespace: 
--

CREATE TABLE "BotTaskError" (
    task_id integer NOT NULL,
    bot character varying(32) NOT NULL,
    code character varying(16) NOT NULL,
    message character varying(1023),
    time_stamp timestamp without time zone DEFAULT now() NOT NULL
);


ALTER TABLE public."BotTaskError" OWNER TO scraper;

--
-- Name: BotTaskParams; Type: TABLE; Schema: public; Owner: scraper; Tablespace: 
--

CREATE TABLE "BotTaskParams" (
    task_id integer NOT NULL,
    bot character varying(20) NOT NULL,
    key character varying(20) NOT NULL,
    value character varying(1024)
);


ALTER TABLE public."BotTaskParams" OWNER TO scraper;

--
-- Name: BotTaskStatus; Type: TABLE; Schema: public; Owner: scraper; Tablespace: 
--

CREATE TABLE "BotTaskStatus" (
    task_id integer NOT NULL,
    bot character varying(32) NOT NULL,
    status character varying(16) NOT NULL,
    time_stamp timestamp without time zone DEFAULT now() NOT NULL
);


ALTER TABLE public."BotTaskStatus" OWNER TO scraper;

--
-- Name: CO_Permits; Type: TABLE; Schema: public; Owner: scraper; Tablespace: 
--

CREATE TABLE "CO_Permits" (
    seqid character(23) NOT NULL,
    ft_id integer NOT NULL,
    county_name character varying(20),
    received_date date,
    posted_date date,
    operator_name character varying(50),
    operator_number character varying(20),
    approved_date date,
    api character varying(20),
    type_of_permit character varying(8),
    well_name character varying(50),
    well_number character varying(20),
    proposed_td double precision,
    well_location character varying(50),
    footage_call character varying(50),
    field character varying(50),
    latitude double precision,
    longitude double precision,
    elevation character varying(20),
    federal_state_lease character varying(20),
    record_url character varying(255)
);


ALTER TABLE public."CO_Permits" OWNER TO scraper;

--
-- Name: cogisinspection_st_id_seq; Type: SEQUENCE; Schema: public; Owner: scraper
--

CREATE SEQUENCE cogisinspection_st_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cogisinspection_st_id_seq OWNER TO scraper;

--
-- Name: CogisInspection; Type: TABLE; Schema: public; Owner: scraper; Tablespace: 
--

CREATE TABLE "CogisInspection" (
    st_id integer DEFAULT nextval('cogisinspection_st_id_seq'::regclass) NOT NULL,
    doc_num character varying(15) NOT NULL,
    county_code character varying(10),
    county_name character varying(30),
    date date,
    doc_href character varying(120),
    loc_id character varying(15),
    operator character varying(60),
    insp_api_num character varying(30),
    insp_status character varying(15),
    insp_overall character varying(30),
    ir_pass_fail character varying(10),
    fr_pass_fail character varying(10),
    violation character varying(10),
    site_lat character varying(20),
    site_lng character varying(20),
    time_stamp timestamp without time zone DEFAULT now() NOT NULL,
    ft_id integer
);


ALTER TABLE public."CogisInspection" OWNER TO scraper;

--
-- Name: cogisspill_st_id_seq; Type: SEQUENCE; Schema: public; Owner: scraper
--

CREATE SEQUENCE cogisspill_st_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cogisspill_st_id_seq OWNER TO scraper;

--
-- Name: CogisSpill; Type: TABLE; Schema: public; Owner: scraper; Tablespace: 
--

CREATE TABLE "CogisSpill" (
    st_id integer DEFAULT nextval('cogisspill_st_id_seq'::regclass) NOT NULL,
    doc_num character varying(15) NOT NULL,
    county_code character varying(10),
    county_name character varying(30),
    date date,
    doc_href character varying(120),
    facility_id character varying(15),
    operator_num character varying(15),
    company_name character varying(60),
    groundwater character varying(10),
    surfacewater character varying(10),
    berm_contained character varying(10),
    spill_area character varying(15),
    spill_lat character varying(20),
    spill_lng character varying(20),
    ft_id integer,
    time_stamp timestamp without time zone DEFAULT now() NOT NULL
);


ALTER TABLE public."CogisSpill" OWNER TO scraper;

--
-- Name: DEFUNCT_BlockCentroid; Type: TABLE; Schema: public; Owner: scraper; Tablespace: 
--

CREATE TABLE "DEFUNCT_BlockCentroid" (
    "AREA" double precision NOT NULL,
    "PERIMETER" double precision NOT NULL,
    "PROT_NUMBE" character varying(7) NOT NULL,
    "PROT_APRV_" character varying(11) NOT NULL,
    "BLOCK_NUMB" character varying(6) NOT NULL,
    "BLK_FED_AP" character varying(11) NOT NULL,
    "AREA_CODE" character varying(2) NOT NULL,
    "AC_LAB" character varying(8) NOT NULL,
    "BLOCK_LAB" character varying(6) NOT NULL,
    "MMS_REGION" character varying(1) NOT NULL,
    "ORIG_FID" integer NOT NULL,
    "POINT_X" double precision NOT NULL,
    "POINT_Y" double precision NOT NULL,
    blockid character varying(6)
);


ALTER TABLE public."DEFUNCT_BlockCentroid" OWNER TO scraper;

--
-- Name: DEFUNCT_BlockCentroidNew; Type: TABLE; Schema: public; Owner: scraper; Tablespace: 
--

CREATE TABLE "DEFUNCT_BlockCentroidNew" (
    "AREA" double precision NOT NULL,
    "PERIMETER" double precision NOT NULL,
    "PROT_NUMBE" character varying(7) NOT NULL,
    "PROT_APRV_" character varying(11) NOT NULL,
    "BLOCK_NUMB" character varying(6) NOT NULL,
    "BLK_FED_AP" character varying(11) NOT NULL,
    "AREA_CODE" character varying(2) NOT NULL,
    "AC_LAB" character varying(8) NOT NULL,
    "BLOCK_LAB" character varying(6) NOT NULL,
    "MMS_REGION" character varying(1) NOT NULL,
    "ORIG_FID" integer NOT NULL,
    y double precision NOT NULL,
    x double precision NOT NULL
);


ALTER TABLE public."DEFUNCT_BlockCentroidNew" OWNER TO scraper;

--
-- Name: feedentry_published_seq_seq; Type: SEQUENCE; Schema: public; Owner: scraper
--

CREATE SEQUENCE feedentry_published_seq_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.feedentry_published_seq_seq OWNER TO scraper;

--
-- Name: DEFUNCT_FeedEntry; Type: TABLE; Schema: public; Owner: scraper; Tablespace: 
--

CREATE TABLE "DEFUNCT_FeedEntry" (
    id character(36) DEFAULT ''::character(1) NOT NULL,
    title character varying(255) NOT NULL,
    link character varying(255),
    updated timestamp without time zone DEFAULT '1970-01-01 00:00:00'::timestamp without time zone NOT NULL,
    summary text,
    lat double precision,
    lng double precision,
    content text,
    source_id integer DEFAULT 0 NOT NULL,
    kml_url character varying(255),
    published timestamp without time zone DEFAULT now() NOT NULL,
    published_seq integer DEFAULT nextval('feedentry_published_seq_seq'::regclass) NOT NULL,
    incident_datetime timestamp without time zone NOT NULL,
    source_item_id integer
);


ALTER TABLE public."DEFUNCT_FeedEntry" OWNER TO scraper;

--
-- Name: DEFUNCT_FracFocus; Type: TABLE; Schema: public; Owner: scraper; Tablespace: 
--

CREATE TABLE "DEFUNCT_FracFocus" (
    seqid character(23) NOT NULL,
    ft_id integer NOT NULL,
    api_nr character varying(20),
    job_date date,
    state character varying(20),
    county character varying(20),
    operator_name character varying(50),
    well_name character varying(50),
    well_type character varying(10),
    latitude double precision,
    longitude double precision,
    datum character varying(8),
    blob_key character varying(180)
);


ALTER TABLE public."DEFUNCT_FracFocus" OWNER TO scraper;

--
-- Name: FT_NRC_Incident_Reports; Type: VIEW; Schema: public; Owner: scraper
--

CREATE VIEW "FT_NRC_Incident_Reports" AS
    SELECT p.time_stamp, r.reportnum, r.calltype, r.recieved_datetime, r.description, r.incident_datetime, r.incidenttype, r.cause, r.location, p.affected_area, r.state, p.county, r.nearestcity, p.zip, p.latitude, p.longitude, p.areaid, p.blockid, p.platform_letter, r.suspected_responsible_company, r.medium_affected, r.material_name, r.full_report_url, r.materials_url, p.sheen_size_length, p.sheen_size_width FROM ("NrcScrapedReport" r JOIN "NrcParsedReport" p ON ((r.reportnum = p.reportnum)));


ALTER TABLE public."FT_NRC_Incident_Reports" OWNER TO scraper;

--
-- Name: ft_test_seq_seq; Type: SEQUENCE; Schema: public; Owner: scraper
--

CREATE SEQUENCE ft_test_seq_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ft_test_seq_seq OWNER TO scraper;

--
-- Name: FT_Test; Type: TABLE; Schema: public; Owner: scraper; Tablespace: 
--

CREATE TABLE "FT_Test" (
    seq integer DEFAULT nextval('ft_test_seq_seq'::regclass) NOT NULL,
    time_stamp timestamp without time zone DEFAULT now() NOT NULL,
    name character varying(30),
    lat double precision,
    lng double precision,
    ft_id integer
);


ALTER TABLE public."FT_Test" OWNER TO scraper;

--
-- Name: FeedEntryTag; Type: TABLE; Schema: public; Owner: scraper; Tablespace: 
--

CREATE TABLE "FeedEntryTag" (
    feed_entry_id character(36) NOT NULL,
    tag character varying(64) NOT NULL,
    comment text
);


ALTER TABLE public."FeedEntryTag" OWNER TO scraper;

--
-- Name: feedsource_id_seq; Type: SEQUENCE; Schema: public; Owner: scraper
--

CREATE SEQUENCE feedsource_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.feedsource_id_seq OWNER TO scraper;

--
-- Name: FeedSource; Type: TABLE; Schema: public; Owner: scraper; Tablespace: 
--

CREATE TABLE "FeedSource" (
    id integer DEFAULT nextval('feedsource_id_seq'::regclass) NOT NULL,
    name character varying(32) NOT NULL
);


ALTER TABLE public."FeedSource" OWNER TO scraper;

--
-- Name: fracfocuschemical_old_seqid_seq; Type: SEQUENCE; Schema: public; Owner: scraper
--

CREATE SEQUENCE fracfocuschemical_old_seqid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.fracfocuschemical_old_seqid_seq OWNER TO scraper;

--
-- Name: FracFocusChemical_old; Type: TABLE; Schema: public; Owner: scraper; Tablespace: 
--

CREATE TABLE "FracFocusChemical_old" (
    seqid integer DEFAULT nextval('fracfocuschemical_old_seqid_seq'::regclass) NOT NULL,
    ft_id integer,
    report_seqid integer NOT NULL,
    api character varying(20) NOT NULL,
    fracture_date date NOT NULL,
    "row" integer NOT NULL,
    trade_name character varying(200),
    supplier character varying(50),
    purpose character varying(200),
    ingredients character varying(100),
    cas_number character varying(50),
    additive_concentration double precision,
    hf_fluid_concentration double precision,
    comments character varying(200)
);


ALTER TABLE public."FracFocusChemical_old" OWNER TO scraper;

--
-- Name: fracfocuschemical_old2_seqid_seq; Type: SEQUENCE; Schema: public; Owner: scraper
--

CREATE SEQUENCE fracfocuschemical_old2_seqid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.fracfocuschemical_old2_seqid_seq OWNER TO scraper;

--
-- Name: FracFocusChemical_old2; Type: TABLE; Schema: public; Owner: scraper; Tablespace: 
--

CREATE TABLE "FracFocusChemical_old2" (
    seqid integer DEFAULT nextval('fracfocuschemical_old2_seqid_seq'::regclass) NOT NULL,
    ft_id integer,
    report_seqid integer NOT NULL,
    api character varying(20) NOT NULL,
    fracture_date date NOT NULL,
    "row" integer NOT NULL,
    trade_name character varying(200),
    supplier character varying(50),
    purpose character varying(200),
    ingredients character varying(100),
    cas_number character varying(50),
    additive_concentration double precision,
    hf_fluid_concentration double precision,
    comments character varying(200)
);


ALTER TABLE public."FracFocusChemical_old2" OWNER TO scraper;

--
-- Name: FracFocusPDF; Type: TABLE; Schema: public; Owner: scraper; Tablespace: 
--

CREATE TABLE "FracFocusPDF" (
    seqid integer NOT NULL,
    downloaded timestamp without time zone DEFAULT now() NOT NULL,
    pdf bytea,
    filename character varying(100)
);


ALTER TABLE public."FracFocusPDF" OWNER TO scraper;

--
-- Name: fracfocusparse_seqid_seq; Type: SEQUENCE; Schema: public; Owner: scraper
--

CREATE SEQUENCE fracfocusparse_seqid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.fracfocusparse_seqid_seq OWNER TO scraper;

--
-- Name: FracFocusParse; Type: TABLE; Schema: public; Owner: scraper; Tablespace: 
--

CREATE TABLE "FracFocusParse" (
    seqid integer DEFAULT nextval('fracfocusparse_seqid_seq'::regclass) NOT NULL,
    ft_id integer,
    api character varying(20) NOT NULL,
    fracture_date date NOT NULL,
    state character varying(20),
    county character varying(20),
    operator character varying(50),
    well_name character varying(50),
    production_type character varying(10),
    latitude double precision,
    longitude double precision,
    datum character varying(8),
    true_vertical_depth double precision,
    total_water_volume double precision,
    extracted timestamp without time zone DEFAULT now() NOT NULL
);


ALTER TABLE public."FracFocusParse" OWNER TO scraper;

--
-- Name: fracfocusparsechemical_seqid_seq; Type: SEQUENCE; Schema: public; Owner: scraper
--

CREATE SEQUENCE fracfocusparsechemical_seqid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.fracfocusparsechemical_seqid_seq OWNER TO scraper;

--
-- Name: FracFocusParseChemical; Type: TABLE; Schema: public; Owner: scraper; Tablespace: 
--

CREATE TABLE "FracFocusParseChemical" (
    seqid integer DEFAULT nextval('fracfocusparsechemical_seqid_seq'::regclass) NOT NULL,
    ft_id integer,
    report_seqid integer NOT NULL,
    api character varying(20) NOT NULL,
    fracture_date date NOT NULL,
    "row" integer NOT NULL,
    trade_name character varying(200),
    supplier character varying(50),
    purpose character varying(200),
    ingredients character varying(200),
    cas_number character varying(50),
    additive_concentration double precision,
    hf_fluid_concentration double precision,
    ingredient_weight double precision,
    comments character varying(200)
);


ALTER TABLE public."FracFocusParseChemical" OWNER TO scraper;

--
-- Name: fracfocusreport_seqid_seq; Type: SEQUENCE; Schema: public; Owner: scraper
--

CREATE SEQUENCE fracfocusreport_seqid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.fracfocusreport_seqid_seq OWNER TO scraper;

--
-- Name: FracFocusReport; Type: TABLE; Schema: public; Owner: scraper; Tablespace: 
--

CREATE TABLE "FracFocusReport" (
    seqid integer DEFAULT nextval('fracfocusreport_seqid_seq'::regclass) NOT NULL,
    ft_id integer,
    pdf_seqid integer NOT NULL,
    api character varying(20) NOT NULL,
    fracture_date date NOT NULL,
    state character varying(20),
    county character varying(20),
    operator character varying(50),
    well_name character varying(50),
    production_type character varying(10),
    latitude double precision,
    longitude double precision,
    datum character varying(8),
    true_vertical_depth double precision,
    total_water_volume double precision,
    published timestamp without time zone DEFAULT now() NOT NULL,
    total_water_weight double precision,
    total_pct_in_fluid double precision,
    water_pct_in_fluid double precision,
    total_hf_weight double precision,
    err_code character varying(20),
    err_field character varying(20),
    err_comment character varying(500)
);


ALTER TABLE public."FracFocusReport" OWNER TO scraper;

--
-- Name: fracfocusreportchemical_seqid_seq; Type: SEQUENCE; Schema: public; Owner: scraper
--

CREATE SEQUENCE fracfocusreportchemical_seqid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.fracfocusreportchemical_seqid_seq OWNER TO scraper;

--
-- Name: FracFocusReportChemical; Type: TABLE; Schema: public; Owner: scraper; Tablespace: 
--

CREATE TABLE "FracFocusReportChemical" (
    seqid integer DEFAULT nextval('fracfocusreportchemical_seqid_seq'::regclass) NOT NULL,
    ft_id integer,
    pdf_seqid integer NOT NULL,
    api character varying(20) NOT NULL,
    fracture_date date NOT NULL,
    "row" integer NOT NULL,
    trade_name character varying(200),
    supplier character varying(50),
    purpose character varying(200),
    ingredients character varying(200),
    cas_number character varying(50),
    additive_concentration double precision,
    hf_fluid_concentration double precision,
    ingredient_weight double precision,
    comments character varying(200),
    weight double precision,
    cas_type character varying(20)
);


ALTER TABLE public."FracFocusReportChemical" OWNER TO scraper;

--
-- Name: fracfocusreport_old_seqid_seq; Type: SEQUENCE; Schema: public; Owner: scraper
--

CREATE SEQUENCE fracfocusreport_old_seqid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.fracfocusreport_old_seqid_seq OWNER TO scraper;

--
-- Name: FracFocusReport_old; Type: TABLE; Schema: public; Owner: scraper; Tablespace: 
--

CREATE TABLE "FracFocusReport_old" (
    seqid integer DEFAULT nextval('fracfocusreport_old_seqid_seq'::regclass) NOT NULL,
    ft_id integer,
    api character varying(20) NOT NULL,
    fracture_date date NOT NULL,
    state character varying(20),
    county character varying(20),
    operator character varying(50),
    well_name character varying(50),
    production_type character varying(10),
    latitude double precision,
    longitude double precision,
    datum character varying(8),
    true_vertical_depth double precision,
    total_water_volume double precision,
    extracted timestamp without time zone DEFAULT now() NOT NULL
);


ALTER TABLE public."FracFocusReport_old" OWNER TO scraper;

--
-- Name: fracfocusreport_old2_seqid_seq; Type: SEQUENCE; Schema: public; Owner: scraper
--

CREATE SEQUENCE fracfocusreport_old2_seqid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.fracfocusreport_old2_seqid_seq OWNER TO scraper;

--
-- Name: FracFocusReport_old2; Type: TABLE; Schema: public; Owner: scraper; Tablespace: 
--

CREATE TABLE "FracFocusReport_old2" (
    seqid integer DEFAULT nextval('fracfocusreport_old2_seqid_seq'::regclass) NOT NULL,
    ft_id integer,
    api character varying(20) NOT NULL,
    fracture_date date NOT NULL,
    state character varying(20),
    county character varying(20),
    operator character varying(50),
    well_name character varying(50),
    production_type character varying(10),
    latitude double precision,
    longitude double precision,
    datum character varying(8),
    true_vertical_depth double precision,
    total_water_volume double precision,
    extracted timestamp without time zone DEFAULT now() NOT NULL
);


ALTER TABLE public."FracFocusReport_old2" OWNER TO scraper;

--
-- Name: fracfocusscrape_seqid_seq; Type: SEQUENCE; Schema: public; Owner: scraper
--

CREATE SEQUENCE fracfocusscrape_seqid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.fracfocusscrape_seqid_seq OWNER TO scraper;

--
-- Name: FracFocusScrape; Type: TABLE; Schema: public; Owner: scraper; Tablespace: 
--

CREATE TABLE "FracFocusScrape" (
    seqid integer DEFAULT nextval('fracfocusscrape_seqid_seq'::regclass) NOT NULL,
    scraped timestamp without time zone DEFAULT now() NOT NULL,
    ft_id integer,
    api character varying(20),
    job_date date,
    state character varying(20),
    county character varying(20),
    operator character varying(50),
    well_name character varying(50),
    well_type character varying(10),
    latitude double precision,
    longitude double precision,
    datum character varying(8),
    pdf_download_attempts integer DEFAULT 0 NOT NULL
);


ALTER TABLE public."FracFocusScrape" OWNER TO scraper;

--
-- Name: GeocodeCache; Type: TABLE; Schema: public; Owner: scraper; Tablespace: 
--

CREATE TABLE "GeocodeCache" (
    _key character varying(50) NOT NULL,
    updated timestamp without time zone DEFAULT now() NOT NULL,
    lat double precision NOT NULL,
    lng double precision NOT NULL
);


ALTER TABLE public."GeocodeCache" OWNER TO scraper;

--
-- Name: la_lease_blocks_id_seq; Type: SEQUENCE; Schema: public; Owner: scraper
--

CREATE SEQUENCE la_lease_blocks_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.la_lease_blocks_id_seq OWNER TO scraper;

--
-- Name: LA_Lease_Blocks; Type: TABLE; Schema: public; Owner: scraper; Tablespace: 
--

CREATE TABLE "LA_Lease_Blocks" (
    id integer DEFAULT nextval('la_lease_blocks_id_seq'::regclass) NOT NULL,
    wkt_geom character varying(40) NOT NULL,
    lat double precision NOT NULL,
    lng double precision NOT NULL,
    area_id character varying(8) NOT NULL,
    block_id character varying(8) NOT NULL,
    "DXF_TEXT" character varying(8) NOT NULL,
    "AREA_NAME" character varying(32) NOT NULL
);


ALTER TABLE public."LA_Lease_Blocks" OWNER TO scraper;

--
-- Name: leaseblockcentroid_id_seq; Type: SEQUENCE; Schema: public; Owner: scraper
--

CREATE SEQUENCE leaseblockcentroid_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.leaseblockcentroid_id_seq OWNER TO scraper;

--
-- Name: LeaseBlockCentroid; Type: TABLE; Schema: public; Owner: scraper; Tablespace: 
--

CREATE TABLE "LeaseBlockCentroid" (
    id integer DEFAULT nextval('leaseblockcentroid_id_seq'::regclass) NOT NULL,
    areaid character varying(8) NOT NULL,
    blockid character varying(8) NOT NULL,
    lat double precision NOT NULL,
    lng double precision NOT NULL,
    state character varying(8) NOT NULL
);


ALTER TABLE public."LeaseBlockCentroid" OWNER TO scraper;

--
-- Name: Nightfire_file; Type: TABLE; Schema: public; Owner: scraper; Tablespace: 
--

CREATE TABLE "Nightfire_file" (
    id integer NOT NULL,
    filename character varying(60) NOT NULL,
    time_stamp timestamp without time zone DEFAULT now() NOT NULL
);


ALTER TABLE public."Nightfire_file" OWNER TO scraper;

--
-- Name: Nightfire_file_id_seq; Type: SEQUENCE; Schema: public; Owner: scraper
--

CREATE SEQUENCE "Nightfire_file_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Nightfire_file_id_seq" OWNER TO scraper;

--
-- Name: Nightfire_file_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: scraper
--

ALTER SEQUENCE "Nightfire_file_id_seq" OWNED BY "Nightfire_file".id;


--
-- Name: Nightfire_record; Type: TABLE; Schema: public; Owner: scraper; Tablespace: 
--

CREATE TABLE "Nightfire_record" (
    file_num bigint NOT NULL,
    "ID" bigint NOT NULL,
    "Lat_GMTCO" double precision,
    "Lon_GMTCO" double precision,
    "CM_IICMO" bigint,
    "COT_IVCOP" double precision,
    "EPS_IVCOP" double precision,
    "QF1_IVCOP" bigint,
    "QF2_IVCOP" bigint,
    "QF3_IVCOP" bigint,
    "Total_Rad" double precision,
    "BB_Temp" bigint,
    "M07_Rad" double precision,
    "M08_Rad" double precision,
    "M10_Rad" double precision,
    "M12_Rad" double precision,
    "M13_Rad" double precision,
    "M14_Rad" double precision,
    "M15_Rad" double precision,
    "M16_Rad" double precision,
    "SOLZ_GMTCO" double precision,
    "SOLA_GMTCO" double precision,
    "SATZ_GMTCO" double precision,
    "SATA_GMTCO" double precision,
    "SCVX_GMTCO" double precision,
    "SCVY_GMTCO" double precision,
    "SCVZ_GMTCO" double precision,
    "SCPX_GMTCO" double precision,
    "SCPY_GMTCO" double precision,
    "SCPZ_GMTCO" double precision,
    "SCAX_GMTCO" double precision,
    "SCAY_GMTCO" double precision,
    "SCAZ_GMTCO" double precision,
    "QF1_GMTCO" bigint,
    "QF2_GMTCO" bigint,
    "QF1_IICMO" bigint,
    "QF2_IICMO" bigint,
    "QF3_IICMO" bigint,
    "QF4_IICMO" bigint,
    "QF5_IICMO" bigint,
    "QF6_IICMO" bigint,
    "Date_Mscan" timestamp without time zone,
    "M10_Center" bigint,
    "M10_Avg" double precision,
    "M10_Std" double precision,
    "M10_Nsigma" bigint,
    "M10_DN" bigint,
    "M10_Sample" bigint,
    "M10_Line" bigint,
    "M10_File" character varying(120) DEFAULT NULL::character varying,
    "Proc_Date" timestamp without time zone,
    "DNB_Sample" bigint,
    "DNB_Line" bigint,
    "DNB_Lat" double precision,
    "DNB_Lon" double precision,
    "DNB_Rad" double precision,
    "DNB_Dist" double precision
);


ALTER TABLE public."Nightfire_record" OWNER TO scraper;

--
-- Name: nrcmaterials_id_seq; Type: SEQUENCE; Schema: public; Owner: scraper
--

CREATE SEQUENCE nrcmaterials_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.nrcmaterials_id_seq OWNER TO scraper;

--
-- Name: NrcMaterials; Type: TABLE; Schema: public; Owner: scraper; Tablespace: 
--

CREATE TABLE "NrcMaterials" (
    id integer DEFAULT nextval('nrcmaterials_id_seq'::regclass) NOT NULL,
    pattern character varying(32) NOT NULL,
    group_label character varying(32) NOT NULL
);


ALTER TABLE public."NrcMaterials" OWNER TO scraper;

--
-- Name: NrcScrapedFullReport; Type: TABLE; Schema: public; Owner: scraper; Tablespace: 
--

CREATE TABLE "NrcScrapedFullReport" (
    reportnum integer NOT NULL,
    full_report_body text,
    full_report_url character varying(255),
    parsed_blockid character varying(32),
    parsed_areaid character varying(32),
    parsed_latitude character varying(32),
    parsed_longitude character varying(32)
);


ALTER TABLE public."NrcScrapedFullReport" OWNER TO scraper;

--
-- Name: nrcscrapedmaterial_st_id_seq; Type: SEQUENCE; Schema: public; Owner: scraper
--

CREATE SEQUENCE nrcscrapedmaterial_st_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.nrcscrapedmaterial_st_id_seq OWNER TO scraper;

--
-- Name: NrcScrapedMaterial; Type: TABLE; Schema: public; Owner: scraper; Tablespace: 
--

CREATE TABLE "NrcScrapedMaterial" (
    reportnum integer NOT NULL,
    chris_code character varying(32),
    name character varying(32) DEFAULT ''::character varying NOT NULL,
    amount double precision,
    unit character varying(32),
    reached_water character varying(16),
    amt_in_water double precision,
    amt_in_water_unit character varying(32),
    ft_id integer,
    st_id integer DEFAULT nextval('nrcscrapedmaterial_st_id_seq'::regclass) NOT NULL
);


ALTER TABLE public."NrcScrapedMaterial" OWNER TO scraper;

--
-- Name: nrcscrapertarget_id_seq; Type: SEQUENCE; Schema: public; Owner: scraper
--

CREATE SEQUENCE nrcscrapertarget_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.nrcscrapertarget_id_seq OWNER TO scraper;

--
-- Name: NrcScraperTarget; Type: TABLE; Schema: public; Owner: scraper; Tablespace: 
--

CREATE TABLE "NrcScraperTarget" (
    id integer DEFAULT nextval('nrcscrapertarget_id_seq'::regclass) NOT NULL,
    done boolean DEFAULT false NOT NULL,
    execute_order integer,
    startdate timestamp without time zone,
    enddate timestamp without time zone
);


ALTER TABLE public."NrcScraperTarget" OWNER TO scraper;

--
-- Name: NrcTag; Type: TABLE; Schema: public; Owner: scraper; Tablespace: 
--

CREATE TABLE "NrcTag" (
    reportnum integer NOT NULL,
    tag character varying(64) NOT NULL,
    comment text
);


ALTER TABLE public."NrcTag" OWNER TO scraper;

--
-- Name: nrcunits_id_seq; Type: SEQUENCE; Schema: public; Owner: scraper
--

CREATE SEQUENCE nrcunits_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.nrcunits_id_seq OWNER TO scraper;

--
-- Name: NrcUnits; Type: TABLE; Schema: public; Owner: scraper; Tablespace: 
--

CREATE TABLE "NrcUnits" (
    id integer DEFAULT nextval('nrcunits_id_seq'::regclass) NOT NULL,
    unit_type character varying(16) NOT NULL,
    pattern character varying(32) NOT NULL,
    standardized_unit character varying(32) NOT NULL,
    conversion_factor double precision NOT NULL
);


ALTER TABLE public."NrcUnits" OWNER TO scraper;

--
-- Name: pa_drillingpermit_st_id_seq; Type: SEQUENCE; Schema: public; Owner: scraper
--

CREATE SEQUENCE pa_drillingpermit_st_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.pa_drillingpermit_st_id_seq OWNER TO scraper;

--
-- Name: PA_DrillingPermit; Type: TABLE; Schema: public; Owner: scraper; Tablespace: 
--

CREATE TABLE "PA_DrillingPermit" (
    st_id integer DEFAULT nextval('pa_drillingpermit_st_id_seq'::regclass) NOT NULL,
    ft_id integer,
    "County_Name" character varying(20) NOT NULL,
    "Municipality_Name" character varying(20),
    "Auth_Id" integer,
    "Date_Disposed" date NOT NULL,
    "Disposition_Code" character varying(20),
    "Appl_Type_Code" character varying(20),
    "Auth_Type_Description" character varying(60),
    "Complete_API_" character varying(20) NOT NULL,
    "Other_Id" character varying(20) NOT NULL,
    "Marcellus_Shale_Well" character varying(4),
    "Horizontal_Well" character varying(4),
    "Well_Type" character varying(20),
    "Site_Name" character varying(50),
    "Total_Depth" integer,
    "Lat_Deg" double precision,
    "Lat_Min" double precision,
    "Lat_Sec" double precision,
    "Long_Deg" double precision,
    "Long_Min" double precision,
    "Long_Sec" double precision,
    "GIS_Datum" character varying(50),
    "Latitude_Decimal" double precision,
    "Longitude_Decimal" double precision,
    "Client_Id" integer,
    "Operator" character varying(100),
    "Address1" character varying(255),
    "Address2" character varying(255),
    "City" character varying(30),
    "State_Code" character varying(20),
    "Zip_Code" character varying(20),
    "Unconventional" character varying(4),
    "OGO_Num" character varying(20),
    "Facility_Id" character varying(20)
);


ALTER TABLE public."PA_DrillingPermit" OWNER TO scraper;

--
-- Name: pa_spud_st_id_seq; Type: SEQUENCE; Schema: public; Owner: scraper
--

CREATE SEQUENCE pa_spud_st_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.pa_spud_st_id_seq OWNER TO scraper;

--
-- Name: PA_Spud; Type: TABLE; Schema: public; Owner: scraper; Tablespace: 
--

CREATE TABLE "PA_Spud" (
    st_id integer DEFAULT nextval('pa_spud_st_id_seq'::regclass) NOT NULL,
    ft_id integer,
    "Well_API__" character varying(20) NOT NULL,
    "OGO__" character varying(20) NOT NULL,
    "SPUD_Date" date NOT NULL,
    "County" character varying(20),
    "Municipality" character varying(20),
    "Operator_s_Name" character varying(100),
    "Farm_Name" character varying(50),
    "Well_Number" character varying(20),
    "Latitude" double precision,
    "Longitude" double precision,
    "Marcellus_Ind_" character varying(4),
    "Horizontal_Ind_" character varying(4),
    "Creation_Date" timestamp without time zone,
    "Created_By" character varying(20),
    "Modification_Date" timestamp without time zone,
    "Modified_By" character varying(20),
    "Well_Type" character varying(20),
    "Unconventional" character varying(4),
    "Region" character varying(50)
);


ALTER TABLE public."PA_Spud" OWNER TO scraper;

--
-- Name: pa_spud_copy_st_id_seq; Type: SEQUENCE; Schema: public; Owner: scraper
--

CREATE SEQUENCE pa_spud_copy_st_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.pa_spud_copy_st_id_seq OWNER TO scraper;

--
-- Name: PA_Spud_copy; Type: TABLE; Schema: public; Owner: scraper; Tablespace: 
--

CREATE TABLE "PA_Spud_copy" (
    st_id integer DEFAULT nextval('pa_spud_copy_st_id_seq'::regclass) NOT NULL,
    ft_id integer,
    "Well_API__" character varying(20) NOT NULL,
    "OGO__" character varying(20) NOT NULL,
    "SPUD_Date" date NOT NULL,
    "County" character varying(20),
    "Municipality" character varying(20),
    "Operator_s_Name" character varying(100),
    "Farm_Name" character varying(50),
    "Well_Number" character varying(20),
    "Latitude" double precision,
    "Longitude" double precision,
    "Marcellus_Ind_" character varying(4),
    "Horizontal_Ind_" character varying(4),
    "Creation_Date" timestamp without time zone,
    "Created_By" character varying(20),
    "Modification_Date" timestamp without time zone,
    "Modified_By" character varying(20),
    "Well_Type" character varying(20),
    "Unconventional" character varying(4),
    "Region" character varying(50)
);


ALTER TABLE public."PA_Spud_copy" OWNER TO scraper;

--
-- Name: pa_spud_new_st_id_seq; Type: SEQUENCE; Schema: public; Owner: scraper
--

CREATE SEQUENCE pa_spud_new_st_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.pa_spud_new_st_id_seq OWNER TO scraper;

--
-- Name: PA_Spud_new; Type: TABLE; Schema: public; Owner: scraper; Tablespace: 
--

CREATE TABLE "PA_Spud_new" (
    st_id integer DEFAULT nextval('pa_spud_new_st_id_seq'::regclass) NOT NULL,
    ft_id integer,
    "Well_API__" character varying(20) NOT NULL,
    "OGO__" character varying(20) NOT NULL,
    "SPUD_Date" date NOT NULL,
    "County" character varying(20),
    "Municipality" character varying(20),
    "Operator_s_Name" character varying(100),
    "Farm_Name" character varying(50),
    "Well_Number" character varying(20),
    "Latitude" double precision,
    "Longitude" double precision,
    "Marcellus_Ind_" character varying(4),
    "Horizontal_Ind_" character varying(4),
    "Creation_Date" timestamp without time zone,
    "Created_By" character varying(20),
    "Modification_Date" timestamp without time zone,
    "Modified_By" character varying(20),
    "Well_Type" character varying(20),
    "Unconventional" character varying(4),
    "Region" character varying(50)
);


ALTER TABLE public."PA_Spud_new" OWNER TO scraper;

--
-- Name: pa_violation_st_id_seq; Type: SEQUENCE; Schema: public; Owner: scraper
--

CREATE SEQUENCE pa_violation_st_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.pa_violation_st_id_seq OWNER TO scraper;

--
-- Name: PA_Violation; Type: TABLE; Schema: public; Owner: scraper; Tablespace: 
--

CREATE TABLE "PA_Violation" (
    st_id integer DEFAULT nextval('pa_violation_st_id_seq'::regclass) NOT NULL,
    ft_id integer,
    "InspectionID" integer NOT NULL,
    "ViolationID" integer NOT NULL,
    "EnforcementID" integer,
    "Operator" character varying(100),
    "Region" character varying(50),
    "InspectionDate" date,
    "InspectionType" character varying(50),
    "Permit_API" character varying(20),
    "IsMarcellus" character varying(8),
    "InspectionCategory" character varying(50),
    "County" character varying(20),
    "Municipality" character varying(20),
    "InspectionResult" character varying(255),
    "InspectionComment" text,
    "ViolationDate" date,
    "ViolationCode" character varying(255),
    "ViolationType" character varying(100),
    "ViolationComment" character varying(255),
    "ResolvedDate" date,
    "EnforcementCode" character varying(100),
    "PenaltyFinalStatus" character varying(100),
    "PenaltyDateFinal" date,
    "EnforcementDateFinal" date,
    "PenaltyAmount" double precision,
    "TotalAmountCollected" double precision,
    "Unconventional" character varying(4)
);


ALTER TABLE public."PA_Violation" OWNER TO scraper;

--
-- Name: publishedfeeditems_id_seq; Type: SEQUENCE; Schema: public; Owner: scraper
--

CREATE SEQUENCE publishedfeeditems_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.publishedfeeditems_id_seq OWNER TO scraper;

--
-- Name: PublishedFeedItems; Type: TABLE; Schema: public; Owner: scraper; Tablespace: 
--

CREATE TABLE "PublishedFeedItems" (
    id integer DEFAULT nextval('publishedfeeditems_id_seq'::regclass) NOT NULL,
    task_id integer NOT NULL,
    feed_item_id character(36) NOT NULL,
    published timestamp without time zone DEFAULT now() NOT NULL
);


ALTER TABLE public."PublishedFeedItems" OWNER TO scraper;

--
-- Name: RSSEmailSubscription; Type: TABLE; Schema: public; Owner: scraper; Tablespace: 
--

CREATE TABLE "RSSEmailSubscription" (
    id character(36) NOT NULL,
    confirmed smallint DEFAULT 0 NOT NULL,
    email character varying(255) NOT NULL,
    rss_url character varying(255) NOT NULL,
    interval_hours integer DEFAULT 23 NOT NULL,
    last_email_sent timestamp without time zone,
    last_item_updated timestamp without time zone,
    lat1 double precision,
    lat2 double precision,
    lng1 double precision,
    lng2 double precision,
    last_update_sent timestamp without time zone,
    active smallint DEFAULT 1 NOT NULL,
    name character varying(30),
    st_id integer NOT NULL,
    ft_id integer
);


ALTER TABLE public."RSSEmailSubscription" OWNER TO scraper;

--
-- Name: RSSEmailSubscription_backup; Type: TABLE; Schema: public; Owner: scraper; Tablespace: 
--

CREATE TABLE "RSSEmailSubscription_backup" (
    id character(36) NOT NULL,
    confirmed smallint DEFAULT 0 NOT NULL,
    email character varying(255) NOT NULL,
    rss_url character varying(255) NOT NULL,
    interval_hours integer DEFAULT 23 NOT NULL,
    last_email_sent timestamp without time zone,
    last_item_updated timestamp without time zone,
    lat1 double precision,
    lat2 double precision,
    lng1 double precision,
    lng2 double precision,
    last_update_sent timestamp without time zone,
    active smallint DEFAULT 1 NOT NULL,
    name character varying(30)
);


ALTER TABLE public."RSSEmailSubscription_backup" OWNER TO scraper;

--
-- Name: RSSEmailSubscription_st_id_seq; Type: SEQUENCE; Schema: public; Owner: scraper
--

CREATE SEQUENCE "RSSEmailSubscription_st_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."RSSEmailSubscription_st_id_seq" OWNER TO scraper;

--
-- Name: RSSEmailSubscription_st_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: scraper
--

ALTER SEQUENCE "RSSEmailSubscription_st_id_seq" OWNED BY "RSSEmailSubscription".st_id;


--
-- Name: rssfeed_id_seq; Type: SEQUENCE; Schema: public; Owner: scraper
--

CREATE SEQUENCE rssfeed_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.rssfeed_id_seq OWNER TO scraper;

--
-- Name: RssFeed; Type: TABLE; Schema: public; Owner: scraper; Tablespace: 
--

CREATE TABLE "RssFeed" (
    id integer DEFAULT nextval('rssfeed_id_seq'::regclass) NOT NULL,
    url character varying(255) NOT NULL,
    last_read timestamp without time zone NOT NULL,
    update_interval_secs integer DEFAULT 0 NOT NULL,
    tag character varying(32),
    name character varying(32),
    source_id integer DEFAULT 0 NOT NULL
);


ALTER TABLE public."RssFeed" OWNER TO scraper;

--
-- Name: RssFeedItem; Type: TABLE; Schema: public; Owner: scraper; Tablespace: 
--

CREATE TABLE "RssFeedItem" (
    item_id character varying(255) NOT NULL,
    content bytea,
    feed_id integer NOT NULL
);


ALTER TABLE public."RssFeedItem" OWNER TO scraper;

--
-- Name: TEMP_PGIDS; Type: TABLE; Schema: public; Owner: scraper; Tablespace: 
--

CREATE TABLE "TEMP_PGIDS" (
    id character varying(36)
);


ALTER TABLE public."TEMP_PGIDS" OWNER TO scraper;

--
-- Name: TEST; Type: VIEW; Schema: public; Owner: scraper
--

CREATE VIEW "TEST" AS
    SELECT "RssFeed".id, "RssFeed".url, "RssFeed".last_read, "RssFeed".update_interval_secs, "RssFeed".tag, "RssFeed".name, "RssFeed".source_id FROM "RssFeed";


ALTER TABLE public."TEST" OWNER TO scraper;

--
-- Name: TEST2; Type: VIEW; Schema: public; Owner: scraper
--

CREATE VIEW "TEST2" AS
    SELECT r.reportnum, r.calltype, r.recieved_datetime, r.description, r.incident_datetime, r.incidenttype, r.cause, r.location, r.state, r.nearestcity, r.county, r.suspected_responsible_company, r.medium_affected, r.material_name, r.full_report_url, r.materials_url, a.sheen_length, a.sheen_width, a.reported_spill_volume, a.min_spill_volume, a.severity, a.region, a.release_type, p.areaid, p.blockid, p.platform_letter, p.zip, p.affected_area, g.source AS geocode_source, g.lat, g.lng FROM ((("NrcScrapedReport" r JOIN "NrcAnalysis" a ON ((r.reportnum = a.reportnum))) JOIN "NrcParsedReport" p ON ((r.reportnum = p.reportnum))) LEFT JOIN "NrcGeocode" g ON ((r.reportnum = g.reportnum))) WHERE ((((a.calltype)::text = 'INCIDENT'::text) AND ((r.incidenttype)::text <> 'RAILROAD NON-RELEASE'::text)) AND ((r.medium_affected)::text <> ALL (ARRAY[('NON-RELEASE (N/A)'::character varying)::text, ('RAIL REPORT (N/A)'::character varying)::text])));


ALTER TABLE public."TEST2" OWNER TO scraper;

--
-- Name: wv_drillingpermit_st_id_seq; Type: SEQUENCE; Schema: public; Owner: scraper
--

CREATE SEQUENCE wv_drillingpermit_st_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.wv_drillingpermit_st_id_seq OWNER TO scraper;

--
-- Name: WV_DrillingPermit; Type: TABLE; Schema: public; Owner: scraper; Tablespace: 
--

CREATE TABLE "WV_DrillingPermit" (
    st_id integer DEFAULT nextval('wv_drillingpermit_st_id_seq'::regclass) NOT NULL,
    ft_id integer,
    "API" character varying(12) NOT NULL,
    permit_number integer,
    permit_type character varying(20),
    current_operator character varying(100),
    farm_name character varying(100),
    well_number character varying(50),
    permit_activity_type character varying(50),
    permit_activity_date date,
    utm_north double precision,
    utm_east double precision,
    datum integer,
    county character varying(20)
);


ALTER TABLE public."WV_DrillingPermit" OWNER TO scraper;

--
-- Name: ais; Type: TABLE; Schema: public; Owner: scraper; Tablespace: 
--

CREATE TABLE ais (
    seqid integer NOT NULL,
    datetime timestamp without time zone NOT NULL,
    mmsi character(20) NOT NULL,
    latitude double precision NOT NULL,
    longitude double precision NOT NULL,
    true_heading double precision,
    sog double precision,
    cog double precision,
    location geometry NOT NULL
);


ALTER TABLE public.ais OWNER TO scraper;

--
-- Name: ais_seqid_seq; Type: SEQUENCE; Schema: public; Owner: scraper
--

CREATE SEQUENCE ais_seqid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ais_seqid_seq OWNER TO scraper;

--
-- Name: ais_seqid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: scraper
--

ALTER SEQUENCE ais_seqid_seq OWNED BY ais.seqid;


--
-- Name: appomatic_mapdata_ais; Type: TABLE; Schema: public; Owner: scraper; Tablespace: 
--

CREATE TABLE appomatic_mapdata_ais (
    id integer NOT NULL,
    src character varying(128) NOT NULL,
    mmsi character varying(16) NOT NULL,
    datetime timestamp with time zone NOT NULL,
    latitude double precision NOT NULL,
    longitude double precision NOT NULL,
    true_heading double precision,
    sog double precision,
    cog double precision,
    location geometry NOT NULL,
    vessel_id integer,
    srcfile character varying(1024),
    quality double precision DEFAULT 1.0 NOT NULL
);


ALTER TABLE public.appomatic_mapdata_ais OWNER TO scraper;

--
-- Name: appomatic_mapdata_ais_id_seq; Type: SEQUENCE; Schema: public; Owner: scraper
--

CREATE SEQUENCE appomatic_mapdata_ais_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.appomatic_mapdata_ais_id_seq OWNER TO scraper;

--
-- Name: appomatic_mapdata_ais_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: scraper
--

ALTER SEQUENCE appomatic_mapdata_ais_id_seq OWNED BY appomatic_mapdata_ais.id;


--
-- Name: appomatic_mapdata_aispath; Type: TABLE; Schema: public; Owner: scraper; Tablespace: 
--

CREATE TABLE appomatic_mapdata_aispath (
    id integer NOT NULL,
    src character varying(128) NOT NULL,
    mmsi character varying(16) NOT NULL,
    timemin timestamp with time zone NOT NULL,
    timemax timestamp with time zone NOT NULL,
    tolerance double precision,
    line geometry NOT NULL,
    vessel_id integer,
    srcfile character varying(1024)
);


ALTER TABLE public.appomatic_mapdata_aispath OWNER TO scraper;

--
-- Name: appomatic_mapdata_aispath_id_seq; Type: SEQUENCE; Schema: public; Owner: scraper
--

CREATE SEQUENCE appomatic_mapdata_aispath_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.appomatic_mapdata_aispath_id_seq OWNER TO scraper;

--
-- Name: appomatic_mapdata_aispath_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: scraper
--

ALTER SEQUENCE appomatic_mapdata_aispath_id_seq OWNED BY appomatic_mapdata_aispath.id;


--
-- Name: appomatic_mapdata_vessel; Type: TABLE; Schema: public; Owner: scraper; Tablespace: 
--

CREATE TABLE appomatic_mapdata_vessel (
    id integer NOT NULL,
    mmsi character varying(16) NOT NULL,
    name character varying(128),
    type character varying(64),
    length integer,
    src character varying(128) DEFAULT ''::character varying NOT NULL,
    srcfile character varying(1024)
);


ALTER TABLE public.appomatic_mapdata_vessel OWNER TO scraper;

--
-- Name: appomatic_mapdata_vessel_id_seq; Type: SEQUENCE; Schema: public; Owner: scraper
--

CREATE SEQUENCE appomatic_mapdata_vessel_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.appomatic_mapdata_vessel_id_seq OWNER TO scraper;

--
-- Name: appomatic_mapdata_vessel_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: scraper
--

ALTER SEQUENCE appomatic_mapdata_vessel_id_seq OWNED BY appomatic_mapdata_vessel.id;


--
-- Name: appomatic_mapimport_downloaded; Type: TABLE; Schema: public; Owner: scraper; Tablespace: 
--

CREATE TABLE appomatic_mapimport_downloaded (
    id integer NOT NULL,
    src character varying(128) NOT NULL,
    filename character varying(1024) NOT NULL,
    datetime timestamp with time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.appomatic_mapimport_downloaded OWNER TO scraper;

--
-- Name: appomatic_mapimport_downloaded_id_seq; Type: SEQUENCE; Schema: public; Owner: scraper
--

CREATE SEQUENCE appomatic_mapimport_downloaded_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.appomatic_mapimport_downloaded_id_seq OWNER TO scraper;

--
-- Name: appomatic_mapimport_downloaded_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: scraper
--

ALTER SEQUENCE appomatic_mapimport_downloaded_id_seq OWNED BY appomatic_mapimport_downloaded.id;


--
-- Name: appomatic_nrccluster_cluster; Type: TABLE; Schema: public; Owner: scraper; Tablespace: 
--

CREATE TABLE appomatic_nrccluster_cluster (
    id integer NOT NULL,
    reportnum integer NOT NULL,
    incident_datetime timestamp with time zone NOT NULL,
    incidenttype character varying(20) NOT NULL,
    location geometry NOT NULL,
    buffer geometry,
    score double precision,
    max_score double precision
);


ALTER TABLE public.appomatic_nrccluster_cluster OWNER TO scraper;

--
-- Name: appomatic_nrccluster_cluster_id_seq; Type: SEQUENCE; Schema: public; Owner: scraper
--

CREATE SEQUENCE appomatic_nrccluster_cluster_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.appomatic_nrccluster_cluster_id_seq OWNER TO scraper;

--
-- Name: appomatic_nrccluster_cluster_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: scraper
--

ALTER SEQUENCE appomatic_nrccluster_cluster_id_seq OWNED BY appomatic_nrccluster_cluster.id;


--
-- Name: appomatic_nrccluster_nrcreport; Type: TABLE; Schema: public; Owner: scraper; Tablespace: 
--

CREATE TABLE appomatic_nrccluster_nrcreport (
    id integer NOT NULL,
    reportnum integer NOT NULL,
    incident_datetime timestamp with time zone NOT NULL,
    incidenttype character varying(20) NOT NULL,
    lat double precision NOT NULL,
    lng double precision NOT NULL,
    location geometry NOT NULL,
    geocode_source character varying(20) NOT NULL
);


ALTER TABLE public.appomatic_nrccluster_nrcreport OWNER TO scraper;

--
-- Name: appomatic_nrccluster_nrcreport_id_seq; Type: SEQUENCE; Schema: public; Owner: scraper
--

CREATE SEQUENCE appomatic_nrccluster_nrcreport_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.appomatic_nrccluster_nrcreport_id_seq OWNER TO scraper;

--
-- Name: appomatic_nrccluster_nrcreport_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: scraper
--

ALTER SEQUENCE appomatic_nrccluster_nrcreport_id_seq OWNED BY appomatic_nrccluster_nrcreport.id;


--
-- Name: auth_group; Type: TABLE; Schema: public; Owner: scraper; Tablespace: 
--

CREATE TABLE auth_group (
    id integer NOT NULL,
    name character varying(80) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO scraper;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: scraper
--

CREATE SEQUENCE auth_group_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_id_seq OWNER TO scraper;

--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: scraper
--

ALTER SEQUENCE auth_group_id_seq OWNED BY auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: scraper; Tablespace: 
--

CREATE TABLE auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO scraper;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: scraper
--

CREATE SEQUENCE auth_group_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_permissions_id_seq OWNER TO scraper;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: scraper
--

ALTER SEQUENCE auth_group_permissions_id_seq OWNED BY auth_group_permissions.id;


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: scraper; Tablespace: 
--

CREATE TABLE auth_permission (
    id integer NOT NULL,
    name character varying(50) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE public.auth_permission OWNER TO scraper;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: scraper
--

CREATE SEQUENCE auth_permission_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_permission_id_seq OWNER TO scraper;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: scraper
--

ALTER SEQUENCE auth_permission_id_seq OWNED BY auth_permission.id;


--
-- Name: auth_user; Type: TABLE; Schema: public; Owner: scraper; Tablespace: 
--

CREATE TABLE auth_user (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone NOT NULL,
    is_superuser boolean NOT NULL,
    username character varying(30) NOT NULL,
    first_name character varying(30) NOT NULL,
    last_name character varying(30) NOT NULL,
    email character varying(75) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL
);


ALTER TABLE public.auth_user OWNER TO scraper;

--
-- Name: auth_user_groups; Type: TABLE; Schema: public; Owner: scraper; Tablespace: 
--

CREATE TABLE auth_user_groups (
    id integer NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.auth_user_groups OWNER TO scraper;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: scraper
--

CREATE SEQUENCE auth_user_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_groups_id_seq OWNER TO scraper;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: scraper
--

ALTER SEQUENCE auth_user_groups_id_seq OWNED BY auth_user_groups.id;


--
-- Name: auth_user_id_seq; Type: SEQUENCE; Schema: public; Owner: scraper
--

CREATE SEQUENCE auth_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_id_seq OWNER TO scraper;

--
-- Name: auth_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: scraper
--

ALTER SEQUENCE auth_user_id_seq OWNED BY auth_user.id;


--
-- Name: auth_user_user_permissions; Type: TABLE; Schema: public; Owner: scraper; Tablespace: 
--

CREATE TABLE auth_user_user_permissions (
    id integer NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_user_user_permissions OWNER TO scraper;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: scraper
--

CREATE SEQUENCE auth_user_user_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_user_permissions_id_seq OWNER TO scraper;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: scraper
--

ALTER SEQUENCE auth_user_user_permissions_id_seq OWNED BY auth_user_user_permissions.id;


--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: scraper; Tablespace: 
--

CREATE TABLE django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    user_id integer NOT NULL,
    content_type_id integer,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);


ALTER TABLE public.django_admin_log OWNER TO scraper;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: scraper
--

CREATE SEQUENCE django_admin_log_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_admin_log_id_seq OWNER TO scraper;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: scraper
--

ALTER SEQUENCE django_admin_log_id_seq OWNED BY django_admin_log.id;


--
-- Name: django_comment_flags; Type: TABLE; Schema: public; Owner: scraper; Tablespace: 
--

CREATE TABLE django_comment_flags (
    id integer NOT NULL,
    user_id integer NOT NULL,
    comment_id integer NOT NULL,
    flag character varying(30) NOT NULL,
    flag_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_comment_flags OWNER TO scraper;

--
-- Name: django_comment_flags_id_seq; Type: SEQUENCE; Schema: public; Owner: scraper
--

CREATE SEQUENCE django_comment_flags_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_comment_flags_id_seq OWNER TO scraper;

--
-- Name: django_comment_flags_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: scraper
--

ALTER SEQUENCE django_comment_flags_id_seq OWNED BY django_comment_flags.id;


--
-- Name: django_comments; Type: TABLE; Schema: public; Owner: scraper; Tablespace: 
--

CREATE TABLE django_comments (
    id integer NOT NULL,
    content_type_id integer NOT NULL,
    object_pk text NOT NULL,
    site_id integer NOT NULL,
    user_id integer,
    user_name character varying(50) NOT NULL,
    user_email character varying(75) NOT NULL,
    user_url character varying(200) NOT NULL,
    comment text NOT NULL,
    submit_date timestamp with time zone NOT NULL,
    ip_address inet,
    is_public boolean NOT NULL,
    is_removed boolean NOT NULL
);


ALTER TABLE public.django_comments OWNER TO scraper;

--
-- Name: django_comments_id_seq; Type: SEQUENCE; Schema: public; Owner: scraper
--

CREATE SEQUENCE django_comments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_comments_id_seq OWNER TO scraper;

--
-- Name: django_comments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: scraper
--

ALTER SEQUENCE django_comments_id_seq OWNED BY django_comments.id;


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: scraper; Tablespace: 
--

CREATE TABLE django_content_type (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO scraper;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: scraper
--

CREATE SEQUENCE django_content_type_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_content_type_id_seq OWNER TO scraper;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: scraper
--

ALTER SEQUENCE django_content_type_id_seq OWNED BY django_content_type.id;


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: scraper; Tablespace: 
--

CREATE TABLE django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO scraper;

--
-- Name: django_site; Type: TABLE; Schema: public; Owner: scraper; Tablespace: 
--

CREATE TABLE django_site (
    id integer NOT NULL,
    domain character varying(100) NOT NULL,
    name character varying(50) NOT NULL
);


ALTER TABLE public.django_site OWNER TO scraper;

--
-- Name: django_site_id_seq; Type: SEQUENCE; Schema: public; Owner: scraper
--

CREATE SEQUENCE django_site_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_site_id_seq OWNER TO scraper;

--
-- Name: django_site_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: scraper
--

ALTER SEQUENCE django_site_id_seq OWNED BY django_site.id;


--
-- Name: feedentry_ewn2; Type: TABLE; Schema: public; Owner: scraper; Tablespace: 
--

CREATE TABLE feedentry_ewn2 (
    id character(36) NOT NULL,
    title character varying(255) NOT NULL,
    link character varying(255),
    summary text,
    content text,
    lat double precision NOT NULL,
    lng double precision NOT NULL,
    source_id integer NOT NULL,
    kml_url character varying(255),
    incident_datetime timestamp without time zone NOT NULL,
    published timestamp without time zone,
    regions integer[],
    tags character varying(64)[],
    the_geom geometry,
    source_item_id integer
);


ALTER TABLE public.feedentry_ewn2 OWNER TO scraper;

--
-- Name: geography_columns; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW geography_columns AS
    SELECT current_database() AS f_table_catalog, n.nspname AS f_table_schema, c.relname AS f_table_name, a.attname AS f_geography_column, postgis_typmod_dims(a.atttypmod) AS coord_dimension, postgis_typmod_srid(a.atttypmod) AS srid, postgis_typmod_type(a.atttypmod) AS type FROM pg_class c, pg_attribute a, pg_type t, pg_namespace n WHERE ((((((t.typname = 'geography'::name) AND (a.attisdropped = false)) AND (a.atttypid = t.oid)) AND (a.attrelid = c.oid)) AND (c.relnamespace = n.oid)) AND (NOT pg_is_other_temp_schema(c.relnamespace)));


ALTER TABLE public.geography_columns OWNER TO postgres;

--
-- Name: geometry_columns; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW geometry_columns AS
    SELECT (current_database())::character varying(256) AS f_table_catalog, (n.nspname)::character varying(256) AS f_table_schema, (c.relname)::character varying(256) AS f_table_name, (a.attname)::character varying(256) AS f_geometry_column, COALESCE(NULLIF(postgis_typmod_dims(a.atttypmod), 2), postgis_constraint_dims((n.nspname)::text, (c.relname)::text, (a.attname)::text), 2) AS coord_dimension, COALESCE(NULLIF(postgis_typmod_srid(a.atttypmod), 0), postgis_constraint_srid((n.nspname)::text, (c.relname)::text, (a.attname)::text), 0) AS srid, (replace(replace(COALESCE(NULLIF(upper(postgis_typmod_type(a.atttypmod)), 'GEOMETRY'::text), (postgis_constraint_type((n.nspname)::text, (c.relname)::text, (a.attname)::text))::text, 'GEOMETRY'::text), 'ZM'::text, ''::text), 'Z'::text, ''::text))::character varying(30) AS type FROM pg_class c, pg_attribute a, pg_type t, pg_namespace n WHERE ((((((((t.typname = 'geometry'::name) AND (a.attisdropped = false)) AND (a.atttypid = t.oid)) AND (a.attrelid = c.oid)) AND (c.relnamespace = n.oid)) AND ((c.relkind = 'r'::"char") OR (c.relkind = 'v'::"char"))) AND (NOT pg_is_other_temp_schema(c.relnamespace))) AND (NOT ((n.nspname = 'public'::name) AND (c.relname = 'raster_columns'::name))));


ALTER TABLE public.geometry_columns OWNER TO postgres;

--
-- Name: nightfire_file_id_seq; Type: SEQUENCE; Schema: public; Owner: scraper
--

CREATE SEQUENCE nightfire_file_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.nightfire_file_id_seq OWNER TO scraper;

--
-- Name: raster_columns; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW raster_columns AS
    SELECT current_database() AS r_table_catalog, n.nspname AS r_table_schema, c.relname AS r_table_name, a.attname AS r_raster_column, COALESCE(_raster_constraint_info_srid(n.nspname, c.relname, a.attname), (SELECT st_srid('010100000000000000000000000000000000000000'::geometry) AS st_srid)) AS srid, _raster_constraint_info_scale(n.nspname, c.relname, a.attname, 'x'::bpchar) AS scale_x, _raster_constraint_info_scale(n.nspname, c.relname, a.attname, 'y'::bpchar) AS scale_y, _raster_constraint_info_blocksize(n.nspname, c.relname, a.attname, 'width'::text) AS blocksize_x, _raster_constraint_info_blocksize(n.nspname, c.relname, a.attname, 'height'::text) AS blocksize_y, COALESCE(_raster_constraint_info_alignment(n.nspname, c.relname, a.attname), false) AS same_alignment, COALESCE(_raster_constraint_info_regular_blocking(n.nspname, c.relname, a.attname), false) AS regular_blocking, _raster_constraint_info_num_bands(n.nspname, c.relname, a.attname) AS num_bands, _raster_constraint_info_pixel_types(n.nspname, c.relname, a.attname) AS pixel_types, _raster_constraint_info_nodata_values(n.nspname, c.relname, a.attname) AS nodata_values, _raster_constraint_info_out_db(n.nspname, c.relname, a.attname) AS out_db, _raster_constraint_info_extent(n.nspname, c.relname, a.attname) AS extent FROM pg_class c, pg_attribute a, pg_type t, pg_namespace n WHERE (((((((t.typname = 'raster'::name) AND (a.attisdropped = false)) AND (a.atttypid = t.oid)) AND (a.attrelid = c.oid)) AND (c.relnamespace = n.oid)) AND ((c.relkind = 'r'::"char") OR (c.relkind = 'v'::"char"))) AND (NOT pg_is_other_temp_schema(c.relnamespace)));


ALTER TABLE public.raster_columns OWNER TO postgres;

--
-- Name: raster_overviews; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW raster_overviews AS
    SELECT current_database() AS o_table_catalog, n.nspname AS o_table_schema, c.relname AS o_table_name, a.attname AS o_raster_column, current_database() AS r_table_catalog, (split_part(split_part(s.consrc, '''::name'::text, 1), ''''::text, 2))::name AS r_table_schema, (split_part(split_part(s.consrc, '''::name'::text, 2), ''''::text, 2))::name AS r_table_name, (split_part(split_part(s.consrc, '''::name'::text, 3), ''''::text, 2))::name AS r_raster_column, (btrim(split_part(s.consrc, ','::text, 2)))::integer AS overview_factor FROM pg_class c, pg_attribute a, pg_type t, pg_namespace n, pg_constraint s WHERE ((((((((((t.typname = 'raster'::name) AND (a.attisdropped = false)) AND (a.atttypid = t.oid)) AND (a.attrelid = c.oid)) AND (c.relnamespace = n.oid)) AND ((c.relkind = 'r'::"char") OR (c.relkind = 'v'::"char"))) AND (s.connamespace = n.oid)) AND (s.conrelid = c.oid)) AND (s.consrc ~~ '%_overview_constraint(%'::text)) AND (NOT pg_is_other_temp_schema(c.relnamespace)));


ALTER TABLE public.raster_overviews OWNER TO postgres;

--
-- Name: spatial_ref_sys; Type: TABLE; Schema: public; Owner: scraper; Tablespace: 
--

CREATE TABLE spatial_ref_sys (
    srid integer NOT NULL,
    auth_name character varying(256),
    auth_srid integer,
    srtext character varying(2048),
    proj4text character varying(2048),
    CONSTRAINT spatial_ref_sys_srid_check CHECK (((srid > 0) AND (srid <= 998999)))
);


ALTER TABLE public.spatial_ref_sys OWNER TO scraper;

--
-- Name: temp_FSU_SAR_FOOTPRINTS; Type: TABLE; Schema: public; Owner: scraper; Tablespace: 
--

CREATE TABLE "temp_FSU_SAR_FOOTPRINTS" (
    "GranuleName" character varying(32) NOT NULL,
    "ImageDate" timestamp without time zone NOT NULL,
    "Lat1" double precision NOT NULL,
    "Lat2" double precision NOT NULL,
    "Lng1" double precision NOT NULL,
    "Lng2" double precision NOT NULL,
    "ImageDate1" timestamp without time zone NOT NULL,
    "ImageDate2" timestamp without time zone NOT NULL
);


ALTER TABLE public."temp_FSU_SAR_FOOTPRINTS" OWNER TO scraper;

--
-- Name: temp_material_id_seq; Type: SEQUENCE; Schema: public; Owner: scraper
--

CREATE SEQUENCE temp_material_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.temp_material_id_seq OWNER TO scraper;

--
-- Name: temp_material; Type: TABLE; Schema: public; Owner: scraper; Tablespace: 
--

CREATE TABLE temp_material (
    id integer DEFAULT nextval('temp_material_id_seq'::regclass) NOT NULL,
    reportnum integer NOT NULL,
    name character varying(32) NOT NULL
);


ALTER TABLE public.temp_material OWNER TO scraper;

--
-- Name: temp_nrc_in_sar; Type: TABLE; Schema: public; Owner: scraper; Tablespace: 
--

CREATE TABLE temp_nrc_in_sar (
    reportnum integer,
    lat double precision,
    lng double precision,
    "granuleName" character varying(20)
);


ALTER TABLE public.temp_nrc_in_sar OWNER TO scraper;

SET search_path = scraper, pg_catalog;

--
-- Name: Alegheny_Forest_PA; Type: TABLE; Schema: scraper; Owner: scraper; Tablespace: 
--

CREATE TABLE "Alegheny_Forest_PA" (
    gid integer NOT NULL,
    "FID" double precision,
    the_geom public.geometry,
    CONSTRAINT enforce_dims_the_geom CHECK ((public.st_ndims(the_geom) = 2)),
    CONSTRAINT enforce_geotype_the_geom CHECK (((public.geometrytype(the_geom) = 'POLYGON'::text) OR (the_geom IS NULL))),
    CONSTRAINT enforce_srid_the_geom CHECK ((public.st_srid(the_geom) = 26917))
);


ALTER TABLE scraper."Alegheny_Forest_PA" OWNER TO scraper;

--
-- Name: Alegheny_Forest_PA_gid_seq; Type: SEQUENCE; Schema: scraper; Owner: scraper
--

CREATE SEQUENCE "Alegheny_Forest_PA_gid_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE scraper."Alegheny_Forest_PA_gid_seq" OWNER TO scraper;

--
-- Name: Alegheny_Forest_PA_gid_seq; Type: SEQUENCE OWNED BY; Schema: scraper; Owner: scraper
--

ALTER SEQUENCE "Alegheny_Forest_PA_gid_seq" OWNED BY "Alegheny_Forest_PA".gid;


--
-- Name: EXPORT_FracFocusChemical; Type: VIEW; Schema: scraper; Owner: scraper
--

CREATE VIEW "EXPORT_FracFocusChemical" AS
    SELECT "FracFocusReportChemical".seqid AS c_seqid, "FracFocusReportChemical".pdf_seqid, "FracFocusReportChemical".api, "FracFocusReportChemical".fracture_date, "FracFocusReportChemical"."row", COALESCE("FracFocusReportChemical".trade_name, ''::character varying) AS trade_name, COALESCE("FracFocusReportChemical".supplier, ''::character varying) AS supplier, COALESCE("FracFocusReportChemical".purpose, ''::character varying) AS purpose, COALESCE("FracFocusReportChemical".ingredients, ''::character varying) AS ingredients, COALESCE("FracFocusReportChemical".cas_number, ''::character varying) AS cas_number, COALESCE("FracFocusReportChemical".additive_concentration, NULL::double precision) AS additive_concentration, COALESCE("FracFocusReportChemical".hf_fluid_concentration, NULL::double precision) AS hf_fluid_concentration, COALESCE("FracFocusReportChemical".comments, ''::character varying) AS comments, COALESCE("FracFocusReportChemical".cas_type, ''::character varying) AS cas_type FROM (public."FracFocusReportChemical" JOIN public."FracFocusReport" ON (("FracFocusReportChemical".pdf_seqid = "FracFocusReport".pdf_seqid))) WHERE ("FracFocusReport".published < date_trunc('month'::text, now())) ORDER BY "FracFocusReportChemical".seqid;


ALTER TABLE scraper."EXPORT_FracFocusChemical" OWNER TO scraper;

--
-- Name: EXPORT_FracFocusCombined; Type: VIEW; Schema: scraper; Owner: scraper
--

CREATE VIEW "EXPORT_FracFocusCombined" AS
    SELECT r.seqid AS r_seqid, r.pdf_seqid, r.api, r.fracture_date, COALESCE(r.state, ''::character varying) AS state, COALESCE(r.county, ''::character varying) AS county, COALESCE(r.operator, ''::character varying) AS operator, COALESCE(r.well_name, ''::character varying) AS well_name, COALESCE(r.production_type, ''::character varying) AS production_type, COALESCE(r.latitude, NULL::double precision) AS latitude, COALESCE(r.longitude, NULL::double precision) AS longitude, COALESCE(r.datum, ''::character varying) AS datum, COALESCE(r.true_vertical_depth, NULL::double precision) AS true_vertical_depth, COALESCE(r.total_water_volume, NULL::double precision) AS total_water_volume, COALESCE(r.published, NULL::timestamp without time zone) AS published, c.seqid AS c_seqid, c."row", COALESCE(c.trade_name, ''::character varying) AS trade_name, COALESCE(c.supplier, ''::character varying) AS supplier, COALESCE(c.purpose, ''::character varying) AS purpose, COALESCE(c.ingredients, ''::character varying) AS ingredients, COALESCE(c.cas_number, ''::character varying) AS cas_number, COALESCE(c.additive_concentration, NULL::double precision) AS additive_concentration, COALESCE(c.hf_fluid_concentration, NULL::double precision) AS hf_fluid_concentration, COALESCE(c.comments, ''::character varying) AS comments, COALESCE(c.cas_type, ''::character varying) AS cas_type FROM (public."FracFocusReport" r JOIN public."FracFocusReportChemical" c ON ((r.pdf_seqid = c.pdf_seqid))) WHERE (r.published < date_trunc('month'::text, now())) ORDER BY r.pdf_seqid, c."row";


ALTER TABLE scraper."EXPORT_FracFocusCombined" OWNER TO scraper;

--
-- Name: EXPORT_FracFocusReport; Type: VIEW; Schema: scraper; Owner: scraper
--

CREATE VIEW "EXPORT_FracFocusReport" AS
    SELECT "FracFocusReport".seqid AS r_seqid, "FracFocusReport".pdf_seqid, "FracFocusReport".api, "FracFocusReport".fracture_date, COALESCE("FracFocusReport".state, ''::character varying) AS state, COALESCE("FracFocusReport".county, ''::character varying) AS county, COALESCE("FracFocusReport".operator, ''::character varying) AS operator, COALESCE("FracFocusReport".well_name, ''::character varying) AS well_name, COALESCE("FracFocusReport".production_type, ''::character varying) AS production_type, COALESCE("FracFocusReport".latitude, NULL::double precision) AS latitude, COALESCE("FracFocusReport".longitude, NULL::double precision) AS longitude, COALESCE("FracFocusReport".datum, ''::character varying) AS datum, COALESCE("FracFocusReport".true_vertical_depth, NULL::double precision) AS true_vertical_depth, COALESCE("FracFocusReport".total_water_volume, NULL::double precision) AS total_water_volume, COALESCE("FracFocusReport".published, NULL::timestamp without time zone) AS published FROM public."FracFocusReport" WHERE ("FracFocusReport".published < date_trunc('month'::text, now())) ORDER BY "FracFocusReport".seqid;


ALTER TABLE scraper."EXPORT_FracFocusReport" OWNER TO scraper;

--
-- Name: GOMPolygon_drawn; Type: TABLE; Schema: scraper; Owner: scraper; Tablespace: 
--

CREATE TABLE "GOMPolygon_drawn" (
    gid integer NOT NULL,
    "ID" integer,
    the_geom public.geometry,
    CONSTRAINT enforce_dims_the_geom CHECK ((public.st_ndims(the_geom) = 2)),
    CONSTRAINT enforce_srid_the_geom CHECK ((public.st_srid(the_geom) = 4269))
);


ALTER TABLE scraper."GOMPolygon_drawn" OWNER TO scraper;

--
-- Name: GOMPolygon_drawn_gid_seq; Type: SEQUENCE; Schema: scraper; Owner: scraper
--

CREATE SEQUENCE "GOMPolygon_drawn_gid_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE scraper."GOMPolygon_drawn_gid_seq" OWNER TO scraper;

--
-- Name: GOMPolygon_drawn_gid_seq; Type: SEQUENCE OWNED BY; Schema: scraper; Owner: scraper
--

ALTER SEQUENCE "GOMPolygon_drawn_gid_seq" OWNED BY "GOMPolygon_drawn".gid;


--
-- Name: HUC10_Monongahela; Type: TABLE; Schema: scraper; Owner: scraper; Tablespace: 
--

CREATE TABLE "HUC10_Monongahela" (
    gid2 integer NOT NULL,
    gid integer,
    huc_8 character varying(255),
    huc_10 character varying(255),
    acres double precision,
    hu_10_name character varying(255),
    the_geom public.geometry,
    CONSTRAINT enforce_dims_the_geom CHECK ((public.st_ndims(the_geom) = 2)),
    CONSTRAINT enforce_geotype_the_geom CHECK (((public.geometrytype(the_geom) = 'POLYGON'::text) OR (the_geom IS NULL))),
    CONSTRAINT enforce_srid_the_geom CHECK ((public.st_srid(the_geom) = 4326))
);


ALTER TABLE scraper."HUC10_Monongahela" OWNER TO scraper;

--
-- Name: HUC10_Monongahela_gid2_seq; Type: SEQUENCE; Schema: scraper; Owner: scraper
--

CREATE SEQUENCE "HUC10_Monongahela_gid2_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE scraper."HUC10_Monongahela_gid2_seq" OWNER TO scraper;

--
-- Name: HUC10_Monongahela_gid2_seq; Type: SEQUENCE OWNED BY; Schema: scraper; Owner: scraper
--

ALTER SEQUENCE "HUC10_Monongahela_gid2_seq" OWNED BY "HUC10_Monongahela".gid2;


--
-- Name: Monongahela_HUC6_Watershed; Type: TABLE; Schema: scraper; Owner: scraper; Tablespace: 
--

CREATE TABLE "Monongahela_HUC6_Watershed" (
    gid2 integer NOT NULL,
    gid integer,
    "REGION" character varying(255),
    "SUBREGION" character varying(255),
    "BASIN" character varying(255),
    "HUC_2" character varying(255),
    "HUC_4" character varying(255),
    "HUC_6" character varying(255),
    the_geom public.geometry,
    CONSTRAINT enforce_dims_the_geom CHECK ((public.st_ndims(the_geom) = 2)),
    CONSTRAINT enforce_geotype_the_geom CHECK (((public.geometrytype(the_geom) = 'POLYGON'::text) OR (the_geom IS NULL))),
    CONSTRAINT enforce_srid_the_geom CHECK ((public.st_srid(the_geom) = 4326))
);


ALTER TABLE scraper."Monongahela_HUC6_Watershed" OWNER TO scraper;

--
-- Name: Monongahela_HUC6_Watershed_gid2_seq; Type: SEQUENCE; Schema: scraper; Owner: scraper
--

CREATE SEQUENCE "Monongahela_HUC6_Watershed_gid2_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE scraper."Monongahela_HUC6_Watershed_gid2_seq" OWNER TO scraper;

--
-- Name: Monongahela_HUC6_Watershed_gid2_seq; Type: SEQUENCE OWNED BY; Schema: scraper; Owner: scraper
--

ALTER SEQUENCE "Monongahela_HUC6_Watershed_gid2_seq" OWNED BY "Monongahela_HUC6_Watershed".gid2;


--
-- Name: Monongahela_HUC8_watersheds; Type: TABLE; Schema: scraper; Owner: scraper; Tablespace: 
--

CREATE TABLE "Monongahela_HUC8_watersheds" (
    gid2 integer NOT NULL,
    gid integer,
    "OBJECTID" integer,
    "REGION" character varying(255),
    "SUBREGION" character varying(255),
    "BASIN" character varying(255),
    "SUBBASIN" character varying(255),
    "HUC_2" character varying(255),
    "HUC_4" character varying(255),
    "HUC_6" character varying(255),
    "HUC_8" character varying(255),
    "ACRES" double precision,
    "SQ_MILES" double precision,
    "HU_8_STATE" character varying(255),
    "FIPS_C" character varying(255),
    "SHAPE_Leng" double precision,
    "SHAPE_Area" double precision,
    the_geom public.geometry,
    CONSTRAINT enforce_dims_the_geom CHECK ((public.st_ndims(the_geom) = 2)),
    CONSTRAINT enforce_geotype_the_geom CHECK (((public.geometrytype(the_geom) = 'POLYGON'::text) OR (the_geom IS NULL))),
    CONSTRAINT enforce_srid_the_geom CHECK ((public.st_srid(the_geom) = 4326))
);


ALTER TABLE scraper."Monongahela_HUC8_watersheds" OWNER TO scraper;

--
-- Name: Monongahela_HUC8_watersheds_gid2_seq; Type: SEQUENCE; Schema: scraper; Owner: scraper
--

CREATE SEQUENCE "Monongahela_HUC8_watersheds_gid2_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE scraper."Monongahela_HUC8_watersheds_gid2_seq" OWNER TO scraper;

--
-- Name: Monongahela_HUC8_watersheds_gid2_seq; Type: SEQUENCE OWNED BY; Schema: scraper; Owner: scraper
--

ALTER SEQUENCE "Monongahela_HUC8_watersheds_gid2_seq" OWNED BY "Monongahela_HUC8_watersheds".gid2;


--
-- Name: PaCounty2011_01; Type: TABLE; Schema: scraper; Owner: scraper; Tablespace: 
--

CREATE TABLE "PaCounty2011_01" (
    gid integer NOT NULL,
    "MSLINK" double precision,
    "COUNTY_NAM" character varying(15),
    "COUNTY_NUM" character varying(2),
    "FIPS_COUNT" character varying(3),
    "COUNTY_ARE" double precision,
    "COUNTY_PER" double precision,
    "NUMERIC_LA" double precision,
    "COUNTY_NU1" double precision,
    "AREA_SQ_MI" double precision,
    "SOUND" character varying(255),
    "SPREAD_SHE" character varying(255),
    "IMAGE_NAME" character varying(255),
    "NOTE_FILE" character varying(255),
    "VIDEO" character varying(20),
    "DISTRICT_N" character varying(2),
    "PA_CTY_COD" character varying(2),
    "MAINT_CTY_" character varying(1),
    "DISTRICT_O" character varying(4),
    the_geom public.geometry,
    CONSTRAINT enforce_dims_the_geom CHECK ((public.st_ndims(the_geom) = 2)),
    CONSTRAINT enforce_srid_the_geom CHECK ((public.st_srid(the_geom) = (-1)))
);


ALTER TABLE scraper."PaCounty2011_01" OWNER TO scraper;

--
-- Name: PaCounty2011_01_gid_seq; Type: SEQUENCE; Schema: scraper; Owner: scraper
--

CREATE SEQUENCE "PaCounty2011_01_gid_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE scraper."PaCounty2011_01_gid_seq" OWNER TO scraper;

--
-- Name: PaCounty2011_01_gid_seq; Type: SEQUENCE OWNED BY; Schema: scraper; Owner: scraper
--

ALTER SEQUENCE "PaCounty2011_01_gid_seq" OWNED BY "PaCounty2011_01".gid;


--
-- Name: PaState2011_01; Type: TABLE; Schema: scraper; Owner: scraper; Tablespace: 
--

CREATE TABLE "PaState2011_01" (
    gid integer NOT NULL,
    "MSLINK" double precision,
    "STATE_ID" integer,
    the_geom public.geometry,
    CONSTRAINT enforce_dims_the_geom CHECK ((public.st_ndims(the_geom) = 2)),
    CONSTRAINT enforce_geotype_the_geom CHECK (((public.geometrytype(the_geom) = 'POLYGON'::text) OR (the_geom IS NULL))),
    CONSTRAINT enforce_srid_the_geom CHECK ((public.st_srid(the_geom) = (-1)))
);


ALTER TABLE scraper."PaState2011_01" OWNER TO scraper;

--
-- Name: PaState2011_01_gid_seq; Type: SEQUENCE; Schema: scraper; Owner: scraper
--

CREATE SEQUENCE "PaState2011_01_gid_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE scraper."PaState2011_01_gid_seq" OWNER TO scraper;

--
-- Name: PaState2011_01_gid_seq; Type: SEQUENCE OWNED BY; Schema: scraper; Owner: scraper
--

ALTER SEQUENCE "PaState2011_01_gid_seq" OWNED BY "PaState2011_01".gid;


--
-- Name: RssFeedItem_Backup; Type: TABLE; Schema: scraper; Owner: scraper; Tablespace: 
--

CREATE TABLE "RssFeedItem_Backup" (
    item_id character varying(255),
    content bytea,
    feed_id integer
);


ALTER TABLE scraper."RssFeedItem_Backup" OWNER TO scraper;

--
-- Name: WVCounty2005_03; Type: TABLE; Schema: scraper; Owner: scraper; Tablespace: 
--

CREATE TABLE "WVCounty2005_03" (
    gid integer NOT NULL,
    "AREA" double precision,
    "PERIMETER" double precision,
    "DEP_24K_" integer,
    "DEP_24K_ID" integer,
    "NAME" character varying(15),
    "STATE" integer,
    "FIPS" integer,
    "POP1986" integer,
    "POP2000" integer,
    "POP_CHNG" integer,
    "POPCH_PCT" double precision,
    "MALES" integer,
    "FEMALES" integer,
    "AMER_IND" integer,
    "ASIAN" integer,
    "BLACK" integer,
    "HAWN_PL" integer,
    "HISPANIC" integer,
    "MULT_RACE" integer,
    "OTHER" integer,
    "WHITE" integer,
    "HOUSEHOLDS" integer,
    "AVG_HH_SZ" double precision,
    "HSE_UNITS" integer,
    "OWNER_OCC" integer,
    "RENTER_OCC" integer,
    "VACANT" integer,
    the_geom public.geometry,
    CONSTRAINT enforce_dims_the_geom CHECK ((public.st_ndims(the_geom) = 2)),
    CONSTRAINT enforce_geotype_the_geom CHECK (((public.geometrytype(the_geom) = 'POLYGON'::text) OR (the_geom IS NULL)))
);


ALTER TABLE scraper."WVCounty2005_03" OWNER TO scraper;

--
-- Name: appomatic_mapcluster_cluster; Type: TABLE; Schema: scraper; Owner: scraper; Tablespace: 
--

CREATE TABLE appomatic_mapcluster_cluster (
    id integer NOT NULL,
    src character varying(128) NOT NULL,
    datetime timestamp with time zone NOT NULL,
    latitude double precision NOT NULL,
    longitude double precision NOT NULL,
    location public.geometry NOT NULL,
    region integer[],
    glocation public.geography NOT NULL,
    buffer public.geography,
    reportnum integer NOT NULL,
    score double precision,
    max_score double precision
);


ALTER TABLE scraper.appomatic_mapcluster_cluster OWNER TO scraper;

--
-- Name: appomatic_mapcluster_cluster_id_seq; Type: SEQUENCE; Schema: scraper; Owner: scraper
--

CREATE SEQUENCE appomatic_mapcluster_cluster_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE scraper.appomatic_mapcluster_cluster_id_seq OWNER TO scraper;

--
-- Name: appomatic_mapcluster_cluster_id_seq; Type: SEQUENCE OWNED BY; Schema: scraper; Owner: scraper
--

ALTER SEQUENCE appomatic_mapcluster_cluster_id_seq OWNED BY appomatic_mapcluster_cluster.id;


--
-- Name: appomatic_mapcluster_query; Type: TABLE; Schema: scraper; Owner: scraper; Tablespace: 
--

CREATE TABLE appomatic_mapcluster_query (
    id integer NOT NULL,
    slug character varying(50) NOT NULL,
    name character varying(128) NOT NULL,
    description text,
    query text NOT NULL,
    size integer NOT NULL,
    radius double precision NOT NULL,
    template character varying(2048) NOT NULL
);


ALTER TABLE scraper.appomatic_mapcluster_query OWNER TO scraper;

--
-- Name: appomatic_mapcluster_query_id_seq; Type: SEQUENCE; Schema: scraper; Owner: scraper
--

CREATE SEQUENCE appomatic_mapcluster_query_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE scraper.appomatic_mapcluster_query_id_seq OWNER TO scraper;

--
-- Name: appomatic_mapcluster_query_id_seq; Type: SEQUENCE OWNED BY; Schema: scraper; Owner: scraper
--

ALTER SEQUENCE appomatic_mapcluster_query_id_seq OWNED BY appomatic_mapcluster_query.id;


--
-- Name: appomatic_mapdata_ais_calculated_speeds; Type: TABLE; Schema: scraper; Owner: scraper; Tablespace: 
--

CREATE TABLE appomatic_mapdata_ais_calculated_speeds (
    id integer,
    src character varying(128),
    mmsi character varying(16),
    datetime timestamp with time zone,
    latitude double precision,
    longitude double precision,
    true_heading double precision,
    sog double precision,
    cog double precision,
    location public.geometry,
    vessel_id integer,
    srcfile character varying(1024),
    quality double precision,
    next_id integer,
    next_src character varying(128),
    next_datetime timestamp with time zone,
    next_latitude double precision,
    next_longitude double precision,
    next_true_heading double precision,
    next_sog double precision,
    next_cog double precision,
    next_location public.geometry,
    next_srcfile character varying(1024),
    next_quality double precision,
    distance double precision,
    timediff interval,
    speed double precision
);


ALTER TABLE scraper.appomatic_mapdata_ais_calculated_speeds OWNER TO scraper;

--
-- Name: appomatic_mapdata_ais_calculated_speeds_view; Type: VIEW; Schema: scraper; Owner: scraper
--

CREATE VIEW appomatic_mapdata_ais_calculated_speeds_view AS
    SELECT ais.id, ais.src, ais.mmsi, ais.datetime, ais.latitude, ais.longitude, ais.true_heading, ais.sog, ais.cog, ais.location, ais.vessel_id, ais.srcfile, ais.quality, next.id AS next_id, next.src AS next_src, next.datetime AS next_datetime, next.latitude AS next_latitude, next.longitude AS next_longitude, next.true_heading AS next_true_heading, next.sog AS next_sog, next.cog AS next_cog, next.location AS next_location, next.srcfile AS next_srcfile, next.quality AS next_quality, (public.st_distance((ais.location)::public.geography, (next.location)::public.geography) / (1852.0)::double precision) AS distance, (next.datetime - ais.datetime) AS timediff, ((public.st_distance((ais.location)::public.geography, (next.location)::public.geography) / (1852.0)::double precision) / (((date_part('epoch'::text, next.datetime) - date_part('epoch'::text, ais.datetime)) / (60)::double precision) / (60)::double precision)) AS speed FROM (public.appomatic_mapdata_ais ais JOIN public.appomatic_mapdata_ais next ON (((((((((((ais.latitude <= (90)::double precision) AND (ais.latitude >= ((-90))::double precision)) AND (ais.longitude <= (180)::double precision)) AND (ais.longitude >= ((-180))::double precision)) AND (next.latitude <= (90)::double precision)) AND (next.latitude >= ((-90))::double precision)) AND (next.longitude <= (180)::double precision)) AND (next.longitude >= ((-180))::double precision)) AND ((next.mmsi)::text = (ais.mmsi)::text)) AND (next.datetime = (SELECT min("between".datetime) AS min FROM public.appomatic_mapdata_ais "between" WHERE ((("between".mmsi)::text = (ais.mmsi)::text) AND ("between".datetime > ais.datetime)))))));


ALTER TABLE scraper.appomatic_mapdata_ais_calculated_speeds_view OWNER TO scraper;

--
-- Name: appomatic_mapdata_ais_old; Type: TABLE; Schema: scraper; Owner: scraper; Tablespace: 
--

CREATE TABLE appomatic_mapdata_ais_old (
    id integer,
    src character varying(128),
    mmsi character varying(16),
    datetime timestamp with time zone,
    latitude double precision,
    longitude double precision,
    true_heading double precision,
    sog double precision,
    cog double precision,
    location public.geometry,
    vessel_id integer,
    srcfile character varying(1024),
    quality double precision
);


ALTER TABLE scraper.appomatic_mapdata_ais_old OWNER TO scraper;

--
-- Name: appomatic_mapdata_ais_path_view; Type: VIEW; Schema: scraper; Owner: scraper
--

CREATE VIEW appomatic_mapdata_ais_path_view AS
    SELECT b.src, b.mmsi, c.tolerance, CASE WHEN (c.tolerance IS NULL) THEN b.line ELSE public.st_simplify(b.line, c.tolerance) END AS line, b.timemin, b.timemax FROM (SELECT a.src, a.mmsi, public.st_makeline(a.location) AS line, min(a.datetime) AS timemin, max(a.datetime) AS timemax FROM (SELECT ais.src, ais.mmsi, ais.datetime, ais.latitude, ais.longitude, ais.true_heading, ais.sog, ais.cog, ais.location FROM public.appomatic_mapdata_ais ais ORDER BY ais.src, ais.mmsi, ais.datetime) a GROUP BY a.src, a.mmsi HAVING (count(a.location) > 1) UNION SELECT 'ALL'::character varying AS src, a.mmsi, public.st_makeline(a.location) AS line, min(a.datetime) AS timemin, max(a.datetime) AS timemax FROM (SELECT ais.src, ais.mmsi, ais.datetime, ais.latitude, ais.longitude, ais.true_heading, ais.sog, ais.cog, ais.location FROM public.appomatic_mapdata_ais ais ORDER BY ais.src, ais.mmsi, ais.datetime) a GROUP BY a.mmsi HAVING (count(a.location) > 1)) b, (SELECT ((2)::double precision ^ (generate_series((-11), 20))::double precision) AS tolerance UNION SELECT NULL::double precision AS tolerance) c;


ALTER TABLE scraper.appomatic_mapdata_ais_path_view OWNER TO scraper;

--
-- Name: appomatic_mapdata_sar; Type: TABLE; Schema: scraper; Owner: scraper; Tablespace: 
--

CREATE TABLE appomatic_mapdata_sar (
    id integer NOT NULL,
    src character varying(128) NOT NULL,
    datetime timestamp with time zone NOT NULL,
    duration integer,
    "BeamMode" character varying(8) NOT NULL,
    "Polarizations" character varying(8) NOT NULL,
    "ProductType" character varying(8) NOT NULL,
    "ImageID" integer,
    "Counter" integer,
    "ProcessessingID" integer,
    "Customer" character varying(16) NOT NULL,
    "FileType" character varying(16) NOT NULL,
    name character varying(128) NOT NULL,
    latitude double precision NOT NULL,
    longitude double precision NOT NULL,
    location public.geometry NOT NULL,
    "Probability" integer,
    "DetectionId" character varying(128) NOT NULL,
    "ProductStartTime" timestamp with time zone,
    "ProductStopTime" timestamp with time zone,
    "Beam" double precision,
    "Length" double precision,
    "Type" character varying(128) NOT NULL,
    "Heading" double precision,
    "ProductId" character varying(128) NOT NULL,
    region integer[],
    srcfile character varying(1024),
    quality double precision DEFAULT 1.0 NOT NULL
);


ALTER TABLE scraper.appomatic_mapdata_sar OWNER TO scraper;

--
-- Name: appomatic_mapdata_sar_id_seq; Type: SEQUENCE; Schema: scraper; Owner: scraper
--

CREATE SEQUENCE appomatic_mapdata_sar_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE scraper.appomatic_mapdata_sar_id_seq OWNER TO scraper;

--
-- Name: appomatic_mapdata_sar_id_seq; Type: SEQUENCE OWNED BY; Schema: scraper; Owner: scraper
--

ALTER SEQUENCE appomatic_mapdata_sar_id_seq OWNED BY appomatic_mapdata_sar.id;


--
-- Name: appomatic_mapdata_viirs; Type: TABLE; Schema: scraper; Owner: scraper; Tablespace: 
--

CREATE TABLE appomatic_mapdata_viirs (
    id integer NOT NULL,
    src character varying(128) NOT NULL,
    datetime timestamp with time zone NOT NULL,
    name character varying(128) NOT NULL,
    latitude double precision NOT NULL,
    longitude double precision NOT NULL,
    location public.geometry NOT NULL,
    "RadiantOutput" double precision,
    "Temperature" double precision,
    "RadiativeHeat" double precision,
    footprint double precision,
    "SatZenithAngle" double precision,
    "SourceID" character varying(128) NOT NULL,
    region integer[],
    srcfile character varying(1024),
    quality double precision DEFAULT 1.0 NOT NULL
);


ALTER TABLE scraper.appomatic_mapdata_viirs OWNER TO scraper;

--
-- Name: appomatic_mapdata_viirs_id_seq; Type: SEQUENCE; Schema: scraper; Owner: scraper
--

CREATE SEQUENCE appomatic_mapdata_viirs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE scraper.appomatic_mapdata_viirs_id_seq OWNER TO scraper;

--
-- Name: appomatic_mapdata_viirs_id_seq; Type: SEQUENCE OWNED BY; Schema: scraper; Owner: scraper
--

ALTER SEQUENCE appomatic_mapdata_viirs_id_seq OWNED BY appomatic_mapdata_viirs.id;


--
-- Name: region; Type: TABLE; Schema: scraper; Owner: scraper; Tablespace: 
--

CREATE TABLE region (
    id integer NOT NULL,
    name character varying(256),
    code character varying(20),
    the_geom public.geometry,
    kml text,
    simple_geom public.geometry,
    src character varying(128),
    srcfile character varying(1024)
);


ALTER TABLE scraper.region OWNER TO scraper;

--
-- Name: appomatic_mapdata_viirsfilteredview; Type: VIEW; Schema: scraper; Owner: scraper
--

CREATE VIEW appomatic_mapdata_viirsfilteredview AS
    SELECT v.id, v.src, v.datetime, v.name, v.latitude, v.longitude, v.location, v."RadiantOutput", v."Temperature", v."RadiativeHeat", v.footprint, v."SatZenithAngle", v."SourceID", v.region, v.srcfile, v.quality, r.code AS regioncode, r.id AS regionid, r.name AS regionname FROM (appomatic_mapdata_viirs v JOIN region r ON (public.st_contains(r.the_geom, v.location))) WHERE (v."Temperature" > (2073)::double precision);


ALTER TABLE scraper.appomatic_mapdata_viirsfilteredview OWNER TO scraper;

--
-- Name: appomatic_mapdelta_event; Type: TABLE; Schema: scraper; Owner: scraper; Tablespace: 
--

CREATE TABLE appomatic_mapdelta_event (
    id integer NOT NULL,
    src character varying(128) NOT NULL,
    datetime timestamp with time zone NOT NULL,
    latitude double precision NOT NULL,
    longitude double precision NOT NULL,
    location public.geometry NOT NULL,
    region integer[],
    glocation public.geography NOT NULL,
    reportnum integer NOT NULL,
    min_distance double precision,
    score integer
);


ALTER TABLE scraper.appomatic_mapdelta_event OWNER TO scraper;

--
-- Name: appomatic_mapdelta_event_id_seq; Type: SEQUENCE; Schema: scraper; Owner: scraper
--

CREATE SEQUENCE appomatic_mapdelta_event_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE scraper.appomatic_mapdelta_event_id_seq OWNER TO scraper;

--
-- Name: appomatic_mapdelta_event_id_seq; Type: SEQUENCE OWNED BY; Schema: scraper; Owner: scraper
--

ALTER SEQUENCE appomatic_mapdelta_event_id_seq OWNED BY appomatic_mapdelta_event.id;


--
-- Name: appomatic_mapdelta_grouping; Type: TABLE; Schema: scraper; Owner: scraper; Tablespace: 
--

CREATE TABLE appomatic_mapdelta_grouping (
    id integer NOT NULL,
    score integer NOT NULL,
    full_geom public.geometry,
    cropped_geom public.geometry
);


ALTER TABLE scraper.appomatic_mapdelta_grouping OWNER TO scraper;

--
-- Name: appomatic_mapdelta_grouping_id_seq; Type: SEQUENCE; Schema: scraper; Owner: scraper
--

CREATE SEQUENCE appomatic_mapdelta_grouping_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE scraper.appomatic_mapdelta_grouping_id_seq OWNER TO scraper;

--
-- Name: appomatic_mapdelta_grouping_id_seq; Type: SEQUENCE OWNED BY; Schema: scraper; Owner: scraper
--

ALTER SEQUENCE appomatic_mapdelta_grouping_id_seq OWNED BY appomatic_mapdelta_grouping.id;


--
-- Name: appomatic_mapserver_application; Type: TABLE; Schema: scraper; Owner: scraper; Tablespace: 
--

CREATE TABLE appomatic_mapserver_application (
    slug character varying(1024) NOT NULL,
    name character varying(1024) NOT NULL,
    configuration text
);


ALTER TABLE scraper.appomatic_mapserver_application OWNER TO scraper;

--
-- Name: appomatic_mapserver_layer; Type: TABLE; Schema: scraper; Owner: scraper; Tablespace: 
--

CREATE TABLE appomatic_mapserver_layer (
    application_id character varying(1024) NOT NULL,
    slug character varying(1024) NOT NULL,
    name character varying(1024) NOT NULL,
    type character varying(1024) NOT NULL,
    backend_type character varying(1024) NOT NULL,
    template character varying(1024) NOT NULL,
    query character varying(1024) NOT NULL,
    definition text NOT NULL
);


ALTER TABLE scraper.appomatic_mapserver_layer OWNER TO scraper;

--
-- Name: appomatic_websitebase_profile; Type: TABLE; Schema: scraper; Owner: scraper; Tablespace: 
--

CREATE TABLE appomatic_websitebase_profile (
    id integer NOT NULL,
    mugshot character varying(100) NOT NULL,
    privacy character varying(15) NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE scraper.appomatic_websitebase_profile OWNER TO scraper;

--
-- Name: appomatic_websitebase_profile_id_seq; Type: SEQUENCE; Schema: scraper; Owner: scraper
--

CREATE SEQUENCE appomatic_websitebase_profile_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE scraper.appomatic_websitebase_profile_id_seq OWNER TO scraper;

--
-- Name: appomatic_websitebase_profile_id_seq; Type: SEQUENCE OWNED BY; Schema: scraper; Owner: scraper
--

ALTER SEQUENCE appomatic_websitebase_profile_id_seq OWNED BY appomatic_websitebase_profile.id;


--
-- Name: countyBoundary_censusAndUSGS_200503_utm83_gid_seq; Type: SEQUENCE; Schema: scraper; Owner: scraper
--

CREATE SEQUENCE "countyBoundary_censusAndUSGS_200503_utm83_gid_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE scraper."countyBoundary_censusAndUSGS_200503_utm83_gid_seq" OWNER TO scraper;

--
-- Name: countyBoundary_censusAndUSGS_200503_utm83_gid_seq; Type: SEQUENCE OWNED BY; Schema: scraper; Owner: scraper
--

ALTER SEQUENCE "countyBoundary_censusAndUSGS_200503_utm83_gid_seq" OWNED BY "WVCounty2005_03".gid;


--
-- Name: easy_thumbnails_source; Type: TABLE; Schema: scraper; Owner: scraper; Tablespace: 
--

CREATE TABLE easy_thumbnails_source (
    id integer NOT NULL,
    storage_hash character varying(40) NOT NULL,
    name character varying(255) NOT NULL,
    modified timestamp with time zone NOT NULL
);


ALTER TABLE scraper.easy_thumbnails_source OWNER TO scraper;

--
-- Name: easy_thumbnails_source_id_seq; Type: SEQUENCE; Schema: scraper; Owner: scraper
--

CREATE SEQUENCE easy_thumbnails_source_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE scraper.easy_thumbnails_source_id_seq OWNER TO scraper;

--
-- Name: easy_thumbnails_source_id_seq; Type: SEQUENCE OWNED BY; Schema: scraper; Owner: scraper
--

ALTER SEQUENCE easy_thumbnails_source_id_seq OWNED BY easy_thumbnails_source.id;


--
-- Name: easy_thumbnails_thumbnail; Type: TABLE; Schema: scraper; Owner: scraper; Tablespace: 
--

CREATE TABLE easy_thumbnails_thumbnail (
    id integer NOT NULL,
    storage_hash character varying(40) NOT NULL,
    name character varying(255) NOT NULL,
    modified timestamp with time zone NOT NULL,
    source_id integer NOT NULL
);


ALTER TABLE scraper.easy_thumbnails_thumbnail OWNER TO scraper;

--
-- Name: easy_thumbnails_thumbnail_id_seq; Type: SEQUENCE; Schema: scraper; Owner: scraper
--

CREATE SEQUENCE easy_thumbnails_thumbnail_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE scraper.easy_thumbnails_thumbnail_id_seq OWNER TO scraper;

--
-- Name: easy_thumbnails_thumbnail_id_seq; Type: SEQUENCE OWNED BY; Schema: scraper; Owner: scraper
--

ALTER SEQUENCE easy_thumbnails_thumbnail_id_seq OWNED BY easy_thumbnails_thumbnail.id;


--
-- Name: feedentry; Type: TABLE; Schema: scraper; Owner: scraper; Tablespace: 
--

CREATE TABLE feedentry (
    id character(36) NOT NULL,
    title character varying(255) NOT NULL,
    link character varying(255),
    summary text,
    content text,
    lat double precision NOT NULL,
    lng double precision NOT NULL,
    source_id integer NOT NULL,
    kml_url character varying(255),
    incident_datetime timestamp without time zone NOT NULL,
    published timestamp without time zone,
    regions integer[],
    tags character varying(64)[],
    the_geom public.geometry,
    source_item_id integer
);


ALTER TABLE scraper.feedentry OWNER TO scraper;

--
-- Name: feedentry_backup; Type: TABLE; Schema: scraper; Owner: scraper; Tablespace: 
--

CREATE TABLE feedentry_backup (
    id character(36),
    title character varying(255),
    link character varying(255),
    summary text,
    content text,
    lat double precision,
    lng double precision,
    source_id integer,
    kml_url character varying(255),
    incident_datetime timestamp without time zone,
    published timestamp without time zone,
    regions integer[],
    tags character varying(64)[],
    the_geom public.geometry,
    source_item_id integer
);


ALTER TABLE scraper.feedentry_backup OWNER TO scraper;

--
-- Name: feedsource; Type: TABLE; Schema: scraper; Owner: scraper; Tablespace: 
--

CREATE TABLE feedsource (
    id integer NOT NULL,
    name character varying(32)
);


ALTER TABLE scraper.feedsource OWNER TO scraper;

--
-- Name: guardian_groupobjectpermission; Type: TABLE; Schema: scraper; Owner: scraper; Tablespace: 
--

CREATE TABLE guardian_groupobjectpermission (
    id integer NOT NULL,
    permission_id integer NOT NULL,
    content_type_id integer NOT NULL,
    object_pk character varying(255) NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE scraper.guardian_groupobjectpermission OWNER TO scraper;

--
-- Name: guardian_groupobjectpermission_id_seq; Type: SEQUENCE; Schema: scraper; Owner: scraper
--

CREATE SEQUENCE guardian_groupobjectpermission_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE scraper.guardian_groupobjectpermission_id_seq OWNER TO scraper;

--
-- Name: guardian_groupobjectpermission_id_seq; Type: SEQUENCE OWNED BY; Schema: scraper; Owner: scraper
--

ALTER SEQUENCE guardian_groupobjectpermission_id_seq OWNED BY guardian_groupobjectpermission.id;


--
-- Name: guardian_userobjectpermission; Type: TABLE; Schema: scraper; Owner: scraper; Tablespace: 
--

CREATE TABLE guardian_userobjectpermission (
    id integer NOT NULL,
    permission_id integer NOT NULL,
    content_type_id integer NOT NULL,
    object_pk character varying(255) NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE scraper.guardian_userobjectpermission OWNER TO scraper;

--
-- Name: guardian_userobjectpermission_id_seq; Type: SEQUENCE; Schema: scraper; Owner: scraper
--

CREATE SEQUENCE guardian_userobjectpermission_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE scraper.guardian_userobjectpermission_id_seq OWNER TO scraper;

--
-- Name: guardian_userobjectpermission_id_seq; Type: SEQUENCE OWNED BY; Schema: scraper; Owner: scraper
--

ALTER SEQUENCE guardian_userobjectpermission_id_seq OWNED BY guardian_userobjectpermission.id;


--
-- Name: region_id_seq; Type: SEQUENCE; Schema: scraper; Owner: scraper
--

CREATE SEQUENCE region_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE scraper.region_id_seq OWNER TO scraper;

--
-- Name: region_id_seq; Type: SEQUENCE OWNED BY; Schema: scraper; Owner: scraper
--

ALTER SEQUENCE region_id_seq OWNED BY region.id;


--
-- Name: satimage; Type: TABLE; Schema: scraper; Owner: scraper; Tablespace: 
--

CREATE TABLE satimage (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    description text,
    size_bytes integer,
    geo_extent public.geometry,
    type character(20),
    status character(20),
    source character(20),
    acquisition_date timestamp without time zone NOT NULL,
    url character varying(255),
    duration interval,
    orbit integer,
    priority integer DEFAULT 100 NOT NULL,
    pass character(10),
    orbit_position double precision
);


ALTER TABLE scraper.satimage OWNER TO scraper;

--
-- Name: satimage_aoi; Type: TABLE; Schema: scraper; Owner: scraper; Tablespace: 
--

CREATE TABLE satimage_aoi (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    description text,
    the_geom public.geometry NOT NULL,
    begin_date date,
    end_date date
);


ALTER TABLE scraper.satimage_aoi OWNER TO scraper;

--
-- Name: satimage_aoi_id_seq; Type: SEQUENCE; Schema: scraper; Owner: scraper
--

CREATE SEQUENCE satimage_aoi_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE scraper.satimage_aoi_id_seq OWNER TO scraper;

--
-- Name: satimage_aoi_id_seq; Type: SEQUENCE OWNED BY; Schema: scraper; Owner: scraper
--

ALTER SEQUENCE satimage_aoi_id_seq OWNED BY satimage_aoi.id;


--
-- Name: satimage_id_seq; Type: SEQUENCE; Schema: scraper; Owner: scraper
--

CREATE SEQUENCE satimage_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE scraper.satimage_id_seq OWNER TO scraper;

--
-- Name: satimage_id_seq; Type: SEQUENCE OWNED BY; Schema: scraper; Owner: scraper
--

ALTER SEQUENCE satimage_id_seq OWNED BY satimage.id;


--
-- Name: satimage_published; Type: TABLE; Schema: scraper; Owner: scraper; Tablespace: 
--

CREATE TABLE satimage_published (
    id integer NOT NULL,
    source_image character varying(100) NOT NULL,
    type character(20) NOT NULL,
    url character varying(255) NOT NULL,
    geo_extent public.geometry,
    name character varying(100)
);


ALTER TABLE scraper.satimage_published OWNER TO scraper;

--
-- Name: satimage_published_id_seq; Type: SEQUENCE; Schema: scraper; Owner: scraper
--

CREATE SEQUENCE satimage_published_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE scraper.satimage_published_id_seq OWNER TO scraper;

--
-- Name: satimage_published_id_seq; Type: SEQUENCE OWNED BY; Schema: scraper; Owner: scraper
--

ALTER SEQUENCE satimage_published_id_seq OWNED BY satimage_published.id;


--
-- Name: tl_2010_us_state10; Type: TABLE; Schema: scraper; Owner: scraper; Tablespace: 
--

CREATE TABLE tl_2010_us_state10 (
    gid integer NOT NULL,
    "REGION10" character varying(2),
    "DIVISION10" character varying(2),
    "STATEFP10" character varying(2),
    "STATENS10" character varying(8),
    "GEOID10" character varying(2),
    "STUSPS10" character varying(2),
    "NAME10" character varying(100),
    "LSAD10" character varying(2),
    "MTFCC10" character varying(5),
    "FUNCSTAT10" character varying(1),
    "ALAND10" double precision,
    "AWATER10" double precision,
    "INTPTLAT10" character varying(11),
    "INTPTLON10" character varying(12),
    the_geom public.geometry,
    CONSTRAINT enforce_dims_the_geom CHECK ((public.st_ndims(the_geom) = 2)),
    CONSTRAINT enforce_srid_the_geom CHECK ((public.st_srid(the_geom) = 4269))
);


ALTER TABLE scraper.tl_2010_us_state10 OWNER TO scraper;

--
-- Name: tl_2010_us_state10_gid_seq; Type: SEQUENCE; Schema: scraper; Owner: scraper
--

CREATE SEQUENCE tl_2010_us_state10_gid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE scraper.tl_2010_us_state10_gid_seq OWNER TO scraper;

--
-- Name: tl_2010_us_state10_gid_seq; Type: SEQUENCE OWNED BY; Schema: scraper; Owner: scraper
--

ALTER SEQUENCE tl_2010_us_state10_gid_seq OWNED BY tl_2010_us_state10.gid;


--
-- Name: userena_userenasignup; Type: TABLE; Schema: scraper; Owner: scraper; Tablespace: 
--

CREATE TABLE userena_userenasignup (
    id integer NOT NULL,
    user_id integer NOT NULL,
    last_active timestamp with time zone,
    activation_key character varying(40) NOT NULL,
    activation_notification_send boolean NOT NULL,
    email_unconfirmed character varying(75) NOT NULL,
    email_confirmation_key character varying(40) NOT NULL,
    email_confirmation_key_created timestamp with time zone
);


ALTER TABLE scraper.userena_userenasignup OWNER TO scraper;

--
-- Name: userena_userenasignup_id_seq; Type: SEQUENCE; Schema: scraper; Owner: scraper
--

CREATE SEQUENCE userena_userenasignup_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE scraper.userena_userenasignup_id_seq OWNER TO scraper;

--
-- Name: userena_userenasignup_id_seq; Type: SEQUENCE OWNED BY; Schema: scraper; Owner: scraper
--

ALTER SEQUENCE userena_userenasignup_id_seq OWNED BY userena_userenasignup.id;


--
-- Name: wvStateBoundary100k_USGS_200203_ll83; Type: TABLE; Schema: scraper; Owner: scraper; Tablespace: 
--

CREATE TABLE "wvStateBoundary100k_USGS_200203_ll83" (
    gid integer NOT NULL,
    "AREA" double precision,
    "STATE_NAME" character varying(25),
    "STATE_FIPS" character varying(2),
    "SUB_REGION" character varying(7),
    "STATE_ABBR" character varying(2),
    "POP1990" integer,
    "POP1999" integer,
    "POP90_SQMI" integer,
    "HOUSEHOLDS" integer,
    "MALES" integer,
    "FEMALES" integer,
    "WHITE" integer,
    "BLACK" integer,
    "AMERI_ES" integer,
    "ASIAN_PI" integer,
    "OTHER" integer,
    "HISPANIC" integer,
    "AGE_UNDER5" integer,
    "AGE_5_17" integer,
    "AGE_18_29" integer,
    "AGE_30_49" integer,
    "AGE_50_64" integer,
    "AGE_65_UP" integer,
    "NEVERMARRY" integer,
    "MARRIED" integer,
    "SEPARATED" integer,
    "WIDOWED" integer,
    "DIVORCED" integer,
    "HSEHLD_1_M" integer,
    "HSEHLD_1_F" integer,
    "MARHH_CHD" integer,
    "MARHH_NO_C" integer,
    "MHH_CHILD" integer,
    "FHH_CHILD" integer,
    "HSE_UNITS" integer,
    "VACANT" integer,
    "OWNER_OCC" integer,
    "RENTER_OCC" integer,
    "MEDIAN_VAL" integer,
    "MEDIANRENT" integer,
    "UNITS_1DET" integer,
    "UNITS_1ATT" integer,
    "UNITS2" integer,
    "UNITS3_9" integer,
    "UNITS10_49" integer,
    "UNITS50_UP" integer,
    "MOBILEHOME" integer,
    "NO_FARMS87" integer,
    "AVG_SIZE87" integer,
    "CROP_ACR87" integer,
    "AVG_SALE87" integer,
    the_geom public.geometry,
    CONSTRAINT enforce_dims_the_geom CHECK ((public.st_ndims(the_geom) = 2)),
    CONSTRAINT enforce_geotype_the_geom CHECK (((public.geometrytype(the_geom) = 'POLYGON'::text) OR (the_geom IS NULL))),
    CONSTRAINT enforce_srid_the_geom CHECK ((public.st_srid(the_geom) = (-1)))
);


ALTER TABLE scraper."wvStateBoundary100k_USGS_200203_ll83" OWNER TO scraper;

--
-- Name: wvStateBoundary100k_USGS_200203_ll83_gid_seq; Type: SEQUENCE; Schema: scraper; Owner: scraper
--

CREATE SEQUENCE "wvStateBoundary100k_USGS_200203_ll83_gid_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE scraper."wvStateBoundary100k_USGS_200203_ll83_gid_seq" OWNER TO scraper;

--
-- Name: wvStateBoundary100k_USGS_200203_ll83_gid_seq; Type: SEQUENCE OWNED BY; Schema: scraper; Owner: scraper
--

ALTER SEQUENCE "wvStateBoundary100k_USGS_200203_ll83_gid_seq" OWNED BY "wvStateBoundary100k_USGS_200203_ll83".gid;


SET search_path = public, pg_catalog;

--
-- Name: id; Type: DEFAULT; Schema: public; Owner: scraper
--

ALTER TABLE ONLY "Nightfire_file" ALTER COLUMN id SET DEFAULT nextval('"Nightfire_file_id_seq"'::regclass);


--
-- Name: st_id; Type: DEFAULT; Schema: public; Owner: scraper
--

ALTER TABLE ONLY "RSSEmailSubscription" ALTER COLUMN st_id SET DEFAULT nextval('"RSSEmailSubscription_st_id_seq"'::regclass);


--
-- Name: seqid; Type: DEFAULT; Schema: public; Owner: scraper
--

ALTER TABLE ONLY ais ALTER COLUMN seqid SET DEFAULT nextval('ais_seqid_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: scraper
--

ALTER TABLE ONLY appomatic_mapdata_ais ALTER COLUMN id SET DEFAULT nextval('appomatic_mapdata_ais_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: scraper
--

ALTER TABLE ONLY appomatic_mapdata_aispath ALTER COLUMN id SET DEFAULT nextval('appomatic_mapdata_aispath_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: scraper
--

ALTER TABLE ONLY appomatic_mapdata_vessel ALTER COLUMN id SET DEFAULT nextval('appomatic_mapdata_vessel_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: scraper
--

ALTER TABLE ONLY appomatic_mapimport_downloaded ALTER COLUMN id SET DEFAULT nextval('appomatic_mapimport_downloaded_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: scraper
--

ALTER TABLE ONLY appomatic_nrccluster_cluster ALTER COLUMN id SET DEFAULT nextval('appomatic_nrccluster_cluster_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: scraper
--

ALTER TABLE ONLY appomatic_nrccluster_nrcreport ALTER COLUMN id SET DEFAULT nextval('appomatic_nrccluster_nrcreport_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: scraper
--

ALTER TABLE ONLY auth_group ALTER COLUMN id SET DEFAULT nextval('auth_group_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: scraper
--

ALTER TABLE ONLY auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('auth_group_permissions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: scraper
--

ALTER TABLE ONLY auth_permission ALTER COLUMN id SET DEFAULT nextval('auth_permission_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: scraper
--

ALTER TABLE ONLY auth_user ALTER COLUMN id SET DEFAULT nextval('auth_user_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: scraper
--

ALTER TABLE ONLY auth_user_groups ALTER COLUMN id SET DEFAULT nextval('auth_user_groups_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: scraper
--

ALTER TABLE ONLY auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('auth_user_user_permissions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: scraper
--

ALTER TABLE ONLY django_admin_log ALTER COLUMN id SET DEFAULT nextval('django_admin_log_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: scraper
--

ALTER TABLE ONLY django_comment_flags ALTER COLUMN id SET DEFAULT nextval('django_comment_flags_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: scraper
--

ALTER TABLE ONLY django_comments ALTER COLUMN id SET DEFAULT nextval('django_comments_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: scraper
--

ALTER TABLE ONLY django_content_type ALTER COLUMN id SET DEFAULT nextval('django_content_type_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: scraper
--

ALTER TABLE ONLY django_site ALTER COLUMN id SET DEFAULT nextval('django_site_id_seq'::regclass);


SET search_path = scraper, pg_catalog;

--
-- Name: gid; Type: DEFAULT; Schema: scraper; Owner: scraper
--

ALTER TABLE ONLY "Alegheny_Forest_PA" ALTER COLUMN gid SET DEFAULT nextval('"Alegheny_Forest_PA_gid_seq"'::regclass);


--
-- Name: gid; Type: DEFAULT; Schema: scraper; Owner: scraper
--

ALTER TABLE ONLY "GOMPolygon_drawn" ALTER COLUMN gid SET DEFAULT nextval('"GOMPolygon_drawn_gid_seq"'::regclass);


--
-- Name: gid2; Type: DEFAULT; Schema: scraper; Owner: scraper
--

ALTER TABLE ONLY "HUC10_Monongahela" ALTER COLUMN gid2 SET DEFAULT nextval('"HUC10_Monongahela_gid2_seq"'::regclass);


--
-- Name: gid2; Type: DEFAULT; Schema: scraper; Owner: scraper
--

ALTER TABLE ONLY "Monongahela_HUC6_Watershed" ALTER COLUMN gid2 SET DEFAULT nextval('"Monongahela_HUC6_Watershed_gid2_seq"'::regclass);


--
-- Name: gid2; Type: DEFAULT; Schema: scraper; Owner: scraper
--

ALTER TABLE ONLY "Monongahela_HUC8_watersheds" ALTER COLUMN gid2 SET DEFAULT nextval('"Monongahela_HUC8_watersheds_gid2_seq"'::regclass);


--
-- Name: gid; Type: DEFAULT; Schema: scraper; Owner: scraper
--

ALTER TABLE ONLY "PaCounty2011_01" ALTER COLUMN gid SET DEFAULT nextval('"PaCounty2011_01_gid_seq"'::regclass);


--
-- Name: gid; Type: DEFAULT; Schema: scraper; Owner: scraper
--

ALTER TABLE ONLY "PaState2011_01" ALTER COLUMN gid SET DEFAULT nextval('"PaState2011_01_gid_seq"'::regclass);


--
-- Name: gid; Type: DEFAULT; Schema: scraper; Owner: scraper
--

ALTER TABLE ONLY "WVCounty2005_03" ALTER COLUMN gid SET DEFAULT nextval('"countyBoundary_censusAndUSGS_200503_utm83_gid_seq"'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: scraper; Owner: scraper
--

ALTER TABLE ONLY appomatic_mapcluster_cluster ALTER COLUMN id SET DEFAULT nextval('appomatic_mapcluster_cluster_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: scraper; Owner: scraper
--

ALTER TABLE ONLY appomatic_mapcluster_query ALTER COLUMN id SET DEFAULT nextval('appomatic_mapcluster_query_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: scraper; Owner: scraper
--

ALTER TABLE ONLY appomatic_mapdata_sar ALTER COLUMN id SET DEFAULT nextval('appomatic_mapdata_sar_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: scraper; Owner: scraper
--

ALTER TABLE ONLY appomatic_mapdata_viirs ALTER COLUMN id SET DEFAULT nextval('appomatic_mapdata_viirs_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: scraper; Owner: scraper
--

ALTER TABLE ONLY appomatic_mapdelta_event ALTER COLUMN id SET DEFAULT nextval('appomatic_mapdelta_event_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: scraper; Owner: scraper
--

ALTER TABLE ONLY appomatic_mapdelta_grouping ALTER COLUMN id SET DEFAULT nextval('appomatic_mapdelta_grouping_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: scraper; Owner: scraper
--

ALTER TABLE ONLY appomatic_websitebase_profile ALTER COLUMN id SET DEFAULT nextval('appomatic_websitebase_profile_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: scraper; Owner: scraper
--

ALTER TABLE ONLY easy_thumbnails_source ALTER COLUMN id SET DEFAULT nextval('easy_thumbnails_source_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: scraper; Owner: scraper
--

ALTER TABLE ONLY easy_thumbnails_thumbnail ALTER COLUMN id SET DEFAULT nextval('easy_thumbnails_thumbnail_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: scraper; Owner: scraper
--

ALTER TABLE ONLY guardian_groupobjectpermission ALTER COLUMN id SET DEFAULT nextval('guardian_groupobjectpermission_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: scraper; Owner: scraper
--

ALTER TABLE ONLY guardian_userobjectpermission ALTER COLUMN id SET DEFAULT nextval('guardian_userobjectpermission_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: scraper; Owner: scraper
--

ALTER TABLE ONLY region ALTER COLUMN id SET DEFAULT nextval('region_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: scraper; Owner: scraper
--

ALTER TABLE ONLY satimage ALTER COLUMN id SET DEFAULT nextval('satimage_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: scraper; Owner: scraper
--

ALTER TABLE ONLY satimage_aoi ALTER COLUMN id SET DEFAULT nextval('satimage_aoi_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: scraper; Owner: scraper
--

ALTER TABLE ONLY satimage_published ALTER COLUMN id SET DEFAULT nextval('satimage_published_id_seq'::regclass);


--
-- Name: gid; Type: DEFAULT; Schema: scraper; Owner: scraper
--

ALTER TABLE ONLY tl_2010_us_state10 ALTER COLUMN gid SET DEFAULT nextval('tl_2010_us_state10_gid_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: scraper; Owner: scraper
--

ALTER TABLE ONLY userena_userenasignup ALTER COLUMN id SET DEFAULT nextval('userena_userenasignup_id_seq'::regclass);


--
-- Name: gid; Type: DEFAULT; Schema: scraper; Owner: scraper
--

ALTER TABLE ONLY "wvStateBoundary100k_USGS_200203_ll83" ALTER COLUMN gid SET DEFAULT nextval('"wvStateBoundary100k_USGS_200203_ll83_gid_seq"'::regclass);


SET search_path = public, pg_catalog;

--
-- Name: AreaCodeMap_pkey; Type: CONSTRAINT; Schema: public; Owner: scraper; Tablespace: 
--

ALTER TABLE ONLY "AreaCodeMap"
    ADD CONSTRAINT "AreaCodeMap_pkey" PRIMARY KEY (id);


--
-- Name: BotTaskError_pkey; Type: CONSTRAINT; Schema: public; Owner: scraper; Tablespace: 
--

ALTER TABLE ONLY "BotTaskError"
    ADD CONSTRAINT "BotTaskError_pkey" PRIMARY KEY (task_id, bot);


--
-- Name: BotTaskParams_pkey; Type: CONSTRAINT; Schema: public; Owner: scraper; Tablespace: 
--

ALTER TABLE ONLY "BotTaskParams"
    ADD CONSTRAINT "BotTaskParams_pkey" PRIMARY KEY (bot, task_id, key);


--
-- Name: BotTaskStatus_pkey; Type: CONSTRAINT; Schema: public; Owner: scraper; Tablespace: 
--

ALTER TABLE ONLY "BotTaskStatus"
    ADD CONSTRAINT "BotTaskStatus_pkey" PRIMARY KEY (task_id, bot);


--
-- Name: BotTask_pkey; Type: CONSTRAINT; Schema: public; Owner: scraper; Tablespace: 
--

ALTER TABLE ONLY "BotTask"
    ADD CONSTRAINT "BotTask_pkey" PRIMARY KEY (id, bot);


--
-- Name: CogisInspection_pkey; Type: CONSTRAINT; Schema: public; Owner: scraper; Tablespace: 
--

ALTER TABLE ONLY "CogisInspection"
    ADD CONSTRAINT "CogisInspection_pkey" PRIMARY KEY (st_id);


--
-- Name: CogisSpill_pkey; Type: CONSTRAINT; Schema: public; Owner: scraper; Tablespace: 
--

ALTER TABLE ONLY "CogisSpill"
    ADD CONSTRAINT "CogisSpill_pkey" PRIMARY KEY (st_id);


--
-- Name: FT_Test_pkey; Type: CONSTRAINT; Schema: public; Owner: scraper; Tablespace: 
--

ALTER TABLE ONLY "FT_Test"
    ADD CONSTRAINT "FT_Test_pkey" PRIMARY KEY (seq);


--
-- Name: FeedEntryTag_pkey; Type: CONSTRAINT; Schema: public; Owner: scraper; Tablespace: 
--

ALTER TABLE ONLY "FeedEntryTag"
    ADD CONSTRAINT "FeedEntryTag_pkey" PRIMARY KEY (tag, feed_entry_id);


--
-- Name: FeedEntry_pkey; Type: CONSTRAINT; Schema: public; Owner: scraper; Tablespace: 
--

ALTER TABLE ONLY "DEFUNCT_FeedEntry"
    ADD CONSTRAINT "FeedEntry_pkey" PRIMARY KEY (id);


--
-- Name: FeedSource_pkey; Type: CONSTRAINT; Schema: public; Owner: scraper; Tablespace: 
--

ALTER TABLE ONLY "FeedSource"
    ADD CONSTRAINT "FeedSource_pkey" PRIMARY KEY (id);


--
-- Name: FracFocusChemical_old2_pkey; Type: CONSTRAINT; Schema: public; Owner: scraper; Tablespace: 
--

ALTER TABLE ONLY "FracFocusChemical_old2"
    ADD CONSTRAINT "FracFocusChemical_old2_pkey" PRIMARY KEY (seqid);


--
-- Name: FracFocusChemical_old_pkey; Type: CONSTRAINT; Schema: public; Owner: scraper; Tablespace: 
--

ALTER TABLE ONLY "FracFocusChemical_old"
    ADD CONSTRAINT "FracFocusChemical_old_pkey" PRIMARY KEY (seqid);


--
-- Name: FracFocusPDF_pkey; Type: CONSTRAINT; Schema: public; Owner: scraper; Tablespace: 
--

ALTER TABLE ONLY "FracFocusPDF"
    ADD CONSTRAINT "FracFocusPDF_pkey" PRIMARY KEY (seqid);


--
-- Name: FracFocusParseChemical_pkey; Type: CONSTRAINT; Schema: public; Owner: scraper; Tablespace: 
--

ALTER TABLE ONLY "FracFocusParseChemical"
    ADD CONSTRAINT "FracFocusParseChemical_pkey" PRIMARY KEY (seqid);


--
-- Name: FracFocusParse_pkey; Type: CONSTRAINT; Schema: public; Owner: scraper; Tablespace: 
--

ALTER TABLE ONLY "FracFocusParse"
    ADD CONSTRAINT "FracFocusParse_pkey" PRIMARY KEY (seqid);


--
-- Name: FracFocusReportChemical_pkey; Type: CONSTRAINT; Schema: public; Owner: scraper; Tablespace: 
--

ALTER TABLE ONLY "FracFocusReportChemical"
    ADD CONSTRAINT "FracFocusReportChemical_pkey" PRIMARY KEY (seqid);


--
-- Name: FracFocusReport_old2_pkey; Type: CONSTRAINT; Schema: public; Owner: scraper; Tablespace: 
--

ALTER TABLE ONLY "FracFocusReport_old2"
    ADD CONSTRAINT "FracFocusReport_old2_pkey" PRIMARY KEY (seqid);


--
-- Name: FracFocusReport_old_pkey; Type: CONSTRAINT; Schema: public; Owner: scraper; Tablespace: 
--

ALTER TABLE ONLY "FracFocusReport_old"
    ADD CONSTRAINT "FracFocusReport_old_pkey" PRIMARY KEY (seqid);


--
-- Name: FracFocusReport_pkey; Type: CONSTRAINT; Schema: public; Owner: scraper; Tablespace: 
--

ALTER TABLE ONLY "FracFocusReport"
    ADD CONSTRAINT "FracFocusReport_pkey" PRIMARY KEY (seqid);


--
-- Name: FracFocusScrape_pkey; Type: CONSTRAINT; Schema: public; Owner: scraper; Tablespace: 
--

ALTER TABLE ONLY "FracFocusScrape"
    ADD CONSTRAINT "FracFocusScrape_pkey" PRIMARY KEY (seqid);


--
-- Name: GeocodeCache_pkey; Type: CONSTRAINT; Schema: public; Owner: scraper; Tablespace: 
--

ALTER TABLE ONLY "GeocodeCache"
    ADD CONSTRAINT "GeocodeCache_pkey" PRIMARY KEY (_key);


--
-- Name: LA_Lease_Blocks_pkey; Type: CONSTRAINT; Schema: public; Owner: scraper; Tablespace: 
--

ALTER TABLE ONLY "LA_Lease_Blocks"
    ADD CONSTRAINT "LA_Lease_Blocks_pkey" PRIMARY KEY (id);


--
-- Name: LeaseBlockCentroid_pkey; Type: CONSTRAINT; Schema: public; Owner: scraper; Tablespace: 
--

ALTER TABLE ONLY "LeaseBlockCentroid"
    ADD CONSTRAINT "LeaseBlockCentroid_pkey" PRIMARY KEY (id);


--
-- Name: Nightfire_file_filename_key; Type: CONSTRAINT; Schema: public; Owner: scraper; Tablespace: 
--

ALTER TABLE ONLY "Nightfire_file"
    ADD CONSTRAINT "Nightfire_file_filename_key" UNIQUE (filename);


--
-- Name: Nightfire_file_pkey; Type: CONSTRAINT; Schema: public; Owner: scraper; Tablespace: 
--

ALTER TABLE ONLY "Nightfire_file"
    ADD CONSTRAINT "Nightfire_file_pkey" PRIMARY KEY (id);


--
-- Name: Nightfire_record_pkey; Type: CONSTRAINT; Schema: public; Owner: scraper; Tablespace: 
--

ALTER TABLE ONLY "Nightfire_record"
    ADD CONSTRAINT "Nightfire_record_pkey" PRIMARY KEY (file_num, "ID");


--
-- Name: NrcAnalysis_pkey; Type: CONSTRAINT; Schema: public; Owner: scraper; Tablespace: 
--

ALTER TABLE ONLY "NrcAnalysis"
    ADD CONSTRAINT "NrcAnalysis_pkey" PRIMARY KEY (reportnum);


--
-- Name: NrcGeocode_pkey; Type: CONSTRAINT; Schema: public; Owner: scraper; Tablespace: 
--

ALTER TABLE ONLY "NrcGeocode"
    ADD CONSTRAINT "NrcGeocode_pkey" PRIMARY KEY (reportnum, source);


--
-- Name: NrcMaterials_pkey; Type: CONSTRAINT; Schema: public; Owner: scraper; Tablespace: 
--

ALTER TABLE ONLY "NrcMaterials"
    ADD CONSTRAINT "NrcMaterials_pkey" PRIMARY KEY (id);


--
-- Name: NrcParsedReport_pkey; Type: CONSTRAINT; Schema: public; Owner: scraper; Tablespace: 
--

ALTER TABLE ONLY "NrcParsedReport"
    ADD CONSTRAINT "NrcParsedReport_pkey" PRIMARY KEY (reportnum);


--
-- Name: NrcScrapedFullReport_pkey; Type: CONSTRAINT; Schema: public; Owner: scraper; Tablespace: 
--

ALTER TABLE ONLY "NrcScrapedFullReport"
    ADD CONSTRAINT "NrcScrapedFullReport_pkey" PRIMARY KEY (reportnum);


--
-- Name: NrcScrapedMaterial_pkey; Type: CONSTRAINT; Schema: public; Owner: scraper; Tablespace: 
--

ALTER TABLE ONLY "NrcScrapedMaterial"
    ADD CONSTRAINT "NrcScrapedMaterial_pkey" PRIMARY KEY (reportnum, name);


--
-- Name: NrcScrapedReport_pkey; Type: CONSTRAINT; Schema: public; Owner: scraper; Tablespace: 
--

ALTER TABLE ONLY "NrcScrapedReport"
    ADD CONSTRAINT "NrcScrapedReport_pkey" PRIMARY KEY (reportnum);


--
-- Name: NrcScraperTarget_pkey; Type: CONSTRAINT; Schema: public; Owner: scraper; Tablespace: 
--

ALTER TABLE ONLY "NrcScraperTarget"
    ADD CONSTRAINT "NrcScraperTarget_pkey" PRIMARY KEY (id);


--
-- Name: NrcTag_pkey; Type: CONSTRAINT; Schema: public; Owner: scraper; Tablespace: 
--

ALTER TABLE ONLY "NrcTag"
    ADD CONSTRAINT "NrcTag_pkey" PRIMARY KEY (reportnum, tag);


--
-- Name: NrcUnits_pkey; Type: CONSTRAINT; Schema: public; Owner: scraper; Tablespace: 
--

ALTER TABLE ONLY "NrcUnits"
    ADD CONSTRAINT "NrcUnits_pkey" PRIMARY KEY (id);


--
-- Name: PA_DrillingPermit_pkey; Type: CONSTRAINT; Schema: public; Owner: scraper; Tablespace: 
--

ALTER TABLE ONLY "PA_DrillingPermit"
    ADD CONSTRAINT "PA_DrillingPermit_pkey" PRIMARY KEY (st_id);


--
-- Name: PA_Spud_copy_pkey; Type: CONSTRAINT; Schema: public; Owner: scraper; Tablespace: 
--

ALTER TABLE ONLY "PA_Spud_copy"
    ADD CONSTRAINT "PA_Spud_copy_pkey" PRIMARY KEY (st_id);


--
-- Name: PA_Spud_new_pkey; Type: CONSTRAINT; Schema: public; Owner: scraper; Tablespace: 
--

ALTER TABLE ONLY "PA_Spud_new"
    ADD CONSTRAINT "PA_Spud_new_pkey" PRIMARY KEY (st_id);


--
-- Name: PA_Spud_pkey; Type: CONSTRAINT; Schema: public; Owner: scraper; Tablespace: 
--

ALTER TABLE ONLY "PA_Spud"
    ADD CONSTRAINT "PA_Spud_pkey" PRIMARY KEY (st_id);


--
-- Name: PA_Violation_pkey; Type: CONSTRAINT; Schema: public; Owner: scraper; Tablespace: 
--

ALTER TABLE ONLY "PA_Violation"
    ADD CONSTRAINT "PA_Violation_pkey" PRIMARY KEY (st_id);


--
-- Name: PublishedFeedItems_pkey; Type: CONSTRAINT; Schema: public; Owner: scraper; Tablespace: 
--

ALTER TABLE ONLY "PublishedFeedItems"
    ADD CONSTRAINT "PublishedFeedItems_pkey" PRIMARY KEY (id);


--
-- Name: RSSEmailSubscription_pkey; Type: CONSTRAINT; Schema: public; Owner: scraper; Tablespace: 
--

ALTER TABLE ONLY "RSSEmailSubscription"
    ADD CONSTRAINT "RSSEmailSubscription_pkey" PRIMARY KEY (id);


--
-- Name: RssFeedItem_pkey; Type: CONSTRAINT; Schema: public; Owner: scraper; Tablespace: 
--

ALTER TABLE ONLY "RssFeedItem"
    ADD CONSTRAINT "RssFeedItem_pkey" PRIMARY KEY (item_id);


--
-- Name: RssFeed_pkey; Type: CONSTRAINT; Schema: public; Owner: scraper; Tablespace: 
--

ALTER TABLE ONLY "RssFeed"
    ADD CONSTRAINT "RssFeed_pkey" PRIMARY KEY (id);


--
-- Name: WV_DrillingPermit_pkey; Type: CONSTRAINT; Schema: public; Owner: scraper; Tablespace: 
--

ALTER TABLE ONLY "WV_DrillingPermit"
    ADD CONSTRAINT "WV_DrillingPermit_pkey" PRIMARY KEY (st_id);


--
-- Name: appomatic_mapdata_ais_pkey; Type: CONSTRAINT; Schema: public; Owner: scraper; Tablespace: 
--

ALTER TABLE ONLY appomatic_mapdata_ais
    ADD CONSTRAINT appomatic_mapdata_ais_pkey PRIMARY KEY (id);


--
-- Name: appomatic_mapdata_aispath_pkey; Type: CONSTRAINT; Schema: public; Owner: scraper; Tablespace: 
--

ALTER TABLE ONLY appomatic_mapdata_aispath
    ADD CONSTRAINT appomatic_mapdata_aispath_pkey PRIMARY KEY (id);


--
-- Name: appomatic_mapdata_vessel_mmsi_key; Type: CONSTRAINT; Schema: public; Owner: scraper; Tablespace: 
--

ALTER TABLE ONLY appomatic_mapdata_vessel
    ADD CONSTRAINT appomatic_mapdata_vessel_mmsi_key UNIQUE (mmsi);


--
-- Name: appomatic_mapdata_vessel_pkey; Type: CONSTRAINT; Schema: public; Owner: scraper; Tablespace: 
--

ALTER TABLE ONLY appomatic_mapdata_vessel
    ADD CONSTRAINT appomatic_mapdata_vessel_pkey PRIMARY KEY (id);


--
-- Name: appomatic_mapimport_downloaded_pkey; Type: CONSTRAINT; Schema: public; Owner: scraper; Tablespace: 
--

ALTER TABLE ONLY appomatic_mapimport_downloaded
    ADD CONSTRAINT appomatic_mapimport_downloaded_pkey PRIMARY KEY (id);


--
-- Name: appomatic_mapimport_downloaded_src_filename_key; Type: CONSTRAINT; Schema: public; Owner: scraper; Tablespace: 
--

ALTER TABLE ONLY appomatic_mapimport_downloaded
    ADD CONSTRAINT appomatic_mapimport_downloaded_src_filename_key UNIQUE (src, filename);


--
-- Name: appomatic_nrccluster_cluster_pkey; Type: CONSTRAINT; Schema: public; Owner: scraper; Tablespace: 
--

ALTER TABLE ONLY appomatic_nrccluster_cluster
    ADD CONSTRAINT appomatic_nrccluster_cluster_pkey PRIMARY KEY (id);


--
-- Name: appomatic_nrccluster_nrcreport_pkey; Type: CONSTRAINT; Schema: public; Owner: scraper; Tablespace: 
--

ALTER TABLE ONLY appomatic_nrccluster_nrcreport
    ADD CONSTRAINT appomatic_nrccluster_nrcreport_pkey PRIMARY KEY (id);


--
-- Name: auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: scraper; Tablespace: 
--

ALTER TABLE ONLY auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions_group_id_permission_id_key; Type: CONSTRAINT; Schema: public; Owner: scraper; Tablespace: 
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_key UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: scraper; Tablespace: 
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: scraper; Tablespace: 
--

ALTER TABLE ONLY auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission_content_type_id_codename_key; Type: CONSTRAINT; Schema: public; Owner: scraper; Tablespace: 
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_key UNIQUE (content_type_id, codename);


--
-- Name: auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: scraper; Tablespace: 
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: scraper; Tablespace: 
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups_user_id_group_id_key; Type: CONSTRAINT; Schema: public; Owner: scraper; Tablespace: 
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_group_id_key UNIQUE (user_id, group_id);


--
-- Name: auth_user_pkey; Type: CONSTRAINT; Schema: public; Owner: scraper; Tablespace: 
--

ALTER TABLE ONLY auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: scraper; Tablespace: 
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions_user_id_permission_id_key; Type: CONSTRAINT; Schema: public; Owner: scraper; Tablespace: 
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_permission_id_key UNIQUE (user_id, permission_id);


--
-- Name: auth_user_username_key; Type: CONSTRAINT; Schema: public; Owner: scraper; Tablespace: 
--

ALTER TABLE ONLY auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);


--
-- Name: django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: scraper; Tablespace: 
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_comment_flags_pkey; Type: CONSTRAINT; Schema: public; Owner: scraper; Tablespace: 
--

ALTER TABLE ONLY django_comment_flags
    ADD CONSTRAINT django_comment_flags_pkey PRIMARY KEY (id);


--
-- Name: django_comment_flags_user_id_comment_id_flag_key; Type: CONSTRAINT; Schema: public; Owner: scraper; Tablespace: 
--

ALTER TABLE ONLY django_comment_flags
    ADD CONSTRAINT django_comment_flags_user_id_comment_id_flag_key UNIQUE (user_id, comment_id, flag);


--
-- Name: django_comments_pkey; Type: CONSTRAINT; Schema: public; Owner: scraper; Tablespace: 
--

ALTER TABLE ONLY django_comments
    ADD CONSTRAINT django_comments_pkey PRIMARY KEY (id);


--
-- Name: django_content_type_app_label_model_key; Type: CONSTRAINT; Schema: public; Owner: scraper; Tablespace: 
--

ALTER TABLE ONLY django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_key UNIQUE (app_label, model);


--
-- Name: django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: scraper; Tablespace: 
--

ALTER TABLE ONLY django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: scraper; Tablespace: 
--

ALTER TABLE ONLY django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: django_site_pkey; Type: CONSTRAINT; Schema: public; Owner: scraper; Tablespace: 
--

ALTER TABLE ONLY django_site
    ADD CONSTRAINT django_site_pkey PRIMARY KEY (id);


--
-- Name: spatial_ref_sys_pkey; Type: CONSTRAINT; Schema: public; Owner: scraper; Tablespace: 
--

ALTER TABLE ONLY spatial_ref_sys
    ADD CONSTRAINT spatial_ref_sys_pkey PRIMARY KEY (srid);


--
-- Name: temp_FSU_SAR_FOOTPRINTS_pkey; Type: CONSTRAINT; Schema: public; Owner: scraper; Tablespace: 
--

ALTER TABLE ONLY "temp_FSU_SAR_FOOTPRINTS"
    ADD CONSTRAINT "temp_FSU_SAR_FOOTPRINTS_pkey" PRIMARY KEY ("GranuleName");


--
-- Name: temp_material_pkey; Type: CONSTRAINT; Schema: public; Owner: scraper; Tablespace: 
--

ALTER TABLE ONLY temp_material
    ADD CONSTRAINT temp_material_pkey PRIMARY KEY (id);


SET search_path = scraper, pg_catalog;

--
-- Name: Alegheny_Forest_PA_pkey; Type: CONSTRAINT; Schema: scraper; Owner: scraper; Tablespace: 
--

ALTER TABLE ONLY "Alegheny_Forest_PA"
    ADD CONSTRAINT "Alegheny_Forest_PA_pkey" PRIMARY KEY (gid);


--
-- Name: GOMPolygon_drawn_pkey; Type: CONSTRAINT; Schema: scraper; Owner: scraper; Tablespace: 
--

ALTER TABLE ONLY "GOMPolygon_drawn"
    ADD CONSTRAINT "GOMPolygon_drawn_pkey" PRIMARY KEY (gid);


--
-- Name: HUC10_Monongahela_pkey; Type: CONSTRAINT; Schema: scraper; Owner: scraper; Tablespace: 
--

ALTER TABLE ONLY "HUC10_Monongahela"
    ADD CONSTRAINT "HUC10_Monongahela_pkey" PRIMARY KEY (gid2);


--
-- Name: Monongahela_HUC6_Watershed_pkey; Type: CONSTRAINT; Schema: scraper; Owner: scraper; Tablespace: 
--

ALTER TABLE ONLY "Monongahela_HUC6_Watershed"
    ADD CONSTRAINT "Monongahela_HUC6_Watershed_pkey" PRIMARY KEY (gid2);


--
-- Name: Monongahela_HUC8_watersheds_pkey; Type: CONSTRAINT; Schema: scraper; Owner: scraper; Tablespace: 
--

ALTER TABLE ONLY "Monongahela_HUC8_watersheds"
    ADD CONSTRAINT "Monongahela_HUC8_watersheds_pkey" PRIMARY KEY (gid2);


--
-- Name: PaCounty2011_01_pkey; Type: CONSTRAINT; Schema: scraper; Owner: scraper; Tablespace: 
--

ALTER TABLE ONLY "PaCounty2011_01"
    ADD CONSTRAINT "PaCounty2011_01_pkey" PRIMARY KEY (gid);


--
-- Name: PaState2011_01_pkey; Type: CONSTRAINT; Schema: scraper; Owner: scraper; Tablespace: 
--

ALTER TABLE ONLY "PaState2011_01"
    ADD CONSTRAINT "PaState2011_01_pkey" PRIMARY KEY (gid);


--
-- Name: appomatic_mapcluster_cluster_pkey; Type: CONSTRAINT; Schema: scraper; Owner: scraper; Tablespace: 
--

ALTER TABLE ONLY appomatic_mapcluster_cluster
    ADD CONSTRAINT appomatic_mapcluster_cluster_pkey PRIMARY KEY (id);


--
-- Name: appomatic_mapcluster_query_pkey; Type: CONSTRAINT; Schema: scraper; Owner: scraper; Tablespace: 
--

ALTER TABLE ONLY appomatic_mapcluster_query
    ADD CONSTRAINT appomatic_mapcluster_query_pkey PRIMARY KEY (id);


--
-- Name: appomatic_mapdata_sar_pkey; Type: CONSTRAINT; Schema: scraper; Owner: scraper; Tablespace: 
--

ALTER TABLE ONLY appomatic_mapdata_sar
    ADD CONSTRAINT appomatic_mapdata_sar_pkey PRIMARY KEY (id);


--
-- Name: appomatic_mapdata_viirs_pkey; Type: CONSTRAINT; Schema: scraper; Owner: scraper; Tablespace: 
--

ALTER TABLE ONLY appomatic_mapdata_viirs
    ADD CONSTRAINT appomatic_mapdata_viirs_pkey PRIMARY KEY (id);


--
-- Name: appomatic_mapdelta_event_pkey; Type: CONSTRAINT; Schema: scraper; Owner: scraper; Tablespace: 
--

ALTER TABLE ONLY appomatic_mapdelta_event
    ADD CONSTRAINT appomatic_mapdelta_event_pkey PRIMARY KEY (id);


--
-- Name: appomatic_mapdelta_grouping_pkey; Type: CONSTRAINT; Schema: scraper; Owner: scraper; Tablespace: 
--

ALTER TABLE ONLY appomatic_mapdelta_grouping
    ADD CONSTRAINT appomatic_mapdelta_grouping_pkey PRIMARY KEY (id);


--
-- Name: appomatic_mapserver_application_name_key; Type: CONSTRAINT; Schema: scraper; Owner: scraper; Tablespace: 
--

ALTER TABLE ONLY appomatic_mapserver_application
    ADD CONSTRAINT appomatic_mapserver_application_name_key UNIQUE (name);


--
-- Name: appomatic_mapserver_application_pkey; Type: CONSTRAINT; Schema: scraper; Owner: scraper; Tablespace: 
--

ALTER TABLE ONLY appomatic_mapserver_application
    ADD CONSTRAINT appomatic_mapserver_application_pkey PRIMARY KEY (slug);


--
-- Name: appomatic_mapserver_layer_name_key; Type: CONSTRAINT; Schema: scraper; Owner: scraper; Tablespace: 
--

ALTER TABLE ONLY appomatic_mapserver_layer
    ADD CONSTRAINT appomatic_mapserver_layer_name_key UNIQUE (name);


--
-- Name: appomatic_mapserver_layer_pkey; Type: CONSTRAINT; Schema: scraper; Owner: scraper; Tablespace: 
--

ALTER TABLE ONLY appomatic_mapserver_layer
    ADD CONSTRAINT appomatic_mapserver_layer_pkey PRIMARY KEY (slug);


--
-- Name: appomatic_websitebase_profile_pkey; Type: CONSTRAINT; Schema: scraper; Owner: scraper; Tablespace: 
--

ALTER TABLE ONLY appomatic_websitebase_profile
    ADD CONSTRAINT appomatic_websitebase_profile_pkey PRIMARY KEY (id);


--
-- Name: appomatic_websitebase_profile_user_id_key; Type: CONSTRAINT; Schema: scraper; Owner: scraper; Tablespace: 
--

ALTER TABLE ONLY appomatic_websitebase_profile
    ADD CONSTRAINT appomatic_websitebase_profile_user_id_key UNIQUE (user_id);


--
-- Name: countyBoundary_censusAndUSGS_200503_utm83_pkey; Type: CONSTRAINT; Schema: scraper; Owner: scraper; Tablespace: 
--

ALTER TABLE ONLY "WVCounty2005_03"
    ADD CONSTRAINT "countyBoundary_censusAndUSGS_200503_utm83_pkey" PRIMARY KEY (gid);


--
-- Name: easy_thumbnails_source_pkey; Type: CONSTRAINT; Schema: scraper; Owner: scraper; Tablespace: 
--

ALTER TABLE ONLY easy_thumbnails_source
    ADD CONSTRAINT easy_thumbnails_source_pkey PRIMARY KEY (id);


--
-- Name: easy_thumbnails_source_storage_hash_name_key; Type: CONSTRAINT; Schema: scraper; Owner: scraper; Tablespace: 
--

ALTER TABLE ONLY easy_thumbnails_source
    ADD CONSTRAINT easy_thumbnails_source_storage_hash_name_key UNIQUE (storage_hash, name);


--
-- Name: easy_thumbnails_thumbnail_pkey; Type: CONSTRAINT; Schema: scraper; Owner: scraper; Tablespace: 
--

ALTER TABLE ONLY easy_thumbnails_thumbnail
    ADD CONSTRAINT easy_thumbnails_thumbnail_pkey PRIMARY KEY (id);


--
-- Name: easy_thumbnails_thumbnail_storage_hash_name_source_id_key; Type: CONSTRAINT; Schema: scraper; Owner: scraper; Tablespace: 
--

ALTER TABLE ONLY easy_thumbnails_thumbnail
    ADD CONSTRAINT easy_thumbnails_thumbnail_storage_hash_name_source_id_key UNIQUE (storage_hash, name, source_id);


--
-- Name: feedsource_id; Type: CONSTRAINT; Schema: scraper; Owner: scraper; Tablespace: 
--

ALTER TABLE ONLY feedsource
    ADD CONSTRAINT feedsource_id PRIMARY KEY (id);


--
-- Name: guardian_groupobjectpermissio_group_id_permission_id_object_key; Type: CONSTRAINT; Schema: scraper; Owner: scraper; Tablespace: 
--

ALTER TABLE ONLY guardian_groupobjectpermission
    ADD CONSTRAINT guardian_groupobjectpermissio_group_id_permission_id_object_key UNIQUE (group_id, permission_id, object_pk);


--
-- Name: guardian_groupobjectpermission_pkey; Type: CONSTRAINT; Schema: scraper; Owner: scraper; Tablespace: 
--

ALTER TABLE ONLY guardian_groupobjectpermission
    ADD CONSTRAINT guardian_groupobjectpermission_pkey PRIMARY KEY (id);


--
-- Name: guardian_userobjectpermission_pkey; Type: CONSTRAINT; Schema: scraper; Owner: scraper; Tablespace: 
--

ALTER TABLE ONLY guardian_userobjectpermission
    ADD CONSTRAINT guardian_userobjectpermission_pkey PRIMARY KEY (id);


--
-- Name: guardian_userobjectpermission_user_id_permission_id_object__key; Type: CONSTRAINT; Schema: scraper; Owner: scraper; Tablespace: 
--

ALTER TABLE ONLY guardian_userobjectpermission
    ADD CONSTRAINT guardian_userobjectpermission_user_id_permission_id_object__key UNIQUE (user_id, permission_id, object_pk);


--
-- Name: region_pkey; Type: CONSTRAINT; Schema: scraper; Owner: scraper; Tablespace: 
--

ALTER TABLE ONLY region
    ADD CONSTRAINT region_pkey PRIMARY KEY (id);


--
-- Name: satimage_aoi_pkey; Type: CONSTRAINT; Schema: scraper; Owner: scraper; Tablespace: 
--

ALTER TABLE ONLY satimage_aoi
    ADD CONSTRAINT satimage_aoi_pkey PRIMARY KEY (id);


--
-- Name: satimage_pkey; Type: CONSTRAINT; Schema: scraper; Owner: scraper; Tablespace: 
--

ALTER TABLE ONLY satimage
    ADD CONSTRAINT satimage_pkey PRIMARY KEY (id);


--
-- Name: tl_2010_us_state10_pkey; Type: CONSTRAINT; Schema: scraper; Owner: scraper; Tablespace: 
--

ALTER TABLE ONLY tl_2010_us_state10
    ADD CONSTRAINT tl_2010_us_state10_pkey PRIMARY KEY (gid);


--
-- Name: userena_userenasignup_pkey; Type: CONSTRAINT; Schema: scraper; Owner: scraper; Tablespace: 
--

ALTER TABLE ONLY userena_userenasignup
    ADD CONSTRAINT userena_userenasignup_pkey PRIMARY KEY (id);


--
-- Name: userena_userenasignup_user_id_key; Type: CONSTRAINT; Schema: scraper; Owner: scraper; Tablespace: 
--

ALTER TABLE ONLY userena_userenasignup
    ADD CONSTRAINT userena_userenasignup_user_id_key UNIQUE (user_id);


--
-- Name: wvStateBoundary100k_USGS_200203_ll83_pkey; Type: CONSTRAINT; Schema: scraper; Owner: scraper; Tablespace: 
--

ALTER TABLE ONLY "wvStateBoundary100k_USGS_200203_ll83"
    ADD CONSTRAINT "wvStateBoundary100k_USGS_200203_ll83_pkey" PRIMARY KEY (gid);


SET search_path = public, pg_catalog;

--
-- Name: AC_LAB; Type: INDEX; Schema: public; Owner: scraper; Tablespace: 
--

CREATE INDEX "AC_LAB" ON "DEFUNCT_BlockCentroidNew" USING btree ("AC_LAB");


--
-- Name: API_DATE; Type: INDEX; Schema: public; Owner: scraper; Tablespace: 
--

CREATE UNIQUE INDEX "API_DATE" ON "PA_Spud_new" USING btree ("Well_API__", "SPUD_Date");


--
-- Name: AREA_CODE; Type: INDEX; Schema: public; Owner: scraper; Tablespace: 
--

CREATE INDEX "AREA_CODE" ON "DEFUNCT_BlockCentroid" USING btree ("AREA_CODE");


--
-- Name: BLOCK_NUMB; Type: INDEX; Schema: public; Owner: scraper; Tablespace: 
--

CREATE INDEX "BLOCK_NUMB" ON "DEFUNCT_BlockCentroid" USING btree ("BLOCK_NUMB");


--
-- Name: Nightfire_record_Lat_GMTCO; Type: INDEX; Schema: public; Owner: scraper; Tablespace: 
--

CREATE INDEX "Nightfire_record_Lat_GMTCO" ON "Nightfire_record" USING btree ("Lat_GMTCO");


--
-- Name: Nightfire_record_Lon_GMTCO; Type: INDEX; Schema: public; Owner: scraper; Tablespace: 
--

CREATE INDEX "Nightfire_record_Lon_GMTCO" ON "Nightfire_record" USING btree ("Lon_GMTCO");


--
-- Name: ViolationID; Type: INDEX; Schema: public; Owner: scraper; Tablespace: 
--

CREATE UNIQUE INDEX "ViolationID" ON "PA_Violation" USING btree ("ViolationID");


--
-- Name: activity_date; Type: INDEX; Schema: public; Owner: scraper; Tablespace: 
--

CREATE INDEX activity_date ON "WV_DrillingPermit" USING btree (permit_activity_date);


--
-- Name: ais_location_idx; Type: INDEX; Schema: public; Owner: scraper; Tablespace: 
--

CREATE INDEX ais_location_idx ON ais USING gist (location);


--
-- Name: ais_mmsi_datetime; Type: INDEX; Schema: public; Owner: scraper; Tablespace: 
--

CREATE UNIQUE INDEX ais_mmsi_datetime ON ais USING btree (mmsi, datetime);


--
-- Name: ais_seqid; Type: INDEX; Schema: public; Owner: scraper; Tablespace: 
--

CREATE UNIQUE INDEX ais_seqid ON ais USING btree (seqid);

ALTER TABLE ais CLUSTER ON ais_seqid;


--
-- Name: api_date_row; Type: INDEX; Schema: public; Owner: scraper; Tablespace: 
--

CREATE UNIQUE INDEX api_date_row ON "FracFocusReportChemical" USING btree (api, fracture_date, "row");


--
-- Name: api_job_date; Type: INDEX; Schema: public; Owner: scraper; Tablespace: 
--

CREATE UNIQUE INDEX api_job_date ON "FracFocusScrape" USING btree (api, job_date);


--
-- Name: api_type_date; Type: INDEX; Schema: public; Owner: scraper; Tablespace: 
--

CREATE UNIQUE INDEX api_type_date ON "WV_DrillingPermit" USING btree ("API", permit_activity_type, permit_activity_date);


--
-- Name: appomatic_mapdata_ais_datetime; Type: INDEX; Schema: public; Owner: scraper; Tablespace: 
--

CREATE INDEX appomatic_mapdata_ais_datetime ON appomatic_mapdata_ais USING btree (datetime);


--
-- Name: appomatic_mapdata_ais_latitude; Type: INDEX; Schema: public; Owner: scraper; Tablespace: 
--

CREATE INDEX appomatic_mapdata_ais_latitude ON appomatic_mapdata_ais USING btree (latitude);


--
-- Name: appomatic_mapdata_ais_location; Type: INDEX; Schema: public; Owner: scraper; Tablespace: 
--

CREATE INDEX appomatic_mapdata_ais_location ON appomatic_mapdata_ais USING btree (location);


--
-- Name: appomatic_mapdata_ais_location_id; Type: INDEX; Schema: public; Owner: scraper; Tablespace: 
--

CREATE INDEX appomatic_mapdata_ais_location_id ON appomatic_mapdata_ais USING gist (location);


--
-- Name: appomatic_mapdata_ais_longitude; Type: INDEX; Schema: public; Owner: scraper; Tablespace: 
--

CREATE INDEX appomatic_mapdata_ais_longitude ON appomatic_mapdata_ais USING btree (longitude);


--
-- Name: appomatic_mapdata_ais_quality; Type: INDEX; Schema: public; Owner: scraper; Tablespace: 
--

CREATE INDEX appomatic_mapdata_ais_quality ON appomatic_mapdata_ais USING btree (quality);


--
-- Name: appomatic_mapdata_ais_src; Type: INDEX; Schema: public; Owner: scraper; Tablespace: 
--

CREATE INDEX appomatic_mapdata_ais_src ON appomatic_mapdata_ais USING btree (src);


--
-- Name: appomatic_mapdata_ais_src_like; Type: INDEX; Schema: public; Owner: scraper; Tablespace: 
--

CREATE INDEX appomatic_mapdata_ais_src_like ON appomatic_mapdata_ais USING btree (src varchar_pattern_ops);


--
-- Name: appomatic_mapdata_ais_vessel_id; Type: INDEX; Schema: public; Owner: scraper; Tablespace: 
--

CREATE INDEX appomatic_mapdata_ais_vessel_id ON appomatic_mapdata_ais USING btree (vessel_id);


--
-- Name: appomatic_mapdata_aispath_line_id; Type: INDEX; Schema: public; Owner: scraper; Tablespace: 
--

CREATE INDEX appomatic_mapdata_aispath_line_id ON appomatic_mapdata_aispath USING gist (line);


--
-- Name: appomatic_mapdata_aispath_vessel_id; Type: INDEX; Schema: public; Owner: scraper; Tablespace: 
--

CREATE INDEX appomatic_mapdata_aispath_vessel_id ON appomatic_mapdata_aispath USING btree (vessel_id);


--
-- Name: appomatic_mapdata_vessel_mmsi_like; Type: INDEX; Schema: public; Owner: scraper; Tablespace: 
--

CREATE INDEX appomatic_mapdata_vessel_mmsi_like ON appomatic_mapdata_vessel USING btree (mmsi varchar_pattern_ops);


--
-- Name: appomatic_mapdata_vessel_src; Type: INDEX; Schema: public; Owner: scraper; Tablespace: 
--

CREATE INDEX appomatic_mapdata_vessel_src ON appomatic_mapdata_vessel USING btree (src);


--
-- Name: appomatic_mapdata_vessel_src_like; Type: INDEX; Schema: public; Owner: scraper; Tablespace: 
--

CREATE INDEX appomatic_mapdata_vessel_src_like ON appomatic_mapdata_vessel USING btree (src varchar_pattern_ops);


--
-- Name: appomatic_nrccluster_cluster_buffer; Type: INDEX; Schema: public; Owner: scraper; Tablespace: 
--

CREATE INDEX appomatic_nrccluster_cluster_buffer ON appomatic_nrccluster_cluster USING btree (buffer);


--
-- Name: appomatic_nrccluster_cluster_buffer_id; Type: INDEX; Schema: public; Owner: scraper; Tablespace: 
--

CREATE INDEX appomatic_nrccluster_cluster_buffer_id ON appomatic_nrccluster_cluster USING gist (buffer);


--
-- Name: appomatic_nrccluster_cluster_location; Type: INDEX; Schema: public; Owner: scraper; Tablespace: 
--

CREATE INDEX appomatic_nrccluster_cluster_location ON appomatic_nrccluster_cluster USING btree (location);


--
-- Name: appomatic_nrccluster_cluster_location_id; Type: INDEX; Schema: public; Owner: scraper; Tablespace: 
--

CREATE INDEX appomatic_nrccluster_cluster_location_id ON appomatic_nrccluster_cluster USING gist (location);


--
-- Name: appomatic_nrccluster_nrcreport_location; Type: INDEX; Schema: public; Owner: scraper; Tablespace: 
--

CREATE INDEX appomatic_nrccluster_nrcreport_location ON appomatic_nrccluster_nrcreport USING btree (location);


--
-- Name: appomatic_nrccluster_nrcreport_location_id; Type: INDEX; Schema: public; Owner: scraper; Tablespace: 
--

CREATE INDEX appomatic_nrccluster_nrcreport_location_id ON appomatic_nrccluster_nrcreport USING gist (location);


--
-- Name: area_block; Type: INDEX; Schema: public; Owner: scraper; Tablespace: 
--

CREATE INDEX area_block ON "NrcParsedReport" USING btree (areaid, blockid);


--
-- Name: areaid_blockid; Type: INDEX; Schema: public; Owner: scraper; Tablespace: 
--

CREATE INDEX areaid_blockid ON "LeaseBlockCentroid" USING btree (areaid, blockid);


--
-- Name: auth_group_name_like; Type: INDEX; Schema: public; Owner: scraper; Tablespace: 
--

CREATE INDEX auth_group_name_like ON auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_group_id; Type: INDEX; Schema: public; Owner: scraper; Tablespace: 
--

CREATE INDEX auth_group_permissions_group_id ON auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_permission_id; Type: INDEX; Schema: public; Owner: scraper; Tablespace: 
--

CREATE INDEX auth_group_permissions_permission_id ON auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_content_type_id; Type: INDEX; Schema: public; Owner: scraper; Tablespace: 
--

CREATE INDEX auth_permission_content_type_id ON auth_permission USING btree (content_type_id);


--
-- Name: auth_user_groups_group_id; Type: INDEX; Schema: public; Owner: scraper; Tablespace: 
--

CREATE INDEX auth_user_groups_group_id ON auth_user_groups USING btree (group_id);


--
-- Name: auth_user_groups_user_id; Type: INDEX; Schema: public; Owner: scraper; Tablespace: 
--

CREATE INDEX auth_user_groups_user_id ON auth_user_groups USING btree (user_id);


--
-- Name: auth_user_user_permissions_permission_id; Type: INDEX; Schema: public; Owner: scraper; Tablespace: 
--

CREATE INDEX auth_user_user_permissions_permission_id ON auth_user_user_permissions USING btree (permission_id);


--
-- Name: auth_user_user_permissions_user_id; Type: INDEX; Schema: public; Owner: scraper; Tablespace: 
--

CREATE INDEX auth_user_user_permissions_user_id ON auth_user_user_permissions USING btree (user_id);


--
-- Name: auth_user_username_like; Type: INDEX; Schema: public; Owner: scraper; Tablespace: 
--

CREATE INDEX auth_user_username_like ON auth_user USING btree (username varchar_pattern_ops);


--
-- Name: bot_status; Type: INDEX; Schema: public; Owner: scraper; Tablespace: 
--

CREATE INDEX bot_status ON "BotTaskStatus" USING btree (bot, status);


--
-- Name: cas_number; Type: INDEX; Schema: public; Owner: scraper; Tablespace: 
--

CREATE INDEX cas_number ON "FracFocusReportChemical" USING btree (cas_number);


--
-- Name: cas_type; Type: INDEX; Schema: public; Owner: scraper; Tablespace: 
--

CREATE INDEX cas_type ON "FracFocusReportChemical" USING btree (cas_type);


--
-- Name: description; Type: INDEX; Schema: public; Owner: scraper; Tablespace: 
--

CREATE INDEX description ON "NrcScrapedReport" USING btree (description);


--
-- Name: django_admin_log_content_type_id; Type: INDEX; Schema: public; Owner: scraper; Tablespace: 
--

CREATE INDEX django_admin_log_content_type_id ON django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_user_id; Type: INDEX; Schema: public; Owner: scraper; Tablespace: 
--

CREATE INDEX django_admin_log_user_id ON django_admin_log USING btree (user_id);


--
-- Name: django_comment_flags_comment_id; Type: INDEX; Schema: public; Owner: scraper; Tablespace: 
--

CREATE INDEX django_comment_flags_comment_id ON django_comment_flags USING btree (comment_id);


--
-- Name: django_comment_flags_flag; Type: INDEX; Schema: public; Owner: scraper; Tablespace: 
--

CREATE INDEX django_comment_flags_flag ON django_comment_flags USING btree (flag);


--
-- Name: django_comment_flags_flag_like; Type: INDEX; Schema: public; Owner: scraper; Tablespace: 
--

CREATE INDEX django_comment_flags_flag_like ON django_comment_flags USING btree (flag varchar_pattern_ops);


--
-- Name: django_comment_flags_user_id; Type: INDEX; Schema: public; Owner: scraper; Tablespace: 
--

CREATE INDEX django_comment_flags_user_id ON django_comment_flags USING btree (user_id);


--
-- Name: django_comments_content_type_id; Type: INDEX; Schema: public; Owner: scraper; Tablespace: 
--

CREATE INDEX django_comments_content_type_id ON django_comments USING btree (content_type_id);


--
-- Name: django_comments_site_id; Type: INDEX; Schema: public; Owner: scraper; Tablespace: 
--

CREATE INDEX django_comments_site_id ON django_comments USING btree (site_id);


--
-- Name: django_comments_user_id; Type: INDEX; Schema: public; Owner: scraper; Tablespace: 
--

CREATE INDEX django_comments_user_id ON django_comments USING btree (user_id);


--
-- Name: django_session_expire_date; Type: INDEX; Schema: public; Owner: scraper; Tablespace: 
--

CREATE INDEX django_session_expire_date ON django_session USING btree (expire_date);


--
-- Name: django_session_session_key_like; Type: INDEX; Schema: public; Owner: scraper; Tablespace: 
--

CREATE INDEX django_session_session_key_like ON django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: doc_num_index; Type: INDEX; Schema: public; Owner: scraper; Tablespace: 
--

CREATE INDEX doc_num_index ON "CogisSpill" USING btree (doc_num);


--
-- Name: feed_entry_source; Type: INDEX; Schema: public; Owner: scraper; Tablespace: 
--

CREATE INDEX feed_entry_source ON feedentry_ewn2 USING btree (source_id, published);


--
-- Name: feedentry_ewn2_id; Type: INDEX; Schema: public; Owner: scraper; Tablespace: 
--

CREATE UNIQUE INDEX feedentry_ewn2_id ON feedentry_ewn2 USING btree (id);


--
-- Name: feedentry_ewn2_incident_datetime; Type: INDEX; Schema: public; Owner: scraper; Tablespace: 
--

CREATE INDEX feedentry_ewn2_incident_datetime ON feedentry_ewn2 USING btree (incident_datetime DESC);


--
-- Name: feedentry_ewn2_latlng; Type: INDEX; Schema: public; Owner: scraper; Tablespace: 
--

CREATE INDEX feedentry_ewn2_latlng ON feedentry_ewn2 USING btree (lat, lng);


--
-- Name: feedentry_ewn2_published; Type: INDEX; Schema: public; Owner: scraper; Tablespace: 
--

CREATE INDEX feedentry_ewn2_published ON feedentry_ewn2 USING btree (published DESC);


--
-- Name: feedentry_ewn2_regions; Type: INDEX; Schema: public; Owner: scraper; Tablespace: 
--

CREATE INDEX feedentry_ewn2_regions ON feedentry_ewn2 USING gin (regions);


--
-- Name: feedentry_ewn2_tags; Type: INDEX; Schema: public; Owner: scraper; Tablespace: 
--

CREATE INDEX feedentry_ewn2_tags ON feedentry_ewn2 USING gin (tags);


--
-- Name: ft_id; Type: INDEX; Schema: public; Owner: scraper; Tablespace: 
--

CREATE INDEX ft_id ON "WV_DrillingPermit" USING btree (ft_id);


--
-- Name: id; Type: INDEX; Schema: public; Owner: scraper; Tablespace: 
--

CREATE INDEX id ON "FeedEntryTag" USING btree (feed_entry_id);


--
-- Name: idcogisspill_UNIQUE; Type: INDEX; Schema: public; Owner: scraper; Tablespace: 
--

CREATE UNIQUE INDEX "idcogisspill_UNIQUE" ON "CogisSpill" USING btree (st_id);


--
-- Name: incident_datetime; Type: INDEX; Schema: public; Owner: scraper; Tablespace: 
--

CREATE INDEX incident_datetime ON "NrcScrapedReport" USING btree (incident_datetime);


--
-- Name: lat_lng; Type: INDEX; Schema: public; Owner: scraper; Tablespace: 
--

CREATE INDEX lat_lng ON "NrcGeocode" USING btree (lat, lng);


--
-- Name: material_name; Type: INDEX; Schema: public; Owner: scraper; Tablespace: 
--

CREATE INDEX material_name ON "NrcScrapedReport" USING btree (material_name);


--
-- Name: name; Type: INDEX; Schema: public; Owner: scraper; Tablespace: 
--

CREATE INDEX name ON "NrcScrapedMaterial" USING btree (name);


--
-- Name: pattern; Type: INDEX; Schema: public; Owner: scraper; Tablespace: 
--

CREATE INDEX pattern ON "AreaCodeMap" USING btree (pattern);


--
-- Name: pdf_seqid; Type: INDEX; Schema: public; Owner: scraper; Tablespace: 
--

CREATE INDEX pdf_seqid ON "FracFocusReport" USING btree (pdf_seqid);


--
-- Name: permit_activity_type; Type: INDEX; Schema: public; Owner: scraper; Tablespace: 
--

CREATE INDEX permit_activity_type ON "WV_DrillingPermit" USING btree (permit_activity_type);


--
-- Name: permit_type; Type: INDEX; Schema: public; Owner: scraper; Tablespace: 
--

CREATE INDEX permit_type ON "WV_DrillingPermit" USING btree (permit_type);


--
-- Name: published; Type: INDEX; Schema: public; Owner: scraper; Tablespace: 
--

CREATE UNIQUE INDEX published ON "DEFUNCT_FeedEntry" USING btree (published, published_seq);


--
-- Name: report_seqid; Type: INDEX; Schema: public; Owner: scraper; Tablespace: 
--

CREATE INDEX report_seqid ON "FracFocusReportChemical" USING btree (pdf_seqid);


--
-- Name: reportnum; Type: INDEX; Schema: public; Owner: scraper; Tablespace: 
--

CREATE INDEX reportnum ON "NrcTag" USING btree (reportnum);


--
-- Name: seqid; Type: INDEX; Schema: public; Owner: scraper; Tablespace: 
--

CREATE INDEX seqid ON "NrcScrapedMaterial" USING btree (st_id);


--
-- Name: state; Type: INDEX; Schema: public; Owner: scraper; Tablespace: 
--

CREATE INDEX state ON "FracFocusScrape" USING btree (state);


--
-- Name: suspected_responsible_company; Type: INDEX; Schema: public; Owner: scraper; Tablespace: 
--

CREATE INDEX suspected_responsible_company ON "NrcScrapedReport" USING btree (suspected_responsible_company);


--
-- Name: tag; Type: INDEX; Schema: public; Owner: scraper; Tablespace: 
--

CREATE INDEX tag ON "FeedEntryTag" USING btree (tag);


--
-- Name: task_item; Type: INDEX; Schema: public; Owner: scraper; Tablespace: 
--

CREATE INDEX task_item ON "PublishedFeedItems" USING btree (task_id, feed_item_id);


--
-- Name: time_stamp; Type: INDEX; Schema: public; Owner: scraper; Tablespace: 
--

CREATE INDEX time_stamp ON "NrcScrapedReport" USING btree (time_stamp);


--
-- Name: updated; Type: INDEX; Schema: public; Owner: scraper; Tablespace: 
--

CREATE INDEX updated ON "DEFUNCT_FeedEntry" USING btree (updated);


SET search_path = scraper, pg_catalog;

--
-- Name: appomatic_mapcluster_cluster_buffer; Type: INDEX; Schema: scraper; Owner: scraper; Tablespace: 
--

CREATE INDEX appomatic_mapcluster_cluster_buffer ON appomatic_mapcluster_cluster USING btree (buffer);


--
-- Name: appomatic_mapcluster_cluster_buffer_id; Type: INDEX; Schema: scraper; Owner: scraper; Tablespace: 
--

CREATE INDEX appomatic_mapcluster_cluster_buffer_id ON appomatic_mapcluster_cluster USING gist (buffer);


--
-- Name: appomatic_mapcluster_cluster_datetime; Type: INDEX; Schema: scraper; Owner: scraper; Tablespace: 
--

CREATE INDEX appomatic_mapcluster_cluster_datetime ON appomatic_mapcluster_cluster USING btree (datetime);


--
-- Name: appomatic_mapcluster_cluster_glocation; Type: INDEX; Schema: scraper; Owner: scraper; Tablespace: 
--

CREATE INDEX appomatic_mapcluster_cluster_glocation ON appomatic_mapcluster_cluster USING btree (glocation);


--
-- Name: appomatic_mapcluster_cluster_glocation_id; Type: INDEX; Schema: scraper; Owner: scraper; Tablespace: 
--

CREATE INDEX appomatic_mapcluster_cluster_glocation_id ON appomatic_mapcluster_cluster USING gist (glocation);


--
-- Name: appomatic_mapcluster_cluster_latitude; Type: INDEX; Schema: scraper; Owner: scraper; Tablespace: 
--

CREATE INDEX appomatic_mapcluster_cluster_latitude ON appomatic_mapcluster_cluster USING btree (latitude);


--
-- Name: appomatic_mapcluster_cluster_location; Type: INDEX; Schema: scraper; Owner: scraper; Tablespace: 
--

CREATE INDEX appomatic_mapcluster_cluster_location ON appomatic_mapcluster_cluster USING btree (location);


--
-- Name: appomatic_mapcluster_cluster_location_id; Type: INDEX; Schema: scraper; Owner: scraper; Tablespace: 
--

CREATE INDEX appomatic_mapcluster_cluster_location_id ON appomatic_mapcluster_cluster USING gist (location);


--
-- Name: appomatic_mapcluster_cluster_longitude; Type: INDEX; Schema: scraper; Owner: scraper; Tablespace: 
--

CREATE INDEX appomatic_mapcluster_cluster_longitude ON appomatic_mapcluster_cluster USING btree (longitude);


--
-- Name: appomatic_mapcluster_cluster_src; Type: INDEX; Schema: scraper; Owner: scraper; Tablespace: 
--

CREATE INDEX appomatic_mapcluster_cluster_src ON appomatic_mapcluster_cluster USING btree (src);


--
-- Name: appomatic_mapcluster_cluster_src_like; Type: INDEX; Schema: scraper; Owner: scraper; Tablespace: 
--

CREATE INDEX appomatic_mapcluster_cluster_src_like ON appomatic_mapcluster_cluster USING btree (src varchar_pattern_ops);


--
-- Name: appomatic_mapcluster_query_slug; Type: INDEX; Schema: scraper; Owner: scraper; Tablespace: 
--

CREATE INDEX appomatic_mapcluster_query_slug ON appomatic_mapcluster_query USING btree (slug);


--
-- Name: appomatic_mapcluster_query_slug_like; Type: INDEX; Schema: scraper; Owner: scraper; Tablespace: 
--

CREATE INDEX appomatic_mapcluster_query_slug_like ON appomatic_mapcluster_query USING btree (slug varchar_pattern_ops);


--
-- Name: appomatic_mapdata_sar_datetime; Type: INDEX; Schema: scraper; Owner: scraper; Tablespace: 
--

CREATE INDEX appomatic_mapdata_sar_datetime ON appomatic_mapdata_sar USING btree (datetime);


--
-- Name: appomatic_mapdata_sar_latitude; Type: INDEX; Schema: scraper; Owner: scraper; Tablespace: 
--

CREATE INDEX appomatic_mapdata_sar_latitude ON appomatic_mapdata_sar USING btree (latitude);


--
-- Name: appomatic_mapdata_sar_location; Type: INDEX; Schema: scraper; Owner: scraper; Tablespace: 
--

CREATE INDEX appomatic_mapdata_sar_location ON appomatic_mapdata_sar USING btree (location);


--
-- Name: appomatic_mapdata_sar_location_id; Type: INDEX; Schema: scraper; Owner: scraper; Tablespace: 
--

CREATE INDEX appomatic_mapdata_sar_location_id ON appomatic_mapdata_sar USING gist (location);


--
-- Name: appomatic_mapdata_sar_longitude; Type: INDEX; Schema: scraper; Owner: scraper; Tablespace: 
--

CREATE INDEX appomatic_mapdata_sar_longitude ON appomatic_mapdata_sar USING btree (longitude);


--
-- Name: appomatic_mapdata_sar_quality; Type: INDEX; Schema: scraper; Owner: scraper; Tablespace: 
--

CREATE INDEX appomatic_mapdata_sar_quality ON appomatic_mapdata_sar USING btree (quality);


--
-- Name: appomatic_mapdata_sar_src; Type: INDEX; Schema: scraper; Owner: scraper; Tablespace: 
--

CREATE INDEX appomatic_mapdata_sar_src ON appomatic_mapdata_sar USING btree (src);


--
-- Name: appomatic_mapdata_sar_src_like; Type: INDEX; Schema: scraper; Owner: scraper; Tablespace: 
--

CREATE INDEX appomatic_mapdata_sar_src_like ON appomatic_mapdata_sar USING btree (src varchar_pattern_ops);


--
-- Name: appomatic_mapdata_viirs_RadiantOutput; Type: INDEX; Schema: scraper; Owner: scraper; Tablespace: 
--

CREATE INDEX "appomatic_mapdata_viirs_RadiantOutput" ON appomatic_mapdata_viirs USING btree ("RadiantOutput");


--
-- Name: appomatic_mapdata_viirs_RadiativeHeat; Type: INDEX; Schema: scraper; Owner: scraper; Tablespace: 
--

CREATE INDEX "appomatic_mapdata_viirs_RadiativeHeat" ON appomatic_mapdata_viirs USING btree ("RadiativeHeat");


--
-- Name: appomatic_mapdata_viirs_SourceID; Type: INDEX; Schema: scraper; Owner: scraper; Tablespace: 
--

CREATE INDEX "appomatic_mapdata_viirs_SourceID" ON appomatic_mapdata_viirs USING btree ("SourceID");


--
-- Name: appomatic_mapdata_viirs_SourceID_like; Type: INDEX; Schema: scraper; Owner: scraper; Tablespace: 
--

CREATE INDEX "appomatic_mapdata_viirs_SourceID_like" ON appomatic_mapdata_viirs USING btree ("SourceID" varchar_pattern_ops);


--
-- Name: appomatic_mapdata_viirs_Temperature; Type: INDEX; Schema: scraper; Owner: scraper; Tablespace: 
--

CREATE INDEX "appomatic_mapdata_viirs_Temperature" ON appomatic_mapdata_viirs USING btree ("Temperature");


--
-- Name: appomatic_mapdata_viirs_datetime; Type: INDEX; Schema: scraper; Owner: scraper; Tablespace: 
--

CREATE INDEX appomatic_mapdata_viirs_datetime ON appomatic_mapdata_viirs USING btree (datetime);


--
-- Name: appomatic_mapdata_viirs_footprint; Type: INDEX; Schema: scraper; Owner: scraper; Tablespace: 
--

CREATE INDEX appomatic_mapdata_viirs_footprint ON appomatic_mapdata_viirs USING btree (footprint);


--
-- Name: appomatic_mapdata_viirs_latitude; Type: INDEX; Schema: scraper; Owner: scraper; Tablespace: 
--

CREATE INDEX appomatic_mapdata_viirs_latitude ON appomatic_mapdata_viirs USING btree (latitude);


--
-- Name: appomatic_mapdata_viirs_location; Type: INDEX; Schema: scraper; Owner: scraper; Tablespace: 
--

CREATE INDEX appomatic_mapdata_viirs_location ON appomatic_mapdata_viirs USING btree (location);


--
-- Name: appomatic_mapdata_viirs_location_id; Type: INDEX; Schema: scraper; Owner: scraper; Tablespace: 
--

CREATE INDEX appomatic_mapdata_viirs_location_id ON appomatic_mapdata_viirs USING gist (location);


--
-- Name: appomatic_mapdata_viirs_longitude; Type: INDEX; Schema: scraper; Owner: scraper; Tablespace: 
--

CREATE INDEX appomatic_mapdata_viirs_longitude ON appomatic_mapdata_viirs USING btree (longitude);


--
-- Name: appomatic_mapdata_viirs_quality; Type: INDEX; Schema: scraper; Owner: scraper; Tablespace: 
--

CREATE INDEX appomatic_mapdata_viirs_quality ON appomatic_mapdata_viirs USING btree (quality);


--
-- Name: appomatic_mapdata_viirs_src; Type: INDEX; Schema: scraper; Owner: scraper; Tablespace: 
--

CREATE INDEX appomatic_mapdata_viirs_src ON appomatic_mapdata_viirs USING btree (src);


--
-- Name: appomatic_mapdata_viirs_src_like; Type: INDEX; Schema: scraper; Owner: scraper; Tablespace: 
--

CREATE INDEX appomatic_mapdata_viirs_src_like ON appomatic_mapdata_viirs USING btree (src varchar_pattern_ops);


--
-- Name: appomatic_mapdelta_event_datetime; Type: INDEX; Schema: scraper; Owner: scraper; Tablespace: 
--

CREATE INDEX appomatic_mapdelta_event_datetime ON appomatic_mapdelta_event USING btree (datetime);


--
-- Name: appomatic_mapdelta_event_glocation; Type: INDEX; Schema: scraper; Owner: scraper; Tablespace: 
--

CREATE INDEX appomatic_mapdelta_event_glocation ON appomatic_mapdelta_event USING btree (glocation);


--
-- Name: appomatic_mapdelta_event_glocation_id; Type: INDEX; Schema: scraper; Owner: scraper; Tablespace: 
--

CREATE INDEX appomatic_mapdelta_event_glocation_id ON appomatic_mapdelta_event USING gist (glocation);


--
-- Name: appomatic_mapdelta_event_latitude; Type: INDEX; Schema: scraper; Owner: scraper; Tablespace: 
--

CREATE INDEX appomatic_mapdelta_event_latitude ON appomatic_mapdelta_event USING btree (latitude);


--
-- Name: appomatic_mapdelta_event_location; Type: INDEX; Schema: scraper; Owner: scraper; Tablespace: 
--

CREATE INDEX appomatic_mapdelta_event_location ON appomatic_mapdelta_event USING btree (location);


--
-- Name: appomatic_mapdelta_event_location_id; Type: INDEX; Schema: scraper; Owner: scraper; Tablespace: 
--

CREATE INDEX appomatic_mapdelta_event_location_id ON appomatic_mapdelta_event USING gist (location);


--
-- Name: appomatic_mapdelta_event_longitude; Type: INDEX; Schema: scraper; Owner: scraper; Tablespace: 
--

CREATE INDEX appomatic_mapdelta_event_longitude ON appomatic_mapdelta_event USING btree (longitude);


--
-- Name: appomatic_mapdelta_event_src; Type: INDEX; Schema: scraper; Owner: scraper; Tablespace: 
--

CREATE INDEX appomatic_mapdelta_event_src ON appomatic_mapdelta_event USING btree (src);


--
-- Name: appomatic_mapdelta_event_src_like; Type: INDEX; Schema: scraper; Owner: scraper; Tablespace: 
--

CREATE INDEX appomatic_mapdelta_event_src_like ON appomatic_mapdelta_event USING btree (src varchar_pattern_ops);


--
-- Name: appomatic_mapdelta_grouping_cropped_geom_id; Type: INDEX; Schema: scraper; Owner: scraper; Tablespace: 
--

CREATE INDEX appomatic_mapdelta_grouping_cropped_geom_id ON appomatic_mapdelta_grouping USING gist (cropped_geom);


--
-- Name: appomatic_mapdelta_grouping_full_geom_id; Type: INDEX; Schema: scraper; Owner: scraper; Tablespace: 
--

CREATE INDEX appomatic_mapdelta_grouping_full_geom_id ON appomatic_mapdelta_grouping USING gist (full_geom);


--
-- Name: appomatic_mapserver_application_name_like; Type: INDEX; Schema: scraper; Owner: scraper; Tablespace: 
--

CREATE INDEX appomatic_mapserver_application_name_like ON appomatic_mapserver_application USING btree (name varchar_pattern_ops);


--
-- Name: appomatic_mapserver_application_slug_like; Type: INDEX; Schema: scraper; Owner: scraper; Tablespace: 
--

CREATE INDEX appomatic_mapserver_application_slug_like ON appomatic_mapserver_application USING btree (slug varchar_pattern_ops);


--
-- Name: appomatic_mapserver_layer_application_id; Type: INDEX; Schema: scraper; Owner: scraper; Tablespace: 
--

CREATE INDEX appomatic_mapserver_layer_application_id ON appomatic_mapserver_layer USING btree (application_id);


--
-- Name: appomatic_mapserver_layer_application_id_like; Type: INDEX; Schema: scraper; Owner: scraper; Tablespace: 
--

CREATE INDEX appomatic_mapserver_layer_application_id_like ON appomatic_mapserver_layer USING btree (application_id varchar_pattern_ops);


--
-- Name: appomatic_mapserver_layer_name_like; Type: INDEX; Schema: scraper; Owner: scraper; Tablespace: 
--

CREATE INDEX appomatic_mapserver_layer_name_like ON appomatic_mapserver_layer USING btree (name varchar_pattern_ops);


--
-- Name: appomatic_mapserver_layer_slug_like; Type: INDEX; Schema: scraper; Owner: scraper; Tablespace: 
--

CREATE INDEX appomatic_mapserver_layer_slug_like ON appomatic_mapserver_layer USING btree (slug varchar_pattern_ops);


--
-- Name: easy_thumbnails_source_name; Type: INDEX; Schema: scraper; Owner: scraper; Tablespace: 
--

CREATE INDEX easy_thumbnails_source_name ON easy_thumbnails_source USING btree (name);


--
-- Name: easy_thumbnails_source_name_like; Type: INDEX; Schema: scraper; Owner: scraper; Tablespace: 
--

CREATE INDEX easy_thumbnails_source_name_like ON easy_thumbnails_source USING btree (name varchar_pattern_ops);


--
-- Name: easy_thumbnails_source_storage_hash; Type: INDEX; Schema: scraper; Owner: scraper; Tablespace: 
--

CREATE INDEX easy_thumbnails_source_storage_hash ON easy_thumbnails_source USING btree (storage_hash);


--
-- Name: easy_thumbnails_source_storage_hash_like; Type: INDEX; Schema: scraper; Owner: scraper; Tablespace: 
--

CREATE INDEX easy_thumbnails_source_storage_hash_like ON easy_thumbnails_source USING btree (storage_hash varchar_pattern_ops);


--
-- Name: easy_thumbnails_thumbnail_name; Type: INDEX; Schema: scraper; Owner: scraper; Tablespace: 
--

CREATE INDEX easy_thumbnails_thumbnail_name ON easy_thumbnails_thumbnail USING btree (name);


--
-- Name: easy_thumbnails_thumbnail_name_like; Type: INDEX; Schema: scraper; Owner: scraper; Tablespace: 
--

CREATE INDEX easy_thumbnails_thumbnail_name_like ON easy_thumbnails_thumbnail USING btree (name varchar_pattern_ops);


--
-- Name: easy_thumbnails_thumbnail_source_id; Type: INDEX; Schema: scraper; Owner: scraper; Tablespace: 
--

CREATE INDEX easy_thumbnails_thumbnail_source_id ON easy_thumbnails_thumbnail USING btree (source_id);


--
-- Name: easy_thumbnails_thumbnail_storage_hash; Type: INDEX; Schema: scraper; Owner: scraper; Tablespace: 
--

CREATE INDEX easy_thumbnails_thumbnail_storage_hash ON easy_thumbnails_thumbnail USING btree (storage_hash);


--
-- Name: easy_thumbnails_thumbnail_storage_hash_like; Type: INDEX; Schema: scraper; Owner: scraper; Tablespace: 
--

CREATE INDEX easy_thumbnails_thumbnail_storage_hash_like ON easy_thumbnails_thumbnail USING btree (storage_hash varchar_pattern_ops);


--
-- Name: feed_entry_source; Type: INDEX; Schema: scraper; Owner: scraper; Tablespace: 
--

CREATE INDEX feed_entry_source ON feedentry USING btree (source_id, published);


--
-- Name: feedentry_id; Type: INDEX; Schema: scraper; Owner: scraper; Tablespace: 
--

CREATE UNIQUE INDEX feedentry_id ON feedentry USING btree (id);


--
-- Name: feedentry_incident_datetime; Type: INDEX; Schema: scraper; Owner: scraper; Tablespace: 
--

CREATE INDEX feedentry_incident_datetime ON feedentry USING btree (incident_datetime DESC);


--
-- Name: feedentry_latlng; Type: INDEX; Schema: scraper; Owner: scraper; Tablespace: 
--

CREATE INDEX feedentry_latlng ON feedentry USING btree (lat, lng);


--
-- Name: feedentry_published; Type: INDEX; Schema: scraper; Owner: scraper; Tablespace: 
--

CREATE INDEX feedentry_published ON feedentry USING btree (published DESC);


--
-- Name: feedentry_regions; Type: INDEX; Schema: scraper; Owner: scraper; Tablespace: 
--

CREATE INDEX feedentry_regions ON feedentry USING gin (regions);


--
-- Name: feedentry_tags; Type: INDEX; Schema: scraper; Owner: scraper; Tablespace: 
--

CREATE INDEX feedentry_tags ON feedentry USING gin (tags);


--
-- Name: guardian_groupobjectpermission_content_type_id; Type: INDEX; Schema: scraper; Owner: scraper; Tablespace: 
--

CREATE INDEX guardian_groupobjectpermission_content_type_id ON guardian_groupobjectpermission USING btree (content_type_id);


--
-- Name: guardian_groupobjectpermission_group_id; Type: INDEX; Schema: scraper; Owner: scraper; Tablespace: 
--

CREATE INDEX guardian_groupobjectpermission_group_id ON guardian_groupobjectpermission USING btree (group_id);


--
-- Name: guardian_groupobjectpermission_permission_id; Type: INDEX; Schema: scraper; Owner: scraper; Tablespace: 
--

CREATE INDEX guardian_groupobjectpermission_permission_id ON guardian_groupobjectpermission USING btree (permission_id);


--
-- Name: guardian_userobjectpermission_content_type_id; Type: INDEX; Schema: scraper; Owner: scraper; Tablespace: 
--

CREATE INDEX guardian_userobjectpermission_content_type_id ON guardian_userobjectpermission USING btree (content_type_id);


--
-- Name: guardian_userobjectpermission_permission_id; Type: INDEX; Schema: scraper; Owner: scraper; Tablespace: 
--

CREATE INDEX guardian_userobjectpermission_permission_id ON guardian_userobjectpermission USING btree (permission_id);


--
-- Name: guardian_userobjectpermission_user_id; Type: INDEX; Schema: scraper; Owner: scraper; Tablespace: 
--

CREATE INDEX guardian_userobjectpermission_user_id ON guardian_userobjectpermission USING btree (user_id);


--
-- Name: idx_regions_code; Type: INDEX; Schema: scraper; Owner: scraper; Tablespace: 
--

CREATE UNIQUE INDEX idx_regions_code ON region USING btree (code);


--
-- Name: idx_regions_the_geom; Type: INDEX; Schema: scraper; Owner: scraper; Tablespace: 
--

CREATE INDEX idx_regions_the_geom ON region USING gist (the_geom);


--
-- Name: idx_satimage_acquisition_date; Type: INDEX; Schema: scraper; Owner: scraper; Tablespace: 
--

CREATE INDEX idx_satimage_acquisition_date ON satimage USING btree (acquisition_date);


--
-- Name: idx_satimage_aoi_name; Type: INDEX; Schema: scraper; Owner: scraper; Tablespace: 
--

CREATE UNIQUE INDEX idx_satimage_aoi_name ON satimage_aoi USING btree (name);


--
-- Name: idx_satimage_aoi_the_geom; Type: INDEX; Schema: scraper; Owner: scraper; Tablespace: 
--

CREATE INDEX idx_satimage_aoi_the_geom ON satimage_aoi USING gist (the_geom);


--
-- Name: idx_satimage_geo_extent; Type: INDEX; Schema: scraper; Owner: scraper; Tablespace: 
--

CREATE INDEX idx_satimage_geo_extent ON satimage USING gist (geo_extent);


--
-- Name: idx_satimage_name; Type: INDEX; Schema: scraper; Owner: scraper; Tablespace: 
--

CREATE INDEX idx_satimage_name ON satimage USING btree (name);


--
-- Name: idx_satimage_priority_acq_date; Type: INDEX; Schema: scraper; Owner: scraper; Tablespace: 
--

CREATE INDEX idx_satimage_priority_acq_date ON satimage USING btree (priority, acquisition_date);


--
-- Name: idx_satimage_published_geo_extent; Type: INDEX; Schema: scraper; Owner: scraper; Tablespace: 
--

CREATE INDEX idx_satimage_published_geo_extent ON satimage_published USING gist (geo_extent);


--
-- Name: idx_satimage_published_name; Type: INDEX; Schema: scraper; Owner: scraper; Tablespace: 
--

CREATE UNIQUE INDEX idx_satimage_published_name ON satimage_published USING btree (name);


--
-- Name: idx_satimage_published_source_image; Type: INDEX; Schema: scraper; Owner: scraper; Tablespace: 
--

CREATE INDEX idx_satimage_published_source_image ON satimage_published USING btree (source_image);


--
-- Name: region_code; Type: INDEX; Schema: scraper; Owner: scraper; Tablespace: 
--

CREATE INDEX region_code ON region USING btree (code);


--
-- Name: region_code_like; Type: INDEX; Schema: scraper; Owner: scraper; Tablespace: 
--

CREATE INDEX region_code_like ON region USING btree (code varchar_pattern_ops);


--
-- Name: region_name; Type: INDEX; Schema: scraper; Owner: scraper; Tablespace: 
--

CREATE INDEX region_name ON region USING btree (name);


--
-- Name: region_name_like; Type: INDEX; Schema: scraper; Owner: scraper; Tablespace: 
--

CREATE INDEX region_name_like ON region USING btree (name varchar_pattern_ops);


--
-- Name: region_simple_geom_id; Type: INDEX; Schema: scraper; Owner: scraper; Tablespace: 
--

CREATE INDEX region_simple_geom_id ON region USING gist (simple_geom);


--
-- Name: region_src; Type: INDEX; Schema: scraper; Owner: scraper; Tablespace: 
--

CREATE INDEX region_src ON region USING btree (src);


--
-- Name: region_src_like; Type: INDEX; Schema: scraper; Owner: scraper; Tablespace: 
--

CREATE INDEX region_src_like ON region USING btree (src varchar_pattern_ops);


--
-- Name: region_the_geom_id; Type: INDEX; Schema: scraper; Owner: scraper; Tablespace: 
--

CREATE INDEX region_the_geom_id ON region USING gist (the_geom);


SET search_path = public, pg_catalog;

--
-- Name: geometry_columns_delete; Type: RULE; Schema: public; Owner: postgres
--

CREATE RULE geometry_columns_delete AS ON DELETE TO geometry_columns DO INSTEAD NOTHING;


--
-- Name: geometry_columns_insert; Type: RULE; Schema: public; Owner: postgres
--

CREATE RULE geometry_columns_insert AS ON INSERT TO geometry_columns DO INSTEAD NOTHING;


--
-- Name: geometry_columns_update; Type: RULE; Schema: public; Owner: postgres
--

CREATE RULE geometry_columns_update AS ON UPDATE TO geometry_columns DO INSTEAD NOTHING;


SET search_path = scraper, pg_catalog;

--
-- Name: feedentry_insert; Type: RULE; Schema: scraper; Owner: scraper
--

CREATE RULE feedentry_insert AS ON INSERT TO feedentry WHERE (NOT (EXISTS (SELECT 1 FROM feedentry WHERE (feedentry.id = new.id)))) DO UPDATE feedentry SET regions = ARRAY(SELECT region.id FROM region WHERE public.st_contains(region.the_geom, public.st_setsrid(public.st_makepoint(feedentry.lng, feedentry.lat), (-1)))), the_geom = public.st_setsrid(public.st_makepoint(feedentry.lng, feedentry.lat), (-1)), published = (SELECT to_timestamp((GREATEST(floor(date_part('epoch'::text, now())), date_part('epoch'::text, max(feedentry.published))) + (0.001)::double precision)) AS to_timestamp FROM feedentry) WHERE (feedentry.id = new.id);
ALTER TABLE scraper.feedentry DISABLE RULE feedentry_insert;


--
-- Name: feedentry_replace; Type: RULE; Schema: scraper; Owner: scraper
--

CREATE RULE feedentry_replace AS ON INSERT TO feedentry WHERE (EXISTS (SELECT 1 FROM feedentry WHERE (feedentry.id = new.id))) DO INSTEAD UPDATE feedentry SET title = new.title, link = new.link, summary = new.summary, content = new.content, lat = new.lat, lng = new.lng, source_id = new.source_id, kml_url = new.kml_url, incident_datetime = new.incident_datetime, tags = new.tags, regions = ARRAY(SELECT region.id FROM region WHERE public.st_contains(region.the_geom, public.st_setsrid(public.st_makepoint(new.lng, new.lat), (-1)))), the_geom = public.st_setsrid(public.st_makepoint(new.lng, new.lat), (-1)) WHERE (feedentry.id = new.id);
ALTER TABLE scraper.feedentry DISABLE RULE feedentry_replace;


SET search_path = public, pg_catalog;

--
-- Name: appomatic_mapdata_ais_insert; Type: TRIGGER; Schema: public; Owner: scraper
--

CREATE TRIGGER appomatic_mapdata_ais_insert BEFORE INSERT ON appomatic_mapdata_ais FOR EACH ROW EXECUTE PROCEDURE scraper.appomatic_mapdata_ais_insert();


--
-- Name: bottaskstatus_update; Type: TRIGGER; Schema: public; Owner: scraper
--

CREATE TRIGGER bottaskstatus_update BEFORE UPDATE ON "BotTaskStatus" FOR EACH ROW EXECUTE PROCEDURE scraper.update_time_stamp_column();


SET search_path = scraper, pg_catalog;

--
-- Name: feedentry_insert; Type: TRIGGER; Schema: scraper; Owner: scraper
--

CREATE TRIGGER feedentry_insert BEFORE INSERT ON feedentry FOR EACH ROW EXECUTE PROCEDURE feedentry_insert();


SET search_path = public, pg_catalog;

--
-- Name: appomatic_mapdata_ais_vessel_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: scraper
--

ALTER TABLE ONLY appomatic_mapdata_ais
    ADD CONSTRAINT appomatic_mapdata_ais_vessel_id_fkey FOREIGN KEY (vessel_id) REFERENCES appomatic_mapdata_vessel(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: appomatic_mapdata_aispath_vessel_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: scraper
--

ALTER TABLE ONLY appomatic_mapdata_aispath
    ADD CONSTRAINT appomatic_mapdata_aispath_vessel_id_fkey FOREIGN KEY (vessel_id) REFERENCES appomatic_mapdata_vessel(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions_permission_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: scraper
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_permission_id_fkey FOREIGN KEY (permission_id) REFERENCES auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups_group_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: scraper
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_fkey FOREIGN KEY (group_id) REFERENCES auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions_permission_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: scraper
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_permission_id_fkey FOREIGN KEY (permission_id) REFERENCES auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: content_type_id_refs_id_d043b34a; Type: FK CONSTRAINT; Schema: public; Owner: scraper
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT content_type_id_refs_id_d043b34a FOREIGN KEY (content_type_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log_content_type_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: scraper
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_fkey FOREIGN KEY (content_type_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: scraper
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_comment_flags_comment_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: scraper
--

ALTER TABLE ONLY django_comment_flags
    ADD CONSTRAINT django_comment_flags_comment_id_fkey FOREIGN KEY (comment_id) REFERENCES django_comments(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_comment_flags_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: scraper
--

ALTER TABLE ONLY django_comment_flags
    ADD CONSTRAINT django_comment_flags_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_comments_content_type_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: scraper
--

ALTER TABLE ONLY django_comments
    ADD CONSTRAINT django_comments_content_type_id_fkey FOREIGN KEY (content_type_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_comments_site_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: scraper
--

ALTER TABLE ONLY django_comments
    ADD CONSTRAINT django_comments_site_id_fkey FOREIGN KEY (site_id) REFERENCES django_site(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_comments_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: scraper
--

ALTER TABLE ONLY django_comments
    ADD CONSTRAINT django_comments_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: group_id_refs_id_f4b32aac; Type: FK CONSTRAINT; Schema: public; Owner: scraper
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT group_id_refs_id_f4b32aac FOREIGN KEY (group_id) REFERENCES auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: user_id_refs_id_40c41112; Type: FK CONSTRAINT; Schema: public; Owner: scraper
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT user_id_refs_id_40c41112 FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: user_id_refs_id_4dc23c39; Type: FK CONSTRAINT; Schema: public; Owner: scraper
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT user_id_refs_id_4dc23c39 FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


SET search_path = scraper, pg_catalog;

--
-- Name: appomatic_mapserver_layer_application_id_fkey; Type: FK CONSTRAINT; Schema: scraper; Owner: scraper
--

ALTER TABLE ONLY appomatic_mapserver_layer
    ADD CONSTRAINT appomatic_mapserver_layer_application_id_fkey FOREIGN KEY (application_id) REFERENCES appomatic_mapserver_application(slug) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: appomatic_websitebase_profile_user_id_fkey; Type: FK CONSTRAINT; Schema: scraper; Owner: scraper
--

ALTER TABLE ONLY appomatic_websitebase_profile
    ADD CONSTRAINT appomatic_websitebase_profile_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: easy_thumbnails_thumbnail_source_id_fkey; Type: FK CONSTRAINT; Schema: scraper; Owner: scraper
--

ALTER TABLE ONLY easy_thumbnails_thumbnail
    ADD CONSTRAINT easy_thumbnails_thumbnail_source_id_fkey FOREIGN KEY (source_id) REFERENCES easy_thumbnails_source(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: guardian_groupobjectpermission_content_type_id_fkey; Type: FK CONSTRAINT; Schema: scraper; Owner: scraper
--

ALTER TABLE ONLY guardian_groupobjectpermission
    ADD CONSTRAINT guardian_groupobjectpermission_content_type_id_fkey FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: guardian_groupobjectpermission_group_id_fkey; Type: FK CONSTRAINT; Schema: scraper; Owner: scraper
--

ALTER TABLE ONLY guardian_groupobjectpermission
    ADD CONSTRAINT guardian_groupobjectpermission_group_id_fkey FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: guardian_groupobjectpermission_permission_id_fkey; Type: FK CONSTRAINT; Schema: scraper; Owner: scraper
--

ALTER TABLE ONLY guardian_groupobjectpermission
    ADD CONSTRAINT guardian_groupobjectpermission_permission_id_fkey FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: guardian_userobjectpermission_content_type_id_fkey; Type: FK CONSTRAINT; Schema: scraper; Owner: scraper
--

ALTER TABLE ONLY guardian_userobjectpermission
    ADD CONSTRAINT guardian_userobjectpermission_content_type_id_fkey FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: guardian_userobjectpermission_permission_id_fkey; Type: FK CONSTRAINT; Schema: scraper; Owner: scraper
--

ALTER TABLE ONLY guardian_userobjectpermission
    ADD CONSTRAINT guardian_userobjectpermission_permission_id_fkey FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: guardian_userobjectpermission_user_id_fkey; Type: FK CONSTRAINT; Schema: scraper; Owner: scraper
--

ALTER TABLE ONLY guardian_userobjectpermission
    ADD CONSTRAINT guardian_userobjectpermission_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: userena_userenasignup_user_id_fkey; Type: FK CONSTRAINT; Schema: scraper; Owner: scraper
--

ALTER TABLE ONLY userena_userenasignup
    ADD CONSTRAINT userena_userenasignup_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO scraper;
GRANT ALL ON SCHEMA public TO PUBLIC;


SET search_path = public, pg_catalog;

--
-- Name: ais; Type: ACL; Schema: public; Owner: scraper
--

REVOKE ALL ON TABLE ais FROM PUBLIC;
REVOKE ALL ON TABLE ais FROM scraper;
GRANT ALL ON TABLE ais TO scraper;
GRANT ALL ON TABLE ais TO iuufishing;


--
-- Name: ais_seqid_seq; Type: ACL; Schema: public; Owner: scraper
--

REVOKE ALL ON SEQUENCE ais_seqid_seq FROM PUBLIC;
REVOKE ALL ON SEQUENCE ais_seqid_seq FROM scraper;
GRANT ALL ON SEQUENCE ais_seqid_seq TO scraper;
GRANT ALL ON SEQUENCE ais_seqid_seq TO iuufishing;


--
-- Name: feedentry_ewn2; Type: ACL; Schema: public; Owner: scraper
--

REVOKE ALL ON TABLE feedentry_ewn2 FROM PUBLIC;
REVOKE ALL ON TABLE feedentry_ewn2 FROM scraper;
GRANT ALL ON TABLE feedentry_ewn2 TO scraper;


SET search_path = scraper, pg_catalog;

--
-- Name: region; Type: ACL; Schema: scraper; Owner: scraper
--

REVOKE ALL ON TABLE region FROM PUBLIC;
REVOKE ALL ON TABLE region FROM scraper;
GRANT ALL ON TABLE region TO scraper;


--
-- Name: feedentry; Type: ACL; Schema: scraper; Owner: scraper
--

REVOKE ALL ON TABLE feedentry FROM PUBLIC;
REVOKE ALL ON TABLE feedentry FROM scraper;
GRANT ALL ON TABLE feedentry TO scraper;


--
-- PostgreSQL database dump complete
--

