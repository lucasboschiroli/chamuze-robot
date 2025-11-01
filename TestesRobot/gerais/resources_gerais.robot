*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${BROWSER}    chrome 
${URL}    http://localhost/ChamuZe/PROJETO/login.php
${PRINTS_DIR}    ${OUTPUT DIR}/prints

*** Keywords ***

Abrir navegador
    [Documentation]    Abre o navegador definido pela variável ${BROWSER}, acessa a URL de login e maximiza a janela.
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window

Fechar navegador
    [Documentation]    Fecha o navegador que foi aberto durante o teste.
    Close Browser

Realizar login com credenciais
    [Documentation]    Preenche os campos de login com o email e senha fornecidos, clica no botão de login e aguarda a exibição do menu principal.
    [Arguments]    ${EMAIL}    ${SENHA}
    Input Text    id:email    ${EMAIL}
    Input Password    id:senha    ${SENHA}
    Click Button    id:btn_login
    Wait Until Page Contains Element    id:menu    10s

Clicar em Meus serviços no menu de navegação
    [Documentation]    Clica no item "Meus serviços" do menu de navegação e aguarda até que a página de serviços disponíveis seja exibida.
    Click Element    id:meus_servicos
    Wait Until Page Contains    Serviços Disponíveis    10s
