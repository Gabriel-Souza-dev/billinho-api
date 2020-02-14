module DataValida
    def data_valida(ano,mes,dia)
        
        return Date.valid_date?(ano,mes,dia)

    end
end