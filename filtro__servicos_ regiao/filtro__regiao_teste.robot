*** Settings ***
Library    SeleniumLibrary
Resource    filtro_regiao_recurso.robot

*** Test Cases ***
Filtrar Servicos Por Regiao
    Acessar Sistema Como Prestador
    Filtrar Servicos Por Regiao  ${REGIAO}
    Verificar Servicos Filtrados

    


