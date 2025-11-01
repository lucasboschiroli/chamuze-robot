*** Settings ***
Documentation    Testes de Avaliação de Prestadores do sistema Chamauze
Resource    ../gerais/resources_gerais.robot
Resource    avaliacao_resources.robot
Test Setup    Abrir navegador
Test Teardown    Fechar navegador

*** Test Cases ***
CT23 - Avaliação de prestador sem selecionar estrela
    [Documentation]    Esse teste verifica a avaliação de um prestador sem selecionar nenhuma estrela
    [Tags]    avaliacao_zero_estrelas
    
    Realizar login com credenciais    juliana123@gmail.com    Juliana123@
    Capture Page Screenshot    ${CENARIO1_PRINTS}/ct23_01_login_realizado.png
    
    Clicar em Meus serviços no menu de navegação
    Capture Page Screenshot    ${CENARIO1_PRINTS}/ct23_02_meus_servicos.png
    
    Clicar em Avaliar prestador no serviço que já tenha sido concluído pelo prestador
    Capture Page Screenshot    ${CENARIO1_PRINTS}/ct23_03_modal_avaliacao_aberto.png
    
    Não selecionar nenhuma estrela
    Capture Page Screenshot    ${CENARIO1_PRINTS}/ct23_04_nenhuma_estrela_selecionada.png
    
    Clicar em Avaliar
    Capture Page Screenshot    ${CENARIO1_PRINTS}/ct23_05_botao_avaliar_clicado.png
    
    Verificar se aparece uma mensagem de Prestador avaliado com sucesso e clicar em Ok
    Capture Page Screenshot    ${CENARIO1_PRINTS}/ct23_06_mensagem_sucesso_ok.png

CT24 - Avaliação de um prestador com 5 estrelas de nota
    [Documentation]    Esse teste verifica a avaliação de um prestador com 5 estrelas de nota
    [Tags]    avaliacao_todas_estrelas
    
    Realizar login com credenciais    juliana123@gmail.com    Juliana123@
    Capture Page Screenshot    ${CENARIO1_PRINTS}/ct24_01_login_realizado.png
    
    Clicar em Meus serviços no menu de navegação
    Capture Page Screenshot    ${CENARIO1_PRINTS}/ct24_02_meus_servicos.png
    
    Clicar em Avaliar prestador no serviço que já tenha sido concluído pelo prestador
    Capture Page Screenshot    ${CENARIO1_PRINTS}/ct24_03_modal_avaliacao_aberto.png
    
    Selecionar a última quinta estrela
    Capture Page Screenshot    ${CENARIO1_PRINTS}/ct24_04_cinco_estrelas_selecionadas.png
    
    Clicar em Avaliar
    Capture Page Screenshot    ${CENARIO1_PRINTS}/ct24_05_botao_avaliar_clicado.png
    
    Verificar se aparece uma mensagem de Prestador avaliado com sucesso e clicar em Ok
    Capture Page Screenshot    ${CENARIO1_PRINTS}/ct24_06_mensagem_sucesso_ok.png