// ignore_for_file: unused_local_variable

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:part_app/model/data_base/data_base.dart';
import 'package:part_app/model/data_model/membership.dart';
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

  final _rPayKey = 'rzp_live_fWP8ssHYxlXENr';

  final _timeOut = 300;

  String? _orderId;

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
      _orderId = orderId;

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

  Future<String?> validateUPI({required String upiId}) async {
    try {
      var response = await ApiClient().post(
        postPath: '',
        header: {
          'Authorization':
              'Basic cnpwX3Rlc3RfaGxxcHREV2I0VzRad1Q6TnVmR21yOGxCSE1HOVVMYktFMzBlazhV',
          Headers.contentTypeHeader: Headers.jsonContentType,
        },
        basePath: 'https://api.razorpay.com/v1/payments/validate/vpa',
        data: {"vpa": "gauravkumar@exampleupi"},
      );
    } catch (e) {
      return null;
    }
    return null;
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    _razorpay.clear();
    emit(PaymentSuccess());
    membershipCubit.addMemberShip(
      paymentMethod: 'online',
      orderId: _orderId,
      paymentId: response.paymentId,
    );
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    _razorpay.clear();
    String status = '';
    if (response.message?.toLowerCase() == 'timeout') {
      status = 'timed-out';

      emit(
        PaymentFailed('Session Timed Out, Please Retry The Payment.'),
      );
      return;
    }
    if (response.code == 2) {
      status = 'failed';
      emit(
        PaymentFailed('Payment failed, please try again.'),
      );
      return;
    }

    if (response.code == 0) {
      status = 'cancelled';
    }

    emit(
      PaymentFailed(
        response.message ?? 'Payment failed, please try again.',
      ),
    );

    _membershipService.updateOrderStatus(
      orderId: _orderId,
      status: status,
    );
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    debugPrint(response.walletName);
  }
}
