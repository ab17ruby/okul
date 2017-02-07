require './lib/ogrenciler'

ogrenci = Okul::Ogrenciler.new
ogrenci.adi = "Ahmet"
ogrenci.soyadi = "Balyali"
ogrenci.dogum_tarihi = Time.new(2000, 12, 3)
ogrenci.cinsiyet = "Erkek"

ogrenci.save()

puts "#{ogrenci.id} id ile ogrenci katyit oldu"

ogrenci = Okul::Ogrenciler.list.first
ogrenci.delete

=begin
1;Ahmet;Balyali;2000-12-03 00:00:00 +0200;Erkek
2;Ahmet;Balyali;2000-12-03 00:00:00 +0200;Erkek
3;Ahmet;Balyali;2000-12-03 00:00:00 +0200;Erkek
4;Ahmet;Balyali;2000-12-03 00:00:00 +0200;Erkek
5;Ahmet;Balyali;2000-12-03 00:00:00 +0200;Erkek
6;Ahmet;Balyali;2000-12-03 00:00:00 +0200;Erkek
7;Ahmet;Balyali;2000-12-03 00:00:00 +0200;Erkek
8;Ahmet;Balyali;2000-12-03 00:00:00 +0200;Erkek
9;Ahmet;Balyali;2000-12-03 00:00:00 +0200;Erkek
=end