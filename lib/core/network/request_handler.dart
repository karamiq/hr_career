import 'package:app/common_lib.dart';
import 'package:app/data/providers/access_token_provider.dart';
import 'package:app/data/services/_clients.dart';

extension RequestHandlerX on WidgetRef {
  Future<HttpResponse<T>> req<T>(Future<HttpResponse<T>> Function() apiCall) {
    return RequestHandler.req(this, apiCall);
  }
}

Future<HttpResponse<T>> _handle401<T>(WidgetRef ref, Future<HttpResponse<T>> Function() apiCall) async {
  await ref.read(accessTokenProvider.notifier).newToken();
  return await apiCall();
}

/// Request handler that works with any response type
class RequestHandler {
  /// Handles 401 errors for any HttpResponse<T> type
  static Future<HttpResponse<T>> req<T>(WidgetRef ref, Future<HttpResponse<T>> Function() apiCall) async {
    try {
      final result = await apiCall();

      if (result.response.statusCode == 401) {
        return await _handle401(ref, apiCall);
      }

      return result;
    } on DioException catch (e) {
      if (e.response?.statusCode == 401) {
        return await _handle401(ref, apiCall);
      }
      rethrow;
    }
  }

  /// Generic 401 handler
  static Future<HttpResponse<T>> _handle401<T>(
    WidgetRef ref,
    Future<HttpResponse<T>> Function() apiCall,
  ) async {
    await ref.read(accessTokenProvider.notifier).newToken();
    return await apiCall();
  }
}

// /// Unified request handler that can work with any API client function
// /// and automatically handle 401 errors by refreshing the token
// extension RequestHandlerX on WidgetRef {
//   // totaly generic functions that can be used with any client
//   FutureApiResponse reqSync<T>(Function<T>() apiCall) async {
//     try {
//       final result = await apiCall();

//       if (result.response.statusCode == 401) {}
//       return result;
//     } on DioException catch (e) {
//       if (e.response?.statusCode == 401) {
//         await read(accessTokenProvider.notifier).newToken();
//         return apiCall();
//       }
//       rethrow;
//     }
//   }

//   FutureApiResponse<T> req<T>(FutureApiResponse<T> Function() apiCall) async =>
//       RequestHandler.req(this, apiCall);

//   FutureDefaultResponse<T> reqDefault<T>(FutureDefaultResponse<T> Function() apiCall) async =>
//       RequestHandler.reqDefault(this, apiCall);

//   FuturePaginatedResponse<T> reqPaginated<T>(FuturePaginatedResponse<T> Function() apiCall) async =>
//       RequestHandler.reqPaginated(this, apiCall);
// }

// class RequestHandler {
//   static FutureApiResponse<T> req<T>(WidgetRef ref, FutureApiResponse<T> Function() apiCall) async {
//     try {
//       final result = await apiCall();

//       if (result.response.statusCode == 401) {
//         return await _handle401Error(ref, apiCall);
//       }
//       return result;
//     } on DioException catch (e) {
//       if (e.response?.statusCode == 401) {
//         return await _handle401Error(ref, apiCall);
//       }
//       rethrow;
//     }
//   }

//   /// Generic request handler for FutureDefaultResponse functions
//   /// Automatically handles 401 errors by refreshing the token and retrying
//   static Future<HttpResponse<DefaultResponse<T>>> reqDefault<T>(
//     WidgetRef ref,
//     Future<HttpResponse<DefaultResponse<T>>> Function() apiCall,
//   ) async {
//     try {
//       final result = await apiCall();

//       if (result.response.statusCode == 401) {
//         return await _handle401ErrorDefault(ref, apiCall);
//       }

//       // Handle 401 error by refreshing token
//       return await _handle401ErrorDefault(ref, apiCall);
//     } on DioException catch (e) {
//       // If the error is a 401, try to refresh token
//       if (e.response?.statusCode == 401) {
//         return await _handle401ErrorDefault(ref, apiCall);
//       }
//       rethrow;
//     }
//   }

//   /// Generic request handler for FuturePaginatedResponse functions
//   /// Automatically handles 401 errors by refreshing the token and retrying
//   static Future<HttpResponse<PaginatedResponse<T>>> reqPaginated<T>(
//     WidgetRef ref,
//     Future<HttpResponse<PaginatedResponse<T>>> Function() apiCall,
//   ) async {
//     try {
//       final result = await apiCall();
//       if (result.response.statusCode == 401) {
//         return await _handle401ErrorPaginated(ref, apiCall);
//       }
//       return result;
//     } on DioException catch (e) {
//       if (e.response?.statusCode == 401) {
//         return await _handle401ErrorPaginated(ref, apiCall);
//       }
//       rethrow;
//     }
//   }

//   static FutureApiResponse<T> _handle401Error<T>(
//     WidgetRef ref,
//     FutureApiResponse<T> Function() apiCall,
//   ) async {
//     await ref.read(accessTokenProvider.notifier).newToken();
//     return await apiCall();
//   }

//   static FutureDefaultResponse<T> _handle401ErrorDefault<T>(
//     WidgetRef ref,
//     FutureDefaultResponse<T> Function() apiCall,
//   ) async {
//     await ref.read(accessTokenProvider.notifier).newToken();
//     return await apiCall();
//   }

//   static FuturePaginatedResponse<T> _handle401ErrorPaginated<T>(
//     WidgetRef ref,
//     FuturePaginatedResponse<T> Function() apiCall,
//   ) async {
//     await ref.read(accessTokenProvider.notifier).newToken();
//     return await apiCall();
//   }
// }
