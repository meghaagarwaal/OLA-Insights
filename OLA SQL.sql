Select * from ola;

#1 retrive all successful bookings
Create view Successful_Bookings as
select * from ola where Booking_Status="success";
select * from Successful_Bookings;

#2 Find the average ride distance for each vehicle type
create view ride_distance_for_each_vehicle as
select vehicle_type,AVG(Ride_Distance) as avg_distance from ola Group by vehicle_type;
select * from ride_distance_for_each_vehicle;

#3 Get the total number of cancelled rides by customer
CREATE view cancelled_rides_by_customer as
Select COUNT(*) from ola where booking_status="Cancelled by customer"; 
select * from cancelled_rides_by_customer;
 
#4 List the top 5 customer who booked the highest no.of rides
create view top_5_customer as
SELECT customer_ID, COUNT(booking_id) AS total_rides FROM ola GROUP BY customer_ID ORDER BY total_rides DESC LIMIT 5;
select * from top_5_customer;
 
 
 
#5 Get the number of rides cancelled by drivers due to  personal and car related issue
Create view rides_cancelled_by_drivers_P_C_issue as
Select count(*) from ola where Cancelled_Rides_by_Customer="personal & car related issue";
select * from rides_cancelled_by_drivers_P_C_issue;



#6Find the maixmum and minimum driver rating for prome sedan bookings
CREATE VIEW max_and_min_driver_ratings as
select max(Driver_Ratings) as max_rating,MIN(Driver_Ratings) as min_rating from ola where Vehicle_Type="Prime Sedan";
Select * from max_and_min_driver_ratings;


#7Retrive all rides where payment was using UPI
create view UPI_payment as
select * from ola where Payment_Method="UPI";
select * from UPI_payment;


#8 Find the average customer raing per vehicle type
create view customer_rating_per_vehicl_type as
select Vehicle_Type,AVG(Customer_Rating) as avg_Customer_Rating from ola group by Vehicle_Type;
select * from customer_rating_per_vehicl_type;
 
 
 #9 Calculate the total booking value of rides completed successfully
 create view  total_successful_ride_value as
 select sum(Booking_Value) as total_successful_ride_value from ola where Booking_Status="Success";
 select * from total_successful_ride_value;
 
 
 #10 List all incomplete rides along with the reason
 create view Incomplete_Rides_Reason as
 select Booking_ID,Incomplete_Rides_Reason from ola where Incomplete_Rides="Yes";
 select * from Incomplete_Rides_Reason;