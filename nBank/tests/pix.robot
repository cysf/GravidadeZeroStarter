*Settings*
Documentation       Suíte de testes da execução do PIX

Resource        ${EXECDIR}/resources/base.robot

Test Setup      Start Session
Test Teardown   End Session

*Test Cases*
Devo verificar o saldo inicial de 1000 reais
    [Tags]      verf_saldo

    Get Balance     1000

Devo fazer PIX de 100 reais
    [Tags]      fazer_pix

    Choose Transaction          Fazer PIX
    Fill PIX Form               Nubank          111-222-3333       100
    Submit PIX Form
    Get Balance                 900

Devo fazer PIX de 0 reais
    [Tags]      fazer_pix_zerado

    Choose Transaction          Fazer PIX
    Fill PIX Form               Nubank          111-222-4444       0
    Submit PIX Form
    Get error message           Oops. Transferir ZERO é osso hein...

Devo fazer PIX de valor negativo
    [Tags]      fazer_pix_negativo

    Choose Transaction          Fazer PIX
    Fill PIX Form               Nubank          111-222-5555       -1
    Submit PIX Form
    Get error message           Oops. Valor para PIX incorreto...