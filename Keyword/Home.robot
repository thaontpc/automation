*** Settings ***
Library   Browser
Library   Collections

*** Variables ***

${site_url}    https://www.bitfinex.com/

# Home page elements 
${traders_tab}  xpath=//span[@class='header_item-title'][normalize-space()='Traders']

# Traders sub tab element
${traders_sub_tab}  xpath=//div[contains(@class, 'header_popover_menu')]//a

# Declare my_list as variable does not work, it thinks my_list is a string instead of a list, why?
#${my_list}    Create List    Features    Mobile app    P2P Trading    Market statistics    Corporate & professional    Our fees    Security    API documentation    Bitfinex Leaderboard    Competitions    Deposits & Withdrawals    Debit/Credit On-ramp    Thalex Derivatives    Reporting Tool    Debit/Credit On-ramp

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
    # Log    ${my_list}

    # Loop through sub-tabs and check visibility
    FOR    ${element}    IN    @{sub_tab_elements}                
        ${tab_name}=    Get Text    ${element}
        ${item_name}=    Get From List    ${my_list}    ${counter}
        # Log    Element name: ${tab_name}
        # Log    Element name: ${item_name}
        Should Be Equal    ${tab_name}    ${item_name}

        ${counter}=    Evaluate    ${counter} + 1
        
    END