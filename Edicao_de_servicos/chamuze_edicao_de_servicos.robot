*** Settings ***
Documentation    Testes de Edição de serviços do sistema Chamauze
Resource    ../gerais/resources_gerais.robot
Resource    recurso_chamuze_edicao_de_servicos.robot
Test Setup    Abrir navegador
Test Teardown    Fechar navegador

*** Test Cases ***
CT29 - Edição de um serviço sem alterar dados
    [Documentation]    Esse teste verifica a edição de um serviço sem alterar dados
    [Tags]    alterar_nada
    
    Realizar login com credenciais    juliana123@gmail.com    Juliana123@
    Capture Page Screenshot    ${CENARIO3_PRINTS}/ct29_01_login_realizado.png
    
    Clicar em Meus serviços no menu de navegação
    Capture Page Screenshot    ${CENARIO3_PRINTS}/ct29_02_meus_servicos.png
    
    Clicar em Editar no serviço desejado
    Capture Page Screenshot    ${CENARIO3_PRINTS}/ct29_03_pagina_edicao.png
    
    Não alterar nenhuma informação em nenhum campo
    Capture Page Screenshot    ${CENARIO3_PRINTS}/ct29_04_campos_sem_alteracao.png
    
    Clicar em Atualizar
    Capture Page Screenshot    ${CENARIO3_PRINTS}/ct29_05_botao_atualizar_clicado.png
    
    Verificar se o preço não foi alterado
    Capture Page Screenshot    ${CENARIO3_PRINTS}/ct29_06_mensagem_sucesso_ok.png

CT30 - Edição de um serviço alterando o preço proposto
    [Documentation]    Esse teste verifica a edição de um serviço alterando o preço proposto
    [Tags]    alterar_preco
    
    Realizar login com credenciais    juliana123@gmail.com    Juliana123@
    Capture Page Screenshot    ${CENARIO3_PRINTS}/ct30_01_login_realizado.png
    
    Clicar em Meus serviços no menu de navegação
    Capture Page Screenshot    ${CENARIO3_PRINTS}/ct30_02_meus_servicos.png
    
    Clicar em Editar no serviço desejado
    Capture Page Screenshot    ${CENARIO3_PRINTS}/ct30_03_pagina_edicao.png
    
    Alterar o campo preço inserindo um novo valor
    Capture Page Screenshot    ${CENARIO3_PRINTS}/ct30_04_preco_alterado.png
    
    Clicar em Atualizar
    Capture Page Screenshot    ${CENARIO3_PRINTS}/ct30_05_botao_atualizar_clicado.png
    
    Verificar se o preço foi alterado
    Capture Page Screenshot    ${CENARIO3_PRINTS}/ct30_06_mensagem_sucesso_ok.png