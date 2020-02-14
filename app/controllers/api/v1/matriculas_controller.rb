module Api
    
    module V1
        
        class MatriculasController < ApplicationController
            # Listar Matriculas
            
            def index
                matriculas = Matricula.order('created_at DESC');
                render json: {status: 'SUCCESS', message:"Matriculas carregadas", data: matriculas}, status: :ok
            end

            # Adicionar Matricula
            
            def create
                matricula = Matricula.new(parametros)
                if matricula.save
                    p "Resultado #{matricula}"
                    render json: {status: 'SUCCESS', message:'Matricula adicionada', data: matricula}, status: :ok
                   
                    data = DateTime.now()
                    matricula.quantd_faturas.times do
                        


                        valor_fatura = matricula.valor_total.fdiv(matricula.quantd_faturas)

                        fatura = Fatura.new({valor: valor_fatura,data_vencimento: data_fatura,matricula_id: matricula.id, status: 'Aberta'})

                        fatura.save
                        
                        data = data.next_month
                    end

                else
                    render json: {status: 'ERROR', message:'Não foi possível adicionar a matricula', data: matricula.errors}, status: :unprocessable_entity
                end
                
            end
            
            private
            def parametros
                params.permit(:valor_total, :quantd_faturas, :dia_vencimento, :nome_curso, :ies_id, :aluno_id)
            end
        
        end

    end

end