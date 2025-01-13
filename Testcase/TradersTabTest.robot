*** Settings ***

Resource  ../../automation/Keyword/Home.robot

*** Test Cases ***
Test1
    Open New Browser

    # Check Traders tab
    # Log To Console    Checking Traders tab
    ${sub_menu_name_list}=    Create List    Features    Mobile app    P2P Trading    Market statistics    Corporate & professional    Our fees    Security    API documentation    Bitfinex Leaderboard    Competitions    Deposits & Withdrawals    Payment Cards    Thalex Derivatives    Reporting Tool
    Run Keyword And Continue On Failure    Check Sub-menu under Menu    Traders    ${sub_menu_name_list}
    Log To Console    Traders tab checked successfully

    Sleep    2 seconds

    # Check Lenders tab
    # Log To Console    Checking Lenders tab
    ${sub_menu_name_list}=    Create List    Staking    Bitfinex Borrow
    Run Keyword And Continue On Failure    Check Sub-menu under Menu    Lenders    ${sub_menu_name_list}
    Log To Console    Lenders tab checked successfully

    Sleep    2 seconds

    # Check About tab
    # Log To Console    Checking About tab
    ${sub_menu_name_list}=    Create List    About Bitfinex    Blog    Press    Newsletter    Status page    Utilities
    Run Keyword And Continue On Failure    Check Sub-menu under Menu    About    ${sub_menu_name_list}
    Log To Console    About tab checked successfully

    Close Browser