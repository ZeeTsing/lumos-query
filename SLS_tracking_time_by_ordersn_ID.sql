-- this is an example of querying SLS status based on ordersn, using ID DB
SELECT OT.orderid,SLST.log_id,SLSR.forderid,SLST.update_time, SLST.location, SLST.message, SLST.channel_status,
SLST.status,SLSR.shipment_provider,from_unixtime(SLST.update_time)
FROM shopee_sls_logistic_id_db__logistic_tracking_tab SLST INNER JOIN 
shopee_sls_logistic_id_db__logistic_request_tab SLSR 
ON SLSR.log_id = SLST.log_id
INNER JOIN shopee_order_v4_db__order_v4_tab OT 
ON OT.ordersn = SLSR.ordersn AND OT.ordersn = '200903QPE5TYW7'
order by SLST.update_time
