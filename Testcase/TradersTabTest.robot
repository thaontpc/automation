*** Settings ***
Library   Browser

Resource  ../../automation/Keyword/Home.robot

*** Test Cases ***

Test1
    
    Home.Open Browser
    
    ${sub_tab_name_list}=    Create List      Features    Mobile app    P2P Trading    Market statistics    Corporate & professional    Our fees    Security    API documentation    Bitfinex Leaderboard    Competitions    Deposits & Withdrawals    Payment Cards    Thalex Derivatives    Reporting Tool
    Check sub-tab under Trader menu     ${traders_sub_tab}      ${sub_tab_name_list}

    Close Browser