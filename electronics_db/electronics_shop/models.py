from sqlalchemy import Column, Integer, String, Text, Date, DECIMAL, ForeignKey, TIMESTAMP, CheckConstraint
from sqlalchemy.orm import relationship
from database import Base

class Brand(Base):
    __tablename__ = "brands"

    id = Column(Integer, primary_key=True)
    name = Column(String(100), nullable=False)
    country = Column(String(100))
    founded_year = Column(Integer)
    description = Column(Text)
    created_at = Column(TIMESTAMP)

    products = relationship("Product", back_populates="brand")

class Product(Base):
    __tablename__ = "products"

    id = Column(Integer, primary_key=True)
    name = Column(String(100), nullable=False)
    brand_id = Column(Integer, ForeignKey("brands.id", ondelete="CASCADE"), nullable=False)
    sku = Column(String(100), unique=True)
    release_year = Column(Integer)
    price = Column(DECIMAL(10, 2), nullable=False)
    warranty_months = Column(Integer)
    catagory = Column(String(100))
    stock_quantity = Column(Integer, default=0)
    created_at = Column(TIMESTAMP)

    brand = relationship("Brand", back_populates="products")

class Order(Base):
    __tablename__ = "orders"

    id = Column(Integer, primary_key=True)
    customer_id = Column(Integer, ForeignKey("customers.id", ondelete="CASCADE"), nullable=False)
    order_date = Column(Date)
    total_amount = Column(DECIMAL(10, 2))
    status = Column(String(50), default="Pending")
    shipping_city = Column(String(100))
    created_at = Column(TIMESTAMP)

def get_all_products(session):
    try:
        return session.query(Product).all()
    finally:
        session.close()

def get_products_by_brand(session,brand_name):
   
    try:
        return (
            session.query(Product)
            .join(Product.brand)
            .filter(Brand.name == brand_name)
            .all()
        )
    finally:
        session.close()

def get_customer_orders(session,customer_id):
    
    try:
        return session.query(Order).filter(Order.customer_id == customer_id).all()
    finally:
        session.close()
