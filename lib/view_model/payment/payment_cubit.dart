import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:part_app/model/data_base/data_base.dart';
import 'package:part_app/model/data_model/membership.dart';
import 'package:part_app/model/data_model/order_response.dart';
import 'package:part_app/model/data_model/user_response.dart';
import 'package:part_app/model/service/api.dart';
import 'package:part_app/view_model/cubits.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

part 'payment_state.dart';

class PaymentCubit extends Cubit<PaymentState> {
  final MembershipCubit membershipCubit;
  final _membershipService = MembershipService();

  PaymentCubit({required this.membershipCubit}) : super(PaymentInitial());

  final _razorpay = Razorpay();
  final _apiClient = ApiClient();

  final _auth =
      'Basic cnpwX3Rlc3RfaGxxcHREV2I0VzRad1Q6TnVmR21yOGxCSE1HOVVMYktFMzBlazhV';

  final _rPayKey = 'rzp_test_hlqptDWb4W4ZwT';

  final _timeOut = 300;
  final _currency = 'INR';

  @Deprecated('Method is replaced with /create-membership-order')

  /// method is is used to get the order id from the razorpay
  /// and the same is deprecated
  Future<String?> _getOrderId(
      {required String receiptId, required int amount}) async {
    try {
      var response = await _apiClient.post(
        postPath: '',
        header: {
          'Authorization': _auth,
          Headers.contentTypeHeader: Headers.jsonContentType,
        },
        basePath: 'https://api.razorpay.com/v1/orders',
        data: {
          "amount": amount,
          "currency": _currency,
          "receipt": receiptId,
        },
      );

      var resp = jsonEncode(response);
      debugPrint(resp.runtimeType.toString());
      OrderResponse orderResponse = orderResponseFromJson(resp);

      return orderResponse.id;
    } catch (e) {
      return null;
    }
  }

  Future payment({required Membership membership, required}) async {
    String? userResp = await Database().getUser();

    UserResponse? userResponse = userResponseFromJson(userResp!);
    if (userResponse.user != null) {
      emit(GeneratingOrderId());
      int amount = membership.finalAmount! * 100;

      /// get the order id from

      String? orderId = await _membershipService.getOrderId(
        academyId: userResponse.user?.adminDetail?.academy?.id,
        membershipID: membership.id,
      );

      /// if order id generation failed
      if (orderId == null) {
        emit(GeneratingOrderIdFailed());
        return;
      }

      emit(OrderIdGenerated());

      /// options to pass to the razorpay SDK to init the payment process
      var options = {
        'key': _rPayKey,
        'amount': amount,
        'name': 'partApp.in',
        'order_id': orderId,
        'description': '${membership.duration} months membership plan',
        'timeout': _timeOut,
        'prefill': {
          'contact': userResponse.user?.mobileNo,
          'email': userResponse.user?.adminDetail?.email,
        },
        'theme': {
          'hide_topbar': true,
          'backdrop_color': '#000000',
          'color': '#000000',
        },
        'hidden': {
          'contact': true,
          'email': true,
        },
        'readonly': {
          'contact': true,
          'email': true,
          'name': true,
        }
      };

      /// initiate the payment process
      _razorpay.open(options);

      /// payment process listeners
      _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
      _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
      _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
    }
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    _razorpay.clear();
    emit(PaymentSuccess());
    membershipCubit.addMemberShip(paymentMethod: 'online');
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    _razorpay.clear();

    if (response.message?.toLowerCase() == 'timeout') {
      emit(
        PaymentFailed('Session Timed Out, Please Retry The Payment.'),
      );
      return;
    }
    if (response.code == 2) {
      emit(
        PaymentFailed('Payment failed, please try again.'),
      );
      return;
    }
    emit(
      PaymentFailed(
        response.message ?? 'Payment failed, please try again.',
      ),
    );
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    debugPrint(response.walletName);
  }
}
