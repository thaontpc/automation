*** Settings ***
Library   Browser
Library   Collections

*** Variables ***

${site_url}    https://www.bitfinex.com/

# Home page elements 
${traders_tab}  xpath=//span[@class='header_item-title'][normalize-space()='Traders']

# Traders sub tab element
${traders_sub_tab}  xpath=//div[contains(@class, 'header_popover_menu')]//a

*** Keywords ***


Open Browser 
  New Browser   headless=False
  New Page    ${site_url}    

Hover TradersTab
    Hover    ${traders_tab}

Click And Validate Each Sub-Tab
    [Arguments]    ${sub_tab_elements}
    
    # Loop through sub-tabs and check visibility
    FOR    ${element}    IN    @{sub_tab_elements}
        Sleep    2s    # Adds a delay of 2 seconds between each iteration
        ${tab_name}=    Get Text    ${element}
        Log    Testing sub-tab: ${tab_name}
        
        Hover    ${element}    force=True
        
        Log    Successfully hovered over sub-tab: ${tab_name}
    END