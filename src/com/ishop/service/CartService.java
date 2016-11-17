package com.ishop.service;

import com.ishop.exceptions.NullEntityObjectException;
import com.ishop.model.Cart;
import com.ishop.model.CartItem;

/**
 * Cart service interface.
 * 
 * @author Jerry
 *
 */
public interface CartService extends GenericService<Cart, Long> {

	Cart getCart(String username);
	
	/**
	 * Throws an NullEntityObjectException if Cart is null.
	 */
	Cart getNonNullCart(String username) throws NullEntityObjectException;
	
	CartItem getCartItem(String username, Long productId) throws NullEntityObjectException;
	
	void addProduct(String username, Long productId) throws NullEntityObjectException;
	
	void removeProduct(String username, Long productId) throws NullEntityObjectException;
	
	void removeCartItem(String username, Long productId) throws NullEntityObjectException;
	
	void clearCart(String username) throws NullEntityObjectException;
	
	int getProductQuantity(String username, Long productId) throws NullEntityObjectException;
}
