*** Settings ***
Library    SeleniumLibrary
Library    OperatingSystem
Resource    recurso.robot
Documentation    Testes para o cadastro de solicitante envolvendo o CPF

*** Test Cases ***
CT1 - Cadastro Com Cpf Invalido 
    Inserir Dados Cadastrais    ${CPF_INVALIDO}    ${SELECTOR_FINAL_CPF_INVALIDO}
    Verificar Resultado    ${RESULTADO_CPF_INVALIDO}

CT2 - Cadastro Com Cpf Valido  
    Refazer Teste   
    Inserir Dados Cadastrais    ${CPF_VALIDO}    ${SELECTOR_FINAL_CPF_VALIDO}
    Verificar Resultado    ${RESULTADO_CPF_VALIDO}