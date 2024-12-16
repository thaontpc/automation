*** Settings ***
Library   Browser

Resource  ../../automation/Keyword/Home.robot

*** Test Cases ***

Test1
    
    Open Browser
    Hover TradersTab
    
    # Check value of sub-tab
    # giống nhau -> đưa vào 1 hàm

    Get Text    ${element_Features}   ==  Features
    Get Text    ${element_Security}   ==  Security
    Get Text    ${element_Competitions}   ==  Competitions
    Get Text    ${element_Mobile_app}   ==  Mobile app
    Get Text    ${element_Our_fees}   ==  Our fees
    Get Text    ${element_Corporate_professional}   ==  Corporate & professional
    Get Text    ${element_Bitfinex_Leaderboard}   ==  Bitfinex Leaderboard
    Get Text    ${element_Deposits_Withdrawals}   ==  Deposits & Withdrawals
    Get Text    ${element_Thalex_Derivatives}   ==  Thalex Derivatives
    Get Text    ${element_Reporting_Tool}   ==  Reporting Tool

    Get Text    ${element_P2P_Trading}   ==  P2P Trading
    Get Text    ${element_Market_statistics}   ==  Market statistics
    Get Text    ${element_API_documentation}   ==  API documentation
    Get Text    ${element_Payment_Cards}   ==  Payment Cards

    Close Browser