import 'package:firebase_auth/firebase_auth.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseService {
  final SupabaseClient _client = Supabase.instance.client;

  // Get all data from any table
  Future<List<Map<String, dynamic>>> getAll({
    required String table,
  }) async {
    final response = await _client.from(table).select('*');
    return response;
  }

  Future<List<Map<String, dynamic>>> getNewestProducts({
    required String table,
  }) async {
    final response = await _client
        .from(table)
        .select('*')
        .order('created_at', ascending: false)
        .limit(6);

    return response;
  }

  Future<List<Map<String, dynamic>>> getAllWithQuery({
    required String table,
    required String columnName,
    required String columnValue,
  }) async {
    final response =
        await _client.from(table).select('*').eq(columnName, columnValue);
    return response;
  }

  Future<List<Map<String, dynamic>>> getAllFiltered({
    required String tableName,
    required String columnName,
    required String categoryName,
    required bool ascending,
  }) async {
    final response = await _client
        .from(tableName)
        .select('*')
        .eq('product_category', categoryName)
        .order(columnName, ascending: ascending);
    return response;
  }

  Future<List<Map<String, dynamic>>> searchByName({
    required String table,
    required String searchKey,
  }) async {
    final response = await _client
        .from(table)
        .select('*')
        .ilike('name', '%$searchKey%'); // ilike = insensitive LIKE
    return response;
  }

  Future<dynamic> insert(
      {required String table, required Map<String, dynamic> value}) async {
    final response = await _client.from(table).insert(value);
    return response;
  }

  Future<List<Map<String, dynamic>>> fetchUserWishlist({
    required String table,
  }) async {
    final email = FirebaseAuth.instance.currentUser!.email!;
    final userData = await getUserData(email: email);

    if (userData.isEmpty) {
      throw Exception('User not found');
    }

    final userId = userData[0]['id'];
    final response = await _client
        .from(table)
        .select(
            'products(id, product_category, name, description, price, image_url, status)')
        .eq('user_id', userId);
    print(response);

    return response;
  }

  // Insert data into any table
  Future insertToWhishlist({
    required String table,
    required Map<String, dynamic> values,
  }) async {
    // First, check if product is already in the wishlist
    final existing = await _client
        .from(table)
        .select()
        .eq('user_id', values['user_id'])
        .eq('product_id', values['product_id'])
        .maybeSingle();

    if (existing != null) {
      throw Exception('Product is already in wishlist');
    }

    // If not found, insert
    final response = await _client.from(table).insert(values);
    return response;
  }

  Future<bool> isProductInWishlist({
    required String table,
    required String userId,
    required String productId,
  }) async {
    final result = await _client
        .from(table)
        .select()
        .eq('user_id', userId)
        .eq('product_id', productId)
        .maybeSingle();
    return result != null;
  }

  Future<void> deleteFromWishlist({
    required String table,
    required String userId,
    required String productId,
  }) async {
    await _client
        .from(table)
        .delete()
        .eq('user_id', userId)
        .eq('product_id', productId);
  }

  // Update data in any table
  Future<List<Map<String, dynamic>>> update({
    required String table,
    required Map<String, dynamic> values,
    required String matchColumn,
    required dynamic matchValue,
  }) async {
    final response = await _client
        .from(table)
        .update(values)
        .eq(matchColumn, matchValue)
        .select();
    return response;
  }

  // Delete data from any table
  Future<void> deleteAllCart({
    required String tableName,
    required String userId,
  }) async {
    final response = await _client.from(tableName).delete().match({
      'user_id': userId,
    });
  }

  Future<void> deleteSingleCartItem({
    required String tableName,
    required String userId,
    required String cartItemId,
  }) async {
    await _client
        .from(tableName)
        .delete()
        .eq('user_id', userId)
        .eq('id', cartItemId);
  }

  Future<dynamic> getUserData({required String email}) async {
    var response = await _client.from('users').select('*').eq('email', email);
    return response;
  }

  Future<void> delete({required String tableName, required String id}) async {
    await Supabase.instance.client.from(tableName).delete().eq('id', id);
  }

  Future<String> insertOrder({
    required String userId,
    required String addressId,
    required int total,
  }) async {
    final response = await _client
        .from('orders')
        .insert({
          'user_id': userId,
          'address_id': addressId,
          'total': total,
        })
        .select()
        .single();
    return response['id'] as String;
  }

  Future<void> insertOrderItem(
      {required String orderId,
      required String productId,
      required int quantity,
      required int unitPrice}) async {
    await _client.from('order_items').insert({
      'order_id': orderId,
      'product_id': productId,
      'quantity': quantity,
      'unit_price': unitPrice
    });
  }

  Future<List<Map<String, dynamic>>> getOrdersWithItemsAndProducts({
    required String userId,
  }) async {
    final response = await _client.from('orders').select('''
        *,
        order_items (
          *,
          products (
            id, name, price, image_url, description, product_category, status
          )
        )
      ''').eq('user_id', userId).order('created_at', ascending: false);

    return response;
  }
}
