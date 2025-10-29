*** Settings ***
Resource    solicitacao_resources.robot
Test Setup    Abrir navegador
Test Teardown    Fechar o navegador


*** Test Cases ***
CT1- teset solciitacao
    [Documentation]
    [Tags]
    Realizar login valido solicitante
    acessar pagina de solicitacao 
    Preencher formulario de solictacao
    Enviar solicitacao 
    Verificar se foi feita a solicitacao
CT2- teste sem preco
    [Documentation]
    [Tags]
    Realizar login valido solicitante
    Acessar pagina de solicitacao
    Preencher formulario solictacao sem preco
    Enviar solicitacao 
    Verificar mensagem de erro  