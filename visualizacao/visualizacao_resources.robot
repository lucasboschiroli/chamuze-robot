*** Settings ***
Documentation     Resources dos formulários de cadastro do sistema ChamuZé
Library    SeleniumLibrary
Library    OperatingSystem

*** Variables ***
${Browser}    Chrome
${URL}    http://localhost/chamuze/PROJETO/login.php
${URL_CADASTRO}    http://localhost/chamuze/PROJETO/cadastro.php?tipo_perfil=prestador
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

Acessar página de login
    [Documentation]    Navega para a página de login e aguarda o carregamento do campo de email
    [Tags]    navigation    login
    Go To    ${URL}
    Wait Until Page Contains Element    ${CAMPO_EMAIL}    timeout=10s
    Log    Acesso a página de login com sucesso

Realizar login válido como prestador
    Input Text    ${CAMPO_EMAIL}    prestador@gmail.com
    Input Text    ${CAMPO_SENHA}    123
    Click Element    ${BOTAO_LOGIN}
    Wait Until Page Contains    ${TEXTO_SUCESSO_LOGIN}    timeout=20s

Fechar o navegador
    [Documentation]    Fecha o navegador
    [Tags]    teardown    browser
    Close Browser