# openapi.api.CreatorsApi

## Load the API package
```dart
import 'package:openapi/api.dart';
```

All URIs are relative to *http://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**getCreators**](CreatorsApi.md#getcreators) | **GET** /v1/creators | 
[**getCreatorsByAlias**](CreatorsApi.md#getcreatorsbyalias) | **GET** /v1/creators/by_alias/{alias} | 
[**getCreatorsCollection**](CreatorsApi.md#getcreatorscollection) | **GET** /v1/creators/{id}/collection | 
[**getCreatorsId**](CreatorsApi.md#getcreatorsid) | **GET** /v1/creators/{id} | 
[**getCreatorsMedia**](CreatorsApi.md#getcreatorsmedia) | **GET** /v1/creators/{id}/media | 
[**getCreatorsUncollected**](CreatorsApi.md#getcreatorsuncollected) | **GET** /v1/creators/{id}/uncollected | 
[**patchCreatorsId**](CreatorsApi.md#patchcreatorsid) | **PATCH** /v1/creators/{id} | 


# **getCreators**
> CreatorsResults getCreators()



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getCreatorsApi();

try {
    final response = api.getCreators();
    print(response);
} catch on DioException (e) {
    print('Exception when calling CreatorsApi->getCreators: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**CreatorsResults**](CreatorsResults.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getCreatorsByAlias**
> ApiCreator getCreatorsByAlias(alias)



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getCreatorsApi();
final String alias = alias_example; // String | 

try {
    final response = api.getCreatorsByAlias(alias);
    print(response);
} catch on DioException (e) {
    print('Exception when calling CreatorsApi->getCreatorsByAlias: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **alias** | **String**|  | 

### Return type

[**ApiCreator**](ApiCreator.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getCreatorsCollection**
> CollectionResult getCreatorsCollection(id)



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getCreatorsApi();
final int id = 789; // int | 

try {
    final response = api.getCreatorsCollection(id);
    print(response);
} catch on DioException (e) {
    print('Exception when calling CreatorsApi->getCreatorsCollection: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **int**|  | 

### Return type

[**CollectionResult**](CollectionResult.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getCreatorsId**
> ApiCreator getCreatorsId(id)



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getCreatorsApi();
final int id = 789; // int | 

try {
    final response = api.getCreatorsId(id);
    print(response);
} catch on DioException (e) {
    print('Exception when calling CreatorsApi->getCreatorsId: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **int**|  | 

### Return type

[**ApiCreator**](ApiCreator.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getCreatorsMedia**
> SearchResult getCreatorsMedia(id, perPage, last)



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getCreatorsApi();
final int id = 789; // int | 
final int perPage = 789; // int | Number of Results per page
final int last = 789; // int | Last object of previous results, provide to get next results

try {
    final response = api.getCreatorsMedia(id, perPage, last);
    print(response);
} catch on DioException (e) {
    print('Exception when calling CreatorsApi->getCreatorsMedia: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **int**|  | 
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

# **getCreatorsUncollected**
> SearchResult getCreatorsUncollected(id, perPage, last)



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getCreatorsApi();
final int id = 789; // int | 
final int perPage = 789; // int | Number of Results per page
final int last = 789; // int | Last object of previous results, provide to get next results

try {
    final response = api.getCreatorsUncollected(id, perPage, last);
    print(response);
} catch on DioException (e) {
    print('Exception when calling CreatorsApi->getCreatorsUncollected: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **int**|  | 
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

# **patchCreatorsId**
> ApiCreator patchCreatorsId(id, apiCreator)



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getCreatorsApi();
final int id = 789; // int | 
final ApiCreator apiCreator = ; // ApiCreator | 

try {
    final response = api.patchCreatorsId(id, apiCreator);
    print(response);
} catch on DioException (e) {
    print('Exception when calling CreatorsApi->patchCreatorsId: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **int**|  | 
 **apiCreator** | [**ApiCreator**](ApiCreator.md)|  | 

### Return type

[**ApiCreator**](ApiCreator.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

