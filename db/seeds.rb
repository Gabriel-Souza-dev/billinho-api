# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)



def validar_data(data,matricula)
    datinha = Date.new(data.year,data.month,matricula.dia_vencimento)
    return datinha if Date.valid_date?(datinha.year,datinha.month,datinha.mday)
    return datinha = Date.civil(datinha.year,datinha.month,-1)
end

AlunoIterator = 202
IesIterator = 302
data = DateTime.new(2020,1,31)

10.times do |i|

    puts "#{i}"
    Ies.create({

        nome:   Faker::Educator.university,
        cnpj:   Faker::Company.brazilian_company_number,
        tipo:   ["Universidade","Escola","Creche"].sample

    })

    Aluno.create({

        nome:               Faker::Name.name,
        cpf:                Faker::Number.number(digits: 11),
        data_nasc:          Faker::Date.birthday(min_age: 5, max_age: 90),
        celular:            '9'+Faker::Number.number(digits: 8).to_s,
        genero:             ["M","F"].sample,
        metodo_pagamento:   ["Cartão","Boleto"].sample
    })

    matricula = Matricula.create({

        valor_total:                Faker::Number.decimal(l_digits: 4, r_digits: 2),
        quantd_faturas:             [12,18,24,30,42,48].sample,
        dia_vencimento:             data.day,
        nome_curso:                 Faker::Educator.course,
        ies_id:                     i+1,
        aluno_id:                   i+1
    })
    
    matricula.quantd_faturas.times do |i|
         
        
  
        Fatura.create({
        
            valor:              matricula.valor_total.fdiv(matricula.quantd_faturas), 
            data_vencimento:    validar_data(data,matricula),
            matricula_id:       matricula.id,
            status:             "Aberta"
        })
     
        
    end
    
    data = DateTime.new(2020,1,31)
end
