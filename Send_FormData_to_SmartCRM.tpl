___TERMS_OF_SERVICE___

By creating or modifying this file you agree to Google Tag Manager's Community
Template Gallery Developer Terms of Service available at
https://developers.google.com/tag-manager/gallery-tos (or such other URL as
Google may provide), as modified from time to time.


___INFO___

{
  "type": "TAG",
  "id": "cvt_temp_public_id",
  "version": 1,
  "securityGroups": [],
  "displayName": "Send data to SmartCRM",
  "description": "This test",
  "categories": ["SALES", "LEAD_GENERATION"],
  "brand": {
    "id": "brand_dummy",
    "displayName": ""
  },
  "description": "Get formData from DataLayer and send use POST request to SmartCRM",
  "containerContexts": [
    "WEB"
  ]
}


___TEMPLATE_PARAMETERS___

[
  {
    "type": "TEXT",
    "name": "postMethod",
    "displayName": "Post Method",
    "simpleValueType": true,
    "valueValidators": [
      {
        "type": "NON_EMPTY"
      }
    ]
  },
  {
    "type": "TEXT",
    "name": "token",
    "displayName": "Token",
    "simpleValueType": true,
    "valueValidators": [
      {
        "type": "NON_EMPTY"
      }
    ]
  }
]


___SANDBOXED_JS_FOR_WEB_TEMPLATE___

const log = require('logToConsole');
const JSON = require('JSON');
const Object = require('Object');
const encodeUriComponent = require('encodeUriComponent');
const copyFromDataLayer = require('copyFromDataLayer'); 

const formData = copyFromDataLayer('formData');
const sendPostRequest = data.postMethod;
const token = data.token;

const baseUrl = 'https://my.binotel.ua/b/smartcrm-staging/api/widget/v1/deal/create?token=';
const url = baseUrl + encodeUriComponent(token);

if(formData) {
 const postBody = {
        name: "GTM",
        budget: 6543,
        fields: [
          // Тут додайте свої користувацькі поля для угоди
          //{fieldId:1591,value:"formData.name"}
        ],
        customerDraft: {
          name: formData.name,
          number: formData.phone,
          fields: [
          // Тут додайте свої користувацькі поля для клієнта
          //{fieldId:1591,value:"formData.name"}],
          ]
        },
      };
log(postBody);

sendPostRequest(url, JSON.stringify(postBody)).then(response => response.json())
  .then(response => {
    log('Успіх:', data);  // Успіх
    data.gtmOnSuccess(response);
  })
  .catch((error) => {
    log('Помилка:', error);  // Помилка
    data.gtmOnFailure(error);
  }); 
  
}

// Вызовите data.gtmOnSuccess после выполнения тега.
//data.gtmOnSuccess();


___WEB_PERMISSIONS___

[
  {
    "instance": {
      "key": {
        "publicId": "logging",
        "versionId": "1"
      },
      "param": [
        {
          "key": "environments",
          "value": {
            "type": 1,
            "string": "all"
          }
        }
      ]
    },
    "clientAnnotations": {
      "isEditedByUser": true
    },
    "isRequired": true
  },
  {
    "instance": {
      "key": {
        "publicId": "read_data_layer",
        "versionId": "1"
      },
      "param": [
        {
          "key": "allowedKeys",
          "value": {
            "type": 1,
            "string": "specific"
          }
        },
        {
          "key": "keyPatterns",
          "value": {
            "type": 2,
            "listItem": [
              {
                "type": 1,
                "string": "formData"
              }
            ]
          }
        }
      ]
    },
    "clientAnnotations": {
      "isEditedByUser": true
    },
    "isRequired": true
  }
]


___TESTS___

scenarios: []


___NOTES___

Created on 2/11/2025, 10:14:03 AM


