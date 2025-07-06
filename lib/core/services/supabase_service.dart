import 'dart:developer';

import 'package:electronics_shop/features/home/presentation/view%20model/cubit/whishlist_cubit.dart';
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
  Future<List<Map<String, dynamic>>> delete({
    required String table,
    required String matchColumn,
    required dynamic matchValue,
  }) async {
    final response =
        await _client.from(table).delete().eq(matchColumn, matchValue).select();
    return response;
  }

  Future<dynamic> getUserData({required String email}) async {
    var response = await _client.from('users').select('*').eq('email', email);
    return response;
  }
}
