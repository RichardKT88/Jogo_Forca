class EscolherPalavra
    
    def self.escolher
        v = []
        File.open(File.expand_path('../../palavras.txt', __FILE__), 'r') do |arq|            
            while line = arq.gets
                v.push(line)
            end
        end
        return v.sample    
    end  
end