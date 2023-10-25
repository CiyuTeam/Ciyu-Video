# ciyu_api.api.SentenceControllerApi

## Load the API package
```dart
import 'package:ciyu_api/api.dart';
```

All URIs are relative to *http://localhost:44333*

Method | HTTP request | Description
------------- | ------------- | -------------
[**generateCompletions**](SentenceControllerApi.md#generatecompletions) | **GET** /api/v1/sentences/generated | 


# **generateCompletions**
> String generateCompletions(beforeText, excludedWordIds, page, size, sort)



### Example
```dart
import 'package:ciyu_api/api.dart';

final api = CiyuApi().getSentenceControllerApi();
final String beforeText = beforeText_example; // String | 
final BuiltList<String> excludedWordIds = ; // BuiltList<String> | 
final int page = 56; // int | Zero-based page index (0..N)
final int size = 56; // int | The size of the page to be returned
final BuiltList<String> sort = ; // BuiltList<String> | Sorting criteria in the format: property,(asc|desc). Default sort order is ascending. Multiple sort criteria are supported.

try {
    final response = api.generateCompletions(beforeText, excludedWordIds, page, size, sort);
    print(response);
} catch on DioError (e) {
    print('Exception when calling SentenceControllerApi->generateCompletions: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **beforeText** | **String**|  | 
 **excludedWordIds** | [**BuiltList&lt;String&gt;**](String.md)|  | 
 **page** | **int**| Zero-based page index (0..N) | [optional] [default to 0]
 **size** | **int**| The size of the page to be returned | [optional] [default to 20]
 **sort** | [**BuiltList&lt;String&gt;**](String.md)| Sorting criteria in the format: property,(asc|desc). Default sort order is ascending. Multiple sort criteria are supported. | [optional] 

### Return type

**String**

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: */*

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

