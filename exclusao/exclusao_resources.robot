*** Settings ***
Library    SeleniumLibrary
Library    OperatingSystem

*** Variables ***
${Browser}    Chrome
${URL}    http://localhost/chamuze/PROJETO/login.php
${CAMPO_EMAIL}    name:email
${CAMPO_SENHA}    name:senha
${BOTAO_LOGIN}    name:btn_login
${TEXTO_SUCESSO_SOLICITANTE}    Seu serviço doméstico a um clique de distância.
${BOTAO_MEUS_SERVICOS}    link:Meus Serviços
${BOTAO_EXCLUIR_SERVICO}    xpath=//button[contains(., 'Excluir')]
${BOTAO_CONFIRMA_EXCLUIR}    xpath=//button[contains(text(), 'Sim, excluir!')]
${BOTAO_CANCELAR_EXCLUIR}    xpath=//button[contains(text(), 'Cancelar')]

*** Keywords ***
Configurar ambiente de teste
    Create Directory    ${CURDIR}/Evidencias
    Set Screenshot Directory    ${CURDIR}/Evidencias

Abrir navegador
    open Browser    ${URL}    ${Browser}
    Maximize browser window

Realizar login valido solicitante 
    Input Text    ${CAMPO_EMAIL}    solicitante@teste.com
    Input Text    ${CAMPO_SENHA}    123
    Click Element    ${BOTAO_LOGIN}
    Wait Until Page Contains    ${TEXTO_SUCESSO_SOLICITANTE}    timeout=20s

Realizar exclusao de servico 
    Click Element   ${BOTAO_MEUS_SERVICOS}
    Click Element    ${BOTAO_EXCLUIR_SERVICO} 
    Click Element    ${BOTAO_CONFIRMA_EXCLUIR}
    Wait Until Page Contains    Sucesso    timeout=10s

Realizar exclusao de servico cancelando no final
    Click Element   ${BOTAO_MEUS_SERVICOS}
    Click Element    ${BOTAO_EXCLUIR_SERVICO} 
    Click Element    ${BOTAO_CANCELAR_EXCLUIR}
    Wait Until Page Contains    Meus Serviços    timeout=10s

Fechar o navegador
    Close Browser