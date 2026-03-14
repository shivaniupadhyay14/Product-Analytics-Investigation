# Order Fulfillment Bottleneck Analysis

Project Overview

This project analyzes operational performance in an e-commerce marketplace using the Brazilian E-commerce Public Dataset by Olist. The goal of the analysis is to identify bottlenecks in the order fulfillment pipeline and understand factors affecting delivery performance and customer experience.

The analysis focuses on delivery timelines, seller performance, regional logistics differences, and customer purchasing behavior.

⸻

Dataset

Dataset Name
Brazilian E-commerce Public Dataset by Olist

Dataset Source
Kaggle

Dataset Link
https://www.kaggle.com/datasets/olistbr/brazilian-ecommerce

The dataset contains real marketplace transaction data including orders, products, sellers, customers, and reviews from 2016 to 2018.

⸻

Business Problem

E-commerce platforms rely on efficient order fulfillment to ensure a good customer experience. Delays in the fulfillment pipeline can lead to poor customer satisfaction and lower repeat purchases.

This project investigates the order lifecycle to answer the following questions:

Where do delays occur in the order fulfillment pipeline?

Which factors contribute to longer delivery times?

How do delivery delays impact customer experience?

What improvements could reduce delivery delays and improve retention?

⸻

Dataset Schema

The dataset follows a relational structure centered around the orders table.

orders → order_items → products
orders → order_items → sellers
orders → customers
orders → order_reviews

This structure allows analysis of order lifecycle events together with product, seller, and customer attributes.

⸻

Analysis Approach

The project was conducted in multiple stages.
	1.	Operational Metrics

Initial analysis was conducted to understand marketplace activity and delivery performance.

Key metrics analyzed

Monthly order volume
Average delivery time
Order status distribution
	2.	Pipeline Bottleneck Analysis

The order lifecycle was analyzed to identify which stage contributes the most to fulfillment delays.

Stages analyzed

Order approval
Seller shipping
Customer delivery
	3.	Root Cause Analysis

Further analysis was conducted to identify drivers of delivery delays.

Factors investigated

Seller shipping performance
Product category delivery times
Regional delivery performance
Customer review scores
	4.	Funnel Analysis

The order lifecycle was analyzed as a funnel to understand how efficiently orders move through the system.

Stages examined

Order placed
Order approved
Order shipped
Order delivered
	5.	Customer Behavior Analysis

Customer purchase patterns were analyzed to understand retention and repeat purchase behavior.

Metrics examined

Average orders per customer
Repeat customer rate
Customer order distribution

⸻

Key Insights

Marketplace Growth

Order volume increased significantly during 2017, indicating strong marketplace growth and increasing platform adoption.

Delivery Performance

The average delivery time across all completed orders is approximately 12 days.

Order Fulfillment Bottleneck

The delivery stage contributes the largest portion of fulfillment time, with transportation taking significantly longer than approval or seller shipping stages.

Regional Logistics Differences

Remote regions such as RR, AP, and AM experience significantly longer delivery times due to geographic distance and logistics infrastructure limitations.

High Operational Reliability

The order lifecycle shows very high completion rates, with more than 98 percent of orders successfully reaching delivery.

Customer Retention Opportunity

Most customers place only one order, indicating potential opportunities to improve repeat purchase behavior.

⸻

Business Recommendations

Improve Logistics Network

Investing in regional distribution centers or additional logistics partners could reduce delivery times, particularly in remote regions.

Monitor Seller Fulfillment Performance

Tracking seller shipping performance and implementing service level agreements could improve consistency in order processing.

Expand Regional Logistics Coverage

Improving logistics infrastructure in remote regions could significantly improve delivery performance.

Improve Customer Retention

Introducing loyalty programs or personalized promotions could increase repeat purchases and customer lifetime value.

Implement Operational Dashboards

Monitoring delivery performance, seller shipping times, and regional logistics performance would allow proactive identification of operational bottlenecks.

⸻

Tools Used

SQL

BigQuery

GitHub

⸻

Project Structure

README.md

sql
Operational analysis queries used in the project

analysis
Insights, experiment design, and data modeling documentation

data
Dataset description and structure information

⸻

Author

Shivani Upadhyay
