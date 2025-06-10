# openapi.api.CollectionApi

## Load the API package
```dart
import 'package:openapi/api.dart';
```

All URIs are relative to *http://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**collectionIdAdd**](CollectionApi.md#collectionidadd) | **POST** /v1/collection/{id}/add | 
[**getCollectionId**](CollectionApi.md#getcollectionid) | **GET** /v1/collection/{id} | 
[**getCollectionName**](CollectionApi.md#getcollectionname) | **GET** /v1/collection/by_name/{name} | 
[**getCollectionPath**](CollectionApi.md#getcollectionpath) | **GET** /v1/collection/by_path/{path} | 
[**getCollections**](CollectionApi.md#getcollections) | **GET** /v1/collection | 
[**patchCollectionId**](CollectionApi.md#patchcollectionid) | **PATCH** /v1/collection/{id} | 
[**postCollection**](CollectionApi.md#postcollection) | **POST** /v1/collection | 


# **collectionIdAdd**
> collectionIdAdd(id, addQuery)



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getCollectionApi();
final int id = 789; // int | 
final AddQuery addQuery = ; // AddQuery | 

try {
    api.collectionIdAdd(id, addQuery);
} catch on DioException (e) {
    print('Exception when calling CollectionApi->collectionIdAdd: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **int**|  | 
 **addQuery** | [**AddQuery**](AddQuery.md)|  | 

### Return type

void (empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getCollectionId**
> ApiCollection getCollectionId(id)



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getCollectionApi();
final int id = 789; // int | 

try {
    final response = api.getCollectionId(id);
    print(response);
} catch on DioException (e) {
    print('Exception when calling CollectionApi->getCollectionId: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **int**|  | 

### Return type

[**ApiCollection**](ApiCollection.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getCollectionName**
> ApiCollection getCollectionName(name)



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getCollectionApi();
final String name = name_example; // String | 

try {
    final response = api.getCollectionName(name);
    print(response);
} catch on DioException (e) {
    print('Exception when calling CollectionApi->getCollectionName: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **name** | **String**|  | 

### Return type

[**ApiCollection**](ApiCollection.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getCollectionPath**
> ApiCollection getCollectionPath(path)



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getCollectionApi();
final String path = path_example; // String | 

try {
    final response = api.getCollectionPath(path);
    print(response);
} catch on DioException (e) {
    print('Exception when calling CollectionApi->getCollectionPath: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **path** | **String**|  | 

### Return type

[**ApiCollection**](ApiCollection.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getCollections**
> CollectionResult getCollections()



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getCollectionApi();

try {
    final response = api.getCollections();
    print(response);
} catch on DioException (e) {
    print('Exception when calling CollectionApi->getCollections: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**CollectionResult**](CollectionResult.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **patchCollectionId**
> ApiCollection patchCollectionId(id, apiCollection)



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getCollectionApi();
final int id = 789; // int | 
final ApiCollection apiCollection = ; // ApiCollection | 

try {
    final response = api.patchCollectionId(id, apiCollection);
    print(response);
} catch on DioException (e) {
    print('Exception when calling CollectionApi->patchCollectionId: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **int**|  | 
 **apiCollection** | [**ApiCollection**](ApiCollection.md)|  | 

### Return type

[**ApiCollection**](ApiCollection.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **postCollection**
> ApiCollection postCollection(apiCollection)



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getCollectionApi();
final ApiCollection apiCollection = ; // ApiCollection | 

try {
    final response = api.postCollection(apiCollection);
    print(response);
} catch on DioException (e) {
    print('Exception when calling CollectionApi->postCollection: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **apiCollection** | [**ApiCollection**](ApiCollection.md)|  | 

### Return type

[**ApiCollection**](ApiCollection.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

