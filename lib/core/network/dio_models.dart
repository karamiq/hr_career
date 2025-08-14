/// Unified export file for all Dio models and request handlers
/// This file provides a single import point for all Dio-related functionality
library;

// Base configuration
export 'dio_models/base_dio_config.dart';

// Dio modules
export 'dio_models/dio_module.dart';
export 'dio_models/auth_dio_module.dart';

// Request handlers
//export 'request_handler.dart';

// Interceptors
export '/core/network/interceptors/access_token_interceptor.dart';
export '/core/network/interceptors/refresh_token_interceptor.dart';
export '/core/network/interceptors/error_interceptor.dart';
export '/core/network/interceptors/response_interceptor.dart';

// Re-export common types for convenience
export 'package:app/common_lib.dart';
export 'package:app/core/models/default_response.dart';
export 'package:app/core/models/paginated_response.dart';

// callbacks
export 'callback.dart';
