// Inside controllers/password_controller.dart
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class PasswordController extends GetxController {
  // Other methods...

  Future<void> changePassword(
      String currentPassword, String newPassword) async {
    try {
      User? user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        AuthCredential credential = EmailAuthProvider.credential(
          email: user.email!,
          password: currentPassword,
        );

        await user.reauthenticateWithCredential(credential);
        await user.updatePassword(newPassword);

        Get.snackbar('Success', 'Password changed successfully');
      } else {
        Get.snackbar('Error', 'No user is currently signed in');
      }
    } catch (e) {
      Get.snackbar('Error', 'Failed to change password: $e');
    }
  }
}
