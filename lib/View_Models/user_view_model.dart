// lib/view_models/user_view_model.dart
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../Models/user_model.dart';
import '../Servicese/user_servicese.dart';

// Provider for UserService
final userServiceProvider = Provider<UserService>((ref) => UserService());

// FutureProvider for fetching users
final usersFutureProvider =
    FutureProvider.family<List<User>, int>((ref, page) async {
  final userService = ref.read(userServiceProvider);
  return userService.fetchUsers(page);
});

// StreamProvider for fetching users periodically
final usersStreamProvider =
    StreamProvider.family<List<User>, int>((ref, page) async* {
  final userService = ref.read(userServiceProvider);
  yield* userService.fetchUsersStream(page);
});
