*** Settings ***
Documentation     Testes automatizados para os formulários de cadastro do sistema ChamuZé
Resource    visualizacao_resources.robot

Test Setup    Configurar ambiente de teste
Test Teardown    Fechar o navegador

*** Test Cases ***
## CT39 - Visualização de todos os serviços publicados pelo solicitante

## CT40 - Visualização de todos os serviços publicados pelo solicitante (sem serviços publlicados)