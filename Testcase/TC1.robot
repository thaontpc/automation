*** Settings ***
Library  SeleniumLibrary

*** Variables ***

*** Test Cases ***

Test1

    open browser  https://www.bitfinex.com/  chrome
    sleep  2s

    element should be visible  //*[@id="header"]/div/div/ul[1]/li[1]/span/div/span
    
    element text should be  //*[@id="header"]/div/div/ul[1]/li[1]/span/div/span  Traders

    Mouse Over  //*[@id="header"]/div/div/ul[1]/li[1]/span/div/span

    element should be visible  //*[@id="header"]/div/div/ul[1]/li[1]/span/div[2]/div/ul/li[1]/a
    element text should be  //*[@id="header"]/div/div/ul[1]/li[1]/span/div[2]/div/ul/li[1]/a  Features

    element should be visible  //*[@id="header"]/div/div/ul[1]/li[1]/span/div[2]/div/ul/li[2]/a
    element text should be  //*[@id="header"]/div/div/ul[1]/li[1]/span/div[2]/div/ul/li[2]/a  Mobile app

    element should be visible  //*[@id="header"]/div/div/ul[1]/li[1]/span/div[2]/div/ul/li[3]/a
    element text should be  //*[@id="header"]/div/div/ul[1]/li[1]/span/div[2]/div/ul/li[3]/a  P2P Trading

    element should be visible  //*[@id="header"]/div/div/ul[1]/li[1]/span/div[2]/div/ul/li[4]/a
    element text should be  //*[@id="header"]/div/div/ul[1]/li[1]/span/div[2]/div/ul/li[4]/a  Market statistics

    element should be visible  //*[@id="header"]/div/div/ul[1]/li[1]/span/div[2]/div/ul/li[5]/a
    element text should be  //*[@id="header"]/div/div/ul[1]/li[1]/span/div[2]/div/ul/li[5]/a  Corporate & professional

    element should be visible  //*[@id="header"]/div/div/ul[1]/li[1]/span/div[2]/div/ul/li[6]/a
    element text should be  //*[@id="header"]/div/div/ul[1]/li[1]/span/div[2]/div/ul/li[6]/a  Our fees

    element should be visible  //*[@id="header"]/div/div/ul[1]/li[1]/span/div[2]/div/ul/li[7]/a
    element text should be  //*[@id="header"]/div/div/ul[1]/li[1]/span/div[2]/div/ul/li[7]/a  Security

    element should be visible  //*[@id="header"]/div/div/ul[1]/li[1]/span/div[2]/div/ul/li[8]/a
    element text should be  //*[@id="header"]/div/div/ul[1]/li[1]/span/div[2]/div/ul/li[8]/a  API documentation

    element should be visible  //*[@id="header"]/div/div/ul[1]/li[1]/span/div[2]/div/ul/li[9]/a
    element text should be  //*[@id="header"]/div/div/ul[1]/li[1]/span/div[2]/div/ul/li[9]/a  Bitfinex Leaderboard

    element should be visible  //*[@id="header"]/div/div/ul[1]/li[1]/span/div[2]/div/ul/li[10]/a
    element text should be  //*[@id="header"]/div/div/ul[1]/li[1]/span/div[2]/div/ul/li[10]/a  Competitions

    element should be visible  //*[@id="header"]/div/div/ul[1]/li[1]/span/div[2]/div/ul/li[11]/a
    element text should be  //*[@id="header"]/div/div/ul[1]/li[1]/span/div[2]/div/ul/li[11]/a  Deposits & Withdrawals

    element should be visible  //*[@id="header"]/div/div/ul[1]/li[1]/span/div[2]/div/ul/li[13]/a
    element text should be  //*[@id="header"]/div/div/ul[1]/li[1]/span/div[2]/div/ul/li[13]/a  Thalex Derivatives

    element should be visible  //*[@id="header"]/div/div/ul[1]/li[1]/span/div[2]/div/ul/li[14]/a
    element text should be  //*[@id="header"]/div/div/ul[1]/li[1]/span/div[2]/div/ul/li[14]/a  Reporting Tool

    element should be visible  //*[@id="header"]/div/div/ul[1]/li[1]/span/div[2]/div/ul/li[12]/a
    element text should be  //*[@id="header"]/div/div/ul[1]/li[1]/span/div[2]/div/ul/li[12]/a  Payment Cards

    close browser


*** Keywords ***
