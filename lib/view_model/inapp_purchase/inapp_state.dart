part of 'inapp_cubit.dart';

@immutable
abstract class InappState {}

class InappLoading extends InappState {}

class InappListed extends InappState {
  final List<PurchasableProduct> products;
  InappListed(this.products);
}

class InappNotAvailable extends InappState {}



