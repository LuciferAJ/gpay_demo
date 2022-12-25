part of 'transfer_homepage_bloc.dart';

@immutable
abstract class TransferHomepageEvent extends Equatable {
  const TransferHomepageEvent();
}

class AmountEnteredEvent extends TransferHomepageEvent {
  final String? amount;
  final BuildContext? context;
  const AmountEnteredEvent(this.amount, this.context);

  @override
  List<Object?> get props => [amount, context];
}

class AmountResetEvent extends TransferHomepageEvent {
  @override
  List<Object?> get props => [];
}
