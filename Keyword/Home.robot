*** Settings ***
Library   Browser
Library   Collections
Library   String
Library   BuiltIn

Resource  ../../automation/Keyword/Common.robot

*** Variables ***
# locator cho các sub-tab
${sub_menu_locator}    xpath=//div[contains(@class, 'header_popover_menu')]//a

# Template cho submenu locators
${menu_locator_template}    xpath=//span[@class='header_item-title'][normalize-space()='{}']

# Template cho link under menu locators
${link_menu_xpath_template}    xpath=//li[@class='header_menu_item header_menu_item__external']//a[contains(text(),'{}')]

*** Keywords ***
##### Hover menu
Hover Menu
    [Arguments]    ${menu_name}
    ${menu_locator}=    Replace String    ${menu_locator_template}    {}    ${menu_name}
    Hover    ${menu_locator}

##### Check name of sub-menu under menu
Validate Sub-Menu Under Menu
    [Arguments]    ${expected_sub_menu_name_list}    ${results}
    ${sub_menu_elements}=    Get Elements    ${sub_menu_locator}
    ${counter}=          Set Variable    0

    FOR    ${element}    IN    @{sub_menu_elements}
        TRY
            ${sub_menu_name}=    Get Text    ${element}
            ${item_name}=    Get From List    ${expected_sub_menu_name_list}    ${counter}
            Should Be Equal    ${sub_menu_name}    ${item_name}
        EXCEPT
            Append To List    ${results}    ${sub_menu_name} != ${item_name}
        END
        ${counter}=    Evaluate    ${counter} + 1
    END

Validate Sub-Menu Under Menu And Log Result
    [Arguments]    ${menu_name}    ${expected_sub_menu_name_list}

    ${results}=          Create List
    Hover Menu    ${menu_name}
    Validate Sub-Menu Under Menu    ${expected_sub_menu_name_list}    ${results}
    Run Keyword If    ${results}    Fail    FAIL: Menu: ${menu_name} - Element: ${results}

Check Sub-menu Under Menu
    [Arguments]    ${menu_name}    ${expected_sub_menu_name_list}
    Run Keyword And Continue On Failure    Validate Sub-Menu Under Menu And Log Result    ${menu_name}    ${expected_sub_menu_name_list}

##### Check link under menu
Validate Link Under Menu
    [Arguments]    ${missing_elements}    ${element}     
    ${link_menu_locator}=    Replace String    ${link_menu_xpath_template}    {}    ${element}
    ${element_exists}=    Run Keyword And Return Status    Get Element    ${link_menu_locator}    
    
    IF    ${element_exists}
        Click With Options    ${link_menu_locator}    force=True
        Wait For Load State
        Switch Page      NEW
        ${new_url}=    Get URL
        Log     ${new_url}
        Should Not Be Equal    ${new_url}    ${site_url}
        Close Page
    ELSE
        Append To List    ${missing_elements}    ${element} 
    END
Validate Link Under Menu And Log Result
    [Arguments]    ${menu_name}    @{sub_menu_link_name}

    ${missing_elements}=    Create List
    FOR    ${element}    IN    @{sub_menu_link_name}
        Hover Menu    ${menu_name}
        Validate Link Under Menu    ${missing_elements}    ${element}
    END
    
    Run Keyword If    ${missing_elements}    Fail    Not found: Menu: ${menu_name} - Elements: ${missing_elements}

Check Link Under Menu
    [Arguments]    ${menu_name}    @{sub_menu_link_name}
    Run Keyword And Continue On Failure    Validate Link Under Menu And Log Result    ${menu_name}    @{sub_menu_link_name}

