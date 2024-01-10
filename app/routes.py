
from flask import Blueprint, render_template, request
from .weather import get_weather_data

bp = Blueprint('main', __name__)


@bp.route('/')
def index():
    return render_template('weather.html')


@bp.route('/weather', methods=['POST'])
def weather():
    city_name = request.form['city_name']
    weather_data = get_weather_data(city_name)
    return render_template('weather.html', weather_data=weather_data)
