*** Settings ***
Resource    exclusao_resources.robot
Test Setup    Abrir navegador
Test Teardown    Fechar o navegador

*** Test Cases ***
CT1 - Exclusão de um serviço existente
    [Documentation]
    [Tags]
    Realizar login valido solicitante
    Realizar exclusao de servico

CT2 - Exclusão de um serviço existente sem finalizar (clicando em cancelar)
    [Documentation]
    [Tags]
    Realizar login valido solicitante
    Realizar exclusao de servico cancelando no final