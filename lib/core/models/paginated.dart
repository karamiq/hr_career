import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class Paginated<T extends dynamic> {
  final List<T> data;

  final int total;

  const Paginated({required this.data, required this.total});
}

const int defaultLimitSize = 25;
const int firstPage = 1;

extension PaginatedExtension on PagingController {
  // skip limit
  void addItems<T>(Paginated<T> data, int pageKey, [int limitSize = defaultLimitSize]) {
    final isLastPage = (itemList ?? []).length + limitSize >= data.total;
    if (isLastPage) {
      appendLastPage(data.data);
    } else {
      final nextPageKey = pageKey + 1;
      appendPage(data.data, nextPageKey);
    }
  }
}

extension PaginatedResultState<T> on AsyncValue<Paginated<T>> {
  void handleState(PagingController<int, T> controller, int page) {
    whenOrNull(
      data: (data) => controller.addItems(data, page),
      error: (error, state) => controller.error = error,
    );
  }
}
