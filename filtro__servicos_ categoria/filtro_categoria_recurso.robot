*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${BROWSER}      chrome
${URL_LOGIN}    http://localhost/chamuze/PROJETO/login.php
${EMAIL}        prestador@teste.com
${SENHA}        123
${CATEGORIA}       Construção
${TEXTO_SUCESSO_LOGIN}    Serviços Disponíveis
${BTN_CATEGORIA}    name:categoria
${BOTAO_FILTRAR}    xpath://button[@type="submit" and contains(., "Filtrar")]


*** Keywords ***
Acessar Sistema Como Prestador
    Open Browser    ${URL_LOGIN}    ${BROWSER}
    Maximize Browser Window
    Capture Page Screenshot
    Input Text      name:email        ${EMAIL}
    Capture Page Screenshot 
    Input Text      name:senha        ${SENHA}
    Capture Page Screenshot 
    Click Element   name:btn_login
    Wait Until Page Contains    ${TEXTO_SUCESSO_LOGIN}    timeout=20s
    Capture Page Screenshot

Filtrar Servicos Por Categoria
    [Arguments]    ${nome_categoria}
    Sleep    3s
    Select From List By Label        ${BTN_CATEGORIA}    Construção
    Capture Page Screenshot 
    Wait Until Element Is Visible    categoria                   timeout=20s
    Click Element    ${BOTAO_FILTRAR}
    Capture Page Screenshot 
    Wait Until Page Contains         ${nome_categoria}    timeout=20s

Verificar Servicos Filtrados
    Capture Page Screenshot 
    Page Should Contain              ${CATEGORIA}
    Close Browser

Filtrar Servicos Por Categoria
    Acessar Sistema Como Prestador
    Filtrar Servicos Por Categoria  ${CATEGORIA}
    Verificar Servicos Filtrados

*** Keywords ***
Acessar Sistema Como Prestador
    Open Browser    ${URL_LOGIN}    ${BROWSER}
    Maximize Browser Window
    Capture Page Screenshot
    Input Text      name:email        ${EMAIL}
    Capture Page Screenshot 
    Input Text      name:senha        ${SENHA}
    Capture Page Screenshot 
    Click Element   name:btn_login
    Wait Until Page Contains    ${TEXTO_SUCESSO_LOGIN}    timeout=20s
    Capture Page Screenshot

Filtrar Servicos Por Categoria
    [Arguments]    ${nome_categoria}
    Sleep    3s
    Select From List By Label        ${BTN_CATEGORIA}    Todas as categorias
    Capture Page Screenshot 
    Wait Until Element Is Visible    categoria                   timeout=20s
    Click Element    ${BOTAO_FILTRAR}
    Capture Page Screenshot 
    Wait Until Page Contains         ${nome_categoria}    timeout=20s

Verificar Servicos Filtrados
    Capture Page Screenshot 
    Page Should Contain              ${CATEGORIA}
    Close Browser

