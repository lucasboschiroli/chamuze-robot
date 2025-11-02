*** Settings ***
Documentation     Testes automatizados para os formulários de cadastro do sistema ChamuZé
Resource    cadastro_resources.robot

Test Setup    Configurar ambiente de teste
Test Teardown    Fechar o navegador

*** Test Cases ***
CT1 - Cadastro de prestadores com todos os campos válidos
    [Documentation]    acessar pagina de cadastro de prestadores, preenchendo o formulario e mandando para o banco de dados
    [Tags]    cadstro    prestador

    Abrir navegador
    Capture PageScreenshot    ct1_1.png

    Preencher formulário de cadastro de prestadores
    Capture PageScreenshot    ct1_2.png

    Enviar solicitação de cadastro
    Capture PageScreenshot    ct1_3.png

    Verificar se o cadastro foi realizado com sucesso
    Capture PageScreenshot    ct1_4.png

CT2 - Cadastro de prestadores com o campo de senha inválida (Senha fraca)
    [Documentation]    realizar o cadastro de prestador, porem colocar uma senha fraca
    [Tags]    senha    fraca

    Abrir navegador
    Capture PageScreenshot    ct1_1.png
    Realizar cadastro de prestadores com uma senha fraca
    Capture PageScreenshot    ct1_2.png
    Enviar solicitação de cadastro
    Capture PageScreenshot    ct1_3.png
    Verificar a mensagem de erro de senha
    Capture PageScreenshot    ct1_4.png

## CT4 - Cadastro de solicitantes com todos os campos válidos

## CT5 - Cadastro de solicitantes com o campo CPF inválido

CT8 - Cadastro de administradores com todos os campos válidos
    [Documentation]  Cadastrando um novo administrador no sistema
    [Tags]    form    submission    positive-test

    Abrir navegador

    Acessar página de login
    Capture Page Screenshot    ct08_01_apos_acesso_a_pagina_de_login.png

    Realizar login válido como administrador
    Capture Page Screenshot    ct08_02_apos_login.png

    Acessar página de cadastro de administradores
    Capture Page Screenshot    ct08_03_apos_acesso_a_pagina_de_cadastro.png

    Preencher formulário de cadastro de administradores
    Capture Page Screenshot    ct08_04_apos_preenchimento_de_formulario.png

    Enviar solicitação de cadastro
    Capture Page Screenshot    ct08_05_apos_envio_de_formulario.png

    Verificar se o cadastro de administradores foi realizado com sucesso  
    Capture Page Screenshot    ct08_06_apos_mensagem_de_sucesso.png

CT9 - Cadastro de administradores com o campo de email inválido (email já cadastrado)
    [Documentation]  Cadastrando um novo administrador no sistema utilizando um email já cadastrado
    [Tags]    form    submission    negative-test

    Abrir navegador

    Acessar página de login
    Capture Page Screenshot    ct09_01_apos_acesso_a_pagina_de_login.png

    Realizar login válido como administrador
    Capture Page Screenshot    ct09_02_apos_login.png

    Acessar página de cadastro de administradores
    Capture Page Screenshot    ct09_03_apos_acesso_a_pagina_de_cadastro.png

    Realizar cadastro de administradores com email inválido (já cadastrado)
    Capture Page Screenshot    ct09_04_apos_preenchimento_de_formulario.png

    Enviar solicitação de cadastro
    Capture Page Screenshot    ct09_05_apos_envio_de_formulario.png

    Verificar mensagem de erro de email duplicado
    Capture Page Screenshot    ct09_06_apos_mensagem_de_erro.png

CT13 - Realização de login de um usuário com todos os campos válidos
    [Documentation]    Realiza login de um solicitante com credenciais válidas e verifica acesso bem-sucedido ao sistema
    [Tags]    login    solicitante    authentication    positive-test

    Abrir navegador

    Acessar página de login
    Capture Page Screenshot    ct13_01_pagina_login.png
    
    Realizar login válido como solicitante
    Capture Page Screenshot    ct13_02_apos_clicar_login.png
    
    Verificar login bem-sucedido de solicitante
    Capture Page Screenshot    ct13_03_apos_login_bem_sucedido.png
    
CT14 - Realização de login com senha inválida/incorreta
    [Documentation]    Tenta realizar login com senha incorreta e verifica que mensagem de erro é exibida
    [Tags]    login    solicitante    authentication    negative-test    error-handling

    Abrir navegador
    
    Acessar página de login
    Capture Page Screenshot    ct14_01_pagina_login.png
    
    Realizar login inválido como solicitante
    Capture Page Screenshot    ct14_02_apos_clicar_login.png
    
    Verificar mensagem de erro de login
    Capture Page Screenshot    ct14_03_apos_mensagem_de_erro.png
