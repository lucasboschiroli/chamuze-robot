*** Settings ***
Library    SeleniumLibrary

*** Variables ***    
${CENARIO2_PRINTS}    Envio_de_mensagens_para_o_prestador/prints
${CENARIO2_LOGS}    Envio_de_mensagens_para_o_prestador/logs
${CENARIO2_REPORTS}    Envio_de_mensagens_para_o_prestador/reports
${TEXTO_MENSAGEM}    Olá, gostaria de confirmar o horário do serviço

*** Keywords ***

Clicar em Prestador responsável no serviço que já tenha sido aceito pelo prestador
    [Documentation]    Localiza e clica no botão do prestador responsável em um serviço já aceito, garantindo que o botão esteja visível.
    Wait Until Element Is Visible    xpath://button[contains(@id,'botao-prestador-responsavel') and contains(@style,'block')]    10s
    Click Element    xpath://button[contains(@id,'botao-prestador-responsavel') and contains(@style,'block')]

Clicar em Conversar
    [Documentation]    Localiza e clica no botão "Conversar" para iniciar a comunicação com o prestador.
    Wait Until Page Contains Element    id:btn_conversar    10s
    Click Element    id:btn_conversar

Preencher o campo de mensagem com o texto desejado
    [Documentation]    Preenche o campo de mensagem com o texto definido na variável ${TEXTO_MENSAGEM}.
    Wait Until Page Contains Element    name:mensagem    5s
    Input Text    name:mensagem    ${TEXTO_MENSAGEM}

Deixar o campo de mensagem vazio
    [Documentation]    Limpa o campo de mensagem, deixando-o vazio para testar validação.
    Wait Until Page Contains Element    name:mensagem    5s
    Clear Element Text    name:mensagem

Clicar em Enviar e verificar se a mensagem aparece como última mensagem enviada na tela
    [Documentation]    Clica no botão "Enviar" e verifica se a mensagem digitada aparece como última mensagem na tela.
    Click Button    name:envio_mensagem
    Wait Until Page Contains    ${TEXTO_MENSAGEM}    10s
    Element Should Be Visible    xpath://div[contains(@class, 'bg-primary')]//p[contains(text(), '${TEXTO_MENSAGEM}')]

Clicar em Enviar e verificar se a mensagem de alerta aparece abaixo do campo de digitar mensagem
    [Documentation]    Clica no botão "Enviar" sem digitar mensagem e verifica se a validação de campo obrigatório é exibida.
    Click Button    name:envio_mensagem
    Wait Until Page Contains Element    xpath://input[@name='mensagem'][@required]    5s
    ${validation_message}=    Execute Javascript    return document.querySelector("input[name='mensagem']").validationMessage;
    Should Not Be Empty    ${validation_message}
