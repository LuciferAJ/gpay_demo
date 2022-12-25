part of 'transfer_homepage_bloc.dart';

@immutable
abstract class TransferHomepageState extends Equatable {
  final VoidCallback? onPressed;
  const TransferHomepageState({required this.onPressed});
}

class TransferHomepagePrimaryButtonState extends TransferHomepageState {
  const TransferHomepagePrimaryButtonState({required super.onPressed});

  @override
  List<Object?> get props => [onPressed];
}
