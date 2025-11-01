*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${BROWSER}      chrome
${URL_LOGIN}    http://localhost/chamuze/PROJETO/login.php
${EMAIL}        solicitante@teste.com
${SENHA}        123
${TEXTO_SUCESSO_LOGIN}    Chama o Zé!
${BOTAO_PAGINA_PROPOSTA}    link:Propostas
${TEXTO_SUCESSO_PROPOSTAS}    Propostas Disponíveis
${TEXTO_RECUSAR_PROPOSTA}    Deseja realmente excluir esta proposta?

*** Keywords ***
Acessar Sistema Como Solicitante
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
    

Acessar Pagina De Propostas
    Wait Until Element Is Visible    ${BOTAO_PAGINA_PROPOSTA}    timeout=15s
    Click Element                    ${BOTAO_PAGINA_PROPOSTA}
    Wait Until Page Contains         ${TEXTO_SUCESSO_PROPOSTAS}    timeout=20s
    Capture Page Screenshot

Recusar Proposta Enviada
    Click Element    xpath=//button[contains(normalize-space(.), 'Excluir')]
    Wait Until Element Is Visible     xpath=//button[contains(., 'Sim, excluir')]    timeout=10s
    Wait Until Element Is Enabled     xpath=//button[contains(., 'Sim, excluir')]    timeout=10s
    Click Element                     xpath=//button[contains(., 'Sim, excluir')]
    Sleep    5s
    Capture Page Screenshot
    Close Browser

Acessar Sistema Como Solicitante
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

Acessar Pagina De Propostas
    Wait Until Element Is Visible    ${BOTAO_PAGINA_PROPOSTA}    timeout=15s
    Click Element                    ${BOTAO_PAGINA_PROPOSTA}
    Wait Until Page Contains         ${TEXTO_SUCESSO_PROPOSTAS}    timeout=20s
    Capture Page Screenshot

Aceitar Proposta Enviada
    Wait Until Element Is Visible    xpath=//button[contains(., 'Aceitar')]    timeout=10s
    Click Element    xpath=//button[contains(., 'Aceitar')]
    Sleep    5s
    Close Browser



