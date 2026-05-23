README: Retail Availability, Distribution Loss, and Competitive Substitution Analysis
Project Title
Diagnosing Sales Decline: Distribution Loss, Stockouts, Velocity, and Competitor Substitution

Business Case
A consumer goods company wants to understand why sales declined across retailers, regions, stores, and products. The core business question is:
Are sales declining because shoppers want the product less, or because the product is less available on shelf?
The R code builds a retail availability diagnostic using weekly store-product data. It separates sales decline into distribution loss, stockouts, velocity changes, lost revenue, and competitor substitution risk. The analysis uses variables such as distribution_status, in_stock, units_sold, revenue, competitor_units, lost_distribution_flag, and out_of_stock_days from the constructed retail dataset.

“Did sales decline because demand weakened, because the product lost distribution, because the product was out of stock, or because competitors captured the demand?”

This distinction matters because each root cause leads to a different business action.
Problem Type	What It Means	Business Response
Lower velocity	Product is available, but selling slower	Improve pricing, promotion, merchandising, or marketing
Distribution loss	Product is no longer carried in some store-product weeks	Fix retailer execution, buyer conversations, replenishment, or planogram compliance
Stockout	Product is carried but unavailable on shelf	Fix inventory, forecasting, supply chain, or replenishment
Competitor substitution	Competitor sells more when we are unavailable	Protect shelf space and prevent shopper switching

Dataset
Dataset Structure
The dataset is built as a weekly retail panel.
Each row represents a:
week × retailer × store × product combination
The dataset contains 108 store-product-week records.

Key Findings
Finding 1: Sales decline is not purely a demand problem

From Week 1 to Week 6, total units declined for all three products.
The biggest decline was for P2, which lost 880 units from Week 1 to Week 6.
However, this decline was not only because shoppers bought less. P2 also lost distribution and experienced stockouts.

Finding 2: P2 and P3 lost distribution; P1 did not
Product-level distribution change shows:
Interpretation: P1 remained fully distributed, while P2 and P3 each lost one distributed store by the final week.
That means P2 and P3 had availability problems that directly reduced selling opportunity.

Finding 3: Walmart and Target drove distribution loss; Kroger did not
Interpretation:
Walmart and Target drove all distribution loss events. Kroger had no zero-distribution weeks. This is a very actionable insight because it tells the business where to focus first.

Finding 4: The issue is concentrated by retailer-product pair
The biggest retailer-product issues were:
Retailer	Product	Issue
Walmart	P2	Distribution loss and stockouts
Target	P3	Distribution loss
Kroger	All products	No distribution loss
Interpretation:
This is not a broad portfolio-wide problem. It is concentrated in specific retailer-product combinations. That makes the solution more operationally manageable.

Finding 5: Distribution loss cost more than stockouts
Estimated lost revenue by issue type:
Interpretation:
Distribution loss created almost 5 times more lost revenue than stockouts.
This is the most important financial finding.

Insight Section: Surprising Findings
Insight 1: The biggest issue was not “weak demand”; it was availability
At first glance, sales decline could look like customers were losing interest.
But the decomposition shows that P2 and P3 lost distribution, and P2 also had stockouts.
Surprising takeaway: The sales decline was partly self-inflicted. We lost selling opportunities because products were not available.

Insight 2: P1 declined even with no distribution loss
P1 had no distribution loss, yet units still declined from 2,720 to 2,515.
That suggests P1’s problem is more likely related to velocity, traffic, pricing, promotion, or category demand rather than availability.
Surprising takeaway: Not every sales decline has the same root cause. P1 needs a demand/velocity investigation, while P2 and P3 need availability fixes.

Insight 3: Distribution loss was more expensive than stockouts
Stockouts are often the obvious operational issue, but here distribution loss was the larger financial drag.
Distribution loss created about $8.4K in lost revenue, while stockouts created about $1.8K.
Surprising takeaway: The more damaging problem was not temporary out-of-stock execution. It was losing the product’s place in distribution.

Insight 4: Kroger was not part of the availability problem
Kroger had zero distribution loss, while Walmart and Target had all zero-distribution weeks.
Surprising takeaway: The issue is not brand-wide or category-wide. It is account-specific. This matters because the company should not overcorrect across all retailers. The fix should be targeted.

Insight 5: Competitor units rose when we were unavailable
When our product was unavailable and the competitor remained distributed, competitor average units were meaningfully higher.
Surprising takeaway: Availability gaps do not just cause lost sales today. They may train shoppers to substitute into competitor products.

Metric Story
Main Metric: Total Units Sold
What changed?
Total units sold declined from Week 1 to Week 6 across all products.
The biggest decline was:
P2 fell from 3,600 units to 2,720 units, a decline of 880 units.
P3 declined by 420 units, and P1 declined by 205 units.

Why did it change?
The decline happened because of a mix of:
Lower velocity per distributed store
Lost distribution
Stockouts
Competitive substitution
For P2, the issue was especially severe because it had both stockouts and distribution loss.

What caused it?

The root causes were different by product:
Product	Main Cause
P1	Velocity decline, not distribution loss
P2	Distribution loss + stockouts + competitor substitution
P3	Distribution loss, especially at Target
Kroger products	No distribution issue
The biggest financial driver was P2 at Walmart, with about $6.4K in estimated lost revenue.

What should we do?

The company should not treat the sales decline as a general demand problem.
Instead:
Fix Walmart P2 availability first.
Fix Target P3 distribution second.
Investigate P1 velocity drivers separately.
Monitor competitor substitution in stores where our product becomes unavailable.
Build weekly alerting for distribution loss and stockouts.

Business Impact
Revenue Impact
The company lost over $10K in estimated revenue from preventable availability issues in only six weeks of sample data.

Retailer Impact
The issue is concentrated in Walmart and Target.
Account teams should prioritize Walmart and Target rather than applying a broad fix across all retailers.

Competitive Impact
Competitor units increased when we were unavailable.
Lost availability can create competitor trial, brand switching, and possible long-term share loss.
This is especially important in CPG because once a shopper switches brands, future loyalty may be harder to recover.

Recommendation 1: Prioritize Walmart P2 immediately

Walmart P2 is the largest issue.
It had:
Distribution loss
Stockouts
Highest estimated lost revenue
Strong competitor substitution risk
Recommended action: Work with Walmart replenishment, category management, and store execution teams to restore P2 distribution and reduce out-of-stock days.

Recommendation 2: Restore Target P3 distribution
Target P3 drove the second-largest lost revenue pool.
Recommended action: Confirm whether the P3 distribution loss was caused by planogram reset, assortment removal, supply shortage, or store-level execution failure.

Recommendation 3: Treat P1 as a velocity problem, not an availability problem
P1 had no distribution loss but still declined.
Recommended action: Analyze P1 pricing, promotion, shelf position, store traffic, and competitor activity to understand why velocity weakened.

Recommendation 4: Create alert thresholds
Suggested alerts: Trigger	Action, Distribution drops by 1+ store	Account manager review, Out-of-stock days exceed 3, Supply chain escalation
Competitor units rise while we are unavailable, Competitive substitution alert, Lost revenue exceeds $1,000 in a week, Prioritize recovery plan

Executive Summary

This project diagnoses a retail sales decline by separating demand weakness from availability problems.

The analysis shows that sales declined across products, but the causes differed. P1 declined despite no distribution loss, suggesting a velocity or demand issue. P2 had the most serious problem, with both distribution loss and stockouts, especially at Walmart. P3 lost distribution at Target. Kroger showed no distribution loss.

The most important finding is that availability issues caused an estimated $10.1K in lost revenue, with distribution loss contributing much more than stockouts. Competitors also sold more when our products were unavailable, indicating substitution risk.

Recommendation

Prioritize availability recovery in this order:

Walmart P2
Target P3
P1 velocity investigation
Weekly distribution and stockout alerting
Competitor substitution monitoring

The final business message is:

Sales did not decline for one single reason. The biggest recoverable opportunity is fixing availability, especially Walmart P2 and Target P3, before competitors convert temporary availability gaps into lasting share gains.


















































































