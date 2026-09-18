import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:signup_flow/providers/signup_provider.dart';

class ConfirmationStep extends ConsumerWidget {
  const ConfirmationStep({super.key, required this.onBack});

  final VoidCallback onBack;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final data = ref.watch(signupProvider);

    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Text(
            'Confirmation',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 24),
          Text('${data.firstName} ${data.lastName}'),
          Text(data.email),
          const SizedBox(height: 16),
          CheckboxListTile(
            value: data.termsAccepted,
            onChanged: (value) =>
                ref.read(signupProvider.notifier).updateTermsAccepted(value ?? false),
            title: const Text("J'accepte les conditions d'utilisation"),
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              TextButton(onPressed: onBack, child: const Text('Retour')),
              const Spacer(),
              ElevatedButton(
                onPressed: data.termsAccepted
                    ? () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Inscription validée')),
                        );
                      }
                    : null,
                child: const Text('Valider'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
