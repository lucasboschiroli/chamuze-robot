*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${Browser}    Chrome
${URL}    http://localhost/chamuze/PROJETO/login.php
${CAMPO_EMAIL}    name:email
${CAMPO_SENHA}    name:senha
${BOTAO_LOGIN}    name:btn_login
${TEXTO_SUCESSO_SOLICITANTE}    Seu serviço doméstico a um clique de distância.
${TEXTO_FALHA}    E-mail ou senha incorretos!
${BOTAO_SOLICITAR}    link:Solicitar Serviço
${TITULO_SOLICITAO}    name:titulo
${DESCRICAO_SERVICO}    name:descricao
${IMAGEM}    name:img_servico
${CAMPO_CATEGORIA_SERVICO}    name:categoria
${CATEGORIA}           Jardinagem
${CAMPO_CATEGORIA_REGIAO}    name:regiao
${REGIAO}    Cajuru
${PRECO}    preco
${PEDIR}    name:btn_solicitar
${CONFIRMA_SOLICITACAO}    Serviços Disponíveis
${ERRO_SOLICITACAO}    



*** Keywords ***
Abrir navegador
    open Browser    ${URL}    ${Browser}
    Maximize browser window
Realizar login valido solicitante 
    Input Text    ${CAMPO_EMAIL}    solicitante@teste.com
    Input Text    ${CAMPO_SENHA}    123
    Click Element    ${BOTAO_LOGIN}
Acessar pagina de solicitacao 
    Wait Until Page Contains    ${TEXTO_SUCESSO_SOLICITANTE}    timeout=40s
    Click Element    ${BOTAO_SOLICITAR}
Preencher formulario de solictacao
    Input Text    ${TITULO_SOLICITAO}    jardinagem
    Input Text    ${DESCRICAO_SERVICO}    quero alguem para realizar a minha jardinagem do meu quintal
    Choose File    ${IMAGEM}    C:/Users/Arthur/Pictures/Screenshots/Captura de tela 2025-05-04 193825.png
    Select From List By Label    ${CAMPO_CATEGORIA_SERVICO}    ${CATEGORIA}
    Select From List By Label    ${CAMPO_CATEGORIA_REGIAO}    ${REGIAO}
    Input Text    ${PRECO}    120
Enviar solicitacao 
    Click Element    ${PEDIR}
Verificar se foi feita a solicitacao
    Wait Until Page Contains    ${CONFIRMA_SOLICITACAO}    timeout=40s
Preencher formulario solictacao sem preco
    Input Text    ${TITULO_SOLICITAO}    jardinagem
    Input Text    ${DESCRICAO_SERVICO}    quero alguem para realizar a minha jardinagem do meu quintal
    Choose File    ${IMAGEM}    C:/Users/Arthur/Pictures/Screenshots/Captura de tela 2025-05-04 193825.png
    Select From List By Label    ${CAMPO_CATEGORIA_SERVICO}    ${CATEGORIA}
    Select From List By Label    ${CAMPO_CATEGORIA_REGIAO}    ${REGIAO}
    Input Text    ${PRECO}    ${EMPTY}
    Click Element    ${PEDIR}
Verificar mensagem de erro    
    ${msg}=    Execute Javascript    return document.getElementsByName("preco")[0].validationMessage
    Log To Console    Mensagem exibida: ${msg}
    Should Be Equal As Strings    ${msg}    Preencha este campo.
Fechar o navegador
    Capture PageScreenshot
    Close Browser
