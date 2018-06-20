SELECT
(SELECT COUNT(*) FROM cases WHERE status like 'Case Closed Statistically') 
* 100.0 / (Select COUNT(*) From cases);