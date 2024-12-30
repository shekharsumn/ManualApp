# manual_app

Manual App: Case Study Project

## Getting Started : Setup the flutter enviornment before getting started
link: https://docs.flutter.dev/get-started/install

### Task
Case Study Project - Mobile Engineer  

The business case::
At Manual we sometimes create a landing screen to better explain our value proposition to users. As an experiment, we’ve decided to create a separate screen that will include a quiz, which will guide users through deciding if Manual is good for them. 

User story ::
As a visitor, I want a landing screen, an information screen and a quiz screen to help me decide if Manual is the correct product for me.

Specifications ::
You’ll find the design mockup on figma: https://www.figma.com/design/h2AUeekHTf1T82Jlbvad6T/Mobile-Design?node-id=0-1&t=lcj3t2QLq8u1M90j-1 
(Important: The contextual data in the design is only for reference, the source of truth is provided in the json files)
If you don’t already have an account on figma, please open one. Then provide us with your account email and we will invite you to the project. 

All screens should work properly and scale for all device sizes both on Android and iOS.
You will also be provided with two JSON files, containing the data for the learn more section as well as a 3-step questionnaire which should be shown to the user when they tap on the “take the quiz” button in the top section, mimicking the consumption of a backend service.

This landing screen should be the app’s entry point and all actions should initiate from it.
The quiz questions should have four steps: one for each question, and one for the result step. 
Each step should be shown full screen (no part of the landing page should be displayed to distract the user). When the user answers one quiz question, they should be taken to the next one immediately. After the final quiz question they should be shown the results screen. 

The user should be able to go back to the previous questions. If they do, the previously selected answer should be visible somehow. Users should also be able to change their answers by simply selecting a new one, possibly triggering a rejection.
The quiz questions are fully described in the provided JSON file. The quiz should be fully dynamic, allowing the existing JSON file to be replaced with a different one, or even with an API. 

You can find the two json files attached at the end of this document.
1. If the user selects as an answer an option that has isRejection === true, they should be shown the result “Unfortunately, we are unable to prescribe this medication for you. This is because finasteride can alter the PSA levels, which may be used to monitor for cancer. You should discuss this further with your GP or specialist if you would still like this medication.” 

2. If the user reaches the end of the quiz without meeting any of the rejection conditions, they should be shown the result “Great news! We have the perfect treatment for your hair loss. Proceed to www.manual.co, and prepare to say hello to your new hair!” the link should open the page in an external browser.


JSON - Learn More
{
 "data": [
   {
     "id": 1,
     "assetID": "hairLossInfoIllustration",
     "title": "Hair loss needn't be irreversible. We can help!",
     "header": "HAIR LOSS",
     "subtitle": "We're working around the clock to bring you a holistic approach to your wellness. From top to bottom, inside and out."
   },
   {
     "id": 2,
     "assetID": "erectileDysfunctionInfoIllustration",
     "title": "Hair loss needn't be irreversible. We can help!",
     "header": "ERECTILE DYSFUNCTION",
     "subtitle": "We're working around the clock to bring you a holistic approach to your wellness. From top to bottom, inside and out."
   }
 ]
}

JSON - Quiz
{
   "questions": [
     {
       "question": "Which image best matches your hair loss?",
       "type": "ChoiceTypeImage",
       "options": [
         {
           "display": "https://s3-eu-west-1.amazonaws.com/manualco/questions/temples-hairloss%402x.png",
           "value": "Temples",
           "isRejection": false
         },
         {
           "display": "https://s3-eu-west-1.amazonaws.com/manualco/questions/templescrown-hairloss%402x.png",
           "value": "Temples & Crown",
           "isRejection": false
         },
         {
           "display": "https://s3-eu-west-1.amazonaws.com/manualco/questions/patchy-hairloss%402x.png",
           "value": "Patchy",
           "isRejection": false
         },
         {
           "display": "https://s3-eu-west-1.amazonaws.com/manualco/questions/moderate-hairloss%402x.png",
           "value": "Moderate",
           "isRejection": true
         },
         {
           "display": "https://s3-eu-west-1.amazonaws.com/manualco/questions/extensive-hairloss%402x.png",
           "value": "Extensive",
           "isRejection": true
         },
         {
           "display": "https://s3-eu-west-1.amazonaws.com/manualco/questions/complete-hairloss%402x.png",
           "value": "Complete",
           "isRejection": true
         }
       ]
     },
     {
       "question": "Have you ever been diagnosed with prostate cancer, or are you currently undergoing PSA/Prostate monitoring?",
       "type": "ChoiceTypeText",
       "options": [
         {
           "display": "Yes",
           "value": true,
           "isRejection": true
         },
         {
           "display": "No",
           "value": false,
           "isRejection": false
         }
       ]
     },
     {
       "question": "Have you ever been diagnosed with breast cancer or noticed any changes in your breast tissue such as lumps, pain, nipple discharge or swelling?",
       "type": "ChoiceTypeText",
       "options": [
         {
           "display": "Yes",
           "value": true,
           "isRejection": true
         },
         {
           "display": "No",
           "value": false,
           "isRejection": false
         }
       ]
     }
   ]
 }

### Considerations & Approach

1. Design Pattern Used M-V-VM with Riverpod. Riverpod offers an improved version of Provider with better scalability and performance.Supports dependency injection and encourages a more modular approach to state management.
2. AutoRoute library for app navigations.
3. API Calls/Data Handling in this app is done using API Service Layer that encapsulate all HTTP requests and responses within this layer to abstract away networking details from the rest of the app. Model Classes uses `json_serializable` to automatically generate model classes from JSON. Currrently All data are being read from jasomData/app_json_data.dart class
4. Unit Tests can be found for all widgets under test folder.
5. App can be run using VSCode or Xcode or Android Studio.
6. Entry point to the app is main.dart under lib folder
7. Steps to run this app -> start ios or android emulator/connect actual device -> flutter run
8. Incase of troubleshooting -> flutter clean -> flutter pub get -> dart run build_runner build

Additional code like encryption manager, secure storage class are essential for app security as apps might need to save user related information. Hence we as developers need to ensure that proper safe guards are in place to protect it.







