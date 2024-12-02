*** Settings ***
Library   Browser

Variables  ../../automation/PageObject/Locator.py
Variables  ../../automation/Resource/TradersKeyword.robot

*** Test Cases ***

Test1
    
    Open Browser
    Hover TradersTab
    
    # Check value of sub-tab
    ${value_Features}=    Get Text    ${element_Features}   ==  Features
    ${value_Security}=    Get Text    ${element_Security}   ==  Security
    ${value_Competitions}=    Get Text    ${element_Competitions}   ==  Competitions
    ${value_Mobile_app}=    Get Text    ${element_Mobile_app}   ==  Mobile app
    ${value_Our_fees}=    Get Text    ${element_Our_fees}   ==  Our fees
    ${value_Corporate_professional}=    Get Text    ${element_Corporate_professional}   ==  Corporate & professional
    ${value_Bitfinex_Leaderboard}=    Get Text    ${element_Bitfinex_Leaderboard}   ==  Bitfinex Leaderboard
    ${value_Deposits_Withdrawals}=    Get Text    ${element_Deposits_Withdrawals}   ==  Deposits & Withdrawals
    ${value_Thalex_Derivatives}=    Get Text    ${element_Thalex_Derivatives}   ==  Thalex Derivatives
    ${value_Reporting_Tool}=    Get Text    ${element_Reporting_Tool}   ==  Reporting Tool

  
    # Change syntax because if keeping that format, there is an error: 'ValueError: Argument 'assertion_operator' got value 'P2P Trading' that cannot be converted to AssertionOperator or None.'
    ${value_P2P_Trading}=    Get Text    ${element_P2P_Trading}
    BuiltIn.Should Be Equal As Strings    ${value_P2P_Trading}    P2P Trading
  
    ${value_Market_statistics}=    Get Text    ${element_Market_statistics}
    BuiltIn.Should Be Equal As Strings    ${value_Market_statistics}    Market statistics

    ${value_API_documentation}=    Get Text    ${element_API_documentation}
    BuiltIn.Should Be Equal As Strings    ${value_API_documentation}    API documentation

    ${value_Payment_Cards}=    Get Text    ${element_Payment_Cards}
    BuiltIn.Should Be Equal As Strings    ${value_Payment_Cards}    Payment Cards

    Close Browser