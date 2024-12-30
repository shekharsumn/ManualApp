class AppJsonData {
  /// Json Data for Quiz functionality
  static const String questionanaireJson = '''
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
  ''';

  /// Json Data for Learn More functionality
  static const String learMoreJson = '''
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
     "title": "Erections can be a tricky thing. But no need to feel down!",
     "header": "ERECTILE DYSFUNCTION",
     "subtitle": "We're working around the clock to bring you a holistic approach to your wellness. From top to bottom, inside and out."
   }
 ]
}
  ''';
}
