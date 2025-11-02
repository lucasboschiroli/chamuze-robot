*** Settings ***
Resource    exclusao_resources.robot
Test Setup    Abrir navegador
Test Teardown    Fechar o navegador


*** Test Cases ***
CT1- teste exclusao
    [Documentation]
    [Tags]
    Realizar login valido solicitante
    Capture PageScreenshot
    Realizar exclusao de servico
    Capture PageScreenshot
CT2- teste exclusao cancelando
    [Documentation]
    [Tags]
    Realizar login valido solicitante
    Capture PageScreenshot
    Realizar exclusao de servico cancelando no final
    Capture PageScreenshot
