*** Settings ***
Resource    exclusao_resources.robot
Test Setup    Configurar ambiente de teste
Test Teardown    Fechar o navegador

*** Test Cases ***
CT19 - Exclusão de um serviço existente
    [Documentation]
    [Tags]
    Abrir navegador
    Realizar login valido solicitante
    Realizar exclusao de servico

CT20 - Exclusão de um serviço existente sem finalizar (clicando em cancelar)
    [Documentation]
    [Tags]
    Abrir navegador
    Realizar login valido solicitante
    Realizar exclusao de servico cancelando no final