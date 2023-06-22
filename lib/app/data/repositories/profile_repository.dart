import 'package:dozenpos/app/data/providers/profile_provider.dart';
import 'package:get/get.dart';

class ProfileRepository {
  final _profileProvider = Get.find<ProfileProvider>();

  Future<bool?> profile(int id, String password, String newPassword) async => await _profileProvider.profile(id, password, newPassword);
}
