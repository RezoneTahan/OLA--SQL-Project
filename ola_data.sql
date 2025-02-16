create database ola;
use ola;
drop table bookings;
show tables;
describe bookings;
alter table bookings 
rename column ï»¿Date to Date;
#1.Retrieve all successful bookings:
select * from bookings
where Booking_Status = 'Success';

#2.Find the average ride distance for each vehicle type:
select avg(Ride_Distance) as Avg_Ride_Distance, Vehicle_Type from bookings
group by Vehicle_Type;

#3. Get the total number of cancelled rides by customers:
select distinct Booking_Status from bookings;
select count(*) from bookings where Booking_Status= 'Canceled by Customer';

#4. List the top 5 customers who booked the highest number of rides:
create view  top_5_highest_number_of_ride as 
select count(Booking_ID) as total_booking, Customer_ID
from bookings 
group by Customer_ID
order by total_booking desc;
select * from top_5_highest_number_of_ride;

#5. Get the number of rides cancelled by drivers due to personal and car-related issues:
select count(Canceled_Rides_by_Driver) as num_of_Canceled_Rides_by_Driver from bookings 
where Canceled_Rides_by_Driver = 'Personal & Car related issue';

#6. Find the maximum and minimum driver ratings for Prime Sedan bookings:
select max(Driver_Ratings) as Max_Driver_Rating, min(Driver_Ratings) as Min_Driver_Rating from bookings
where Vehicle_Type='Prime Sedan';
 
#7. Retrieve all rides where payment was made using UPI:
select * from bookings
where Payment_Method = 'UPI';

#8. Find the average customer rating per vehicle type:
select round(avg(Customer_Rating),2) as Avg_Customer_Rating , Vehicle_Type from bookings 
group by Vehicle_Type;

#9.Calculate the total booking value of rides completed successfully:
select count(Booking_Value) as Total_Booking_Value from bookings 
where Booking_Status = 'Success';

#10. List all incomplete rides along with the reason:
select Booking_ID, Incomplete_Rides_Reason  from bookings 
where  Incomplete_Rides= 'Yes';



