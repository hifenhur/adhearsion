module SoundHelper
	def criar_som(text, filename)
		text.to_file "pt-br", "/tmp/#{filename}.mp3"
		system("sox /tmp/#{filename}.mp3 -r 8000 -c1 /var/lib/asterisk/sounds/en/#{filename}.gsm resample -ql")
	end

	
end
