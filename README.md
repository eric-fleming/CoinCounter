# CoinCounter

I used both MatLab and Python to achieve my results for this project.  The goal is to takea  picture of a group of coins and output how much money is there.  US MINT, no fancy coins!  Just pennies, nickels, dimes, and quarters.

### Simplifying Assumptions
-  Images of change should be taken against a dark (black) background

-  Medium lighting, no glare and minimal reflections

-  High-Resolution images.  I used ≈1500𝑥2000 images.

-  No overlapping or hiding coins

-  All coins are present: Pennies, Nickels, Dimes, & Quarters


### Process
-  Take Images
-  Segment into P vs. NP
-  Find circles
    -  The number in each segment and the radius of each circle
-  K-means Algorithm to classify coins by radius
    -  Clustering algorithm
    -  Group and use a dot-product to return the total


### Results
Works well in medium light and on a black background. The best results have the pennies separated from the other coins so as not to reflect some of their color onto the other gray/silver coins.  The parameters must be tuned for each lighting scenario.
