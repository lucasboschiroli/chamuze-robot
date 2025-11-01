*** Settings ***
Documentation     Testes automatizados para os formulários de cadastro do sistema ChamuZé
Resource    cadastro_resources.robot

Test Setup    Configurar ambiente de teste
Test Teardown    Fechar o navegador

*** Test Cases ***
CT1 - Cadastro de prestadores com todos os campos válidos
    [Documentation]
    [Tags]

    Abrir navegador

    Preencher formulário de cadastro de prestadores

    Enviar solicitação de cadastro

    Verificar se o cadastro foi realizado com sucesso

CT2 - Cadastro de prestadores com o campo de senha inválida (Senha fraca)
    [Documentation]
    [Tags]

    Abrir navegador

    Realizar cadastro de prestadores com uma senha fraca

    Enviar solicitação de cadastro

    Verificar a mensagem de erro de senha

## CT3 - Cadastro de solicitantes com todos os campos válidos

## CT4 - Cadastro de solicitantes com o campo CPF inválido

CT5 - Cadastro de administradores com todos os campos válidos
    [Documentation]  Cadastrando um novo administrador no sistema
    [Tags]    form    submission    positive-test

    Abrir navegador

    Acessar página de login
    Capture Page Screenshot    evidencia_ct5_01_apos_acesso_a_pagina_de_login.png

    Realizar login válido como administrador
    Capture Page Screenshot    evidencia_ct5_02_apos_login.png

    Acessar página de cadastro de administradores
    Capture Page Screenshot    evidencia_ct5_03_apos_acesso_a_pagina_de_cadastro.png

    Preencher formulário de cadastro de administradores
    Capture Page Screenshot    evidencia_ct5_04_apos_preenchimento_de_formulario.png

    Enviar solicitação de cadastro
    Capture Page Screenshot    evidencia_ct5_05_apos_envio_de_formulario.png

    Verificar se o cadastro de administradores foi realizado com sucesso  
    Capture Page Screenshot    evidencia_ct5_06_apos_mensagem_de_sucesso.png

CT6 - Cadastro de administradores com o campo de email inválido (email já cadastrado)
    [Documentation]  Cadastrando um novo administrador no sistema utilizando um email já cadastrado
    [Tags]    form    submission    negative-test

    Abrir navegador

    Acessar página de login
    Capture Page Screenshot    evidencia_ct6_01_apos_acesso_a_pagina_de_login.png

    Realizar login válido como administrador
    Capture Page Screenshot    evidencia_ct6_02_apos_login.png

    Acessar página de cadastro de administradores
    Capture Page Screenshot    evidencia_ct6_03_apos_acesso_a_pagina_de_cadastro.png

    Realizar cadastro de administradores com email inválido (já cadastrado)
    Capture Page Screenshot    evidencia_ct6_04_apos_preenchimento_de_formulario.png

    Enviar solicitação de cadastro
    Capture Page Screenshot    evidencia_ct6_05_apos_envio_de_formulario.png

    Verificar mensagem de erro de email duplicado
    Capture Page Screenshot    evidencia_ct6_06_apos_mensagem_de_erro.png

## Casos de teste extras?????

CT3 - login válido como prestador 
    [Documentation]
    [Tags]
    Acessar página de login
    Realizar login válido como prestador

CT4 - login válido como solicitante 
    [Documentation]
    [Tags]
    Acessar página de login
    
CT5 - login dando erro
    [Documentation]
    [tags]
    Acessar página de login
    Realizar login inválido como prestador