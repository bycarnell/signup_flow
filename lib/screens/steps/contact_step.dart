import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:signup_flow/providers/signup_provider.dart';

class ContactStep extends ConsumerStatefulWidget {
  const ContactStep({super.key, required this.onNext, required this.onBack});

  final VoidCallback onNext;
  final VoidCallback onBack;

  @override
  ConsumerState<ContactStep> createState() => _ContactStepState();
}

class _ContactStepState extends ConsumerState<ContactStep> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;

  @override
  void initState() {
    super.initState();
    final data = ref.read(signupProvider);
    _emailController = TextEditingController(text: data.email);
    _passwordController = TextEditingController(text: data.password);
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _submit() {
    if (_formKey.currentState!.validate()) {
      ref.read(signupProvider.notifier).updateContact(
            email: _emailController.text,
            password: _passwordController.text,
          );
      widget.onNext();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Contact',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 24),
            TextFormField(
              controller: _emailController,
              decoration: const InputDecoration(labelText: 'Email'),
              validator: (value) {
                if (value == null || !value.contains('@') || !value.contains('.')) {
                  return 'Email invalide';
                }
                return null;
              },
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: _passwordController,
              obscureText: true,
              decoration: const InputDecoration(labelText: 'Mot de passe'),
              validator: (value) {
                if (value == null || value.length < 6) {
                  return 'Au moins 6 caractères';
                }
                return null;
              },
            ),
            const SizedBox(height: 32),
            Row(
              children: [
                TextButton(onPressed: widget.onBack, child: const Text('Retour')),
                const Spacer(),
                ElevatedButton(onPressed: _submit, child: const Text('Suivant')),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
