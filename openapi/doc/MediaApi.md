# openapi.api.MediaApi

## Load the API package
```dart
import 'package:openapi/api.dart';
```

All URIs are relative to *http://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**getMedia**](MediaApi.md#getmedia) | **GET** /v1/media | 
[**getMediaFile**](MediaApi.md#getmediafile) | **GET** /v1/media/{id}/file | 
[**getMediaItem**](MediaApi.md#getmediaitem) | **GET** /v1/media/{id} | 
[**getMediaItemByHash**](MediaApi.md#getmediaitembyhash) | **GET** /v1/media/by_hash/{hash} | 
[**getMediaThumbnail**](MediaApi.md#getmediathumbnail) | **GET** /v1/media/{id}/thumbnail | 
[**mediaItemPatch**](MediaApi.md#mediaitempatch) | **PATCH** /v1/media/{id} | 
[**postMedia**](MediaApi.md#postmedia) | **POST** /v1/media | 
[**updateMediaItem**](MediaApi.md#updatemediaitem) | **POST** /v1/media/{id} | 


# **getMedia**
> SearchResult getMedia(perPage, last)



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getMediaApi();
final int perPage = 789; // int | Number of Results per page
final int last = 789; // int | Last object of previous results, provide to get next results

try {
    final response = api.getMedia(perPage, last);
    print(response);
} catch on DioException (e) {
    print('Exception when calling MediaApi->getMedia: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
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

# **getMediaFile**
> Uint8List getMediaFile(id)



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getMediaApi();
final int id = 789; // int | 

try {
    final response = api.getMediaFile(id);
    print(response);
} catch on DioException (e) {
    print('Exception when calling MediaApi->getMediaFile: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **int**|  | 

### Return type

[**Uint8List**](Uint8List.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/octet

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getMediaItem**
> ApiMedia getMediaItem(id)



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getMediaApi();
final int id = 789; // int | 

try {
    final response = api.getMediaItem(id);
    print(response);
} catch on DioException (e) {
    print('Exception when calling MediaApi->getMediaItem: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **int**|  | 

### Return type

[**ApiMedia**](ApiMedia.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getMediaItemByHash**
> ApiMedia getMediaItemByHash(hash)



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getMediaApi();
final String hash = hash_example; // String | 

try {
    final response = api.getMediaItemByHash(hash);
    print(response);
} catch on DioException (e) {
    print('Exception when calling MediaApi->getMediaItemByHash: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **hash** | **String**|  | 

### Return type

[**ApiMedia**](ApiMedia.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getMediaThumbnail**
> Uint8List getMediaThumbnail(id)



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getMediaApi();
final int id = 789; // int | 

try {
    final response = api.getMediaThumbnail(id);
    print(response);
} catch on DioException (e) {
    print('Exception when calling MediaApi->getMediaThumbnail: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **int**|  | 

### Return type

[**Uint8List**](Uint8List.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/octet

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **mediaItemPatch**
> ApiMedia mediaItemPatch(id, apiMedia)



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getMediaApi();
final int id = 789; // int | 
final ApiMedia apiMedia = ; // ApiMedia | 

try {
    final response = api.mediaItemPatch(id, apiMedia);
    print(response);
} catch on DioException (e) {
    print('Exception when calling MediaApi->mediaItemPatch: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **int**|  | 
 **apiMedia** | [**ApiMedia**](ApiMedia.md)|  | 

### Return type

[**ApiMedia**](ApiMedia.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **postMedia**
> ApiMedia postMedia(data, file)



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getMediaApi();
final ApiMedia data = ; // ApiMedia | 
final BuiltList<int> file = ; // BuiltList<int> | 

try {
    final response = api.postMedia(data, file);
    print(response);
} catch on DioException (e) {
    print('Exception when calling MediaApi->postMedia: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **data** | [**ApiMedia**](ApiMedia.md)|  | 
 **file** | [**BuiltList&lt;int&gt;**](int.md)|  | 

### Return type

[**ApiMedia**](ApiMedia.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: multipart/form-data
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **updateMediaItem**
> ApiMedia updateMediaItem(id, apiMedia)



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getMediaApi();
final int id = 789; // int | 
final ApiMedia apiMedia = ; // ApiMedia | 

try {
    final response = api.updateMediaItem(id, apiMedia);
    print(response);
} catch on DioException (e) {
    print('Exception when calling MediaApi->updateMediaItem: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **int**|  | 
 **apiMedia** | [**ApiMedia**](ApiMedia.md)|  | 

### Return type

[**ApiMedia**](ApiMedia.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

