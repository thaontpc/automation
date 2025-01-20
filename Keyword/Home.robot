*** Settings ***
Library   Browser
Library   Collections
Library   String
Library   BuiltIn

*** Variables ***
${site_url}    https://www.bitfinex.com/

# locator cho các sub-tab
${sub_menu_locator}    xpath=//div[contains(@class, 'header_popover_menu')]//a

# Template cho submenu locators
${menu_locator_template}    xpath=//span[@class='header_item-title'][normalize-space()='{}']

# Template cho link under menu locators
${link_menu_xpath_template}    xpath=//li[@class='header_menu_item header_menu_item__external']//a[contains(text(),'{}')]

*** Keywords ***
Open New Browser
  New Browser   headless=False
  New Page    ${site_url}    

# Check name of sub-menu under menu
Click And Validate Each Sub-Tab
    [Arguments]    ${sub_menu_locator}    ${expected_sub_menu_name_list}

    ${counter}=          Set Variable    0
    ${results}=          Create List
    ${sub_menu_elements}=    Get Elements    ${sub_menu_locator}

    FOR    ${element}    IN    @{sub_menu_elements}
        TRY
            ${sub_menu_name}=    Get Text    ${element}
            ${item_name}=    Get From List    ${expected_sub_menu_name_list}    ${counter}
            Should Be Equal    ${sub_menu_name}    ${item_name}
        EXCEPT
            Append To List    ${results}    FAIL: ${sub_menu_name} != ${item_name}
        END
        ${counter}=    Evaluate    ${counter} + 1
    END

    # Log the final results - FAIL only
    Log    Final Results: ${results}
    Run Keyword If    ${results}    Fail    Final FAIL Results: ${results}

Check Sub-menu under Menu
    [Arguments]    ${menu_name}    ${expected_sub_menu_name_list}

    ${menu_locator}=    Replace String    ${menu_locator_template}    {}    ${menu_name}
    Hover    ${menu_locator}
    Click And Validate Each Sub-Tab    ${sub_menu_locator}    ${expected_sub_menu_name_list}

# Check link under menu
Check Link Under Menu
    [Arguments]    ${menu_name}    @{sub_menu_link_name}
    ${missing_elements}=    Create List
    FOR    ${element}    IN    @{sub_menu_link_name}
        ${menu_locator}=    Replace String    ${menu_locator_template}    {}    ${menu_name}
        Hover    ${menu_locator}
        ${link_menu_locator}=    Replace String    ${link_menu_xpath_template}    {}    ${element}

        ${element_exists}=    Run Keyword And Return Status    Get Element    ${link_menu_locator}    # timeout=2s
        IF    ${element_exists}
            Click With Options    ${link_menu_locator}    force=True
            Wait For Load State
            Switch Page      NEW
            Sleep    2 seconds
            ${new_url}=    Get URL
            Log     ${new_url}
            Should Not Be Equal    ${new_url}    ${site_url}
            Close Page
            Sleep    2 seconds
        ELSE
            Append To List    ${missing_elements}    ${element} 
        END
    END
    
    IF    ${missing_elements}
        Fail    Elements were not found '${menu_name}': ${missing_elements}
    END



