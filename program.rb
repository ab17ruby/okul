require './lib/ogrenciler'

ogrenci = Okul::Ogrenciler.new
ogrenci.adi = "Ahmet"
ogrenci.soyadi = "Balyali"
ogrenci.dogum_tarihi = Time.new(2000, 12, 3)
ogrenci.cinsiyet = "Erkek"

ogrenci.save()

puts "#{ogrenci.id} id ile ogrenci katyit oldu"