// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'signup_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(Signup)
final signupProvider = SignupProvider._();

final class SignupProvider extends $NotifierProvider<Signup, SignupData> {
  SignupProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'signupProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$signupHash();

  @$internal
  @override
  Signup create() => Signup();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(SignupData value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<SignupData>(value),
    );
  }
}

String _$signupHash() => r'990d952dc4a65464f05ac7ef3c86dfdd35b88da2';

abstract class _$Signup extends $Notifier<SignupData> {
  SignupData build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<SignupData, SignupData>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<SignupData, SignupData>,
              SignupData,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}
