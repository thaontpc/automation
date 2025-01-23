*** Settings ***
Resource  ../../automation/Keyword/Home.robot
Resource  ../../automation/Keyword/Common.robot

*** Test Cases ***
Test1
    Open New Browser

    # Check Traders tab
    ${sub_menu_name_list}=    Create List    Features    Mobile app    P2P Trading    Market statistics    Corporate & professional    Our fees    Security    API documentation    Bitfinex Leaderboard    Competitions    Deposits & Withdrawals    Payment Cards    Thalex Derivatives    Reporting Tool
    Check Sub-menu Under Menu    Traders    ${sub_menu_name_list}
    # Check Lenders tab
    ${sub_menu_name_list}=    Create List    Staking    Bitfinex Borrow
    Check Sub-menu Under Menu    Lenders    ${sub_menu_name_list}
    # Check About tab
    ${sub_menu_name_list}=    Create List    About Bitfinex    Blog    Press    Newsletter    Status page    Utilities
    Check Sub-menu under Menu    About    ${sub_menu_name_list}

    Close Browser


Test2
    Open New Browser

    # Check About Tab
    @{link_menu_name_list}    Create List    Blog    Newsletter    Status page
    Check Link Under Menu    About   @{link_menu_name_list}
    # Check Trader Tab
    @{link_menu_name_list}    Create List    P2P Trading    API documentation    Bitfinex Leaderboard    Reporting Tool
    Check Link Under Menu    Traders    @{link_menu_name_list}
    # Check Lender Tab
    @{link_menu_name_list}    Create List    Staking
    Check Link Under Menu   Lenders    @{link_menu_name_list}

    Close Browser