module Api
    module V1
        class FaturasController < ApplicationController
            
            # Listar Faturas - OK

            def index
                faturas = Fatura.order('created_at DESC');
                render json: {status: 'SUCCESS', message:"Faturas carregadas", data: faturas}, status: :ok
            end

            def create
                fatura = Fatura.new(parametros)
                if fatura.save
                    render json: {status: 'SUCCESS', message: 'Fatura Adicionada', data: fatura}, status: :ok
                else
                    render json: {status: 'ERROR', message: 'Não foi possível adicionar fatura', data: fatura.errors}, status: :unporocessable_entity                  
                end
            end

            private
            def parametros
               
                params.permit(:valor, :data_vencimento, :matricula_id, :status)
        
            end
            
        end

    end
end