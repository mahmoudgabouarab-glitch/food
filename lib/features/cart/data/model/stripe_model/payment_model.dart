import 'package:equatable/equatable.dart';

class PaymentModel extends Equatable {
  final String id;
  final String object;
  final int amount;
  final int amountCapturable;
  final AmountDetails amountDetails;
  final int amountReceived;
  final String? application;
  final int? applicationFeeAmount;
  final AutomaticPaymentMethods automaticPaymentMethods;
  final int? canceledAt;
  final String? cancellationReason;
  final String captureMethod;
  final String clientSecret;
  final String confirmationMethod;
  final int created;
  final String currency;
  final String? customer;
  final String? description;
  final String? lastPaymentError;
  final String? latestCharge;
  final bool livemode;
  final Map<String, dynamic> metadata;
  final String? nextAction;
  final String? onBehalfOf;
  final String? paymentMethod;
  final PaymentMethodOptions paymentMethodOptions;
  final List<String> paymentMethodTypes;
  final String? processing;
  final String? receiptEmail;
  final String? review;
  final String? setupFutureUsage;
  final String? shipping;
  final String? source;
  final String? statementDescriptor;
  final String? statementDescriptorSuffix;
  final String status;
  final String? transferData;
  final String? transferGroup;

  const PaymentModel({
    required this.id,
    required this.object,
    required this.amount,
    required this.amountCapturable,
    required this.amountDetails,
    required this.amountReceived,
    this.application,
    this.applicationFeeAmount,
    required this.automaticPaymentMethods,
    this.canceledAt,
    this.cancellationReason,
    required this.captureMethod,
    required this.clientSecret,
    required this.confirmationMethod,
    required this.created,
    required this.currency,
    this.customer,
    this.description,
    this.lastPaymentError,
    this.latestCharge,
    required this.livemode,
    required this.metadata,
    this.nextAction,
    this.onBehalfOf,
    this.paymentMethod,
    required this.paymentMethodOptions,
    required this.paymentMethodTypes,
    this.processing,
    this.receiptEmail,
    this.review,
    this.setupFutureUsage,
    this.shipping,
    this.source,
    this.statementDescriptor,
    this.statementDescriptorSuffix,
    required this.status,
    this.transferData,
    this.transferGroup,
  });

  factory PaymentModel.fromJson(Map<String, dynamic> json) {
    return PaymentModel(
      id: json['id'] as String? ?? '',
      object: json['object'] as String? ?? '',
      amount: json['amount'] as int? ?? 0,
      amountCapturable: json['amount_capturable'] as int? ?? 0,
      amountDetails: AmountDetails.fromJson(
        json['amount_details'] as Map<String, dynamic>? ?? {},
      ),
      amountReceived: json['amount_received'] as int? ?? 0,
      application: json['application'] as String?,
      applicationFeeAmount: json['application_fee_amount'] as int?,
      automaticPaymentMethods: AutomaticPaymentMethods.fromJson(
        json['automatic_payment_methods'] as Map<String, dynamic>? ?? {},
      ),
      canceledAt: json['canceled_at'] as int?,
      cancellationReason: json['cancellation_reason'] as String?,
      captureMethod: json['capture_method'] as String? ?? '',
      clientSecret: json['client_secret'] as String? ?? '',
      confirmationMethod: json['confirmation_method'] as String? ?? '',
      created: json['created'] as int? ?? 0,
      currency: json['currency'] as String? ?? '',
      customer: json['customer'] as String?,
      description: json['description'] as String?,
      lastPaymentError: json['last_payment_error'] as String?,
      latestCharge: json['latest_charge'] as String?,
      livemode: json['livemode'] as bool? ?? false,
      metadata: json['metadata'] as Map<String, dynamic>? ?? {},
      nextAction: json['next_action'] as String?,
      onBehalfOf: json['on_behalf_of'] as String?,
      paymentMethod: json['payment_method'] as String?,
      paymentMethodOptions: PaymentMethodOptions.fromJson(
        json['payment_method_options'] as Map<String, dynamic>? ?? {},
      ),
      paymentMethodTypes: List<String>.from(
        json['payment_method_types'] as List<dynamic>? ?? [],
      ),
      processing: json['processing'] as String?,
      receiptEmail: json['receipt_email'] as String?,
      review: json['review'] as String?,
      setupFutureUsage: json['setup_future_usage'] as String?,
      shipping: json['shipping'] as String?,
      source: json['source'] as String?,
      statementDescriptor: json['statement_descriptor'] as String?,
      statementDescriptorSuffix: json['statement_descriptor_suffix'] as String?,
      status: json['status'] as String? ?? '',
      transferData: json['transfer_data'] as String?,
      transferGroup: json['transfer_group'] as String?,
    );
  }

  @override
  List<Object?> get props => [
    id,
    status,
    amount,
    amountCapturable,
    amountDetails,
    amountReceived,
    application,
    applicationFeeAmount,
    automaticPaymentMethods,
    canceledAt,
    cancellationReason,
    captureMethod,
    clientSecret,
    confirmationMethod,
    created,
    currency,
    customer,
    description,
    lastPaymentError,
    latestCharge,
    livemode,
    metadata,
    nextAction,
    onBehalfOf,
    paymentMethod,
    paymentMethodOptions,
    paymentMethodTypes,
    processing,
    receiptEmail,
    review,
    setupFutureUsage,
    shipping,
    source,
    statementDescriptor,
    statementDescriptorSuffix,
    transferData,
    transferGroup,

  ];
}

class AmountDetails extends Equatable {
  final Map<String, dynamic> tip;

  const AmountDetails({required this.tip});

  factory AmountDetails.fromJson(Map<String, dynamic> json) {
    return AmountDetails(tip: json['tip'] as Map<String, dynamic>? ?? {});
  }

  @override
  List<Object?> get props => [tip];
}

class AutomaticPaymentMethods extends Equatable {
  final bool enabled;

  const AutomaticPaymentMethods({required this.enabled});

  factory AutomaticPaymentMethods.fromJson(Map<String, dynamic> json) {
    return AutomaticPaymentMethods(enabled: json['enabled'] as bool? ?? false);
  }

  @override
  List<Object?> get props => [enabled];
}

class PaymentMethodOptions extends Equatable {
  final CardOptions card;
  final LinkOptions link;

  const PaymentMethodOptions({required this.card, required this.link});

  factory PaymentMethodOptions.fromJson(Map<String, dynamic> json) {
    return PaymentMethodOptions(
      card: CardOptions.fromJson(json['card'] as Map<String, dynamic>? ?? {}),
      link: LinkOptions.fromJson(json['link'] as Map<String, dynamic>? ?? {}),
    );
  }

  @override
  List<Object?> get props => [card, link];
}

class CardOptions extends Equatable {
  final String? requestThreeDSecure;
  final dynamic installments;
  final dynamic mandateOptions;
  final String? network;

  const CardOptions({
    this.installments,
    this.mandateOptions,
    this.network,
    this.requestThreeDSecure,
  });

  factory CardOptions.fromJson(Map<String, dynamic> json) {
    return CardOptions(
      installments: json['installments'],
      mandateOptions: json['mandate_options'],
      network: json['network'] as String?,
      requestThreeDSecure: json['request_three_d_secure'] as String?,
    );
  }

  @override
  List<Object?> get props => [
    installments,
    mandateOptions,
    network,
    requestThreeDSecure,
  ];
}

class LinkOptions extends Equatable {
  final String? persistentToken;

  const LinkOptions({this.persistentToken});

  factory LinkOptions.fromJson(Map<String, dynamic> json) {
    return LinkOptions(persistentToken: json['persistent_token'] as String?);
  }

  @override
  List<Object?> get props => [persistentToken];
}
