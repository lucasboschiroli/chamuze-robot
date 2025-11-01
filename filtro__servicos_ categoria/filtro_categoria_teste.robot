*** Settings ***
Library    SeleniumLibrary
Resource    filtro_categoria_recurso.robot

*** Test Cases ***
Filtrar Servicos Por Categoria
    Acessar Sistema Como Prestador
    Filtrar Servicos Por Categoria  ${CATEGORIA}
    Verificar Servicos Filtrados
