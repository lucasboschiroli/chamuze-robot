*** Settings ***
Documentation     Resources dos formulários de cadastro do sistema ChamuZé
Library    SeleniumLibrary
Library    OperatingSystem

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
${URL_CADASTRO_ADM}    http://localhost/chamuze/PROJETO/administrador/cadastroAdm.php
${MENSAGEM_SUCESSO_CADASTRO_ADM}    Usuário cadastrado com sucesso
${MENSAGEM_EMAIL_DUPLICADO}    E-mail de usuário já cadastrado no banco de dados
${ALERTA_SUCESSO}    css=.alert.alert-success
${ALERTA_ERRO}    css=.alert.alert-danger

*** Keywords ***
Configurar ambiente de teste
    Create Directory    ${CURDIR}/Evidencias
    Set Screenshot Directory    ${CURDIR}/Evidencias

Abrir navegador
    [Documentation]    Abre o navegador Chrome e maximiza a janela na página de cadastro de prestadores
    [Tags]    setup    browser
    open Browser    ${URL_CADASTRO}    ${Browser}
    Maximize browser window
    Log    Navegador aberto com sucesso

Acessar página de cadastro de administradores
    [Documentation]    Clica no link "Cadastrar ADM" na navbar e aguarda o carregamento da página
    [Tags]    navigation    admin
    Click Element    xpath=//a[contains(@href, 'cadastroAdm')]
    Wait Until Page Contains Element    ${CAMPO_EMAIL_CADASTRO}    timeout=10s
    Log    Acesso a página de cadastro de administradores com sucesso

Acessar página de login
    [Documentation]    Navega para a página de login e aguarda o carregamento do campo de email
    [Tags]    navigation    login
    Go To    ${URL}
    Wait Until Page Contains Element    ${CAMPO_EMAIL}    timeout=10s
    Log    Acesso a página de login com sucesso

Preencher formulário de cadastro de prestadores
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

Preencher formulário de cadastro de administradores
    [Documentation]    Preenche todos os campos obrigatórios do formulário de cadastro de administradores com dados válidos
    [Tags]    form    admin    data-input
    Input Text    ${CAMPO_EMAIL_CADASTRO}    luc4sboschiroli@gmail.com
    Input Text    ${CAMPO_NOME}    Lucas
    Input Text    ${CAMPO_SNOME}    Boschiroli
    Input Text    ${CAMPO_DATA_NASC}    28/04/2005
    Input Text    ${CPF}    13694868984
    Input Text    ${TELEFONE}    41995662435
    Select From List By Label    ${GENERO}    Masculino
    Input Text    ${SENHA}    TrueDetectiveS01!
    Input Text    ${SENHA_CONFIRMA}    TrueDetectiveS01!
    Log    Formulário de cadastro de administradores preenchido com sucesso

Enviar solicitação de cadastro
    [Documentation]    Scroll até o botão de envio e envia o formulário de cadastro
    [Tags]    form    submission
    Scroll Element Into View    id=btnEnviar
    Click Button    ${CADASTRAR}
    Log    Solicitação de cadastro enviada com sucesso

Verificar se o cadastro foi realizado com sucesso   
    Wait Until Page Contains    Login    timeout=20s

Verificar se o cadastro de administradores foi realizado com sucesso
    [Documentation]    Verifica se o cadastro de administrador foi realizado com sucesso através da mensagem de sucesso e parâmetro erro=3 na URL
    [Tags]    validation    admin    positive-test
    Wait Until Page Contains    ${MENSAGEM_SUCESSO_CADASTRO_ADM}    timeout=10s
    Element Should Be Visible    ${ALERTA_SUCESSO}
    ${url}=    Get Location
    Should Contain    ${url}    erro=3
    Log    Cadastro de administrador realizado com sucesso - mensagem de sucesso

Verificar mensagem de erro de email duplicado
    [Documentation]    Verifica se a mensagem de erro para email já cadastrado é exibida corretamente com parâmetro erro=1 na URL
    [Tags]    validation    admin    negative-test    error-handling
    Wait Until Page Contains    ${MENSAGEM_EMAIL_DUPLICADO}    timeout=10s
    Element Should Be Visible    ${ALERTA_ERRO}
    ${url}=    Get Location
    Should Contain    ${url}    erro=1
    Log    Mensagem de erro de email duplicado exibida corretamente

Realizar cadastro de prestadores com uma senha fraca
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

Realizar cadastro de administradores com email inválido (já cadastrado)
    [Documentation]    Preenche o formulário de cadastro de administradores utilizando um email já existente no sistema
    [Tags]    form    admin    data-input    negative-test
    Input Text    ${CAMPO_EMAIL_CADASTRO}    luc4sboschiroli@gmail.com
    Input Text    ${CAMPO_NOME}    Lucas
    Input Text    ${CAMPO_SNOME}    Boschiroli
    Input Text    ${CAMPO_DATA_NASC}    28/04/2005
    Input Text    ${CPF}    13694868984
    Input Text    ${TELEFONE}    41995662435
    Select From List By Label    ${GENERO}    Masculino
    Input Text    ${SENHA}    TrueDetectiveS01!
    Input Text    ${SENHA_CONFIRMA}    TrueDetectiveS01!
    Log    Envio de formulário verificado com sucesso - saiu da página de formulário

Verificar a mensagem de erro de senha
    Element Should Contain    ${SENHA_ERRADA}    A senha não atende aos requisitos

Realizar login válido como administrador
    [Documentation]    Realiza login no sistema com credenciais válidas de administrador e verifica acesso bem-sucedido
    [Tags]    login    admin    authentication    positive-test
    Input Text    ${CAMPO_EMAIL}    admin@teste.com
    Input Text    ${CAMPO_SENHA}    123
    Click Element    ${BOTAO_LOGIN}
    Log    Administrador logado com sucesso

Realizar login válido como prestador
    Input Text    ${CAMPO_EMAIL}    prestador@teste.com
    Input Text    ${CAMPO_SENHA}    123
    Click Element    ${BOTAO_LOGIN}
    Wait Until Page Contains    ${TEXTO_SUCESSO_LOGIN}    timeout=20s

Realizar login inválido como prestador
    Input Text    ${CAMPO_EMAIL}    prestador@teste.com
    Input Text    ${CAMPO_SENHA}    7777
    Click Element    ${BOTAO_LOGIN}
    Wait Until Page Contains   ${TEXTO_FALHA}    timeout=10s

Fechar o navegador
    [Documentation]    Fecha o navegador
    [Tags]    teardown    browser
    Close Browser