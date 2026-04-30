# Ride Demand Zone Classification
Problem Statement

Objective: Build a multiclass machine learning model that predicts ride demand levels in different city zones. The demand level is categorized as Low, Medium, or High. Business Context: Ride-hailing platforms must anticipate demand patterns across city zones to efficiently allocate
drivers, reduce waiting times, manage surge pricing, and optimize ride fulfillment rates. This project simulates a real-world demand forecasting classification system using historical ride patterns, weather conditions, traffic indicators, and zone characteristics.

Data Dictionary

Column Description

record_id Unique record identifier

timestamp Observation timestamp

zone_id Zone identifier

zone_type Type of urban zone

hour_of_day Hour extracted from timestamp (0-23)

day_of_week Day of week where Monday=0

month Month number

is_weekend 1 if Saturday/Sunday else 0

is_holiday 1 if holiday/festival date else 0

peak_hour_flag 1 for commute-heavy hours

weather_condition Observed weather category

temperature_c Temperature in Celsius

rainfall_mm Rainfall in millimeters

humidity_pct Humidity percentage

traffic_level Traffic severity bucket

avg_vehicle_speed_kmph Average vehicle speed in km/h

road_congestion_score Congestion score from 0-100

public_transport_availability Zone public transport accessibility index

event_nearby_flag 1 if nearby event likely to affect demand

event_type Nearby event category or No Event

population_density_index Relative population density index

office_density_index Relative office density index

shopping_density_index Relative shopping density index

tourist_spot_flag 1 if zone is a tourist hotspot

driver_availability Estimated available drivers in zone

previous_hour_ride_count Historical ride count for previous hour

same_hour_last_day_ride_count Historical ride count for same hour yesterday

same_hour_last_week_ride_count Historical ride count for same hour last week

app_open_count Approximate ride-app opens/searches

ride_price_surge_multiplier Estimated surge multiplier
demand_zone Target class: Low/Medium/High
