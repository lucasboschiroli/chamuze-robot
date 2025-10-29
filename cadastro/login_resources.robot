*** Settings ***
Library    SeleniumLibrary
*** Variables ***
${Browser}    Chrome
${URL}    http://localhost/chamuze/PROJETO/login.php
${URL_CADASTRO}    http://localhost/chamuze/PROJETO/cadastro.php?tipo_perfil=prestador
${ESCOLHA_PRESTADOR}    css=img[alt="Prestador"]
${CAMPO_EMAIL_CADASTRO}    name:email
${CAMPO_NOME}    name:nome
${CAMPO_SNOME}    name:snome
${CAMPO_DATA_NASC}    id=datanasc
${CPF}    name:cpf
${CNPJ}    name:cnpj
${TELEFONE}    name:telefone
${GENERO}    name:genero
${SENHA}    name:senha
${SENHA_CONFIRMA}    name:senhaConfirmada
${CEP}    name:cep
${LOGADOURO}    name:logradouro
${BAIRRO}    name:bairro
${CIDADE}    name:cidade
${NUMERO}    name:numero_casa
${ESTADO}    name:estado
${IMG}    name:img_rg
${PIX}    name:chavepix
${CADASTRAR}    name:btn_enviar
${SENHA_ERRADA}    xpath=//div[contains(@class,'alert-danger')]    
${CAMPO_EMAIL}    name:email
${CAMPO_SENHA}    name:senha
${BOTAO_LOGIN}    name:btn_login
${TEXTO_SUCESSO_LOGIN}    Serviços Disponíveis
${TEXTO_SUCESSO_SOLICITANTE}    Seu serviço doméstico a um clique de distância.
${TEXTO_FALHA}    E-mail ou senha incorretos!

*** Keywords ***
Abrir navegador
    open Browser    ${URL_CADASTRO}    ${Browser}
    Maximize browser window
Acessar pagina login 
    Go To    ${URL}
    Wait Until Page Contains Element    ${CAMPO_EMAIL}    timeout=10s
Preencher formulario de cadastro
    Input Text    ${CAMPO_EMAIL_CADASTRO}    arthur2@gmail.com
    Input Text    ${CAMPO_NOME}    Arthur
    Input Text    ${CAMPO_SNOME}    Kalil
    Input Text    ${CAMPO_DATA_NASC}    06/10/2006
    Input Text    ${CPF}    13005989965
    Input Text    ${CNPJ}    11111111111111
    Input Text    ${TELEFONE}    41998842424
    Select From List By Label    ${GENERO}    Masculino
    Input Text    ${SENHA}    Vi28112712@
    Input Text    ${SENHA_CONFIRMA}    Vi28112712@
    Input Text    ${CEP}    50765122
    Input Text    ${LOGADOURO}    avenida
    Input Text    ${BAIRRO}    reboucas
    Input Text    ${CIDADE}    FVFAF
    Input Text    ${NUMERO}    123
    Select From List By Label    ${ESTADO}    Paraná
    Choose File    ${IMG}    C:/Users/Arthur/Pictures/Screenshots/Captura de tela 2025-05-04 193825.png
    Input Text    ${PIX}    8242848272784
enviar solicitacao de cadastro
    Scroll Element Into View    id=btnEnviar
    Click Button    ${CADASTRAR}
verificar cadastro realizado com sucesso   
    Wait Until Page Contains    Login    timeout=20s

Realizar Cadastro senha fraca
    Input Text    ${CAMPO_EMAIL_CADASTRO}    arthur234@gmail.com
    Input Text    ${CAMPO_NOME}    tutu
    Input Text    ${CAMPO_SNOME}    Kali42442l
    Input Text    ${CAMPO_DATA_NASC}    06/10/2006
    Input Text    ${CPF}    13005929965
    Input Text    ${CNPJ}    11111112111111
    Input Text    ${TELEFONE}    41998842424
    Select From List By Label    ${GENERO}    Masculino
    Input Text    ${SENHA}    Vi28112712
    Input Text    ${SENHA_CONFIRMA}    Vi28112712
    Input Text    ${CEP}    50765122
    Input Text    ${LOGADOURO}    avenida
    Input Text    ${BAIRRO}    reboucas
    Input Text    ${CIDADE}    FVFAF
    Input Text    ${NUMERO}    123
    Select From List By Label    ${ESTADO}    Paraná
    Choose File    ${IMG}    C:/Users/Arthur/Pictures/Screenshots/Captura de tela 2025-05-04 193825.png
    Input Text    ${PIX}    82423848272784
verificar mensagem de erro de senha
    Element Should Contain    ${SENHA_ERRADA}    A senha não atende aos requisitos
Realizar login valido prestador
    Input Text    ${CAMPO_EMAIL}    prestador@teste.com
    Input Text    ${CAMPO_SENHA}    123
    Click Element    ${BOTAO_LOGIN}
    Wait Until Page Contains    ${TEXTO_SUCESSO_LOGIN}    timeout=20s
Realizar login invalido
    Input Text    ${CAMPO_EMAIL}    prestador@teste.com
    Input Text    ${CAMPO_SENHA}    7777
    Click Element    ${BOTAO_LOGIN}
    Wait Until Page Contains   ${TEXTO_FALHA}    timeout=10s
Fechar o navegador
    Capture PageScreenshot
    Close Browser