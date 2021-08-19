require_relative 'lib/adivinhar_palavra.rb'
# require_relative 'lib/sortear_palavra.rb'

# palavra = EscolherPalavra.new
# puts acertou = false
# letras_acertadas = palavra.escolher().chomp().upcase().split(//)
# letras_acertadas.each { |letra| print letra.replace("_")}
# print letras_acertadas.class
# puts ""
# puts ""
# acertou = letras_acertadas.include?("_")
# puts acertou
# letras_acertadas.each {|letra| print letra + " "}
forca = AdivinhaPalavra.new

forca.tentar_adivinhar()
