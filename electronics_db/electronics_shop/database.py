from sqlalchemy import create_engine
from sqlalchemy.orm import declarative_base,sessionmaker
from sqlalchemy.exc import SQLAlchemyError
Base = declarative_base()
DATABASE_URL = "postgresql://postgres:renuka@localhost:5432/postgres"


try:
        engine = create_engine(DATABASE_URL, echo=True)
       
    
except SQLAlchemyError as e:
        print(f"Database connection error: {e}")
        raise

def get_session(engine):
    
    try:
       
        Session = sessionmaker(bind=engine)
        session = Session()
        return session
    except SQLAlchemyError as e:
        print(f"Database connection error: {e}")
        raise

