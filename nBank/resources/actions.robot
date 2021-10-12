*Settings*
Documentation       Ações customizadas do nBank

*Keywords*
Go To Home Page
    Go To       ${BASE_URL}

    Wait For Elements State     css=.carousel       visible     5

Get Balance
    [Arguments]     ${expected_balance}

    ${element}      Set Variable        xpath=//a[@class="navbar-item"]

    Wait For Elements State     ${element}      visible     5
    ${saldo}=       Fetch From Right        ${element}      R$ 

    Get Text        ${saldo}        contains          ${expected_balance}

Choose Transaction
    [Arguments]     ${expected_transaction}
    Click           xpath=//a[contains(@class, "is-success")]//strong[text()="${expected_transaction}"]


Fill PIX Form
    [Arguments]     ${banco}        ${chave}        ${valor}
    Wait For Elements State         css=.modal-card-title       visible         5

    Select Options By       css=.control select         text        ${banco}

    Fill Text       id=chave-pix            ${chave}
    Fill Text       id=valor                ${valor}

Submit PIX Form
    Click       css=button >> text=Enviar PIX

Get error message
    [Arguments]     ${expected_message}

    ${element}          Set Variable        css=.media-content
    
    Wait For Elements State         ${element}          visible         5
    Get Text            ${element}          contains           ${expected_message}