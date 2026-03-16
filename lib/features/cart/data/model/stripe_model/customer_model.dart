import 'package:equatable/equatable.dart';

class CustomerModel extends Equatable {
  final String id;
  final String object;
  final int balance;
  final int created;
  final bool delinquent;
  final String invoicePrefix;
  final InvoiceSettingsModel invoiceSettings;
  final bool livemode;
  final Map<String, dynamic> metadata;
  final String name;
  final int nextInvoiceSequence;
  final List preferredLocales;
  final String taxExempt;

  const CustomerModel({
    required this.id,
    required this.object,
    required this.balance,
    required this.created,
    required this.delinquent,
    required this.invoicePrefix,
    required this.invoiceSettings,
    required this.livemode,
    required this.metadata,
    required this.name,
    required this.nextInvoiceSequence,
    required this.preferredLocales,
    required this.taxExempt,
  });

  factory CustomerModel.fromJson(Map<String, dynamic> json) {
    return CustomerModel(
      id: json['id'] as String? ?? '',
      object: json['object'] as String? ?? '',
      balance: json['balance'] as int? ?? 0,
      created: json['created'] as int? ?? 0,
      delinquent: json['delinquent'] as bool? ?? false,
      invoicePrefix: json['invoice_prefix'] as String? ?? '',
      invoiceSettings: InvoiceSettingsModel.fromJson(
        json['invoice_settings'] as Map<String, dynamic>? ?? {},
      ),
      livemode: json['livemode'] as bool? ?? false,
      metadata: json['metadata'] as Map<String, dynamic>? ?? {},
      name: json['name'] as String? ?? '',
      nextInvoiceSequence: json['next_invoice_sequence'] as int? ?? 0,
      preferredLocales: json['preferred_locales'] as List? ?? [],
      taxExempt: json['tax_exempt'] as String? ?? '',
    );
  }

  @override
  List<Object?> get props => [
        id,
        object,
        balance,
        created,
        delinquent,
        invoicePrefix,
        invoiceSettings,
        livemode,
        metadata,
        name,
        nextInvoiceSequence,
        preferredLocales,
        taxExempt,
      ];
}

class InvoiceSettingsModel extends Equatable {
  final String? defaultPaymentMethod;

  const InvoiceSettingsModel({
    required this.defaultPaymentMethod,
  });

  factory InvoiceSettingsModel.fromJson(Map<String, dynamic> json) {
    return InvoiceSettingsModel(
      defaultPaymentMethod: json['default_payment_method'] as String?,
    );
  }

  @override
  List<Object?> get props => [defaultPaymentMethod];
}
