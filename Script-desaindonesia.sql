-- menampilkan data kesejahteraan setiap provinsi di Indonesia (menggunakan fungsi AGGREGATE, join, group by)
	
select pro.Province_Name,
	SUM(dk.jumlah_prasejahtera) as prasejahtera,
	SUM(dk.jumlah_sejahtera1) as sejahtera1,
	SUM(dk.jumlah_sejahtera2) as sejahtera2,
	SUM(dk.jumlah_sejahtera3) as sejahtera3,
	SUM(dk.jumlah_sejahtera3plus) as sejahteraplus
    	FROM desa_kesejahteraan as dk
			INNER JOIN dim_kabupaten as kab ON dk.kabupaten_id =  kab.Kabupaten_ID
    		INNER JOIN dim_province as pro ON kab.Province_ID = pro.Province_ID
    			GROUP BY pro.Province_Name;
    			
-- menampilkan data kesejahteraan setiap kabupaten/kota di provinsi Jawa Barat (menggunakan fungsi AGGREGATE, join, group by, where, order by)

SELECT kab.Kabupaten_Name,
    SUM(dk.jumlah_prasejahtera) as prasejahtera,
    SUM(dk.jumlah_sejahtera1) as sejahtera1,
    SUM(dk.jumlah_sejahtera2) as sejahtera2,
    SUM(dk.jumlah_sejahtera3) as sejahtera3,
    SUM(dk.jumlah_sejahtera3plus) as sejahteraplus,
    SUM(dk.jumlah_prasejahtera) + SUM(dk.jumlah_sejahtera1) + SUM(dk.jumlah_sejahtera2) + SUM(dk.jumlah_sejahtera3) + SUM(dk.jumlah_sejahtera3plus) as total
    	FROM desa_kesejahteraan as dk
    		INNER JOIN dim_kabupaten as kab ON dk.kabupaten_id = kab.Kabupaten_ID
    		INNER JOIN dim_province as pro ON kab.Province_ID = pro.Province_ID
   				WHERE pro.Province_Name = 'JAWA BARAT'
    				GROUP BY kab.Kabupaten_Name
    					order by total asc;
    				
-- menampilkan data tenaga medis beserta jumlahnya setiap provinsi Indonesia (menggunakan fungsi aggregate, join, group by)

SELECT pro.Province_Name, tm.tenaga_medis,
    SUM(tm.jumlah) as jumlah
    	FROM desa_tenagamedis as tm
    		INNER JOIN dim_kabupaten as kab ON tm.kabupaten_id = kab.Kabupaten_ID
    		INNER JOIN dim_province as pro ON kab.Province_ID = pro.Province_ID
    			GROUP BY pro.Province_Name,
    					 tm.tenaga_medis;

-- menampilkan jumlah data tenaga medis bidan setiap kabupaten/kota untuk provinsi Jawa Timur (menggunakan fungsi aggregate, join, where, and, group by, order by)
    					
SELECT kab.Kabupaten_Name, tm.tenaga_medis,
    SUM(tm.jumlah) as jumlah
    	FROM desa_tenagamedis as tm
    		INNER JOIN dim_kabupaten as kab ON tm.kabupaten_id = kab.Kabupaten_ID
    		INNER JOIN dim_province as pro ON kab.Province_ID = pro.Province_ID
   				WHERE pro.Province_Name = 'JAWA TIMUR' AND tm.tenaga_medis = 'BIDAN'
    				GROUP BY kab.Kabupaten_Name,
 							 tm.tenaga_medis
 								order by jumlah asc;

-- menampilkan data kesejahteraan setiap kabupaten/kota untuk provinsi Jawa Tengah dan di urutkan dari terkecil ke terbesar untuk jumlah prasejahtera (menggunakan fungsi aggregate, join, where, group by, order by)

SELECT kab.Kabupaten_Name,
    	SUM(dk.jumlah_prasejahtera) AS total_prasejahtera,
    	SUM(dk.jumlah_sejahtera1) AS total_sejahtera1,
    	SUM(dk.jumlah_sejahtera2) AS total_sejahtera2,
    	SUM(dk.jumlah_sejahtera3) AS total_sejahtera3,
    	SUM(dk.jumlah_sejahtera3plus) AS total_sejahtera3plus
    		FROM desa_kesejahteraan as dk
    			INNER JOIN dim_kabupaten as kab ON dk.kabupaten_id = kab.Kabupaten_ID
    			INNER JOIN dim_province as pro ON kab.Province_ID = pro.Province_ID
    				WHERE pro.Province_Name = 'JAWA TENGAH'
    					GROUP BY kab.Kabupaten_Name
    						ORDER BY total_prasejahtera ASC;
 							


