*** Settings ***
Library   Browser
Resource  ../../automation/PageObject/Locator.robot

*** Variables ***
${site_url}    https://www.bitfinex.com/

*** Keywords ***

Open Browser 
  New Browser   headless=False
  New Page    ${site_url}    

Hover TradersTab
  Hover   ${traders_tab}