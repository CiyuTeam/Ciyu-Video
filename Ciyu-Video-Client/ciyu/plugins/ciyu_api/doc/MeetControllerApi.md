# ciyu_api.api.MeetControllerApi

## Load the API package
```dart
import 'package:ciyu_api/api.dart';
```

All URIs are relative to *http://localhost:44333*

Method | HTTP request | Description
------------- | ------------- | -------------
[**createMeet**](MeetControllerApi.md#createmeet) | **POST** /api/v1/meets | 
[**createMeets**](MeetControllerApi.md#createmeets) | **POST** /api/v1/meets/batch | 
[**getMeets**](MeetControllerApi.md#getmeets) | **GET** /api/v1/meets | 


# **createMeet**
> createMeet(createMeetDto)



### Example
```dart
import 'package:ciyu_api/api.dart';

final api = CiyuApi().getMeetControllerApi();
final CreateMeetDto createMeetDto = ; // CreateMeetDto | 

try {
    api.createMeet(createMeetDto);
} catch on DioError (e) {
    print('Exception when calling MeetControllerApi->createMeet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **createMeetDto** | [**CreateMeetDto**](CreateMeetDto.md)|  | 

### Return type

void (empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **createMeets**
> createMeets(createMeetsDto)



### Example
```dart
import 'package:ciyu_api/api.dart';

final api = CiyuApi().getMeetControllerApi();
final CreateMeetsDto createMeetsDto = ; // CreateMeetsDto | 

try {
    api.createMeets(createMeetsDto);
} catch on DioError (e) {
    print('Exception when calling MeetControllerApi->createMeets: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **createMeetsDto** | [**CreateMeetsDto**](CreateMeetsDto.md)|  | 

### Return type

void (empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getMeets**
> BuiltList<MeetDto> getMeets(wordId)



### Example
```dart
import 'package:ciyu_api/api.dart';

final api = CiyuApi().getMeetControllerApi();
final String wordId = wordId_example; // String | 

try {
    final response = api.getMeets(wordId);
    print(response);
} catch on DioError (e) {
    print('Exception when calling MeetControllerApi->getMeets: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **wordId** | **String**|  | 

### Return type

[**BuiltList&lt;MeetDto&gt;**](MeetDto.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: */*

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

