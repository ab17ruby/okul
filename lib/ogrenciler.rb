module Okul
	
	class Ogrenciler
		attr_accessor :adi, :soyadi, :dogum_tarihi, :cinsiyet
		attr_reader :id

		DOSYA_ADI = 'db/ogrenciler.txt'

		def save
			if @id.nil?
				auto_id	
				ogrenci = [@id, @adi, @soyadi, @dogum_tarihi, @cinsiyet]

				File.open(DOSYA_ADI, 'a') do |dosya|
					dosya.puts ogrenci.join(';')
				end
			else
				Ogrenciler.list.each do |ogrenci|
					File.open(DOSYA_ADI, "w") do |dosya|
						if ogrenci.id == @id
							dosya.puts [@id, @adi, @soyadi, @dogum_tarihi, @cinsiyet].join(';')
						else
							dosya.puts [ogrenci.id, ogrenci.adi, ogrenci.soyadi, ogrenci.dogum_tarihi, ogrenci.cinsiyet].join(';')
						end
					end
				end
			end
		end

		def delete
			Ogrenciler.list.select { |ogrenci| ogrenci.id != @id }.each do |ogr|
				File.open(DOSYA_ADI, 'w') do |dosya|
					dosya.puts [ogr.id, ogr.adi, ogr.soyadi, ogr.dogum_tarihi, ogr.cinsiyet].join(';')
				end
			end
		end

		private
		def auto_id
			last_user = Ogrenciler.list.last
			@id = last_user ? last_user.id.next : 1
		end

		def all_save(ogrenci, dosya)
			ogrenci = [ogrenci.id, ogrenci.adi, ogrenci.soyadi, ogrenci.dogum_tarihi, ogrenci.cinsiyet]
			dosya.puts ogrenci.join(';')
			dosya
		end

		protected
		def id=(id)
			@id = id
		end

		public
		class << self

			def one (id)
				ogrenciler = list.select {|ogrenci| ogrenci.id == id}

				ogrenciler[0]
			end

			def search(**params, &block) # params = {adi: 'Ahmet'}
				if block_given?
					list.select(&block)
				else
					_list = list()
					params.each do |key, value|
						_list.select! { |ogrenci| ogrenci.method(key).call == value }
					end
					_list
				end
			end

			def list
				dosya = File.open(DOSYA_ADI, "r") 
				ogrenciler = dosya.readlines.delete_if {|a| a.empty?}.map do |ogrenci|
					csv_row ogrenci
				end 
				dosya.close
				ogrenciler
			end

			private
			def csv_row(row)
					row = row.split(';')

					ogrenci = self.new
					ogrenci.method(:id=).call row[0].to_i
					ogrenci.adi = row[1]
					ogrenci.soyadi = row[2]
					ogrenci.dogum_tarihi = Time.new(row[3])
					ogrenci.cinsiyet = row[4]

					ogrenci
			end

		end

	end

end