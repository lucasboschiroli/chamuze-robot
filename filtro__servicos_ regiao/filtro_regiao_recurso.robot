*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${BROWSER}      chrome
${URL_LOGIN}    http://localhost/chamuze/PROJETO/login.php
${EMAIL}        prestador@teste.com
${SENHA}        123
${REGIAO}       Cachoeira
${TEXTO_SUCESSO_LOGIN}    Serviços Disponíveis
${BTN_REGIAO}    name:local_servico
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

Filtrar Servicos Por Regiao
    [Arguments]    ${nome_regiao}
    Sleep    3s
    Select From List By Label        ${BTN_REGIAO}    Cachoeira
    Capture Page Screenshot 
    Wait Until Element Is Visible    local_servico                   timeout=20s
    Click Element    ${BOTAO_FILTRAR}
    Capture Page Screenshot 
    Wait Until Page Contains         ${nome_regiao}    timeout=20s

Verificar Servicos Filtrados
    Capture Page Screenshot 
    Page Should Contain              ${REGIAO}
    Close Browser
  
Acessar Sistema Como Prestador
    Open Browser    ${URL_LOGIN}    ${BROWSER}
    Maximize Browser Window
    Capture Page Screenshot
    Input Text      name:email        ${EMAIL}
    Capture Page Screenshot
    Input Text      name:senha        ${SENHA}
    Capture Page Screenshot
    Click Element   name:btn_login
    Capture Page Screenshot
    Wait Until Page Contains    ${TEXTO_SUCESSO_LOGIN}    timeout=20s

Filtrar Servicos Por Regiao
    [Arguments]    ${nome_regiao}
    Sleep    3s
    Capture Page Screenshot
    Select From List By Label        ${BTN_REGIAO}    ${REGIAO}
    Wait Until Element Is Visible    local_servico                   timeout=20s
    Capture Page Screenshot
    Click Element    ${BOTAO_FILTRAR}
    Capture Page Screenshot
    Wait Until Page Contains         ${nome_regiao}    timeout=20s

Verificar Servicos Filtrados
    Page Should Contain              ${REGIAO}
    Capture Page Screenshot
    Close Browser

