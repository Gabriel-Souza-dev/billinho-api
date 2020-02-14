module Api
    module V1
        class IesController < ApplicationController

            # Listar IES
            
            def index
                instituicoes = Ies.order('created_at DESC')
                render json: {status: 'SUCCESS', message: 'IESs Carregadas', data: instituicoes}, status: :ok
            end

            # Adicionar IES

            def create
                instituicao = Ies.new(parametros)
                if instituicao.save
                    render json: {status: 'SUCCESS', message:'IES adicionada' , data: instituicao}, status: :ok
                else
                    render json: {status: 'ERROR' , message: 'Nao foi possivel adicionar IES' , data: instituicao.errors}, status: :unprocessable_entity
                
                end
            end

            private
                def parametros
                    params.permit(:nome, :cnpj, :tipo)
                end

        end
    end
end
