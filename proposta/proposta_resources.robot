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
${BOTAO_REALIZAR_PROPOSTA}    id=btn-proposta
${BOTAO_SIM_ENVIAR_PROPOSTA}    css=button.swal2-confirm
${BOTAO_CANCELAR_PROPOSTA}    css=button.swal2-cancel
${CAMPO_NOVO_PRECO}    name:valor_proposta
${CAMPO_JUSTIFICATIVA}    name:justificativa
${BOTAO_ENVIAR_PROPOSTA}    xpath=//button[contains(text(), 'Enviar Proposta')]
${PRIMEIRO_SERVICO}    xpath=(//div[contains(@class, 'card')])[1]
${MENSAGEM_PROPOSTA_ENVIADA}    Proposta enviada com sucesso
${PRECO_ORIGINAL}    xpath=//p[contains(text(), 'R$ 89,00')]
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

Realizar login válido como prestador verificado
    [Documentation]    Realiza login no sistema com credenciais de prestador verificado
    [Tags]    login    prestador    authentication    positive-test
    Input Text    ${CAMPO_EMAIL}    prestador@gmail.com
    Input Text    ${CAMPO_SENHA}    123
    Click Element    ${BOTAO_LOGIN}
    Wait Until Page Contains    ${TEXTO_SUCESSO_LOGIN}    timeout=20s
    Log    Prestador verificado logado com sucesso

Selecionar primeiro serviço disponível
    [Documentation]    Clica no primeiro serviço da lista de serviços disponíveis
    [Tags]    navigation    servico
    Wait Until Page Contains    Serviços Disponíveis    timeout=10s
    Wait Until Element Is Visible    ${PRIMEIRO_SERVICO}    timeout=10s
    Click Element    ${PRIMEIRO_SERVICO}
    Wait Until Page Contains    Realizar Proposta    timeout=10s
    Log    Serviço selecionado com sucesso

Clicar em realizar proposta
    [Documentation]    Clica no botão "Realizar Proposta" (ID: btn-proposta) para abrir o modal SweetAlert
    [Tags]    proposta    modal
    
    Wait Until Element Is Visible    ${BOTAO_REALIZAR_PROPOSTA}    timeout=10s
    Scroll Element Into View    ${BOTAO_REALIZAR_PROPOSTA}
    Click Element    ${BOTAO_REALIZAR_PROPOSTA}
    
    # Aguarda o SweetAlert aparecer
    Wait Until Element Is Visible    css=.swal2-popup    timeout=10s
    Wait Until Page Contains    Deseja realizar uma Proposta?    timeout=10s
    Log    Modal SweetAlert de confirmação aberto

Confirmar envio de proposta
    [Documentation]    Confirma o envio da proposta clicando em "Sim, enviar proposta" no SweetAlert
    [Tags]    proposta    modal
    
    Wait Until Element Is Visible    ${BOTAO_SIM_ENVIAR_PROPOSTA}    timeout=10s
    Click Element    ${BOTAO_SIM_ENVIAR_PROPOSTA}
    
    # Aguarda redirecionamento para a página de proposta
    Wait Until Page Contains    Realizar Proposta    timeout=10s
    Wait Until Page Contains    Preço Original    timeout=10s
    Log    Redirecionado para formulário de proposta (realizarProposta.php)

Preencher proposta com novo valor
    [Documentation]    Preenche o formulário de proposta com novo valor e justificativa
    [Tags]    proposta    form    data-input
    [Arguments]    ${novo_valor}    ${justificativa}
    Wait Until Element Is Visible    ${CAMPO_NOVO_PRECO}    timeout=10s
    
    # Clear and input the value
    Clear Element Text    ${CAMPO_NOVO_PRECO}
    Input Text    ${CAMPO_NOVO_PRECO}    ${novo_valor}
    
    # Fill justification
    Input Text    ${CAMPO_JUSTIFICATIVA}    ${justificativa}
    Log    Formulário de proposta preenchido: Novo valor=${novo_valor}

Preencher proposta sem novo valor
    [Documentation]    Preenche apenas a justificativa, mantendo o valor original
    [Tags]    proposta    form    data-input
    [Arguments]    ${justificativa}
    Wait Until Element Is Visible    ${CAMPO_JUSTIFICATIVA}    timeout=10s
    Input Text    ${CAMPO_JUSTIFICATIVA}    ${justificativa}
    Log    Formulário de proposta preenchido apenas com justificativa

Enviar proposta
    [Documentation]    Clica no botão "Enviar Proposta" para submeter o formulário
    [Tags]    proposta    submission
    Wait Until Element Is Visible    ${BOTAO_ENVIAR_PROPOSTA}    timeout=10s
    Scroll Element Into View    ${BOTAO_ENVIAR_PROPOSTA}
    Click Element    ${BOTAO_ENVIAR_PROPOSTA}
    Log    Proposta enviada

Verificar envio de proposta com sucesso
    [Documentation]    Verifica se a proposta foi enviada com sucesso através de mensagem ou redirecionamento
    [Tags]    validation    proposta    positive-test
    Sleep    2s
    ${url}=    Get Location

    ${proposta_enviada}=    Run Keyword And Return Status    
    ...    Should Not Contain    ${url}    realizarProposta
    Run Keyword If    ${proposta_enviada}    
    ...    Log    Proposta enviada com sucesso - redirecionamento confirmado
    ...    ELSE    
    ...    Wait Until Page Contains    sucesso    timeout=10s
    Log    Verificação de envio de proposta concluída

Verificar erro no envio de proposta
    [Documentation]    Verifica que o campo obrigatório 'Novo Preço' exibe erro de validação HTML5
    [Tags]    validation    negative-test    error-handling
    
    # The form should still be on the same page (not submitted)
    ${url}=    Get Location
    Should Contain    ${url}    realizarProposta.php
    
    # Check if the required field has validation error (HTML5)
    ${is_invalid}=    Execute JavaScript    
    ...    return document.querySelector('input[name="valor_proposta"]').validity.valid === false
    
    Should Be Equal    ${is_invalid}    ${True}
    Log    Validação HTML5 detectou campo obrigatório vazio corretamente

Fechar o navegador
    [Documentation]    Fecha o navegador
    [Tags]    teardown    browser
    Close Browser