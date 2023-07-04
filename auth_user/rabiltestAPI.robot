*** Settings ***
Library               RequestsLibrary

*** Variables ***
${response}    https://www.google.com

*** Test Cases ***
Quick Get Request Test
      ${response}=    GET  https://www.google.com
Quick Get Request With Parameters Test
      ${response}=    GET  https://www.google.com/search  params=query=ciao  expected_status=200

Quick Get A JSON Body Test
      ${response}=    GET  https://jsonplaceholder.typicode.com/posts/1
      Should Be Equal As Strings    1  ${response.json()}[id]
      Log To Console    ${response.status_code}
      Log To Console    ${response.content}