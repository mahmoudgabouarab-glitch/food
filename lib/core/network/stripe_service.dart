import 'package:dio/dio.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:food/core/network/api_keys.dart';
import 'package:food/core/network/cache_helper.dart';
import 'package:food/core/network/cache_keys.dart';
import 'package:food/features/cart/data/model/stripe_model/customer_model.dart';
import 'package:food/features/cart/data/model/stripe_model/ephemeral_key_model.dart';
import 'package:food/features/cart/data/model/stripe_model/payment_model.dart';

class StripeService {
  final Dio _dio;

  StripeService(this._dio);
  final String baseUrl = "https://api.stripe.com/v1/";

  Future<Map<String, dynamic>> postStripe({
    required String endpoint,
    Object? data,
    Map<String, dynamic>? headers,
  }) async {
    dynamic postData = data;
    if (data is Map<String, dynamic>) {
      bool hasFile = data.values.any((v) => v is MultipartFile);
      if (hasFile) {
        postData = FormData.fromMap(data);
      }
    }
    final response = await _dio.post(
      "$baseUrl$endpoint",
      data: postData,
      options: Options(
        headers: {
          "Accept": "application/json",
          "Authorization": "Bearer ${ApiKeys.secretKey}",
          "Content-Type": "application/x-www-form-urlencoded",
          ...?headers,
        },
      ),
    );
    return response.data;
  }

  // Create customer
  Future<CustomerModel> createCustomer() async {
    var response = await postStripe(endpoint: "customers");
    final customerModel = CustomerModel.fromJson(response);
    await CacheHelper.saveData(
      key: CacheKeys.customerId,
      value: customerModel.id,
    );
    return customerModel;
  }

  // create ephemeral key
  Future<EphemeralKeyModel> createEphemeralKey({
    required String customerId,
  }) async {
    var response = await postStripe(
      endpoint: "ephemeral_keys",
      data: {"customer": customerId},
      headers: {"Stripe-Version": "2023-10-16"},
    );
    final paymentModel = EphemeralKeyModel.fromJson(response);
    return paymentModel;
  }

  // create payment intent
  Future<PaymentModel> createPaymentIntent({
    required int amount,
    required String currency,
    required String customerId,
  }) async {
    var response = await postStripe(
      endpoint: "payment_intents",
      data: {"amount": amount, "currency": currency, "customer": customerId},
    );
    final paymentModel = PaymentModel.fromJson(response);
    return paymentModel;
  }

  // init payment sheet
  Future<void> initPaymentSheet({
    required String paymentIntentClientSecret,
    required String customerEphemeralKeySecret,
    required String customerId,
  }) async {
    await Stripe.instance.initPaymentSheet(
      paymentSheetParameters: SetupPaymentSheetParameters(
        paymentIntentClientSecret: paymentIntentClientSecret,
        merchantDisplayName: 'Mahmoud Gomaa',
        customerEphemeralKeySecret: customerEphemeralKeySecret,
        customerId: customerId,
      ),
    );
  }

  // display payment sheet
  Future<void> displayPaymentSheet() {
    return Stripe.instance.presentPaymentSheet();
  }

  // make payment
  Future makePayment({required int amount}) async {
    var customerId = await CacheHelper.getData(key: CacheKeys.customerId);
    if (customerId == null) {
      var customerModel = await createCustomer();
      customerId = customerModel.id;
    }

    var ephemeralKey = await createEphemeralKey(customerId: customerId);

    var paymentIntent = await createPaymentIntent(
      amount: amount * 100,
      currency: "USD",
      customerId: customerId,
    );

    await initPaymentSheet(
      paymentIntentClientSecret: paymentIntent.clientSecret,
      customerEphemeralKeySecret: ephemeralKey.secret,
      customerId: customerId,
    );

    await displayPaymentSheet();
  }
}
