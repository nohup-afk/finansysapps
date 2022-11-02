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
        
How long did you spend on the technical test?

    1 Hours

What would you add to your solution if you had more time?

    add browser options 
    separate keyword and testcases
    
If you didnt spend much time on the technical test then use this as an opportunity to
explain what you would add.

    same as answer no 2
    
What do you think is the most interesting trend in test automation?

    more easier doing regression
    
How would you integrate test automation with a deployment pipeline?

    yes, i can
