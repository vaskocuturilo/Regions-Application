# The application Regions 
This iOS application determines regions by code for different countries as Russia, Ukraine, Belarus, and European Union.
![](https://c.radikal.ru/c10/2108/a3/e469c95e6020.png)

Using REST API on the Spring Boot technology with Mysql or JSON data.

This is simple regions application. The features of this application: 
- Response regions with REST API service.
- Response regions with JSON data.

![](https://a.radikal.ru/a08/2108/b1/35be4de95b5f.png)

![](https://c.radikal.ru/c06/2108/ba/78ef0469b1bb.png)


## Test scenario:
- Create simple application for response regions (Russia, Ukraine, Belarusia, Poland, Moldova, Lithuania, Turkey, Czech, Estonia and Germany).
- Create functional for using REST API with Mysql.
- Create functional for work with JSON data.
- Creat functional for work with CoreData.
- Create automation scripts for application.
- Generate report after running automation scripts. 
    
## Requirements:
- Use any *object-oriented language* (Objective-C or Swift).
- Use automation patterns like *PageObject*, *data-driven* tests, etc.
- Use any testing frameworks (XCUITest). 
- provide code and clear instructions how to run it.

**Note**: please put your code in public repository.

**Note**: Please send link to this repo when you are done.

**Note**: Please use this backend server .

You will need the following technologies available to try it out:

* Git
* Alamofire
* CoreData
* XCUITest
* Swift 5
* Xcode 

### How it work:

## Database
![](https://d.radikal.ru/d27/2107/d7/ba3bdd553416.png)

## CoreData
![](https://c.radikal.ru/c03/2108/a0/572e3c6e4abc.png)

### Ho w to run

``` xcodebuild test -workspace Regions-Application.xcworkspace -scheme Regions-Application -destination 'platform=iOS Simulator,name=IPhone SE,OS=14.5' -resultBundlePath TestResults```

# xcresults
A command line tool to extract test summaries & screenshots from Xcode 11 XCResult files.

# Installation
Download latest version from github releases:

wget https://github.com/eroshenkoam/xcresults/releases/latest/download/xcresults

# And make it executable:

chmod +x xcresults

### Generate Allure report 

```./xcresults export TestResults.xcresult/ outputDirectory```

### Open Allure report in browser

```allure serve outputDirectory/```

![](https://a.radikal.ru/a39/2110/41/78c13446f5f8.png)
![](https://d.radikal.ru/d13/2110/c9/39309a785553.png)
![]()
