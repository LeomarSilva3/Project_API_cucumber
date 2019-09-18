Dado("que visualizo a rota {string}") do |endpoint|
   @url_default = endpoint

end

Dado("que insiro o header {string}") do |json|
    @head = json
end

Quando("realizar uma requisição com os parametros {string}, {string} e {string} via metodo POST no body da requisição") do |name, email, senha|
    @result = HTTParty.post(
        @url_default,
        body: {
            full_name: name,
            email: email,
            password: senha
        }.to_json,
        headers: {
            "Content-Type" => "application/json",
        },
    )

    Database.new.delete_user(email)
 
end

Quando("realizar uma requisição com os parametros errados {string}, {string} e {string} via metodo POST no body da requisição") do |name, email, senha|
    @result = HTTParty.post(
        @url_default,
        body: {
            full_name: name,
            email: email,
            password: senha
        }.to_json,
        headers: {
            "Content-Type" => "application/json",
        },
    )

end

Quando("realizar uma requisição com os parametros nullos via metodo POST no body da requisição") do 
    @result = HTTParty.post(
        @url_default,
        body: {
            full_name:"",
            email:"",
            password:"" 
        }.to_json,
        headers: {
            "Content-Type" => "application/json",
        },
    )

end


Então("tem o retorno do {string}") do |codigo|
    expect(@result.response.code).to eql codigo
end

Então("tem usuario cadastrado com sucesso") do
    puts @result
  
end

Então("recebe uma mensagem {string} no retorno") do |message|
    expect(@result.parsed_response["msg"]).to eql message
    
end

  