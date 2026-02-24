# hospital-encounters-analysis
Healthcare analytics case study using MySQL and Power BI to analyze hospital encounters, costs, and patient behavior.

# 🏥 Hospital Analytics  
### Trends, Costs, and Patient Behavior Insights

# Executive Summary

## 📊 Dashboards

### Encounter Overview
![Encounter Overview](images/encounter-overview.png)

### Cost & Coverage Insights
![Cost & Coverage](images/cost-coverage-insights.png)

### Patient Behavior Insights
![Patient Behavior](images/patient-behavior-insights.png)


## 📊 Results & Business Recommendations

### 1. Stabilize Outpatient Capacity to Handle Demand Swings  
**Evidence:** Encounter volumes peaked in 2014 and again in 2021, with ambulatory care consistently dominating total encounters across all years.  
**Impact:** A heavy reliance on ambulatory volume means sudden demand spikes can quickly overwhelm outpatient infrastructure, while sharp declines risk underutilized capacity and planning inefficiencies.  
**Recommendation:** Invest in scalable outpatient infrastructure and flexible staffing models that can expand during peaks and contract during lower-demand periods. Strengthening the system where volume is already concentrated improves resilience without requiring structural care model shifts.

---

### 2. Optimize Same-Day Care Pathways  
**Evidence:** Over 95% of encounters lasted under 24 hours, confirming a predominantly short-stay care model.  
**Impact:** Without optimized fast-track workflows, short-stay patients can still create bottlenecks by occupying beds and staff time longer than necessary, reducing throughput and increasing per-encounter costs.  
**Recommendation:** Implement streamlined same-day care pathways, including fast-track triage and discharge optimization. Even marginal efficiency gains across high-volume short-stay encounters can significantly improve capacity, patient flow, and operational cost control.

---

### 3. Address Coverage Gaps at Intake  
**Evidence:** Approximately 49% of encounters had zero payer coverage, representing a substantial uncompensated care burden.  
**Impact:** High volumes of uncovered encounters directly pressure hospital margins and limit reinvestment into staffing, equipment, and service expansion. This pattern may indicate gaps in eligibility screening or patient financial navigation at intake.  
**Recommendation:** Introduce proactive coverage screening and financial counseling at the point of entry. Connecting patients early to Medicaid eligibility, charity care programs, or structured payment options can meaningfully reduce uncompensated care exposure and improve financial sustainability.

---

### 4. Monitor High-Cost Clinical Pathways  
**Evidence:** Routine preventive and assessment procedures dominated overall volume, but a small subset of ICU admissions and complex interventions drove disproportionately high average costs.  
**Impact:** Without active monitoring, sporadic spikes in high-acuity interventions can distort cost metrics and complicate budgeting and forecasting.  
**Recommendation:** Establish cost-monitoring dashboards for high-acuity pathways and standardize escalation protocols where clinically appropriate. The goal is not to limit care intensity, but to ensure the most resource-intensive interventions are deployed deliberately and consistently.

---

### 5. Reduce Late-Stage Care Among High-Risk Payer Groups  
**Evidence:** Public and uninsured payer groups exhibited the highest average claim costs, suggesting patients may be presenting later with more severe conditions.  
**Impact:** Treating advanced conditions within underinsured populations increases clinical complexity while simultaneously reducing cost recovery, creating a compounding financial and operational strain.  
**Recommendation:** Expand community outreach and early-intervention programs targeting underinsured populations. Encouraging earlier care engagement shifts utilization from high-cost emergency interventions toward lower-cost preventive care, improving outcomes while reducing financial volatility.

---

### 6. Target High-Frequency Utilizers to Reduce Readmissions  
**Evidence:** 771 patients were readmitted within 30 days, with readmissions concentrated among a relatively small subset of patients.  
**Impact:** Recurrent admissions consume disproportionate clinical resources and often signal gaps in post-discharge coordination or chronic disease management.  
**Recommendation:** Implement targeted care management for high-risk patients, including structured discharge planning, follow-up outreach, and care coordination programs. Focusing interventions on the small population driving repeat utilization offers a high-return opportunity to improve outcomes while freeing capacity.

---

### Executive Takeaway  
Overall, the analysis indicates that meaningful operational and financial gains can be achieved through targeted interventions rather than large-scale structural change. By optimizing short-stay workflows, closing coverage gaps, and focusing resources on high-cost and high-utilization segments, healthcare systems can improve both care efficiency and financial resilience.


## 💡 Skills Demonstrated
- SQL aggregation and filtering
+ Window functions (LEAD, DATEDIFF)
* Cohort analysis (30-day readmissions)
- Data transformation for BI
+ Power BI dashboard storytelling
* Healthcare data interpretation

## 📁 Repository Structure

/images
/sql

## 📌 Attribution
This project is based on a guided case study from Maven Analytics.  
SQL implementation, dashboard design, and extended analysis were completed independently.
