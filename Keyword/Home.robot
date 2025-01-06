*** Settings ***
Library   Browser
Library   Collections
Library   String

*** Variables ***

${site_url}    https://www.bitfinex.com/

# locator cho các sub-tab
${sub_menu_locator}    xpath=//div[contains(@class, 'header_popover_menu')]//a

# Template cho menu locators
${menu_locator_template}    xpath=//span[@class='header_item-title'][normalize-space()='{}']

${counter}    0

*** Keywords ***

Open Browser
  New Browser   headless=False
  New Page    ${site_url}    

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

Check Sub-menu under Menu
    [Arguments]    ${menu_name}    ${expected_list}
    
    ${menu_locator}=    Replace String    ${menu_locator_template}    {}    ${menu_name}
    Hover    ${menu_locator}
    Click And Validate Each Sub-Tab    ${sub_menu_locator}    ${expected_list}


