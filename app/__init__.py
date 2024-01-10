# app/__init__.py

from flask import Flask


def create_app():
    app = Flask(__name__)

    # Configure the app using config.py (not shown here)
    app.config.from_object('config')

    # Import and register blueprints
    from app.routes import bp
    app.register_blueprint(bp)

    return app
