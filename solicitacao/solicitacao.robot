*** Settings ***
Resource    solicitacao_resources.robot
Test Setup    Configurar ambiente de teste
Test Teardown    Fechar o navegador

*** Test Cases ***
CT17 - Solicitação de serviços com todos os campos válidos
    [Documentation]
    [Tags]
    Abrir navegador
    Realizar login valido solicitante
    acessar pagina de solicitacao 
    Preencher formulario de solictacao
    Enviar solicitacao 
    Verificar se foi feita a solicitacao

CT18 - Solicitação de serviço com o campo preço vazio
    [Documentation]
    [Tags]
    Abrir navegador
    Realizar login valido solicitante
    Acessar pagina de solicitacao
    Preencher formulario solictacao sem preco
    Enviar solicitacao 
    Verificar mensagem de erro  