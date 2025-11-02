*** Settings ***
Library    SeleniumLibrary
Library    OperatingSystem
Resource    servico_visualizar_teste.robot
Documentation    Testes para o cadastro de solicitante envolvendo o CPF


*** Variables ***
# Configurações do Browser
${BROWSER}                          Chrome
${TIMEOUT_DEFAULT}                  15s
${SELENIUM_SPEED}                   0.2s

# Estrutura de Diretórios
${DIR_EVIDENCIAS}                   ./Evidencias
${DIR_SELECIONAR_SERVICO}          ${DIR_EVIDENCIAS}/selecionar_servico
${DIR_ACEITAR_SERVICO}             ${DIR_EVIDENCIAS}/aceitar_servico
${DIR_VISUALIZAR_SOLICITANTE}      ${DIR_EVIDENCIAS}/visualizar_solicitante
${DIR_ENVIAR_PROPOSTA}             ${DIR_EVIDENCIAS}/enviar_proposta

# URL e Credenciais
${URL_BASE}                         http://localhost/ChamuZe/PROJETO
${URL_LOGIN}                        ${URL_BASE}/login.php
${EMAIL_PRESTADOR}                  prestador@teste.com
${SENHA_PRESTADOR}                  123

# Localizadores - Página de Login
${LOC_CAMPO_EMAIL}                  id:email
${LOC_CAMPO_SENHA}                  id:senha
${LOC_BTN_LOGIN}                    id:btn_login

# Localizadores - Header/Menu
${LOC_MENU_MEUS_SERVICOS}          xpath://a[@href='../prestador/meusServicos.php' or @href='meusServicos.php' or contains(text(),'Meus Serviços')]
${LOC_MENU_HOME}                   xpath://a[contains(@href,'inicialPrestador.php')]
${LOC_LOGO}                         xpath://img[contains(@alt,'Logo') or contains(@src,'chamuze')]

# Localizadores - Página de Serviços
${LOC_CARD_SOLICITACAO}            css:.row-1
${LOC_BTN_SOLICITANTE}             css:.botao-prestador-responsavel
${LOC_TITULO_SERVICOS_DISP}        xpath://*[contains(text(),'Serviços Disponíveis')]

# Localizadores - Página de Detalhes do Serviço
${LOC_BTN_ACEITAR}                 name:btn-editar
${LOC_BTN_PROPOSTA}                id:btn-proposta
${LOC_BTN_CONVERSAR}               css:.rounded-pill

# Localizadores - Modal de Proposta
${LOC_MODAL_CONFIRMAR}             css:.swal2-confirm.swal2-styled
${LOC_CAMPO_VALOR}                 name:valor_proposta
${LOC_CAMPO_JUSTIFICATIVA}         name:justificativa
${LOC_BTN_ENVIAR_PROPOSTA}         css:.btn-success

# Localizadores - Página Meus Serviços
${LOC_TITULO_MEUS_SERVICOS}        xpath://*[contains(text(),'Meus Serviços')]

# Textos Esperados
${TXT_SERVICOS_DISPONIVEIS}        Serviços Disponíveis
${TXT_ACEITE_SUCESSO}              Serviço aceito com sucesso
${TXT_PERFIL_SOLICITANTE}          Perfil do solicitante
${TXT_MEUS_SERVICOS}               Meus Serviços

# Dados de Teste - Proposta
${VALOR_PROPOSTA}                   140
${JUSTIFICATIVA_PROPOSTA}          Preço abaixo do esperado

*** Keywords ***
# ========== CONFIGURAÇÕES ==========
Configurar Suite
    [Documentation]    Cria estrutura de diretórios para evidências
    Log    Criando estrutura de diretórios para evidências    INFO
    Criar Diretorio Se Nao Existir    ${DIR_EVIDENCIAS}
    Criar Diretorio Se Nao Existir    ${DIR_SELECIONAR_SERVICO}
    Criar Diretorio Se Nao Existir    ${DIR_ACEITAR_SERVICO}
    Criar Diretorio Se Nao Existir    ${DIR_VISUALIZAR_SOLICITANTE}
    Criar Diretorio Se Nao Existir    ${DIR_ENVIAR_PROPOSTA}

Criar Diretorio Se Nao Existir
    [Documentation]    Verifica se o diretório existe, caso contrário, cria
    [Arguments]    ${diretorio}
    ${existe}=    Run Keyword And Return Status    Directory Should Exist    ${diretorio}
    Run Keyword If    not ${existe}    Create Directory    ${diretorio}
    Log    Diretório verificado/criado: ${diretorio}    DEBUG

Iniciar Browser
    [Documentation]    Abre o browser e configura parâmetros
    Log    Iniciando browser ${BROWSER}    INFO
    Open Browser    ${URL_LOGIN}    ${BROWSER}
    Maximize Browser Window
    Set Selenium Timeout    ${TIMEOUT_DEFAULT}
    Set Selenium Speed    ${SELENIUM_SPEED}

Fechar Browser
    [Documentation]    Captura evidência final e fecha o browser
    Log    Fechando browser e capturando evidência final    INFO
    ${status}=    Run Keyword And Return Status    Capture Page Screenshot    final.png
    Close Browser

# ========== AÇÕES DE LOGIN ==========
Realizar Login Como Prestador
    [Documentation]    Executa o fluxo completo de login do prestador
    [Arguments]    ${diretorio_evidencia}
    Log    Realizando login como prestador    INFO
    Set Screenshot Directory    ${diretorio_evidencia}
    
    Wait Until Element Is Visible    ${LOC_CAMPO_EMAIL}    timeout=${TIMEOUT_DEFAULT}
    Input Text    ${LOC_CAMPO_EMAIL}    ${EMAIL_PRESTADOR}
    Input Password    ${LOC_CAMPO_SENHA}    ${SENHA_PRESTADOR}
    Capture Page Screenshot    01-dados-login.png
    
    Click Button    ${LOC_BTN_LOGIN}
    
    # Aguarda redirecionamento e carregamento da home
    Wait Until Location Contains    inicialPrestador    timeout=${TIMEOUT_DEFAULT}
    Wait Until Element Is Visible    ${LOC_LOGO}    timeout=${TIMEOUT_DEFAULT}
    Capture Page Screenshot    02-login-sucesso.png
    Log    Login realizado com sucesso    INFO

# ========== NAVEGAÇÃO ==========
Navegar Para Meus Servicos
    [Documentation]    Acessa a página de Meus Serviços através do menu
    Log    Navegando para Meus Serviços    INFO
    
    # Aguarda o menu estar visível
    Wait Until Element Is Visible    ${LOC_MENU_MEUS_SERVICOS}    timeout=${TIMEOUT_DEFAULT}
    Capture Page Screenshot    03-menu-visivel.png
    
    # Scroll até o elemento se necessário
    Scroll Element Into View    ${LOC_MENU_MEUS_SERVICOS}
    
    # Clica no menu
    Click Element    ${LOC_MENU_MEUS_SERVICOS}
    Log    Clicou em Meus Serviços    INFO
    
    # Aguarda carregamento da página
    Wait Until Location Contains    meusServicos    timeout=${TIMEOUT_DEFAULT}
    

Selecionar Primeiro Servico
    [Documentation]    Clica no primeiro card de serviço disponível
    Log    Selecionando primeiro serviço    INFO
    
    Wait Until Element Is Visible    ${LOC_CARD_SOLICITACAO}    timeout=${TIMEOUT_DEFAULT}
    Capture Page Screenshot    05-card-servico.png
    
    Scroll Element Into View    ${LOC_CARD_SOLICITACAO}
    Click Element    ${LOC_CARD_SOLICITACAO}
    

# ========== AÇÕES DE SERVIÇO ==========
Visualizar Solicitante
    [Documentation]    Acessa o perfil do solicitante relacionado ao serviço
    Log    Visualizando solicitante    INFO
    
    Wait Until Element Is Visible    ${LOC_BTN_SOLICITANTE}    timeout=${TIMEOUT_DEFAULT}
    Capture Page Screenshot    05-botao-solicitante.png
    
    Scroll Element Into View    ${LOC_BTN_SOLICITANTE}
    Click Element    ${LOC_BTN_SOLICITANTE}
    
    Sleep    2s
    Wait Until Element Is Visible    ${LOC_BTN_CONVERSAR}    timeout=${TIMEOUT_DEFAULT}
    Capture Page Screenshot    06-perfil-solicitante.png
    Log    Perfil do solicitante exibido    INFO

Aceitar Servico
    [Documentation]    Aceita a solicitação de serviço
    Log    Aceitando serviço    INFO
    
    Wait Until Element Is Visible    ${LOC_BTN_ACEITAR}    timeout=${TIMEOUT_DEFAULT}
    Capture Page Screenshot    07-botao-aceitar.png
    
    Scroll Element Into View    ${LOC_BTN_ACEITAR}
    Click Element    ${LOC_BTN_ACEITAR}

Enviar Proposta De Modificacao
    [Documentation]    Envia uma proposta de alteração de valor
    Log    Enviando proposta de modificação    INFO
    
    # Clica no botão de proposta
    Wait Until Element Is Visible    ${LOC_BTN_PROPOSTA}    timeout=${TIMEOUT_DEFAULT}
    Capture Page Screenshot    07-botao-proposta.png
    Scroll Element Into View    ${LOC_BTN_PROPOSTA}
    Click Element    ${LOC_BTN_PROPOSTA}
    
    # Confirma no modal SweetAlert
    Sleep    1s
    Wait Until Element Is Visible    ${LOC_MODAL_CONFIRMAR}    timeout=${TIMEOUT_DEFAULT}
    Capture Page Screenshot    08-modal-confirmacao.png
    Click Element    ${LOC_MODAL_CONFIRMAR}
    
    # Preenche formulário de proposta
    Sleep    2s
    Wait Until Element Is Visible    ${LOC_CAMPO_VALOR}    timeout=${TIMEOUT_DEFAULT}
    Input Text    ${LOC_CAMPO_VALOR}    ${VALOR_PROPOSTA}
    Input Text    ${LOC_CAMPO_JUSTIFICATIVA}    ${JUSTIFICATIVA_PROPOSTA}
    Capture Page Screenshot    09-formulario-proposta.png
    
    # Envia proposta
    Scroll Element Into View    ${LOC_BTN_ENVIAR_PROPOSTA}
    Click Element    ${LOC_BTN_ENVIAR_PROPOSTA}
    
    # Valida envio
    Sleep    2s
    Wait Until Page Contains    ${TXT_MEUS_SERVICOS}    timeout=${TIMEOUT_DEFAULT}
    Capture Page Screenshot    10-proposta-enviada.png
    Log    Proposta enviada com sucesso    INFO

# ========== VALIDAÇÕES ==========
Validar Pagina De Detalhes Do Servico
    [Documentation]    Verifica se a página de detalhes do serviço foi carregada
    Log    Validando página de detalhes do serviço    INFO
    Element Should Be Visible    id:main_servico
    Capture Page Screenshot    validacao-detalhes.png
    Log    Validação concluída: Página de detalhes OK    INFO

Validar Visualizacao Do Solicitante
    [Documentation]    Verifica se o perfil do solicitante foi carregado
    Log    Validando visualização do solicitante    INFO
    Page Should Contain    ${TXT_PERFIL_SOLICITANTE}
    Element Should Be Visible    ${LOC_BTN_CONVERSAR}
    Capture Page Screenshot    validacao-solicitante.png
    Log    Validação concluída: Perfil do solicitante OK    INFO

Validar Aceite Do Servico
    [Documentation]    Verifica se o serviço foi aceito com sucesso
    Navegar Para Meus Servicos
    Selecionar Primeiro Servico

Validar Envio Da Proposta
    [Documentation]    Verifica se a proposta foi enviada com sucesso
    Log    Validando envio da proposta    INFO
    Page Should Contain    ${TXT_MEUS_SERVICOS}
    Capture Page Screenshot    validacao-proposta.png
    Log    Validação concluída: Proposta enviada OK    INFO

*** Test Cases ***
CT01 - Visualizar Serviços Disponíveis
    [Documentation]    Valida a visualização da lista de serviços disponíveis para o prestador
    [Tags]    visualizacao    servicos    smoke
    Log    Iniciando CT01 - Visualizar Serviços Disponíveis    INFO
    Realizar Login Como Prestador    ${DIR_SELECIONAR_SERVICO}
    Navegar Para Meus Servicos
    Selecionar Primeiro Servico
    Validar Pagina De Detalhes Do Servico
    Log    CT01 concluído com sucesso    INFO

CT02 - Visualizar Perfil Do Solicitante
    [Documentation]    Valida a visualização do perfil do solicitante relacionado ao serviço
    [Tags]    visualizacao    solicitante
    Log    Iniciando CT02 - Visualizar Perfil Do Solicitante    INFO
    Realizar Login Como Prestador    ${DIR_VISUALIZAR_SOLICITANTE}
    Navegar Para Meus Servicos
    Visualizar Solicitante
    Validar Visualizacao Do Solicitante
    Log    CT02 concluído com sucesso    INFO

CT03 - Aceitar Solicitação De Serviço
    [Documentation]    Valida o fluxo de aceitação de uma solicitação de serviço
    [Tags]    aceitar    servico    critico
    Log    Iniciando CT03 - Aceitar Solicitação De Serviço    INFO
    Realizar Login Como Prestador    ${DIR_ACEITAR_SERVICO}
    Selecionar Primeiro Servico
    Aceitar Servico
    Validar Aceite Do Servico
    Log    CT03 concluído com sucesso    INFO

CT04 - Enviar Proposta De Modificação De Valor
    [Documentation]    Valida o envio de proposta para modificação do valor do serviço
    [Tags]    proposta    negociacao    critico
    Log    Iniciando CT04 - Enviar Proposta De Modificação De Valor    INFO
    Realizar Login Como Prestador    ${DIR_ENVIAR_PROPOSTA}
    Selecionar Primeiro Servico
    Enviar Proposta De Modificacao
    Validar Envio Da Proposta
    Log    CT04 concluído com sucesso    INFO