/* 
File: 04_rank_attribution.sql
Purpose: Final YoY performance analysis with ranking attribution

Business Context:
- Branch: 'Branch_ID_001'
- Compares same-day & same-month YoY metrics
- Correctly handles ordinal metrics (e.g., Branch Rank)
- Attributes performance movement to business actions

Outcome:
- Branch Rank improvement identified
- Advances Outstanding YoY growth calculated
*/



SELECT
	y.branch_sol_id,
	y.metric_name,
	y.value_2025,
	y.value_2026,
	y.absolute_change,
	y.yoy_growth_pct,
	r.Ranking_Dimension,
	r.What_HO_Measures,
	r.Your_Intervention,
	r.Evidence_Metric
FROM(
	SELECT
		curr.branch_sol_id,
		curr.metric_name,
		prev.metric_value AS value_2025,
		curr.metric_value AS value_2026,
		curr.metric_value - prev.metric_value AS absolute_change,
		CASE
			WHEN curr.metric_name = 'Branch Rank' THEN NULL
			ELSE ROUND (((curr.metric_value - prev.metric_value) * 100.0) / prev.metric_value,2)
		END AS yoy_growth_pct
FROM dbo.performance_metrics curr
JOIN dbo.performance_metrics prev
	ON curr.branch_sol_id = prev.branch_sol_id
	AND curr.metric_name = prev.metric_name
	AND DAY(curr.as_on_date) = DAY(prev.as_on_date)
	AND MONTH(curr.as_on_date) = MONTH(prev.as_on_date)
	AND YEAR(curr.as_on_date) = YEAR(prev.as_on_date) + 1
WHERE curr.branch_sol_id = 8653  -- Branch_ID_001 (anonymized)

) y
LEFT JOIN dbo.ranking_framework r
	ON y.metric_name = r.Metric

ORDER BY y.metric_name;

