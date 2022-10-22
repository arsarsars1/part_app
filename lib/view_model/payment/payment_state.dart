part of 'payment_cubit.dart';

@immutable
abstract class PaymentState {}

class PaymentInitial extends PaymentState {}

class GeneratingOrderId extends PaymentState {}

class GeneratingOrderIdFailed extends PaymentState {}

class OrderIdGenerated extends PaymentState {}

class PaymentSuccess extends PaymentState {}

class PaymentFailed extends PaymentState {
  final String message;

  PaymentFailed(this.message);
}
