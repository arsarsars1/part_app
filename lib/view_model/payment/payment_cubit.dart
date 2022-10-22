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

  PaymentCubit({required this.membershipCubit}) : super(PaymentInitial());

  final _razorpay = Razorpay();
  final _apiClient = ApiClient();

  final _membershipService = MembershipService();

  Membership? _membership;

  final _auth =
      'Basic cnpwX3Rlc3RfRVdQUjZ4VmhYRlc4a1A6eW5qNjhRQ3RORVZES3VSVHNLbllwNzNh';

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
          "amount": 50000,
          "currency": "INR",
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
    _membership = membership;

    String? userResp = await Database().getUser();

    UserResponse? userResponse = userResponseFromJson(userResp!);
    if (userResponse.user != null) {
      /// builds the receipt id with user & membership data
      String receiptId =
          'receipt_${userResponse.user?.adminDetail?.id}_${membership.id}';

      emit(GeneratingOrderId());

      /// get the order id from the razorpay order id api
      String? orderId = await _getOrderId(
        receiptId: receiptId,
        amount: membership.amount ?? 0,
      );

      if (orderId == null) {
        emit(GeneratingOrderIdFailed());
        return;
      }

      emit(OrderIdGenerated());

      /// options to pass to the razorpay SDK to init the payment process
      var options = {
        'key': 'rzp_test_EWPR6xVhXFW8kP',
        'amount': membership.amount,
        'name': 'partApp.in',
        'order_id': orderId,
        'description': '${membership.duration} months membership plan',
        'timeout': 60,
        'prefill': {
          'contact': userResponse.user?.mobileNo,
          'email': userResponse.user?.adminDetail?.email,
        },
        'theme': {
          'hide_topbar': false,
          'backdrop_color': '#000000',
          'color': '#000000',
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
