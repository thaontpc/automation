*** Settings ***
Library   Browser
Library   Collections

*** Variables ***

${site_url}    https://www.bitfinex.com/

# Home page elements 
${traders_tab}  xpath=//span[@class='header_item-title'][normalize-space()='Traders']

# Traders sub tab element
${traders_sub_tab}  xpath=//div[contains(@class, 'header_popover_menu')]//a

${counter}    0

*** Keywords ***

Open Browser
  New Browser   headless=False
  New Page    ${site_url}    

Hover Traders menu
    Hover    ${traders_tab}

Click And Validate Each Sub-Tab
    [Arguments]    ${traders_sub_tab}    ${expected_list}

    ${counter}=          Set Variable    0
    ${results}=          Create List

    ${sub_tab_elements}=    Get Elements    ${traders_sub_tab}

    FOR    ${element}    IN    @{sub_tab_elements}
        TRY
            ${tab_name}=    Get Text    ${element}
            ${item_name}=    Get From List    ${expected_list}    ${counter}
            Should Be Equal    ${tab_name}    ${item_name}
        EXCEPT
            Append To List    ${results}    FAIL: ${tab_name} != ${item_name}
        END
        ${counter}=    Evaluate    ${counter} + 1
    END

    # Log the final results - FAIL only
    Log    Final Results: ${results}
    Run Keyword If    ${results}    Fail    Final FAIL Results: ${results}


Check sub-tab under Trader menu
    [Arguments]    ${traders_sub_tab}    ${expected_list}
    Hover Traders menu
    Click And Validate Each Sub-Tab    ${traders_sub_tab}    ${expected_list}