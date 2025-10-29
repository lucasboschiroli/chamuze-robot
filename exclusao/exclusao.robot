*** Settings ***
Resource    exclusao_resources.robot
Test Setup    Abrir navegador
Test Teardown    Fechar o navegador


*** Test Cases ***
CT1- teste exclusao
    [Documentation]
    [Tags]
    Realizar login valido solicitante
    Realizar exclusao de servico
CT2- teste exclusao cancelando
    [Documentation]
    [Tags]
    Realizar login valido solicitante
    Realizar exclusao de servico cancelando no final