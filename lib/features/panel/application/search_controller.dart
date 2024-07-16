import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'search_controller.g.dart';

@riverpod
class SearchController extends _$SearchController {
  @override
  String? build() {
    return null;
  }

  // ignore: use_setters_to_change_properties
  void setSearchString(String value) {
    state = value;
  }
}
