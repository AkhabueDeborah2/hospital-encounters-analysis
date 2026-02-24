# hospital-encounters-analysis
Healthcare analytics case study using MySQL and Power BI to analyze hospital encounters, costs, and patient behavior.

## 📌 Executive Summary

Healthcare systems must balance utilization, cost control, and patient outcomes.  
This project analyzes hospital encounter data to uncover patterns in:

- Care delivery mix  
- Financial coverage gaps  
- Cost drivers  
- Patient readmissions  

Using MySQL for data analysis and Power BI for visualization, the project transforms raw encounter data into executive-ready dashboards.

### Key Highlights
- ~49% of encounters had zero payer coverage, indicating potential uncompensated care risk  
- Most encounters were short-stay (<24 hours), reflecting high outpatient and ambulatory volume  
- High-acuity procedures (e.g., ICU-related interventions) disproportionately drive average costs  
- A small subset of patients account for repeated 30-day readmissions  

---

## 🎯 Business Problem

Healthcare administrators need visibility into:

1. How encounter volume changes over time  
2. Which types of care dominate service delivery  
3. Where financial risk exists due to coverage gaps  
4. Which patients contribute to repeat utilization  

Without structured analysis, decision-makers lack clarity on operational and financial performance.

---

## 🛠 Methodology

### 1️⃣ Data Exploration (MySQL)
- Aggregated encounter volume by year  
- Calculated encounter class distribution (%)  
- Computed length-of-stay using `TIMESTAMPDIFF`  
- Identified uncovered encounters  
- Analyzed procedure frequency and cost  
- Used window functions (`LEAD`) for 30-day readmission logic  

### 2️⃣ Data Transformation
- Created BI-ready aggregated views  
- Standardized metric definitions (e.g., 30-day readmission logic)  
- Structured outputs for dashboard consumption  

### 3️⃣ Visualization (Power BI)
- Built 3 themed dashboard pages:
  - Encounter Overview  
  - Cost & Coverage Insights  
  - Patient Behavior Insights  
- Applied consistent color hierarchy and executive design principles  

---

## 📊 Dashboards

### 🔹 Encounter Overview
![Encounter Overview](images/encounter-overview.png)

**Insights**
- Encounter volume peaked in 2014 and 2021  
- Care delivery mix remained stable over time  
- Only a small proportion of encounters exceeded 24 hours  

---

### 🔹 Cost & Coverage Insights
![Cost & Coverage Insights](images/cost-coverage-insights.png)

**Insights**
- Nearly half of encounters lacked payer coverage  
- Preventive and routine procedures dominate volume  
- ICU-related and complex interventions drive cost concentration  

---

### 🔹 Patient Behavior Insights
![Patient Behavior Insights](images/patient-behavior-insights.png)

**Insights**
- Patient volumes show cyclical patterns over time  
- 30-day readmission cohort identified  
- A small subset of patients drive repeated admissions  

---

## 💡 Skills Demonstrated
- SQL aggregation & filtering  
- Window functions (LEAD, DATEDIFF)  
- Cohort analysis (30-day readmissions)  
- Data transformation for BI  
- Metric standardization  
- Dashboard storytelling  
- Healthcare domain interpretation  

---

## 📁 Repository Structure

