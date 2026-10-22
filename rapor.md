# Ödev 1 raporu
*Ad Soyad: Semih SABUNCU
*Öğrenci No: 202607131011  
*Program: Yapay Zeka Operatörlüğü  
*Veritabanı: `llm\\\\\\\_ops`  
*Tarih:** 23.10.2026
------------------------------------------------------------------------------------------------------------------------------
# 1\. Ne Yaptım?

* İlk bölümde döngünün içinde neler değişiyor diye adım adım baktım. Eşik değerini geçen sayıların en uzun serisini buldum, dersleri de sözlük kullanarak saydım. İkinci bölümde veritabanı ve DBMS ne demek onu kendi anladığım şekilde yazdım. Sonraki bölümlerde `SELECT`, `WHERE`, sıralama ve `LIMIT` kullandım. En son da gruplama ve `NULL` değerleriyle ilgili sorgulara baktım. Bazı kısımları başta karıştırdım ama örneklerden gidince daha anlaşılır oldu hocam.

------------------------------------------------------------------------------------------------------------------------------

* 2. Sonuçlar ve Zorlandığım Yer

*En zorlandığım konular: Soru 15 ve `NULL` ile ilgili olan sorular.

Neden ve nasıl çözdüm: Soru 15'te çağrıları hızlı, orta ve yavaş diye ayırırken `CASE` kısmını anlamam biraz zaman aldı. Bir de `NULL` normal boş bir değer gibi davranmıyormuş. `IS NULL` ile nasıl bulduğuma ve `SUM` ile `AVG` sonuçlarının niye değiştiğine bakınca daha iyi anladım. Hala biraz karışık geliyor ama en azından mantığını kavradığımı düşünüyorum.

------------------------------------------------------------------------------------------------------------------------------ 

* 3. Beklemediğim Bir Sonuç

* 11 numaralı çağrının `cost\_usd` alanı boş, yani `NULL`. Ben başta bunun toplamda sıfır gibi sayılacağını düşündüm ama `SUM` bunu toplamıyor. O yüzden özellikle 16 Ekim'in toplam maliyeti daha düşük görünebiliyor. Burada `NULL` ile sıfırın aynı şey olmadığını fark ettim.

------------------------------------------------------------------------------------------------------------------------------

*(Not: Hocanın raporda özellikle merak ettiği detaylara da değinmek gerekirse; parantez kullanmadığımızda mantıksal önceliklerin nasıl karıştığını, `COLLATE` ile Türkçe sıralamayı, koşullarda `NULL` değerlerin filtreden düşüp kaybolduğunu ve `COALESCE` kullanılmayan ortalamaların eksik veri yüzünden nasıl değiştiğini lab süresince fark ettim.)*

------------------------------------------------------------------------------------------------------------------------------

*4. Aldığım Hata ve Nasıl Çözdüm

*`ORDER BY` kısmında ayrı bir `CASE` yazınca PostgreSQL hata verdi. Hata mesajında `latency\_ms` değerinin `GROUP BY` içinde olması ya da bir toplama fonksiyonunda kullanılması gerektiği yazıyordu. Biraz uğraştıktan sonra sıralamayı `MIN(latency\_ms)` ile yaptım ve hata düzeldi. Bu kısım ilk başta bana karışık geldi ama nedenini görünce daha mantıklı oldu.

------------------------------------------------------------------------------------------------------------------------------

* 5. Yapay Zeka Beyanı

*Kullanılan Araç: ChatGPT ve Gemini

*Kullanım Amacı: Bazı soruların mantığını açıklamasını ve genel olarak kavrayamadığım çoğu konuyu anlatmasını yazımlarımı ve notlarımı daha düzgün bir şekilde bana yazdırmasını istedim.

*Doğrulama: Verilen cevapları olduğu gibi almak yerine ödevdeki tablo ve sütunlara göre kontrol ettim. Sorguların kendi veritabanımda çalışıp çalışmadığını teslim etmeden önce test ettim.
------------------------------------------------------------------------------------------------------------------------------
6 Kendimi değerlendirmem ve sorum


*Bir dahaki ödevde geliştireceğim şey: Ödevlere daha fazla vakit ayırıp on güne bırakmadan ve dersi derte dinleyerek yapay zekayı daha az kullanmak. 


*Derste tekrar görmek istediğim konu: hocamın anlattığı herşeyi. :)


