# ciyu_api.api.HistoryControllerApi

## Load the API package
```dart
import 'package:ciyu_api/api.dart';
```

All URIs are relative to *http://localhost:44333*

Method | HTTP request | Description
------------- | ------------- | -------------
[**createHistory**](HistoryControllerApi.md#createhistory) | **POST** /api/v1/histories | 
[**getPaginatedHistories**](HistoryControllerApi.md#getpaginatedhistories) | **GET** /api/v1/histories | 


# **createHistory**
> createHistory(articleId)



### Example
```dart
import 'package:ciyu_api/api.dart';

final api = CiyuApi().getHistoryControllerApi();
final String articleId = articleId_example; // String | 

try {
    api.createHistory(articleId);
} catch on DioError (e) {
    print('Exception when calling HistoryControllerApi->createHistory: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **articleId** | **String**|  | 

### Return type

void (empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getPaginatedHistories**
> SearchHitsArticle getPaginatedHistories(page, size, sort)



### Example
```dart
import 'package:ciyu_api/api.dart';

final api = CiyuApi().getHistoryControllerApi();
final int page = 56; // int | Zero-based page index (0..N)
final int size = 56; // int | The size of the page to be returned
final BuiltList<String> sort = ; // BuiltList<String> | Sorting criteria in the format: property,(asc|desc). Default sort order is ascending. Multiple sort criteria are supported.

try {
    final response = api.getPaginatedHistories(page, size, sort);
    print(response);
} catch on DioError (e) {
    print('Exception when calling HistoryControllerApi->getPaginatedHistories: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **page** | **int**| Zero-based page index (0..N) | [optional] [default to 0]
 **size** | **int**| The size of the page to be returned | [optional] [default to 20]
 **sort** | [**BuiltList&lt;String&gt;**](String.md)| Sorting criteria in the format: property,(asc|desc). Default sort order is ascending. Multiple sort criteria are supported. | [optional] 

### Return type

[**SearchHitsArticle**](SearchHitsArticle.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: */*

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

