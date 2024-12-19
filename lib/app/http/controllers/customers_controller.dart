import 'package:vania/vania.dart';
import 'package:tugas_vania/app/models/customers_model.dart';

class CustomersController extends Controller {
  Future<Response> index() async {
    return Response.html('Hello World');
  }

  Future<Response> create(Request request) async {
    request.validate({
      'cust_name': 'required',
      'cust_address': 'required',
      'cust_city': 'required',
      'cust_state': 'required',
      'cust_zip': 'required',
      'cust_country': 'required',
      'cust_telp': 'required',
      'cust_password': 'required',
    }, {
      'cust_name.required': 'harus diisi',
      'cust_address.required': 'harus diisi',
      'cust_city.required': 'harus diisi',
      'cust_state.required': 'harus diisi',
      'cust_zip.required': 'harus diisi',
      'cust_country.required': 'harus diisi',
      'cust_telp.required': 'harus diisi',
      'cust_password.required': 'harus diisi',
    });
    final reqData = request.input();
    reqData['created_at'] = DateTime.now().toIso8601String();

    final existingCust = await CustomersModel()
        .query()
        .where('cust_name', '=', reqData['cust_name'])
        .first();
    if (existingCust != null) {
      return Response.json(
        {
          'message': 'wes ono lek',
        },
        409,
      );
    }
    await CustomersModel().query().insert(reqData);
    return Response.json({
      "message": 'berhasil',
      "data": reqData,
    }, 201);
  }

  Future<Response> show() async {
    final cust = await CustomersModel().query().get();
    if (cust.isEmpty) {
      return Response.json({
        "message": 'daftar customers',
        "data": [],
      }, 404);
    }
    return Response.json({
      "message": 'daftar customers',
      "data": cust,
    }, 200);
  }
}

// Future<Response> store(Request request) async {
//   return Response.json({});
// }

Future<Response> show(int id) async {
  final cust = await CustomersModel().query().get();
  if (cust.isEmpty) {
    return Response.json({
      "message": 'daftar customers',
      "data": [],
    }, 404);
  }
  return Response.json({
    "message": 'daftar customers',
    "data": cust,
  }, 200);
}

// Future<Response> edit(int id) async {
//   return Response.json({});
// }

Future<Response> update(Request request, int id) async {
  request.validate({
    'cust_name': 'required',
    'cust_address': 'required',
    'cust_city': 'required',
    'cust_state': 'required',
    'cust_zip': 'required',
    'cust_country': 'required',
    'cust_telp': 'required',
  }, {
    'cust_name.required': 'harus diisi',
    'cust_address.required': 'harus diisi',
    'cust_city.required': 'harus diisi',
    'cust_state.required': 'harus diisi',
    'cust_zip.required': 'harus diisi',
    'cust_country.required': 'harus diisi',
    'cust_telp.required': 'harus diisi',
  });

  final reqData = request.input();
  await CustomersModel().query().where('cust_id', id.toString()).update({
    'cust_name': reqData['cust_name'],
    'cust_address': reqData['cust_address'],
    'cust_city': reqData['cust_city'],
    'cust_state': reqData['cust_state'],
    'cust_zip': reqData['cust_zip'],
    'cust_country': reqData['cust_country'],
    'cust_telp': reqData['cust_telp'],
  });
  reqData['updated_at'] = DateTime.now().toIso8601String();

  return Response.json({
    "message": "data customer berhasil diupdate",
    "data": reqData,
  }, 200);
}

Future<Response> destroy(int id) async {
  final selectedRow = await CustomersModel()
      .query()
      .where('cust_id', '=', id.toString())
      .first();
  if (selectedRow == null) {
    return Response.json({
      "message": "id tidak ditemukan",
    }, 404);
  }
  await CustomersModel().query().where('cust_id', '=', id.toString()).delete();
  return Response.json({
    "message": "data customer berhasil dihapus",
  }, 200);
}

final CustomersController customersController = CustomersController();
