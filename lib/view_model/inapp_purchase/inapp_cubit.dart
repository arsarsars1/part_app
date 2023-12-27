import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:in_app_purchase/in_app_purchase.dart';
import 'package:part_app/view_model/membership/membership_cubit.dart';

import '../../model/data_model/purchasable_product.dart';
import 'inapp.dart';

part 'inapp_state.dart';

class InappCubit extends Cubit<InappState> {
  InappCubit(this.membershipCubit) : super(InappLoading());

  late StreamSubscription<List<PurchaseDetails>> _subscription;
  MembershipCubit membershipCubit;
  List<PurchasableProduct> products = [];
  final iapConnection = IAPConnection.instance;
  PurchasableProduct? _selecedProduct;
  PurchasableProduct? get selectedProduct => _selecedProduct;

  Future addMemberShip({
    String? paymentCode,
    String? paymentMethod = 'offline',
    String? orderId,
    String? paymentId,
  }) async {
    // var userStr = await Database().getUser();
    // emit(CreatingMembership());
    // if (userStr != null) {
    //   try {
    //     var userResp = userResponseFromJson(userStr);
    //     Common value = await _membershipService.addMembership(
    //       academyId: userResp.user?.adminDetail?.academy?.id,
    //       membershipID: _selectedMembership?.id,
    //       paymentMethod: paymentMethod,
    //       salesManOtp: paymentCode,
    //       orderId: orderId,
    //       paymentId: paymentId,
    //     );

    //     if (value.status == 1) {
    //       await authCubit.getUser();
    //       emit(MembershipSuccess());
    //     } else {
    //       emit(MembershipFailed(value.message));
    //     }
    //   } catch (e) {
    //     debugPrint(e.toString());
    //     emit(MembershipFailed(e.toString()));
    //   }
    // } else {
    //   emit(MembershipFailed('Failed to process the request!'));
    // }
  }

  set selectedProduct(PurchasableProduct? product) {
    _selecedProduct = product;

    emit(InappListed(products));
  }

  void istenToPurchases() {
    final purchaseUpdated = iapConnection.purchaseStream;
    _subscription = purchaseUpdated.listen(
      _onPurchaseUpdate,
      onDone: _updateStreamOnDone,
      onError: _updateStreamOnError,
    );
    loadPurchases();
  }

  Future<void> loadPurchases() async {
    final available = await iapConnection.isAvailable();
    if (!available) {
      emit(InappNotAvailable());
      return;
    }
    const ids = <String>{
      'partapp_6m_plan',
    };
    final response = await iapConnection.queryProductDetails(ids);
    for (var element in response.notFoundIDs) {
      debugPrint('Purchase $element not found');
    }
    products =
        response.productDetails.map((e) => PurchasableProduct(e)).toList();
    emit(InappListed(products));
  }

  Future<void> buy(PurchasableProduct product) async {
    final purchaseParam = PurchaseParam(productDetails: product.productDetails);
    switch (product.id) {
      case 'partapp_6m_plan':
        await iapConnection.buyConsumable(purchaseParam: purchaseParam);
        break;

      default:
        throw ArgumentError.value(
            product.productDetails, '${product.id} is not a known product');
    }
  }

  Future<void> _onPurchaseUpdate(
      List<PurchaseDetails> purchaseDetailsList) async {
    for (var purchaseDetails in purchaseDetailsList) {
      await _handlePurchase(purchaseDetails);
    }
  }

  Future<void> _handlePurchase(PurchaseDetails purchaseDetails) async {
    if (purchaseDetails.status == PurchaseStatus.purchased) {
      if (purchaseDetails.productID == 'partapp_6m_plan') {
        //handle what to do when payment is done, verify purchase in server or upload purchases to server
        _verifyPurchase(purchaseDetails);
        // if verification is successful update ui to pro plan
      }
    }

    if (purchaseDetails.pendingCompletePurchase) {
      await iapConnection.completePurchase(purchaseDetails);
    }
  }

  Future<bool> _verifyPurchase(PurchaseDetails purchaseDetails) async {
    try {
      membershipCubit.addMemberShip(
        paymentMethod: 'Apple Pay',
        orderId: purchaseDetails.purchaseID,
        paymentId: purchaseDetails.verificationData.serverVerificationData,
      );
      return true;
    } catch (e) {
      return false;
    }

    // final url = Uri.parse('http://$serverIp:8080/verifypurchase');
    // const headers = {
    //   'Content-type': 'application/json',
    //   'Accept': 'application/json',
    // };
    // final response = await http.post(
    //   url,
    //   body: jsonEncode({
    //     'source': purchaseDetails.verificationData.source,
    //     'productId': purchaseDetails.productID,
    //     'verificationData':
    //         purchaseDetails.verificationData.serverVerificationData,
    //     'userId': uid,
    //   }),
    //   headers: headers,
    // );
    // if (response.statusCode == 200) {
    //   print('Successfully verified purchase');
    //   return true;
    // } else {
    //   print('failed request: ${response.statusCode} - ${response.body}');
    // return false;
    // }
  }

  void _updateStreamOnDone() {
    _subscription.cancel();
  }

  void _updateStreamOnError(dynamic error) {
    //Handle error here
  }

  void dispose() {
    _subscription.cancel();
  }
}
