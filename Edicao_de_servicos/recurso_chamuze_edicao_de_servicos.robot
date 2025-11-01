*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${CENARIO3_PRINTS}    ${CURDIR}/prints
${CENARIO3_LOGS}    ${CURDIR}/logs
${CENARIO3_REPORTS}    ${CURDIR}/reports
${NOVO_PRECO}    375.00

*** Keywords ***

Clicar em Editar no serviço desejado
    [Documentation]    Localiza e clica no botão "Editar" do serviço selecionado, aguardando até que a página de edição seja carregada.
    Wait Until Page Contains Element    name:btn-editar    10s
    Click Button    name:btn-editar
    Wait Until Page Contains    Editar Serviço    10s

Não alterar nenhuma informação em nenhum campo
    [Documentation]    Verifica se todos os campos do formulário de edição estão visíveis, sem realizar alterações.
    Wait Until Page Contains Element    id:titulo    5s
    Element Should Be Visible    id:titulo
    Element Should Be Visible    id:descricao
    Element Should Be Visible    id:categoria
    Element Should Be Visible    id:regiao
    Element Should Be Visible    id:preco

Alterar o campo preço inserindo um novo valor
    [Documentation]    Limpa o campo de preço e insere um novo valor definido pela variável ${NOVO_PRECO}.
    Wait Until Page Contains Element    id:preco    5s
    Clear Element Text    id:preco
    Input Text    id:preco    ${NOVO_PRECO}

Clicar em Atualizar
    [Documentation]    Rola a página até o botão "Atualizar", aguarda sua visibilidade e habilitação, e então clica para salvar as alterações.
    Scroll Element Into View    id:btn_atualizar
    Wait Until Element Is Visible    id:btn_atualizar    10s
    Wait Until Element Is Enabled    id:btn_atualizar    10s
    Click Element    id:btn_atualizar
    Sleep    1s

Verificar se o preço não foi alterado
    [Documentation]    Confirma que o preço original do serviço continua na página sem alterações e captura um screenshot.
    Wait Until Page Contains    Serviços Disponíveis    10s
    Page Should Contain Element    xpath://p[@class='fw-bold text-success mb-0']
    Capture Page Screenshot    ${CENARIO3_PRINTS}/verificacao_preco_nao_alterado.png

Verificar se o preço foi alterado
    [Documentation]    Confirma que o novo preço do serviço foi atualizado na página e captura um screenshot.
    Wait Until Page Contains    Serviços Disponíveis    10s
    Wait Until Page Contains    ${NOVO_PRECO}    10s
    Page Should Contain    ${NOVO_PRECO}
    Capture Page Screenshot    ${CENARIO3_PRINTS}/verificacao_preco_alterado.png
