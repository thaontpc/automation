*** Settings ***
Library  Browser

*** Variables ***

*** Test Cases ***

Test1
    New Browser    headless=False
    New Page    https://www.bitfinex.com/

    ${element}=    Get Element    xpath=//*[@id="header"]/div/div/ul[1]/li[1]/span/div/span
    Get Element States    ${element}    contains    visible
    ${value}=    Get Text    ${element}
    BuiltIn.Should Be Equal As Strings    ${value}    Traders


    Hover    xpath=//*[@id="header"]/div/div/ul[1]/li[1]/span/div/span
#----------
    ${element_Features}=    Get Element    xpath=//*[@id="header"]/div/div/ul[1]/li[1]/span/div[2]/div/ul/li[1]/a
    ${element_Mobile_app}=    Get Element    xpath=//*[@id="header"]/div/div/ul[1]/li[1]/span/div[2]/div/ul/li[2]/a
    ${element_P2P_Trading}=    Get Element    xpath=//*[@id="header"]/div/div/ul[1]/li[1]/span/div[2]/div/ul/li[3]/a
    ${element_Market_statistics}=    Get Element    xpath=//*[@id="header"]/div/div/ul[1]/li[1]/span/div[2]/div/ul/li[4]/a
    ${element_Corporate_professional}=    Get Element    xpath=//*[@id="header"]/div/div/ul[1]/li[1]/span/div[2]/div/ul/li[5]/a
    ${element_Our_fees}=    Get Element    xpath=//*[@id="header"]/div/div/ul[1]/li[1]/span/div[2]/div/ul/li[6]/a
    ${element_Security}=    Get Element    xpath=//*[@id="header"]/div/div/ul[1]/li[1]/span/div[2]/div/ul/li[7]/a
    ${element_API_documentation}=    Get Element    xpath=//*[@id="header"]/div/div/ul[1]/li[1]/span/div[2]/div/ul/li[8]/a
    ${element_Bitfinex_Leaderboard}=    Get Element    xpath=//*[@id="header"]/div/div/ul[1]/li[1]/span/div[2]/div/ul/li[9]/a
    ${element_Competitions}=    Get Element    xpath=//*[@id="header"]/div/div/ul[1]/li[1]/span/div[2]/div/ul/li[10]/a
    ${element_Deposits_Withdrawals}=    Get Element    xpath=//*[@id="header"]/div/div/ul[1]/li[1]/span/div[2]/div/ul/li[11]/a
    ${element_Thalex_Derivatives}=    Get Element    xpath=//*[@id="header"]/div/div/ul[1]/li[1]/span/div[2]/div/ul/li[13]/a
    ${element_Reporting_Tool}=    Get Element    xpath=//*[@id="header"]/div/div/ul[1]/li[1]/span/div[2]/div/ul/li[14]/a
    ${element_Payment_Cards}=    Get Element    xpath=//*[@id="header"]/div/div/ul[1]/li[1]/span/div[2]/div/ul/li[12]/a


# # -------

#     # Wait for each of the dropdown elements to be visible

    Wait For Elements State    ${element_Features}    visible
    Wait For Elements State    ${element_Mobile_app}    visible
    Wait For Elements State    ${element_P2P_Trading}    visible
    Wait For Elements State    ${element_Market_statistics}    visible
    Wait For Elements State    ${element_Corporate_professional}    visible
    Wait For Elements State    ${element_Our_fees}    visible
    Wait For Elements State    ${element_Security}    visible
    Wait For Elements State    ${element_API_documentation}    visible
    Wait For Elements State    ${element_Bitfinex_Leaderboard}    visible
    Wait For Elements State    ${element_Competitions}    visible
    Wait For Elements State    ${element_Deposits_Withdrawals}    visible
    Wait For Elements State    ${element_Thalex_Derivatives}    visible
    Wait For Elements State    ${element_Reporting_Tool}    visible
    Wait For Elements State    ${element_Payment_Cards}    visible

# -------

    Get Element States    ${element_Features}    contains    visible
    ${value_Features}=    Get Text    ${element_Features}
    BuiltIn.Should Be Equal As Strings    ${value_Features}    Features


    Get Element States    ${element_Mobile_app}    contains    visible
    ${value_Mobile_app}=    Get Text    ${element_Mobile_app}
    BuiltIn.Should Be Equal As Strings    ${value_Mobile_app}    Mobile app
  
    Get Element States    ${element_P2P_Trading}    contains    visible
    ${value_P2P_Trading}=    Get Text    ${element_P2P_Trading}
    BuiltIn.Should Be Equal As Strings    ${value_P2P_Trading}    P2P Trading
  
    Get Element States    ${element_Market_statistics}    contains    visible
    ${value_Market_statistics}=    Get Text    ${element_Market_statistics}
    BuiltIn.Should Be Equal As Strings    ${value_Market_statistics}    Market statistics
  
    Get Element States    ${element_Corporate_professional}    contains    visible
    ${value_Corporate_professional}=    Get Text    ${element_Corporate_professional}
    BuiltIn.Should Be Equal As Strings    ${value_Corporate_professional}    Corporate & professional
  
    Get Element States    ${element_Our_fees}    contains    visible
    ${value_Our_fees}=    Get Text    ${element_Our_fees}
    BuiltIn.Should Be Equal As Strings    ${value_Our_fees}    Our fees
  
    Get Element States    ${element_Security}    contains    visible
    ${value_Security}=    Get Text    ${element_Security}
    BuiltIn.Should Be Equal As Strings    ${value_Security}    Security
  
    Get Element States    ${element_API_documentation}    contains    visible
    ${value_API_documentation}=    Get Text    ${element_API_documentation}
    BuiltIn.Should Be Equal As Strings    ${value_API_documentation}    API documentation
  
    Get Element States    ${element_Bitfinex_Leaderboard}    contains    visible
    ${value_Bitfinex_Leaderboard}=    Get Text    ${element_Bitfinex_Leaderboard}
    BuiltIn.Should Be Equal As Strings    ${value_Bitfinex_Leaderboard}    Bitfinex Leaderboard
  
    Get Element States    ${element_Competitions}    contains    visible
    ${value_Competitions}=    Get Text    ${element_Competitions}
    BuiltIn.Should Be Equal As Strings    ${value_Competitions}    Competitions
  
    Get Element States    ${element_Deposits_Withdrawals}    contains    visible
    ${value_Deposits_Withdrawals}=    Get Text    ${element_Deposits_Withdrawals}
    BuiltIn.Should Be Equal As Strings    ${value_Deposits_Withdrawals}    Deposits & Withdrawals
  
    Get Element States    ${element_Thalex_Derivatives}    contains    visible
    ${value_Thalex_Derivatives}=    Get Text    ${element_Thalex_Derivatives}
    BuiltIn.Should Be Equal As Strings    ${value_Thalex_Derivatives}    Thalex Derivatives
  
    Get Element States    ${element_Reporting_Tool}    contains    visible
    ${value_Reporting_Tool}=    Get Text    ${element_Reporting_Tool}
    BuiltIn.Should Be Equal As Strings    ${value_Reporting_Tool}    Reporting Tool
  
    Get Element States    ${element_Payment_Cards}    contains    visible
    ${value_Payment_Cards}=    Get Text    ${element_Payment_Cards}
    BuiltIn.Should Be Equal As Strings    ${value_Payment_Cards}    Payment Cards
  
# -------

# # -------

    Close Browser
