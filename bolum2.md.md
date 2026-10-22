# Bölüm 2: Veritabanı Kavramları


# 1\. Excel yerine veritabanı kullanmak

# Excel dosyaları çoğaldıkça aynı bilgiyi farklı yerlerde tutmak zorunda kalıyoruz. Bu da bir dosyada yapılan düzeltmenin diğerinde unutulmasına ve verilerin birbiriyle çelişmesine neden oluyor. Veritabanı mantığında ise bilgiler tek bir merkezde toplanıyor ve sorgu atarak güncel haline ulaşılabiliyor. Ayrıca Excel'i aynı anda birkaç kişi açıp değiştirmeye kalktığında dosyalar kilitleniyor veya veriler karışabiliyor. DBMS bu eşzamanlı erişimleri düzenleyerek kimin ne yapacağını yönetiyor. Dosyadaki satır sayısı yüz binleri bulduğunda arama yapmak çok yavaşlarken, veritabanı indeksler sayesinde aradığımızı saniyeler içinde bulmamızı sağlıyor.

--------------------------------------------------------------------------------------------------------------------------

# 2\. Birincil anahtar ne işe yarıyor

# Birincil anahtar (Primary Key), bir tablodaki her satırı birbirinden net bir şekilde ayırmamızı ve kimlik kazandırmamızı sağlıyor. Aynı primary key değeri tabloda asla iki kez bulunamaz, böylece karışıklık önlenir. Örneğin öğrenci numarası bu iş için biçilmiş kaftandır çünkü okulda her öğrencinin numarası kendine hastır ve değişmez. Ancak ad soyad kesinlikle iyi birincil anahtar olamaz, çünkü aynı isim ve soyadına sahip birden fazla insan pek çok kez karşımıza çıkabilir.

---------------------------------------------------------------------------------------------------------------------------

# 3\. DBMS ile veritabanı arasındaki fark

# Veritabanı, verilerimizin düzenli bir şekilde saklandığı dosyaların bütünüdür. DBMS (Veritabanı Yönetim Sistemi) ise bu veritabanını oluşturmamıza, içinden veri çekmemize (sorgulamamıza) ve güvenliğini sağlamamıza yarayan yazılımın kendisidir. Yani kısacası, veritabanı depoladığımız bilgi havuzuyken, DBMS de o havuzu kontrol edip yöneten sistemdir. PostgreSQL de bu işi yapan güçlü bir DBMS örneğidir.

-------------------------------------------------------------------------------------------------------------------------

# 4\. İki kişi aynı kaydı değiştirirse ne olur

# Aynı anda iki kişi aynı veriyi güncellemeye çalışırsa çakışma (race condition) durumu ortaya çıkar ve son kaydeden kişinin bilgisi diğerinin üstüne yazılıp verinin kaybolmasına yol açabilir. DBMS bu gibi durumlarda veritabanı bütünlüğünü korumak için devreye girer, işlemleri sıraya koyar veya kilitleme mekanizmaları çalıştırarak aynı anda müdahaleyi engeller.

