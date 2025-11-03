*** Settings ***
Resource    exclusao_resources.robot
Test Setup    Abrir navegador
Test Teardown    Fechar o navegador


*** Test Cases ***
CT21- Exclusão de um serviço existente
    [Documentation]
    [Tags]

    Realizar login valido solicitante
    Capture PageScreenshot    ct21_1.png
    Acessar pagina de servicos 
    Realizar exclusao de servico
    Capture PageScreenshot    ct21_2.png
    verificar exclusao

CT22- Exclusão de um serviço existente sem finalizar (clicando em cancelar)
    [Documentation]
    [Tags]
    
    Realizar login valido solicitante
    Capture PageScreenshot    ct22_1.png
    Acessar pagina de servicos 

    Realizar exclusao de servico cancelando no final
    Capture PageScreenshot    ct22_2.png
    verificar cancelamento de exclusao
