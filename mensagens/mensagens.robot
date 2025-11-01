*** Settings ***
Documentation    Testes de Envio de mensagens para o prestador do sistema Chamauze
Resource    ../gerais/resources_gerais.robot
Resource    recurso_chamuze_envio_de_mensagens_para_o_prestador.robot
Test Setup    Abrir navegador
Test Teardown    Fechar navegador

*** Test Cases ***
CT26 - Envio de uma mensagem de texto para um prestador
    [Documentation]    Esse teste verifica o envio de uma mensagem de texto para um prestador
    [Tags]    enviar_mensagem_texto
    
    Realizar login com credenciais    juliana123@gmail.com    Juliana123@
    Capture Page Screenshot    ${CENARIO2_PRINTS}/ct26_01_login_realizado.png
    
    Clicar em Meus serviços no menu de navegação
    Capture Page Screenshot    ${CENARIO2_PRINTS}/ct26_02_meus_servicos.png
   
    Clicar em Prestador responsável no serviço que já tenha sido aceito pelo prestador
    Capture Page Screenshot    ${CENARIO2_PRINTS}/ct26_03_pagina_prestador.png
    
    Clicar em Conversar
    Capture Page Screenshot    ${CENARIO2_PRINTS}/ct26_04_chat_aberto.png
    
    Preencher o campo de mensagem com o texto desejado
    Capture Page Screenshot    ${CENARIO2_PRINTS}/ct26_05_mensagem_preenchida.png
    
    Clicar em Enviar e verificar se a mensagem aparece como última mensagem enviada na tela
    Capture Page Screenshot    ${CENARIO2_PRINTS}/ct26_06_mensagem_enviada.png

CT27 - Envio de uma mensagem em branco para o prestador
    [Documentation]    Esse teste verifica o envio de uma mensagem em branco para o prestador
    [Tags]    enviar_mensagem_vazia
    
    Realizar login com credenciais    juliana123@gmail.com    Juliana123@
    Capture Page Screenshot    ${CENARIO2_PRINTS}/ct27_01_login_realizado.png
    
    Clicar em Meus serviços no menu de navegação
    Capture Page Screenshot    ${CENARIO2_PRINTS}/ct27_02_meus_servicos.png
    
    Clicar em Prestador responsável no serviço que já tenha sido aceito pelo prestador
    Capture Page Screenshot    ${CENARIO2_PRINTS}/ct27_03_pagina_prestador.png
    
    Clicar em Conversar
    Capture Page Screenshot    ${CENARIO2_PRINTS}/ct27_04_chat_aberto.png
    
    Deixar o campo de mensagem vazio
    Capture Page Screenshot    ${CENARIO2_PRINTS}/ct27_05_campo_vazio.png
    
    Clicar em Enviar e verificar se a mensagem de alerta aparece abaixo do campo de digitar mensagem
    Capture Page Screenshot    ${CENARIO2_PRINTS}/ct27_06_mensagem_alerta.png