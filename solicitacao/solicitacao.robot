*** Settings ***
Resource    solicitacao_resources.robot
Test Setup    Abrir navegador
Test Teardown    Fechar o navegador


*** Test Cases ***
CT1- teste solciitacao
    [Documentation]    criação de uma solicitação de serviço  para o solicitante e preenchendo o formulario
    [Tags]    criação    solicitacao
    Capture PageScreenshot    ct1_0.png
    Realizar login valido solicitante
    Capture PageScreenshot    ct1_1.png
    acessar pagina de solicitacao 
    Capture PageScreenshot    ct1_2.png
    Preencher formulario de solictacao
    Capture PageScreenshot    ct1_3.png
    Enviar solicitacao 
    Capture PageScreenshot    ct1_4.png
    Verificar se foi feita a solicitacao
    Capture PageScreenshot    ct1_5.png
CT2- teste sem preco
    [Documentation]    criação de uma solicitação e preenchendo o formulario, porem sem colocar o preço da solicitação
    [Tags]    sem    preco
    Capture PageScreenshot    ct02_1.png
    Realizar login valido solicitante
    Capture PageScreenshot    ct02_1.png
    Acessar pagina de solicitacao
    Capture PageScreenshot    ct02_2.png
    Preencher formulario solictacao sem preco
    Capture PageScreenshot    ct02_3.png
    Enviar solicitacao 
    Capture PageScreenshot    ct02_4.png
    Verificar mensagem de erro  
    Capture PageScreenshot    ct02_5.png
