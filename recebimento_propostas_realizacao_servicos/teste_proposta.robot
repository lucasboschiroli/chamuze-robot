*** Settings ***
Library    SeleniumLibrary
Resource    recurso_proposta.robot

*** Test Cases ***
Aceitar Proposta
    Acessar Sistema Como Solicitante
    Acessar Pagina De Propostas
    Aceitar Proposta Enviada    

Recusar Proposta
    Acessar Sistema Como Solicitante
    Acessar Pagina De Propostas
    Recusar Proposta Enviada   

