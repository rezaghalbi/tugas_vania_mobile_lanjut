import 'package:vania/vania.dart';

class CreateUserTable extends Migration {
  @override
  Future<void> up() async {
    super.up();
    await createTableNotExists('user', () {
      // string('cust_name', length: 50);
      char('cust_password', length: 10);

      // foreign('cust_name', 'customers', 'cust_name');
      foreign('cust_password', 'customers', 'cust_password');
    });
  }

  @override
  Future<void> down() async {
    super.down();
    await dropIfExists('user');
  }
}
