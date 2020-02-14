module GerarFaturas
    
    def criar_fatura(valor, data_vencimento, matricula_id, status)

        Fatura.create ({
        
            valor:              valor,
            data_vencimento:    data_vencimento,
            matricula_id:       matricula_id,
            status:             status
        })
        
    end
end