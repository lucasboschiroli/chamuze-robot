*** Settings ***
Resource    login_resources.robot

Test Setup    Abrir navegador
Test Teardown    Fechar o navegador


*** Test Cases ***
CT1- login válido como prestador 
    [Documentation]
    [Tags]
    Acessar pagina login
    Realizar login valido prestador
CT1- login válido como solicitante 
    [Documentation]
    [Tags]
    Acessar pagina login
    
CT2- login dando erro
    [Documentation]
    [tags]
    Acessar pagina login
    Realizar login invalido
CT3- Realizando cadastro de prestador
    [Documentation]
    [Tags]
    Preencher formulario de cadastro
    enviar solicitacao de cadastro
    verificar cadastro realizado com sucesso
CT3- Realizando cadastro de prestador com senha fraca
    [Documentation]
    [Tags]
    Realizar Cadastro senha fraca
    enviar solicitacao de cadastro
    verificar mensagem de erro de senha