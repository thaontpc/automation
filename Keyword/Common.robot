*** Settings ***
Library   Browser

*** Variables ***
${site_url}    https://www.bitfinex.com/

*** Keywords ***
Open New Browser
  New Browser   headless=False
  New Page    ${site_url}    
