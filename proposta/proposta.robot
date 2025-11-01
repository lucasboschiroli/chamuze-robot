*** Settings ***
Documentation     Testes automatizados para os formulários de cadastro do sistema ChamuZé
Resource    proposta_resources.robot

Test Setup    Configurar ambiente de teste
Test Teardown    Fechar o navegador

*** Test Cases ***
CT50 - Envio de proposta com novo valor indicado
    [Documentation]    Prestador envia proposta para um serviço disponível com alteração de preço
    [Tags]    proposta    prestador    positive-test    form    submission
    
    Abrir navegador
    
    Acessar página de login
    Capture Page Screenshot    ct50_01_pagina_login.png
    
    Realizar login válido como prestador verificado
    Capture Page Screenshot    ct50_02_apos_login.png
    
    Selecionar primeiro serviço disponível
    Capture Page Screenshot    ct50_03_servico_selecionado.png
    
    Clicar em realizar proposta
    Capture Page Screenshot    ct50_04_modal_confirmacao.png
    
    Confirmar envio de proposta
    Capture Page Screenshot    ct50_05_formulario_proposta.png
    
    Preencher proposta com novo valor    75.00    Posso realizar o serviço por um valor mais acessível mantendo a qualidade
    Capture Page Screenshot    ct50_06_formulario_preenchido.png
    
    Enviar proposta
    Capture Page Screenshot    ct50_07_apos_envio.png
    
    Verificar envio de proposta com sucesso
    Capture Page Screenshot    ct50_08_proposta_enviada.png
    
    Fechar o navegador

CT51 - Envio de proposta sem novo valor indicado
    [Documentation]    Prestador envia proposta para um serviço disponível mantendo o valor original
    [Tags]    proposta    prestador    positive-test    form    submission
    
    Abrir navegador
    
    Acessar página de login
    Capture Page Screenshot    ct51_01_pagina_login.png
    
    Realizar login válido como prestador verificado
    Capture Page Screenshot    ct51_02_apos_login.png
    
    Selecionar primeiro serviço disponível
    Capture Page Screenshot    ct51_03_servico_selecionado.png
    
    Clicar em realizar proposta
    Capture Page Screenshot    ct51_04_modal_confirmacao.png
    
    Confirmar envio de proposta
    Capture Page Screenshot    ct51_05_formulario_proposta.png
    
    Preencher proposta sem novo valor    Aceito realizar o serviço pelo valor solicitado
    Capture Page Screenshot    ct51_06_formulario_preenchido.png
    
    Enviar proposta
    Capture Page Screenshot    ct51_07_apos_envio.png
    
    Verificar erro no envio de proposta
    Capture Page Screenshot    ct51_08_apos_mensagem_de_erro.png
    
    Fechar o navegador
    