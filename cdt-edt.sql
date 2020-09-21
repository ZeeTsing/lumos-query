SELECT allorders.orderid
,json_extract(orderdatatab.extra_data, '$.delivery_detail_info.edt_min_dt') as EDT_min
,json_extract(orderdatatab.extra_data, '$.delivery_detail_info.edt_max_dt') as EDT_max
,json_extract(orderdatatab.extra_data, '$.delivery_detail_info.apt') as seller_apt
,json_extract(orderdatatab.extra_data, '$.delivery_detail_info.cdt_min') as CDT_min
,json_extract(orderdatatab.extra_data, '$.delivery_detail_info.cdt_max') as CDT_max
,json_extract(orderdatatab.extra_data, '$.delivery_detail_info.he_pt') as APT_extended
,json_extract(orderdatatab.extra_data, '$.delivery_detail_info.he_cdt') as CDT_extended
FROM shopee_order_v4_db__order_v4_tab allorders
LEFT JOIN shopee_order_processing_backend_PH_db__order_ext_data_tab orderdatatab -- change country
ON allorders.extinfo.order_ext_data_ref = orderdatatab.order_ext_data_ref
