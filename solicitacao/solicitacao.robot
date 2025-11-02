*** Settings ***
Resource    solicitacao_resources.robot
Test Setup    Abrir navegador
Test Teardown    Fechar o navegador


*** Test Cases ***
CT19- Solicitação de serviços com todos os campos válidos
    [Documentation]    criação de uma solicitação de serviço  para o solicitante e preenchendo o formulario
    [Tags]    criação    solicitacao
    Capture PageScreenshot    ct19_0.png
    Realizar login valido solicitante
    Capture PageScreenshot    ct19_1.png
    acessar pagina de solicitacao 
    Capture PageScreenshot    ct19_2.png
    Preencher formulario de solictacao
    Capture PageScreenshot    ct19_3.png
    Enviar solicitacao 
    Capture PageScreenshot    ct19_4.png
    Verificar se foi feita a solicitacao
    Capture PageScreenshot    ct19_5.png
CT20- Solicitação de serviço com o campo preço vazio
    [Documentation]    criação de uma solicitação e preenchendo o formulario, porem sem colocar o preço da solicitação
    [Tags]    sem    preco
    Capture PageScreenshot    ct20_1.png
    Realizar login valido solicitante
    Capture PageScreenshot    ct20_1.png
    Acessar pagina de solicitacao
    Capture PageScreenshot    ct20_2.png
    Preencher formulario solictacao sem preco
    Capture PageScreenshot    ct20_3.png
    Enviar solicitacao 
    Capture PageScreenshot    ct20_4.png
    Verificar mensagem de erro  
    Capture PageScreenshot    ct20_5.png
