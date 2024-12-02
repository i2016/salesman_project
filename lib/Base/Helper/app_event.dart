import 'package:water/Authentication/domain/entities/login_entity.dart';
import 'package:water/Profile/domain/entities/resetPassword_entity.dart';

abstract class AppEvent {
}

class click extends AppEvent{
  click();
}

class AppDrawrEvent extends AppEvent{
  final String drawerType;
  AppDrawrEvent({required this.drawerType});

}

class loginClickEvent extends AppEvent{
  final LoginEntity  loginEntity;
  loginClickEvent({required this.loginEntity});
}

class GetProfileEvent extends AppEvent{}
class ResetPasswordClickEvent extends AppEvent{
  final ResetPasswordEntity  resetPasswordEntity;
  ResetPasswordClickEvent({required this.resetPasswordEntity});
}


// TODAY VISITS
class GetTodayVisitsEvent extends AppEvent{}
class GetVisitsHistoryEvent extends AppEvent{}
class GetVisitDetailsEvent extends AppEvent{
  final String? visit_id;
  GetVisitDetailsEvent({this.visit_id});
}

// Categories
class GetCategoriesEvent extends AppEvent{
  GetCategoriesEvent();
}

// PRODUCTS
class GetProductsEvent extends AppEvent{
  GetProductsEvent();
}

// HISTORY INVOICES
class GetHistoryInvoiceEvent extends AppEvent{
  GetHistoryInvoiceEvent();
}

// Create Order
class CreateOrderEvent extends AppEvent{
  CreateOrderEvent();
}

// Create Returns
class CreateReturnsEvent extends AppEvent{
  CreateReturnsEvent();
}

// Create Collection
class CreateCollectionEvent extends AppEvent{
  CreateCollectionEvent();
}
//Returns
class GetReturnsInvoiceEvent extends AppEvent{
  GetReturnsInvoiceEvent();
}
class GetInvoicesDetailsEvent extends AppEvent{
  GetInvoicesDetailsEvent();
}

// Create Inventory Transfer Request
class InventoryTransferRequestEvent extends AppEvent{
  InventoryTransferRequestEvent();
}

class SalesRemainingLimitEvent extends AppEvent{
  SalesRemainingLimitEvent();
}
class GetTransferRequestsHistoryEvent extends AppEvent{
  GetTransferRequestsHistoryEvent();
}

class GetTransferRequestsDetailsEvent extends AppEvent{
  GetTransferRequestsDetailsEvent();
}
class GetMainInventoryProductsvent extends AppEvent{
  GetMainInventoryProductsvent();
}

// ZEBRA PRINTER
class GetZebraReceiptEvent extends AppEvent{
  GetZebraReceiptEvent();
}