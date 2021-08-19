require_relative 'sortear_palavra'
require_relative 'inicializacao'


class AdivinhaPalavra
    attr_reader :palavra
    attr_reader :acertou
    attr_reader :enforcou
    

    def initialize
        Inicializacao.inicializando
        @palavra_secreta = EscolherPalavra.escolher.chomp().upcase()
        @acertou = false
        @enforcou = false 
    end
        

    def tentar_adivinhar()
        palavra_invisivel = @palavra_secreta.split(//)
        erros = 0
        letras_acertadas = palavra_invisivel.each {|letra| letra.replace("_")} 
        print letras_acertadas
            until (@enforcou || @acertou) do                
                puts "\nQual a letra?"
                chute = gets.strip().upcase()            
                if (@palavra_secreta.include?(chute))
                    indice = 0
                    for letra in @palavra_secreta.split(//)
                        if chute == letra  
                            letras_acertadas[indice] = letra                            
                        end
                        indice += 1
                    end                                                    
                else 
                    erros += 1
                    print "Errrrrooou!!!! Faltam #{palavra_invisivel.length() - erros} tentativas"                                           
                end
                @enforcou = erros == palavra_invisivel.length()
                @acertou = !letras_acertadas.include?("_")
                print letras_acertadas
            end
       puts("\nFIM DO JOGO")
    end
end