# openapi.api.TagsApi

## Load the API package
```dart
import 'package:openapi/api.dart';
```

All URIs are relative to *http://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**autocomplete**](TagsApi.md#autocomplete) | **GET** /v1/autocomplete | 
[**searchTags**](TagsApi.md#searchtags) | **GET** /v1/tags | 


# **autocomplete**
> BuiltList<TagReturn> autocomplete(tag, tagType)



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getTagsApi();
final String tag = tag_example; // String | 
final String tagType = tagType_example; // String | 

try {
    final response = api.autocomplete(tag, tagType);
    print(response);
} catch on DioException (e) {
    print('Exception when calling TagsApi->autocomplete: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **tag** | **String**|  | 
 **tagType** | **String**|  | [optional] 

### Return type

[**BuiltList&lt;TagReturn&gt;**](TagReturn.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **searchTags**
> BuiltList<String> searchTags(tag)



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getTagsApi();
final String tag = tag_example; // String | 

try {
    final response = api.searchTags(tag);
    print(response);
} catch on DioException (e) {
    print('Exception when calling TagsApi->searchTags: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **tag** | **String**|  | 

### Return type

**BuiltList&lt;String&gt;**

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

