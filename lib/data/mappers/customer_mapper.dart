
import '../../domain/models/customer.dart';
import '../models/api_customer.dart';

extension ApiCustomerMapper on ApiCustomer {
  Customer toCustomer() {
    return Customer(
      id: id,
      firstName: firstName,
      lastName: lastName,
      companyName: companyName,
      email: email,
      phone: phone,
      hasAccount: hasAccount,
      metadata: metadata,
    );
  }
}