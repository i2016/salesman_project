import 'package:water/Authentication/data/models/login_model.dart';
import 'package:water/Base/network/network-mappers.dart';
import 'package:water/Clients/data/models/invoice_history_model.dart';
import 'package:water/Inventory/data/models/inventory_transfer_request_response_model.dart';
import 'package:water/Inventory/data/models/inventory_trnsfer_requests_model.dart';
import 'package:water/Inventory/data/models/sales_remaining_limit_model.dart';
import 'package:water/Inventory/data/models/transfer_requests_details_model.dart';
import 'package:water/Profile/data/models/profile_model.dart';
import 'package:water/Profile/data/models/resetPassword_model.dart';
import 'package:water/Returns/data/models/create_returns_model.dart';
import 'package:water/Returns/data/models/returns_invoice_model.dart' as returns_invoice_model;
import 'package:water/Returns/data/models/invoices_details_model.dart' as invoices_details_model;
import 'package:water/Visits/data/models/category_model.dart';
import 'package:water/Visits/data/models/create_collection/create_collection_response_model.dart';
import 'package:water/Visits/data/models/create_order/create_order_response_model.dart';
import 'package:water/Visits/data/models/product_model.dart';
import 'package:water/Visits/data/models/today_visits_details_model.dart';
import 'package:water/Visits/data/models/visits_history_model.dart';
import 'package:water/Visits/data/models/visits_model.dart';
import 'package:water/zebra/data/models/receipt_model.dart';

abstract class AppState {
  get model =>null;
}
class Start extends AppState{
}

class Loading extends AppState{
  Loading();
}
class ErrorLoading extends AppState{
  String? message;
  ErrorLoading({this.message});
  @override
  String toString() {
    return message!;
  }

}

class LoginDone extends AppState{
  LoginModel? model;
  LoginDone({this.model});

  @override
  String toString() {
    return model!.toString();
  }

}

class LoginErrorLoading extends AppState{
  String? message;
  LoginErrorLoading({this.message});
  @override
  String toString() {
    return message!;
    // TODO: implement toString
  }

}


class GetProfileDone extends AppState{
  final ProfileModel? profileModel;
  GetProfileDone({this.profileModel});
}

class GetProfileErrorLoading extends AppState{
  final String? message;
  GetProfileErrorLoading({this.message});
}

class RestPasswordDone extends AppState{
  ResetPasswordModel? model;
  RestPasswordDone({this.model});

  @override
  String toString() {
    return model!.toString();
  }

}

class RestPasswordErrorLoading extends AppState{
  String? message;
  RestPasswordErrorLoading({this.message});
  @override
  String toString() {
    return message!;
    // TODO: implement toString
  }

}

class AppDrawerDoneState extends AppState{
  final String drawerType ;
  AppDrawerDoneState({required this.drawerType});
}


//TODAY VISITS
class GeTodayVisitsDone extends AppState{
  final  List<Visit>? visits;
  GeTodayVisitsDone({this.visits});
}

class GetTodayVisitsErrorLoading extends AppState{
  final String? message;
  GetTodayVisitsErrorLoading({this.message});
}

// VISITS HISTORY
class GetVisitsHistoryDone extends AppState{
  final  List<VisitHistory>? visitsHistory;
  GetVisitsHistoryDone({this.visitsHistory});
}

class GetVisitsHistoryErrorLoading extends AppState{
  final String? message;
  GetVisitsHistoryErrorLoading({this.message});
}

//TODAY VISITS Details
class GeTodayVisitDetailsDone extends AppState{
  final   List<VisitDetails>? visitDetails;
  GeTodayVisitDetailsDone({this.visitDetails});
}

class GetTodayVisitDetailsErrorLoading extends AppState{
  final String? message;
  GetTodayVisitDetailsErrorLoading({this.message});
}

// Categories
class GetCategoriesDone extends AppState{
  final  List<CategoryData>? categories;
  GetCategoriesDone({this.categories});
}

class GetCategoriesErrorLoading extends AppState{
  final String? message;
  GetCategoriesErrorLoading({this.message});
}


//PRODUCTS
class GetProductsDone extends AppState{
  final  List<Product>? products;
  GetProductsDone({this.products});
}

class GetProductsErrorLoading extends AppState{
  final String? message;
  GetProductsErrorLoading({this.message});
}

//HISTORY INVOICES
class GetHistoryInvoiceDone extends AppState{
  final  InvoiceResult? invoiceResult;
  GetHistoryInvoiceDone({this.invoiceResult});
}

class GetHistoryInvoiceErrorLoading extends AppState{
  final String? message;
  GetHistoryInvoiceErrorLoading({this.message});
}


//CLIENTS
class GetAllClientsDone extends AppState{
  final  Mappable? model;
  GetAllClientsDone({this.model});
}

class GetAllClientsErrorLoading extends AppState{
  final String? message;
  GetAllClientsErrorLoading({this.message});
}



//Returns
class GetReturnsInvoiceDone extends AppState{
  final  returns_invoice_model.InvoiceResult? invoiceResult;
  GetReturnsInvoiceDone({this.invoiceResult});
}

class GetReturnsInvoiceErrorLoading extends AppState{
  final String? message;
  GetReturnsInvoiceErrorLoading({this.message});
}

class GetInvoicesDetailsDone extends AppState{
  final  invoices_details_model.Result? result;
  GetInvoicesDetailsDone({this.result});
}

class GetInvoicesDetailsErrorLoading extends AppState{
  final String? message;
  GetInvoicesDetailsErrorLoading({this.message});
}




// CREATE ORDERS
class CreateOrderDone extends AppState{
  final  CreateOrderResponseModel? createOrderResponseModel;
  CreateOrderDone({this.createOrderResponseModel});
}

class CreateOrderErrorLoading extends AppState{
  final String? message;
  CreateOrderErrorLoading({this.message});
}

// CREATE RETURNS
class CreateReturnsDone extends AppState{
  final  CreateReturnsModel? createReturnsModel;
  CreateReturnsDone({this.createReturnsModel});
}

class CreateReturnsErrorLoading extends AppState{
  final String? message;
  CreateReturnsErrorLoading({this.message});
}

// CREATE Collection
class CreateCollectionLoading extends AppState{
  CreateCollectionLoading();
}
class CreateCollectionDone extends AppState{
  final  CreateCollectionResponseModel? createCollectionResponseModel;
  CreateCollectionDone({this.createCollectionResponseModel});
}

class CreateCollectionErrorLoading extends AppState{
  final String? message;
  CreateCollectionErrorLoading({this.message});
}


// CREATE ORDERS
class TransferRequestDone extends AppState{
  final  InventoryTransferRequestResposneModel? inventoryTransferRequestResposneModel;
  TransferRequestDone({this.inventoryTransferRequestResposneModel});
}

class TransferRequestErrorLoading extends AppState{
  final String? message;
  TransferRequestErrorLoading({this.message});
}

class SalesRemainingLimitDone extends AppState{
  final  SalesRemainingLimitModel? salesRemainingLimitModel;
  SalesRemainingLimitDone({this.salesRemainingLimitModel});
}

class SalesRemainingLimitErrorLoading extends AppState{
  final String? message;
  SalesRemainingLimitErrorLoading({this.message});
}

//HISTORY TRANSFER REQUESTS
class GetTransferRequestsHistoryDone extends AppState{
  final   List<TransferRequest>? transferRequests;
  GetTransferRequestsHistoryDone({this.transferRequests});
}

class GetTransferRequestsHistoryErrorLoading extends AppState{
  final String? message;
  GetTransferRequestsHistoryErrorLoading({this.message});
}

// TRANSFER REQUESTS DETAILS
class GetTransferRequestsDetailsDone extends AppState{
  final  TransferRequestsDetails? transferRequestsDetails;
  GetTransferRequestsDetailsDone({this.transferRequestsDetails});
}

class GetTransferRequestsDetailsErrorLoading extends AppState{
  final String? message;
  GetTransferRequestsDetailsErrorLoading({this.message});
}

// MAIN INVENTORY PRODUCTS
class GetMainInventoryProductsDone extends AppState{
  List<Product>? products;
  GetMainInventoryProductsDone({this.products});
}

class GetMainInventoryProductsErrorLoading extends AppState{
  final String? message;
  GetMainInventoryProductsErrorLoading({this.message});
}


/*
//ZEBRA RECEIPT
class GetZebraReceiptDone extends AppState{
  final  RecieptModel? recieptModel;
  GetZebraReceiptDone({this.recieptModel});
}

class GetZebraReceiptErrorLoading extends AppState{
  final String? message;
  GetZebraReceiptErrorLoading({this.message});
}*/
