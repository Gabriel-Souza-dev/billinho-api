module Api
    module V1
        class AlunosController < ApplicationController
            # Listar Alunos - OK

            def index
                alunos = Aluno.order('created_at DESC');
                render json: {status: 'SUCCESS', message:"Alunos carregados", data: alunos}, status: :ok
            end
    
            # Adicionar Alunos - OK
             
            def create
                aluno = Aluno.new(parametros)
                if aluno.save
                    render json: {status: 'SUCCESS', message:'Aluno adicionado', data: aluno}, status: :ok
                else
                    render json: {status: 'ERROR', message:'Não foi possível adicionar o aluno', data: aluno.errors}, status: :unprocessable_entity
                end
                
            end

            private
            def parametros
                params.permit(:nome, :cpf, :data_nasc, :celular, :genero, :metodo_pagamento)
            end

        end
    end
end