# 📱 Dating App Sentiment Analysis (Tinder vs. Bumble vs. Hinge)

An end-to-end data analytics and business intelligence project exploring 10,700+ Google Play Store reviews across the top three online dating platforms: **Tinder**, **Bumble**, and **Hinge**.

This project investigates user churn drivers, cross-platform satisfaction rates, monetization friction, and moderation bottlenecks using **PostgreSQL** for data modeling and **Power BI** for interactive executive reporting.

---

## 📊 Executive Dashboard Preview

### 1. Executive Overview & Rating Trends
![Executive Overview](images/P1-Overview)

### 2. Friction Points & Voice of Customer
![Friction Points & VoC](images/P2-FrictionPoint&VoiceofCustomer)

### 3. Key Takeaways & Strategic Recommendations
![Key Takeaways & Strategy](images/P2-FrictionPoint&VoiceofCustomer)

---

## 🔍 Key Findings

* **Severe Negative Polarization:** Over **72.28%** of total reviews are negative (1–2 stars), with 3-star reviews being virtually nonexistent. Users primarily turn to public app store reviews to vent frustration and report churn.
* **Monetization is the #1 Churn Driver:** Across all platforms, **23.1% to 23.9%** of user feedback explicitly complains about paywalls, subscription pricing (Tinder Gold/Platinum, Bumble Boost), and paid daily likes.
* **Platform-Specific Pain Points:**
  * **Hinge** has the highest proportion of account ban/suspension complaints (**15.1%**).
  * **Bumble** struggles the most with bot and inactive profile complaints (**13.1%**).
* **Review Length Inversely Predicts CSAT:** Short reviews (<15 words) have an average rating of **2.30 – 3.35★**, whereas long, detailed reviews (>45 words) plunge to **~1.28★**, operating primarily as formal bug/ban escalation tickets.

---

## 💡 Strategic Recommendations

| Platform | Core Friction | Actionable Strategy | Target Metric |
| :--- | :--- | :--- | :--- |
| **Tinder** | Aggressive Paywalls | Introduce flexible 24h / weekend micro-passes rather than locking features behind steep recurring subscriptions. | Lower monetization friction mentions < 18% |
| **Bumble** | Bots & Fake Profiles | Enforce mandatory liveness selfie verification before matching and automate the purging of inactive accounts (>30 days). | Reduce bot complaints to < 8% |
| **Hinge** | Sudden Account Bans | Transition from pure automated moderation to a tiered strike system backed by a transparent 48-hour human appeal SLA. | Cut account ban complaints by 40% |

---

## 🛠️ Tech Stack & Workflow

### 1. Database & Engineering (PostgreSQL)
* Cleaned and imported raw review data with structured schemas.
* Built analytical view `vw_dating_reviews_curated` utilizing regular expressions (`~`) to categorize customer complaints into binary flags (`flag_monetization`, `flag_bots_fakes`, `flag_account_bans`, `flag_algorithm_matching`).
* Classified review verbosity into `Brief`, `Medium`, and `Detailed` segments.

### 2. Business Intelligence (Power BI)
* Configured dynamic DAX measures for CSAT %, Net Negative Sentiment %, and Category Shares.
* Implemented company-branded UX palette:
  * **Tinder:** Flame Coral (`#FE3C72`)
  * **Bumble:** Honey Amber (`#FFC629`)
  * **Hinge:** Deep Espresso (`#534645`)
* Designed a 3-tier report flow: Macro KPIs ➔ VoC Diagnostic ➔ Strategic Product Roadmap.

---

##📂 Dataset Citation
Dataset sourced from Kaggle: Dating App Reviews: Tinder, Bumble & Hinge by Samar Talwar.
