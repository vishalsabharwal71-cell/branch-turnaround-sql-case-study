/* 
File: 03_yoy_analysis.sql
Purpose: Core year-over-year performance comparison (pre-attribution)

Notes:
- Uses self-join with same-day & same-month alignment
- Preserves data types while anonymizing branch identity
- Ordinal metrics (e.g., Branch Rank) excluded from % growth
- Serves as the analytical base for final attribution logic
*/

SELECT
    curr.branch_sol_id,
    curr.metric_name,
    prev.metric_value AS value_2025,
    curr.metric_value AS value_2026,
    curr.metric_value - prev.metric_value AS absolute_change,
    CASE
        WHEN curr.metric_name = 'Branch Rank' THEN NULL
        ELSE ROUND(((curr.metric_value - prev.metric_value) * 100.0) / prev.metric_value, 2)
    END AS yoy_growth_pct
FROM dbo.performance_metrics curr
JOIN dbo.performance_metrics prev
    ON curr.branch_sol_id = prev.branch_sol_id
    AND curr.metric_name = prev.metric_name
    AND DAY(curr.as_on_date) = DAY(prev.as_on_date)
    AND MONTH(curr.as_on_date) = MONTH(prev.as_on_date)
    AND YEAR(curr.as_on_date) = YEAR(prev.as_on_date) + 1
WHERE curr.branch_sol_id = 8653  -- Branch_ID_001 (anonymized)
ORDER BY curr.metric_name;


SELECT
curr.branch_sol_id,
curr.metric_name,
prev.metric_value AS value_2025,
curr.metric_value AS value_2026,
curr.metric_value - prev.metric_value AS absolute_change,
CASE
	WHEN curr.metric_name = 'Branch Rank' THEN NULL
	ELSE ROUND(((curr.metric_value - prev.metric_value) * 100.0) / prev.metric_value, 2)
	END AS yoy_growth_pct
FROM dbo.performance_metrics curr
JOIN dbo.performance_metrics prev
	ON curr.branch_sol_id = prev.branch_sol_id
	AND curr.metric_name = prev.metric_name
	AND DAY(curr.as_on_date) = DAY(prev.as_on_date)
	AND MONTH(curr.as_on_date) = MONTH(prev.as_on_date)
	AND YEAR(curr.as_on_date) = YEAR(prev.as_on_date) + 1
WHERE curr.branch_sol_id = 8653
ORDER BY curr.metric_name;