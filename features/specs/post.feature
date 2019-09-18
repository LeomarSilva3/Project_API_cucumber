# language: pt

Funcionalidade: Criar um novo usuario atraves de um cliente API
Como um cliente da API
Quero enviar requisições com o metodo POST
Afim de poder criar um novo usuario na base de dados

Contexto: Configuração para enviar requisições com o metodo POST
    Dado que visualizo a rota "http://localhost:3001/user"
    E que insiro o header "Content-Type", "application/json"
    

Esquema do Cenario: Criar um novo usuario
    Quando realizar uma requisição com os parametros "<full_name>", "<email>" e "<password>" via metodo POST no body da requisição 
    Então tem o retorno do "<codigo>"
    E tem usuario cadastrado com sucesso

    Exemplos:
     | full_name | email           | password | codigo |
     | jose3     | leomar@jose3.io | 123456   | 200    |


Esquema do Cenario: Erros ao criar um novo usuário
    Quando realizar uma requisição com os parametros errados "<full_name>", "<email>" e "<password>" via metodo POST no body da requisição 
    Então tem o retorno do "<codigo>"
    E recebe uma mensagem "<msg>" no retorno

   Exemplos: 
      | full_name  | email         | password | codigo | msg                                                                   |
      | Tony Stark | tony@stark.io | 123456   | 409    | Oops. Looks like you already have an account with this email address. |
      | Tony Stark | tonystark.io  | 123456   | 412    | Oops. You entered a wrong email.                                      |
      |            |               |          | 412    | Validation notEmpty on full_name failed                               |


Esquema do Cenario: Parametros nulos
    Quando realizar uma requisição com os parametros nullos via metodo POST no body da requisição 
    Então tem o retorno do "<codigo>"
    E recebe uma mensagem "<msg>" no retorno

   Exemplos:
   | codigo | msg                                     |
   | 412    | Validation notEmpty on full_name failed |
 