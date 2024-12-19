import 'package:vania/vania.dart';
// import 'package:tugas_vania/app/http/controllers/home_controller.dart';
// import 'package:tugas_vania/app/http/middleware/authenticate.dart';
// import 'package:tugas_vania/app/http/middleware/home_middleware.dart';
// import 'package:tugas_vania/app/http/middleware/error_response_middleware.dart';
import 'package:tugas_vania/app/http/controllers/customers_controller.dart';

// var customersController = CustomersController();

class ApiRoute implements Route {
  @override
  void register() {
    /// Base RoutePrefix
    Router.basePrefix('api');
    
    Router.get('/index', CustomersController.show);
  }
}
