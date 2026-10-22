
-- Bölüm 3: SELECT ve WHERE Sorguları
-- Semih Sabuncu - 202607131011
-- Not: Satır sayıları seed verisindeki duruma göredir.

----------------------------------------------------------------------------------------------------------------------------
-- Soru 1: Bütün çağrıların id ve model adlarına baktım
SELECT id, model_name
FROM llm_calls;
-- 12 satır dönüyor.
----------------------------------------------------------------------------------------------------------------------------
-- Soru 2: Model adını 'model' olarak yazdırıp token sayılarını topladım
SELECT model_name AS model,
       prompt_tokens + completion_tokens AS total_tokens
FROM llm_calls;
-- Burada da 12 satır var.
------------------------------------------------------------------------------------------------------------------------------
-- Soru 3: İki saniyeden (2000 ms) uzun süren çağrılara baktım
SELECT id, model_name, latency_ms
FROM llm_calls
WHERE latency_ms > 2000;
-- 5 satır çıkıyor.
------------------------------------------------------------------------------------------------------------------------------
-- Soru 4: Sadece Ece'nin yaptığı çağrıları seçtim
SELECT id, model_name, user_name
FROM llm_calls
WHERE user_name = 'Ece';
-- 3 satır geliyor.
------------------------------------------------------------------------------------------------------------------------------
-- Soru 5: 'chat' türünde olmayan diğer çağrılara baktım
SELECT id, model_name, task_type
FROM llm_calls
WHERE task_type <> 'chat';
-- 9 satır çıkıyor.
------------------------------------------------------------------------------------------------------------------------------
-- Soru 6: Claude modellerinden 1 saniyeyi geçenleri buldum
SELECT id, model_name, latency_ms
FROM llm_calls
WHERE model_name ILIKE 'claude%'
  AND latency_ms > 1000;
-- 2 satır çıktı.
------------------------------------------------------------------------------------------------------------------------------
-- Soru 7: Kod veya çeviri işi olup maliyeti 0.01 dolardan fazla olanlar
SELECT id, task_type, cost_usd
FROM llm_calls
WHERE (task_type = 'code' OR task_type = 'translate')
  AND cost_usd > 0.01;
-- 3 satır geliyor.
------------------------------------------------------------------------------------------------------------------------------
-- Soru 7 (Parantezsiz deneme):
-- Parantez koymadan denediğimde de sonuç 3 çıktı çünkü PostgreSQL 
-- öncelik kuralından dolayı önce AND kısmını çalıştırdı.
SELECT id, task_type, cost_usd
FROM llm_calls
WHERE task_type = 'code' 
   OR task_type = 'translate' 
  AND cost_usd > 0.01;
------------------------------------------------------------------------------------------------------------------------------
-- Soru 8: Gecikmesi 500 ile 1500 ms arasında olanlar
SELECT id, model_name, latency_ms
FROM llm_calls
WHERE latency_ms BETWEEN 500 AND 1500;
-- Sınırlar dahil 3 satır çıkıyor.
------------------------------------------------------------------------------------------------------------------------------
-- Soru 9: GPT-4o modellerini seçtim
SELECT id, model_name
FROM llm_calls
WHERE model_name IN ('gpt-4o', 'gpt-4o-mini');
-- 4 satır geliyor.
------------------------------------------------------------------------------------------------------------------------------
-- Soru 10: Adında 'mini' geçen modeller (büyük küçük harf duyarsız)
SELECT id, model_name
FROM llm_calls
WHERE model_name ILIKE '%mini%';
-- 3 satır çıktı (id 6, 9 ve 10). 
-- 'gemini' kelimesinde de mini geçtiği için o da araya girdi.
------------------------------------------------------------------------------------------------------------------------------
-- Soru 10b: Sadece gpt-4o-mini modelini aramak için:
SELECT id, model_name
FROM llm_calls
WHERE model_name ILIKE '%-mini%';
-- Tireyi ekleyince sadece 1 satır (id 9) çıktı, gemini'ler elendi.
-----------------------------------------------------------------------------------------------------------------------------
-- Soru 11: Önce kullanıcıya göre, sonra maliyete göre sıralama
SELECT id, user_name, cost_usd
FROM llm_calls
ORDER BY user_name ASC NULLS FIRST, 
         cost_usd DESC NULLS FIRST;
-- 12 satır geldi, NULL olanlar da listede var.
-----------------------------------------------------------------------------------------------------------------------------
-- Soru 12: En pahalı üç çağrıyı buldum, NULL maliyetleri arkaya attım
SELECT id, model_name, cost_usd
FROM llm_calls
ORDER BY cost_usd DESC NULLS LAST
LIMIT 3;
-- 3 satır çıktı (id 7, 2 ve 4).
-----------------------------------------------------------------------------------------------------------------------------
-- Soru 13: İş türlerini tekrarsız olarak listelettim
SELECT DISTINCT task_type
FROM llm_calls
ORDER BY task_type;
-- 5 farklı iş türü var.
-----------------------------------------------------------------------------------------------------------------------------
-- Soru 14: Tekrarsız kullanıcıları sıraladım (NULL'ları hariç tuttum)
SELECT DISTINCT user_name
FROM llm_calls
WHERE user_name IS NOT NULL
ORDER BY user_name;
-- 5 satır geldi.
-----------------------------------------------------------------------------------------------------------------------------
-- Soru 14b (Türkçe karakter sıralaması denemesi):
SELECT DISTINCT user_name COLLATE "tr-TR-x-icu" AS user_name
FROM llm_calls
WHERE user_name IS NOT NULL
ORDER BY user_name;
-- Sıralama Deniz, Ece, Mert, Oğuz ve Selin şeklinde oluştu.
------------------------------------------------------------------------------------------------------------------------------
-- Soru 15: 14 Ekim'den sonra 1 saniyeyi geçen çağrılar
SELECT id, model_name, latency_ms
FROM llm_calls
WHERE created_at >= TIMESTAMPTZ '2026-10-15 00:00:00+03'
  AND latency_ms > 1000
ORDER BY latency_ms DESC;
-- Gecikmesi uzun olandan kısaya doğru sıralandı, 5 satır çıktı.