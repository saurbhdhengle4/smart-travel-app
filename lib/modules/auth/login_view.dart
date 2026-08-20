import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'auth_controller.dart';

class LoginView extends GetView<AuthController> {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    final email = TextEditingController();
    final password = TextEditingController();

    return Scaffold(
      appBar: AppBar(title: const Text('Sign In')),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(controller: email, decoration: const InputDecoration(labelText: 'Email')),
            const SizedBox(height: 12),
            TextField(controller: password, obscureText: true, decoration: const InputDecoration(labelText: 'Password')),
            const SizedBox(height: 20),
            Obx(() => controller.isLoading.value
                ? const CircularProgressIndicator()
                : Column(children: [
                    ElevatedButton(
                      onPressed: () => controller.loginWithEmail(email.text, password.text),
                      child: const Text('Login'),
                    ),
                    TextButton(
                      onPressed: () => controller.registerWithEmail(email.text, password.text),
                      child: const Text('Create an account'),
                    ),
                    OutlinedButton.icon(
                      onPressed: controller.loginWithGoogle,
                      icon: const Icon(Icons.g_mobiledata),
                      label: const Text('Continue with Google'),
                    ),
                  ])),
            Obx(() => controller.errorMessage.value != null
                ? Text(controller.errorMessage.value!, style: const TextStyle(color: Colors.red))
                : const SizedBox.shrink()),
          ],
        ),
      ),
    );
  }
}