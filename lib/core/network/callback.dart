import 'package:app/core/models/default_response.dart';
import 'package:app/core/models/paginated_response.dart';
import 'package:retrofit/retrofit.dart';

typedef FutureDefaultResponse<T> = Future<HttpResponse<DefaultResponse<T>>>;
typedef FutureApiResponse<T> = Future<HttpResponse<T>>;

typedef FuturePaginatedResponse<T> = Future<HttpResponse<PaginatedResponse<T>>>;
typedef FromJsonT<T> = T Function(Object?);
