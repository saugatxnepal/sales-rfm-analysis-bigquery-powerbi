-- Segment customers based on RFM score

SELECT *,
  CASE 
    WHEN rfm_total_score >= 28 THEN 'Elite Customers'
    WHEN rfm_total_score >= 24 THEN 'Premium Loyalists'
    WHEN rfm_total_score >= 20 THEN 'Growth Customers'
    WHEN rfm_total_score >= 16 THEN 'Emerging Customers'
    WHEN rfm_total_score >= 12 THEN 'Active Customers'
    WHEN rfm_total_score >= 8 THEN 'Needs Attention'
    WHEN rfm_total_score >= 4 THEN 'At Risk'
    ELSE 'Inactive Customers'
  END AS rfm_segment
FROM rfm_total_scores;