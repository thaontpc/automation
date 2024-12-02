*** Settings ***
Library   Browser
Variables  ../../automation/PageObject/Locator.py

*** Variables ***
${site_url}    "https://www.bitfinex.com/"

*** Keywords ***

Open Browser 
  New Browser   headless=False
  New Page    ${site_url}    

Hover TradersTab
  Hover   ${traders_tab}

Close Browser
  Close All Browsers 
