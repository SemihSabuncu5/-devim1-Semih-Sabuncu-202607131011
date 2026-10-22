# Ödev 1 - Yapay Zeka Operatörlüğü

*Ad Soyad:** Semih Sabuncu  
*Öğrenci No:** 202607131011  



# Bölüm 1: Algoritma ve İzleme (`bolum1.py`)

python
 
# Bölüm 1: Algoritma ve İzleme
 --------------------------------------------------------------------------------------------------------------------------
Soru 1.1: İz Sürme 




# 0 | 0 | 4 (çift) | 4 | \[]
# 1 | 1 | 7 (tek) | 4 | \[7]
# 2 | 2 | 2 (çift) | 6 | \[7]
# 3 | 3 | 9 (tek) | 6 | \[7, 9]
# 4 | 4 | 5 (tek) | 6 | \[7, 9, 5]
# 5 | 5 | 1 (tek) | 6 | \[7, 9, 5, 1]
# 6 | 6 | 8 (çift) | 14 | \[7, 9, 5, 1]




Sonuç: Tablodaki tahminimiz doğruydu. Kod çalıştırıldığında da aynı sonuçlar elde edilir.

 Çift sayıların toplamı: 14

 Tek sayıların listesi: \[7, 9, 5, 1]

Tahminimiz tuttuğu için yanıldığımız bir adım yok.





-------------------------------------------------------------------------------------------------------------------

 Soru 1.2: En Uzun Seri 
readings = \[18, 21, 23, 25, 24, 26, 27, 19, 20, 22, 23, 24, 25, 26]

threshold = 22



current = 0

longest = 0



for i in range(len(readings)):

  if readings\[i] > threshold:

  current = current + 1

  if current > longest:
  
  longest = current

  else:

  current = 0



print(longest)
-----------------------------------------------






 Soru 1.3: Elle Gruplama 
records = \[

  {"student": "Ece", "course": "VTYS"},

  {"student": "Ali", "course": "Yapay Zeka"},

  {"student": "Ece", "course": "Yapay Zeka"},

  {"student": "Can", "course": "VTYS"},

  {"student": "Ali", "course": "VTYS"},

  {"student": "Ece", "course": "Robotik"},

]



result = {}



for record in records:

   course = record\["course"]



  *if course in result:

  *result\[course] = result\[course] + 1

  else:

  *result\[course] = 1



print(result)



