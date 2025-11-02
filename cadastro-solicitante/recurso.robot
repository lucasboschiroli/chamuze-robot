*** Settings ***
Library    SeleniumLibrary
Library    OperatingSystem
Test Setup    Iniciar Browser
Test Teardown    Fechar Browser
Documentation    Testes para o cadastro de solicitante envolvendo o CPF


*** Variables ***
${BROWSER}    Chrome
${PAG_CAD_SOLICITANTE}    http://localhost/ChamuZe/PROJETO/cadastro.php?tipo_perfil=solicitante
${CAMPO_EMAIL}    name:email
${CAMPO_NOME}    name:nome
${CAMPO_SOBRENOME}    name:snome
${CAMPO_DATA_NASC}    name:datanasc
${CAMPO_CPF}    name:cpf
${CAMPO_TEL}    name:telefone
${CAMPO_GENERO}    name:genero
${CAMPO_SENHA}    name:senha
${CAMPO_SENHAC}    name:senhaConfirmada
${CAMPO_CEP}    name:cep
${CAMPO_NUMERO}    name:numero_casa
${ENVIAR}    name:btn_enviar
${SELECTOR_FINAL_CPF_INVALIDO}    class=alert-danger
${RESULTADO_CPF_INVALIDO}    Por favor, digite um CPF válido com 11 dígitos.
${SELECTOR_FINAL_CPF_VALIDO}    class=alert-success
${RESULTADO_CPF_VALIDO}    Cadastrado com sucesso!
${EMAIL}    robot@teste.com
${NOME}    Rafael Augusto 
${SOBRENOME}    de Oliveira Souza
${DATA_NASC}    13112006
${CPF_INVALIDO}    111111
${CPF_VALIDO}    42931184039
${TELEFONE}    47986678998
${GENERO}    2
${SENHA}    a2rvhT66-P9
${CEP}    83883280
${NUMERO_CASA}    189

*** Keywords ***
Iniciar Browser
    Open Browser    ${PAG_CAD_SOLICITANTE}    ${BROWSER}
    Maximize Browser Window

Refazer Teste
    Go To    ${PAG_CAD_SOLICITANTE}
    Capture Page Screenshot
    
Inserir Dados Cadastrais
    [Arguments]    ${CPF_ENTRADA}    ${SELECTOR_FINAL}
    Wait Until Page Contains Element    ${CAMPO_EMAIL}
    Input Text    ${CAMPO_EMAIL}    ${EMAIL}
    Capture Page Screenshot
    Input Text    ${CAMPO_NOME}    ${NOME}
    Capture Page Screenshot
    Input Text    ${CAMPO_SOBRENOME}    ${SOBRENOME}
    Capture Page Screenshot
    Input Text    ${CAMPO_DATA_NASC}    ${DATA_NASC}
    Capture Page Screenshot
    Input Text    ${CAMPO_CPF}    ${CPF_ENTRADA}
    Capture Page Screenshot
    Input Text    ${CAMPO_TEL}    ${TELEFONE}
    Capture Page Screenshot
    Select From List By Value    ${CAMPO_GENERO}    ${GENERO}
    Capture Page Screenshot
    Input Text    ${CAMPO_SENHA}    ${SENHA}
    Capture Page Screenshot
    Input Text    ${CAMPO_SENHAC}    ${SENHA}
    Capture Page Screenshot
    Input Text    ${CAMPO_CEP}    ${CEP}
    Capture Page Screenshot
    Input Text    ${CAMPO_NUMERO}    ${NUMERO_CASA}
    Capture Page Screenshot
    Press Keys    ${ENVIAR}    RETURN
    Wait Until Page Contains Element    ${SELECTOR_FINAL}    timeout=10
    Capture Page Screenshot

Verificar Resultado   
    [Arguments]    ${RESULTADO_ESPERADO}
    Page Should Contain    ${RESULTADO_ESPERADO}
    Capture Page Screenshot

Fechar Browser
    Close Browser
    