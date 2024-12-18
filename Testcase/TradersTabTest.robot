*** Settings ***
Library   Browser

Resource  ../../automation/Keyword/Home.robot

*** Test Cases ***

Test1
    
    Open Browser
    Hover TradersTab
    
    ${sub_tab_elements}=    Get Elements    ${traders_sub_tab}
    Click And Validate Each Sub-Tab    ${sub_tab_elements}

    Close Browser