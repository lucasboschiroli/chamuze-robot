*** Settings ***
Library           SeleniumLibrary
Library           OperatingSystem
Documentation     Testes automatizados para o sistema ChamuZé - Módulo Prestador de Serviços
...               Cenários: Visualização/Aceitação de serviços, Visualização de solicitante e Envio de proposta
Resource    servico_visualizar_recurso.robot

*** Test Cases ***
CT01 - Visualizar Serviços Disponíveis
    [Documentation]    Valida a visualização da lista de serviços disponíveis para o prestador
    [Tags]    visualizacao    servicos    smoke
    Log    Iniciando CT01 - Visualizar Serviços Disponíveis    INFO
    Realizar Login Como Prestador    ${DIR_SELECIONAR_SERVICO}
    Navegar Para Meus Servicos
    Selecionar Primeiro Servico
    Validar Pagina De Detalhes Do Servico
    Log    CT01 concluído com sucesso    INFO

CT02 - Visualizar Perfil Do Solicitante
    [Documentation]    Valida a visualização do perfil do solicitante relacionado ao serviço
    [Tags]    visualizacao    solicitante
    Log    Iniciando CT02 - Visualizar Perfil Do Solicitante    INFO
    Realizar Login Como Prestador    ${DIR_VISUALIZAR_SOLICITANTE}
    Navegar Para Meus Servicos
    Visualizar Solicitante
    Validar Visualizacao Do Solicitante
    Log    CT02 concluído com sucesso    INFO

CT03 - Aceitar Solicitação De Serviço
    [Documentation]    Valida o fluxo de aceitação de uma solicitação de serviço
    [Tags]    aceitar    servico    critico
    Log    Iniciando CT03 - Aceitar Solicitação De Serviço    INFO
    Realizar Login Como Prestador    ${DIR_ACEITAR_SERVICO}
    Selecionar Primeiro Servico
    Aceitar Servico
    Validar Aceite Do Servico
    Log    CT03 concluído com sucesso    INFO

CT04 - Enviar Proposta De Modificação De Valor
    [Documentation]    Valida o envio de proposta para modificação do valor do serviço
    [Tags]    proposta    negociacao    critico
    Log    Iniciando CT04 - Enviar Proposta De Modificação De Valor    INFO
    Realizar Login Como Prestador    ${DIR_ENVIAR_PROPOSTA}
    Selecionar Primeiro Servico
    Enviar Proposta De Modificacao
    Validar Envio Da Proposta
    Log    CT04 concluído com sucesso    INFO