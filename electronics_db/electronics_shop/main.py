from database import engine, get_session
from models import get_all_products, get_products_by_brand, get_customer_orders

def main():
    print("=== Electronics Shop ORM Demo ===")
    session = get_session(engine)
    # Get all products
    print("\nAll Products:")
    for product in get_all_products(session):
        print(f"{product.id} - {product.name} ({product.price} USD)")

    # Get products by brand
    print("\nProducts by Brand (SmartLamp X200):")
    for product in get_products_by_brand(session, "SmartLamp X200"):
        print(f"{product.id} - {product.name} ({product.price} USD)")

    # Get customer orders
    print("\nOrders for Customer ID 1:")
    for order in get_customer_orders(session, 1):
        print(f"Order {order.id} - {order.status} - {order.total_amount} USD")

if __name__ == "__main__":
    main()
