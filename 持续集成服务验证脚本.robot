*** Settings ***
Library           os
Library           Selenium2Library

*** Test Cases ***
持续服务集成验证-登录
    [Documentation]    *testlink系统登录*
    ...    _持续集成用例集合_
    ...    登录
    [Tags]    CI
    open browser    http://localhost/testlink/login.php?note=logout&viewer=    ff
    input text    id=tl_login    admin
    input text    id=tl_password    admin
    click element    xpath=//*[@id='login']/div[3]/input
    page should not contain    New User? \
    close browser
