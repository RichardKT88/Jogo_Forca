class Inicializacao
    def self.inicializando
        system('cls')
        File.open(File.expand_path('../../ascii/forca.txt', __FILE__), 'r') do |arq|            
            while line = arq.gets
                puts line
            end
        end
        sleep 5        
    end
end