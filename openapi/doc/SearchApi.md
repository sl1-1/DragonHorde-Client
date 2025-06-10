# openapi.api.SearchApi

## Load the API package
```dart
import 'package:openapi/api.dart';
```

All URIs are relative to *http://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**hashSearch**](SearchApi.md#hashsearch) | **GET** /v1/search/hash | 
[**searchQuery**](SearchApi.md#searchquery) | **GET** /v1/search | 


# **hashSearch**
> SearchResult hashSearch(hash, maxDistance, perPage, last)



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getSearchApi();
final int hash = 789; // int | 
final int maxDistance = 789; // int | 
final int perPage = 789; // int | Number of Results per page
final int last = 789; // int | Last object of previous results, provide to get next results

try {
    final response = api.hashSearch(hash, maxDistance, perPage, last);
    print(response);
} catch on DioException (e) {
    print('Exception when calling SearchApi->hashSearch: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **hash** | **int**|  | [optional] 
 **maxDistance** | **int**|  | [optional] 
 **perPage** | **int**| Number of Results per page | [optional] 
 **last** | **int**| Last object of previous results, provide to get next results | [optional] 

### Return type

[**SearchResult**](SearchResult.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **searchQuery**
> SearchResult searchQuery(tags, creators, perPage, last)



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getSearchApi();
final BuiltList<String> tags = ; // BuiltList<String> | 
final BuiltList<String> creators = ; // BuiltList<String> | 
final int perPage = 789; // int | Number of Results per page
final int last = 789; // int | Last object of previous results, provide to get next results

try {
    final response = api.searchQuery(tags, creators, perPage, last);
    print(response);
} catch on DioException (e) {
    print('Exception when calling SearchApi->searchQuery: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **tags** | [**BuiltList&lt;String&gt;**](String.md)|  | [optional] 
 **creators** | [**BuiltList&lt;String&gt;**](String.md)|  | [optional] 
 **perPage** | **int**| Number of Results per page | [optional] 
 **last** | **int**| Last object of previous results, provide to get next results | [optional] 

### Return type

[**SearchResult**](SearchResult.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

