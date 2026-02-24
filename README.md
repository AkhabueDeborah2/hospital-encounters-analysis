# hospital-encounters-analysis
Healthcare analytics case study using MySQL and Power BI to analyze hospital encounters, costs, and patient behavior.


# 🏥 Hospital Analytics  
### Trends, Costs, and Patient Behavior Insights

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

hospital-encounters-analysis/  
│  
├── images/  
│ ├── encounter-overview.png  
│ ├── cost-coverage-insights.png  
│ └── patient-behavior-insights.png  
│
└── sql/  
└── hospital-encounters-analysis.sql  



---

## 📊 Results & Business Recommendations

### 1. Stabilize Outpatient Capacity to Handle Demand Swings
**Evidence:** Encounter volumes peaked in 2014 and again in 2021, with ambulatory care consistently dominating total encounters across all years.  

**Impact:** The hospital is heavily dependent on ambulatory volume. When demand spikes, outpatient capacity takes the hit immediately. When it drops sharply, the system risks underutilized staff and resources.  

**Recommendation:** Invest in flexible staffing models and scalable outpatient infrastructure that can expand during peaks and scale back during quieter periods.

---

### 2. Optimize Same-Day Care Pathways
**Evidence:** Over 95% of encounters lasted under 24 hours.  

**Impact:** Without streamlined workflows, short-stay patients still occupy beds and staff time longer than necessary, creating bottlenecks.  

**Recommendation:** Implement fast-track triage and discharge optimization for short-stay patients to improve throughput and reduce cost per encounter.

---

### 3. Close Coverage Gaps at the Point of Entry
**Evidence:** Approximately 49% of encounters had zero payer coverage.  

**Impact:** Every uncovered encounter is a direct financial loss, putting pressure on operating margins.  

**Recommendation:** Introduce proactive financial screening and counseling at intake to connect patients to Medicaid, charity care, or payment plans.

---

### 4. Monitor High-Cost Clinical Pathways
**Evidence:** ICU and complex interventions drove significantly higher average costs.  

**Impact:** High-acuity cost spikes can distort budgeting and forecasting.  

**Recommendation:** Build cost-monitoring dashboards for high-acuity pathways and standardize escalation protocols where clinically appropriate.

---

### 5. Reach High-Risk Payer Groups Earlier
**Evidence:** Public and uninsured groups showed the highest average claim costs.  

**Impact:** Patients may be presenting later with more severe conditions, increasing both clinical and financial strain.  

**Recommendation:** Expand community outreach and early-intervention programs targeting underinsured populations.

---

### 6. Target High-Frequency Utilizers to Reduce Readmissions
**Evidence:** 771 patients were readmitted within 30 days, concentrated among a small subset.  

**Impact:** Repeated admissions consume disproportionate resources and signal gaps in post-discharge care.  

**Recommendation:** Implement targeted care management programs including follow-ups, discharge planning, and care coordinators.

---

### Executive Takeaway
The data suggests that meaningful operational and financial gains can be achieved through targeted interventions rather than large structural changes. Closing coverage gaps, optimizing short-stay workflows, and focusing on high-cost and high-utilization segments can significantly improve both care efficiency and financial resilience.

---

## 📌 Project Source & Attribution
This project is based on a guided case study from Maven Analytics.  
SQL implementation, dashboard design, and extended analysis were completed independently.

---

## 🚀 Next Steps
- Introduce star schema modeling for enhanced BI scalability  
- Add time-intelligence measures using a date dimension  
- Expand into predictive modeling for readmission risk  
- Conduct deeper segmentation of high-frequency utilizers  

---

## 🧠 Author
**Deborah Akhabue**  
Healthcare Data Analyst  
MySQL | Power BI | Data Storytelling
