# ciyu_api.api.GlossaryControllerApi

## Load the API package
```dart
import 'package:ciyu_api/api.dart';
```

All URIs are relative to *http://localhost:44333*

Method | HTTP request | Description
------------- | ------------- | -------------
[**getCurrentGlossary**](GlossaryControllerApi.md#getcurrentglossary) | **GET** /api/v1/glossaries/current | 
[**getGlossaries**](GlossaryControllerApi.md#getglossaries) | **GET** /api/v1/glossaries | 
[**getGlossaryById**](GlossaryControllerApi.md#getglossarybyid) | **GET** /api/v1/glossaries/{id} | 
[**setCurrentGlossary**](GlossaryControllerApi.md#setcurrentglossary) | **PUT** /api/v1/glossaries/current | 


# **getCurrentGlossary**
> Glossary getCurrentGlossary()



### Example
```dart
import 'package:ciyu_api/api.dart';

final api = CiyuApi().getGlossaryControllerApi();

try {
    final response = api.getCurrentGlossary();
    print(response);
} catch on DioError (e) {
    print('Exception when calling GlossaryControllerApi->getCurrentGlossary: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**Glossary**](Glossary.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: */*

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getGlossaries**
> JsonObject getGlossaries()



### Example
```dart
import 'package:ciyu_api/api.dart';

final api = CiyuApi().getGlossaryControllerApi();

try {
    final response = api.getGlossaries();
    print(response);
} catch on DioError (e) {
    print('Exception when calling GlossaryControllerApi->getGlossaries: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**JsonObject**](JsonObject.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: */*

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getGlossaryById**
> Glossary getGlossaryById(id)



### Example
```dart
import 'package:ciyu_api/api.dart';

final api = CiyuApi().getGlossaryControllerApi();
final String id = id_example; // String | 

try {
    final response = api.getGlossaryById(id);
    print(response);
} catch on DioError (e) {
    print('Exception when calling GlossaryControllerApi->getGlossaryById: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **String**|  | 

### Return type

[**Glossary**](Glossary.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: */*

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **setCurrentGlossary**
> setCurrentGlossary(glossary)



### Example
```dart
import 'package:ciyu_api/api.dart';

final api = CiyuApi().getGlossaryControllerApi();
final Glossary glossary = ; // Glossary | 

try {
    api.setCurrentGlossary(glossary);
} catch on DioError (e) {
    print('Exception when calling GlossaryControllerApi->setCurrentGlossary: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **glossary** | [**Glossary**](Glossary.md)|  | 

### Return type

void (empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

