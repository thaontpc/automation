*** Settings ***

Resource  ../../automation/Keyword/Home.robot

*** Test Cases ***
Test1
    Open New Browser

    # Check Traders tab
    ${sub_menu_name_list}=    Create List    Features    Mobile app    P2P Trading    Market statistics    Corporate & professional    Our fees    Security    API documentation    Bitfinex Leaderboard    Competitions    Deposits & Withdrawals    Payment Cards    Thalex Derivatives    Reporting Tool
    Run Keyword And Continue On Failure    Check Sub-menu under Menu    Traders    ${sub_menu_name_list}

    Sleep    2 seconds

    # Check Lenders tab
    ${sub_menu_name_list}=    Create List    Staking    Bitfinex Borrow
    Run Keyword And Continue On Failure    Check Sub-menu under Menu    Lenders    ${sub_menu_name_list}

    Sleep    2 seconds

    # Check About tab
    ${sub_menu_name_list}=    Create List    About Bitfinex    Blog    Press    Newsletter    Status page    Utilities
    Run Keyword And Continue On Failure    Check Sub-menu under Menu    About    ${sub_menu_name_list}

    Close Browser


Test 9
    Open New Browser
    # Check Trader Tab
    @{link_menu_name_list}    Create List    API documentation    P2P Trading    Bitfinex Leaderboard    Reporting Tool
    Check Link Under Menu    Traders    @{link_menu_name_list}

    Sleep    2 seconds
    # Check Lender Tab
    @{link_menu_name_list}    Create List    Staking
    Check Link Under Menu    Lenders    @{link_menu_name_list}

    Sleep    2 seconds
    # Check About Tab
    @{link_menu_name_list}    Create List    Blog    Status page
    Check Link Under Menu    About    @{link_menu_name_list}
    Close Browser