*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${CENARIO1_PRINTS}    ${CURDIR}/prints
${CENARIO1_LOGS}    ${CURDIR}/logs
${CENARIO1_REPORTS}    ${CURDIR}/reports

*** Keywords ***

Clicar em Avaliar prestador no serviço que já tenha sido concluído pelo prestador
    [Documentation]    Localiza e clica no botão "Avaliar" de um serviço concluído pelo prestador, garantindo que a página de avaliação seja exibida.
    Wait Until Page Contains Element    id:btn_avaliar    10s
    Scroll Element Into View    id:btn_avaliar
    Wait Until Element Is Visible    id:btn_avaliar    5s
    Click Element    id:btn_avaliar
    Wait Until Element Is Visible    xpath://h1[text()='Avaliação']    5s

Não selecionar nenhuma estrela
    [Documentation]    Aguarda o carregamento do elemento da primeira estrela (valor 0) sem selecioná-la, usado para testar avaliação sem estrelas.
    Wait Until Page Contains Element    xpath://input[@name='estrela'][@value='0']/preceding-sibling::label[1]

Selecionar a última quinta estrela
    [Documentation]    Clica na quinta estrela para selecionar a nota máxima na avaliação do prestador.
    Click Element    xpath://input[@name='estrela'][@value='5']/preceding-sibling::label[1]

Clicar em Avaliar
    [Documentation]    Clica no botão "Avaliar" para enviar a avaliação e aguarda um pequeno tempo para o processamento.
    Click Button    id:btn_enviar_avaliar
    Sleep    2s

Verificar se aparece uma mensagem de Prestador avaliado com sucesso e clicar em Ok
    [Documentation]    Verifica se a mensagem de sucesso é exibida após a avaliação e confirma clicando no botão "Ok".
    Wait Until Page Contains    Prestador avaliado com sucesso    10s
    Click Button    xpath://button[contains(@class, 'swal2-confirm')]
    Sleep    1s
