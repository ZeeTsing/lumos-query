select SLSR.ordersn,lm_tracking_number,
        MIN(CASE WHEN SLST.status IN (8, 9, 10, 25)
                 THEN SLST.update_time
            END) AS ptime, -- pickup time
        MIN(CASE WHEN SLST.status IN (11)
                 THEN SLST.update_time
            END) AS dtime, -- delivered time
        MIN(CASE WHEN SLST.status IN (11,13)
                 THEN SLST.update_time
            END) AS datime, -- delivery attempt time
        MIN(CASE WHEN SLST.status IN (22,18,19,20,21,31)
                 THEN SLST.update_time
            END) AS ftime -- RTS related time
            
    FROM shopee_sls_logistic_id_db__logistic_tracking_tab AS SLST -- change country
    LEFT JOIN shopee_sls_logistic_id_db__logistic_request_tab AS SLSR ON SLSR.log_id = SLST.log_id -- change country
    WHERE SLST.update_time > TO_UNIXTIME(timestamp '2020-03-01 00:00:00')
    GROUP BY 1,2
