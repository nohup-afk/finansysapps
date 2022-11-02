# finansysapps
###How to run api test
    
    install python 
    
    pip install robotframework
    
    robot --version
        
    pip install robotframework-requests

How to run Script
    
    robot api.robot


###How to run web test
    
    install python 
    
    pip install robotframework

    robot --version
       
    pip install --upgrade robotframework-seleniumlibrary
    
    pip install robotframework-faker

Setup Webdriver 
Windows CLI #

    Get familiar with Windows Environment Variables in Command Prompt
    
    Create directory C:\bin
    Download it for Windows and save to C:\bin
    
    Open Command Prompt and set the PATH for your account with

    setx PATH "C:\bin;%PATH%"

    Restart Command Prompt
    Verify setup with

    chromedriver.exe -v


How to run

        robot webtest.robot
