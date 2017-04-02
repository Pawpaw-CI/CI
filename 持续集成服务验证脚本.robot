*** Settings ***
Library           os
Library           Selenium2Library

*** Test Cases ***
持续服务集成验证-登录
    [Documentation]    *testlink系统登录*
    ...    _持续集成用例集合_
    ...    登录验证测试
    [Tags]    CI
    open browser    http://localhost/testlink/login.php?note=logout&viewer=    ff
    input text    id=tl_login    admin
    input text    id=tl_password    admin
    click element    xpath=//*[@id='login']/div[3]/input
    page should not contain    New User? \
    close browser
关键字分层登录-退出
    [Documentation]    *Testlink系统登录脚本*
    ...    _持续集成用例集合_
    [Tags]    CI
    [Setup]    登录    http://localhost/testlink/login.php    admin    admin
    [Timeout]
    [Teardown]    退出

*** Keywords ***
登录
    [Arguments]    ${URL}    ${user}    ${passwd}
    open browser    ${URL}     ff
    input text    id=tl_login    ${user}
    input text    id=tl_password    ${passwd}
    click element    xpath=//*[@id='login']/div[3]/input

退出
    close browser
