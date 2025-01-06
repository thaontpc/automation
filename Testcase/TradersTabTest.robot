*** Settings ***

Resource  ../../automation/Keyword/Home.robot

*** Test Cases ***

Test1
    
    Open Browser
    
    ${sub_menu_name_list}=    Create List      Features    Mobile app    P2P Trading    Market statistics    Corporate & professional    Our fees    Security    API documentation    Bitfinex Leaderboard    Competitions    Deposits & Withdrawals    Payment Cards    Thalex Derivatives    Reporting Tool
    Check Sub-menu under Menu     Traders      ${sub_menu_name_list}

    Close Browser