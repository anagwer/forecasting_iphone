<?php\
$conn = new mysqli('localhost', 'root', '', 'db_forecasting_iphone');\
$data = [];\
$res = $conn->query('SELECT * FROM iphone');\
while ($row = $res->fetch_assoc()) { $data['iphone'][] = $row; }\
$res = $conn->query('SELECT id_iphone, count(*) as count, min(bulan_tahun) as min_month, max(bulan_tahun) as max_month FROM data_penjualan GROUP BY id_iphone');\
while ($row = $res->fetch_assoc()) { $data['sales_summary'][] = $row; }\
$res = $conn->query('SELECT * FROM prediksi');\
while ($row = $res->fetch_assoc()) { $data['prediksi'][] = $row; }\
$res = $conn->query('SELECT * FROM rekomendasi');\
while ($row = $res->fetch_assoc()) { $data['rekomendasi'][] = $row; }\
echo '<pre>' . json_encode($data, JSON_PRETTY_PRINT) . '</pre>';\

