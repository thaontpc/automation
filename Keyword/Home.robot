*** Settings ***
Library   Browser

*** Variables ***

${site_url}    https://www.bitfinex.com/

# Home page elements 
${traders_tab}  xpath=//span[@class='header_item-title'][normalize-space()='Traders']

# Traders tab element
${element_P2P_Trading}  xpath=//li[@class='header_menu_item header_menu_item__external']//a[contains(text(),'P2P Trading')]

${element_Market_statistics}  xpath=//a[normalize-space()='Market statistics']
${element_Payment_Cards}  xpath=//a[@target='_self'][normalize-space()='Debit/Credit On-ramp']
${element_Features}  //a[normalize-space()='Features']
${element_Mobile_app}  xpath=//a[normalize-space()='Mobile app']
${element_Corporate_professional}  xpath=//a[normalize-space()='Corporate & professional']
${element_Our_fees}  xpath=//a[normalize-space()='Our fees']
${element_Security}  xpath=//a[normalize-space()='Security']
${element_API_documentation}  xpath=//a[normalize-space()='API documentation']
${element_Bitfinex_Leaderboard}  xpath=//a[normalize-space()='Bitfinex Leaderboard']
${element_Competitions}  xpath=//a[normalize-space()='Competitions']
${element_Deposits_Withdrawals}  xpath=//a[@target='_self'][normalize-space()='Deposits & Withdrawals']
${element_Thalex_Derivatives}  xpath=//a[@target='_self'][normalize-space()='Thalex Derivatives']
${element_Reporting_Tool}  xpath=//a[normalize-space()='Reporting Tool']


*** Keywords ***

# check manu items

# input: manu


Open Browser 
  New Browser   headless=False
  New Page    ${site_url}    

Hover TradersTab
  Hover   ${traders_tab}