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

Open Browser 2
  New Browser   headless=False
  New Page    ${site_url}    

Hover TradersTab
    Hover    ${traders_tab}

Click And Validate Each Sub-Tab
    [Arguments]    ${sub_tab_elements}

    ${my_list}=          Create List      Features    Mobile app    P2P Trading    Market statistics    Corporate & professional    Our fees    Security    API documentation    Bitfinex Leaderboard    Competitions    Deposits & Withdrawals    Payment Cards    Thalex Derivatives    Reporting Tool

    ${counter}=          Set Variable    0
    # Initialize result list
    ${results}=          Create List

    FOR    ${element}    IN    @{sub_tab_elements}                
        TRY
            ${tab_name}=    Get Text    ${element}
            ${item_name}=    Get From List    ${my_list}    ${counter}
            Should Be Equal    ${tab_name}    ${item_name}
            # Log    PASS: ${tab_name}
        EXCEPT
            # Log    FAIL: ${tab_name} != ${item_name}
            Append To List    ${results}    FAIL: ${tab_name} != ${item_name}
        END
        ${counter}=    Evaluate    ${counter} + 1
    END

    # Log the final results - FAIL only
    Log    Final Results: ${results}
    # Kiểm tra nếu có bất kỳ lỗi nào trong ${results}
    Run Keyword If    ${results}    Fail    Final FAIL Results: ${results}