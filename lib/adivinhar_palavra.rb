require_relative 'sortear_palavra'
require_relative 'inicializacao'


class AdivinhaPalavra
    attr_reader :palavra_secreta
    attr_reader :acertou
    attr_reader :enforcou
    

    def initialize
        Inicializacao.inicializando
        @palavra_secreta = EscolherPalavra.escolher.chomp().upcase()
        @acertou = false
        @enforcou = false 
    end
        

    def tentar_adivinhar()
        erros = 0
        letras_acertadas = @palavra_secreta.split(//).each {|letra| letra.replace("_")} 
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
                    puts (letras_acertadas.count {|x| x == "_"} == 0 ) ? "Parabéns!!! Você salvou o seu pescoço." : "Acertou!!!! Falta(m) #{letras_acertadas.count {|x| x == "_"}} letra(s)"                                                         
                else 
                    erros += 1
                    puts (erros == @palavra_secreta.length()) ? "Game Over!!!" : "Errrrrooou!!!! Falta(m) #{@palavra_secreta.length() - erros} tentativa(s)"                                           
                end
                @enforcou = erros >= @palavra_secreta.length()
                @acertou = !letras_acertadas.include?("_")
                print letras_acertadas
            end
            puts "\nFIM DE JOGO!"

    end
end