library(dplyr)
library(tidyverse)
library(ggplot2)
library(tidyr)
library(forcats)
library(scales)
week <- c('2024-W01', '2024-W01', '2024-W01', '2024-W01', '2024-W01', '2024-W01',
          '2024-W01', '2024-W01', '2024-W01', '2024-W01', '2024-W01', '2024-W01',
          '2024-W01', '2024-W01', '2024-W01', '2024-W01', '2024-W01', '2024-W01',
          '2024-W02', '2024-W02', '2024-W02', '2024-W02', '2024-W02', '2024-W02',
          '2024-W02', '2024-W02', '2024-W02', '2024-W02', '2024-W02', '2024-W02',
          '2024-W02', '2024-W02', '2024-W02', '2024-W02', '2024-W02', '2024-W02',
          '2024-W03', '2024-W03', '2024-W03', '2024-W03', '2024-W03', '2024-W03',
          '2024-W03', '2024-W03', '2024-W03', '2024-W03', '2024-W03', '2024-W03',
          '2024-W03', '2024-W03', '2024-W03', '2024-W03', '2024-W03', '2024-W03',
          '2024-W04', '2024-W04', '2024-W04', '2024-W04', '2024-W04', '2024-W04', 
          '2024-W04', '2024-W04', '2024-W04', '2024-W04', '2024-W04', '2024-W04',
          '2024-W04', '2024-W04', '2024-W04', '2024-W04', '2024-W04', '2024-W04',
          '2024-W05', '2024-W05', '2024-W05', '2024-W05', '2024-W05', '2024-W05',
          '2024-W05', '2024-W05', '2024-W05', '2024-W05', '2024-W05', '2024-W05',
          '2024-W05', '2024-W05', '2024-W05', '2024-W05', '2024-W05', '2024-W05',
          '2024-W06', '2024-W06', '2024-W06', '2024-W06', '2024-W06', '2024-W06',
          '2024-W06', '2024-W06', '2024-W06', '2024-W06', '2024-W06', '2024-W06',
          '2024-W06', '2024-W06', '2024-W06', '2024-W06', '2024-W06', '2024-W06')
retailer <- c('Walmart', 'Walmart', 'Walmart', 'Walmart', 'Walmart', 'Walmart',
              'Target', 'Target', 'Target', 'Target', 'Target', 'Target',
              'Kroger', 'Kroger', 'Kroger', 'Kroger', 'Kroger', 'Kroger',
              'Walmart', 'Walmart', 'Walmart', 'Walmart', 'Walmart', 'Walmart',
              'Target', 'Target', 'Target', 'Target', 'Target', 'Target',
              'Kroger', 'Kroger', 'Kroger', 'Kroger', 'Kroger', 'Kroger',
              'Walmart', 'Walmart', 'Walmart', 'Walmart', 'Walmart', 'Walmart',
              'Target', 'Target', 'Target', 'Target', 'Target', 'Target',
              'Kroger', 'Kroger', 'Kroger', 'Kroger', 'Kroger', 'Kroger',
              'Walmart', 'Walmart', 'Walmart', 'Walmart', 'Walmart', 'Walmart',
              'Target', 'Target', 'Target', 'Target', 'Target', 'Target',
              'Kroger', 'Kroger', 'Kroger', 'Kroger', 'Kroger', 'Kroger',
              'Walmart', 'Walmart', 'Walmart', 'Walmart', 'Walmart', 'Walmart',
              'Target', 'Target', 'Target', 'Target', 'Target', 'Target',
              'Kroger', 'Kroger', 'Kroger', 'Kroger', 'Kroger', 'Kroger',
              'Walmart', 'Walmart', 'Walmart', 'Walmart', 'Walmart', 'Walmart',
              'Target', 'Target', 'Target', 'Target', 'Target', 'Target',
              'Kroger', 'Kroger', 'Kroger', 'Kroger', 'Kroger', 'Kroger')
region <- c('West', 'West', 'West', 'West', 'West', 'West',
            'East', 'East', 'East', 'East', 'East', 'East',
            'Central', 'Central', 'Central', 'Central', 'Central', 'Central',
            'West', 'West', 'West', 'West', 'West', 'West',
            'East', 'East', 'East', 'East', 'East', 'East',
            'Central', 'Central', 'Central', 'Central', 'Central', 'Central',
            'West', 'West', 'West', 'West', 'West', 'West',
            'East', 'East', 'East', 'East', 'East', 'East',
            'Central', 'Central', 'Central', 'Central', 'Central', 'Central',
            'West', 'West', 'West', 'West', 'West', 'West',
            'East', 'East', 'East', 'East', 'East', 'East',
            'Central', 'Central', 'Central', 'Central', 'Central', 'Central',
            'West', 'West', 'West', 'West', 'West', 'West',
            'East', 'East', 'East', 'East', 'East', 'East',
            'Central', 'Central', 'Central', 'Central', 'Central', 'Central',
            'West', 'West', 'West', 'West', 'West', 'West',
            'East', 'East', 'East', 'East', 'East', 'East',
            'Central', 'Central', 'Central', 'Central', 'Central', 'Central')

store_id <- c(101, 101, 101, 102, 102, 102,
              201, 201, 201, 202, 202, 202, 
              301, 301, 301, 302, 302, 302, 
              101, 101, 101, 102, 102, 102,
              201, 201, 201, 202, 202, 202, 
              301, 301, 301, 302, 302, 302,
              101, 101, 101, 102, 102, 102,
              201, 201, 201, 202, 202, 202, 
              301, 301, 301, 302, 302, 302,
              101, 101, 101, 102, 102, 102,
              201, 201, 201, 202, 202, 202, 
              301, 301, 301, 302, 302, 302,
              101, 101, 101, 102, 102, 102,
              201, 201, 201, 202, 202, 202, 
              301, 301, 301, 302, 302, 302,
              101, 101, 101, 102, 102, 102,
              201, 201, 201, 202, 202, 202, 
              301, 301, 301, 302, 302, 302)
product_id <- c('P1', 'P2', 'P3', 'P1', 'P2', 'P3',
                'P1', 'P2', 'P3', 'P1', 'P2', 'P3',
                'P1', 'P2', 'P3', 'P1', 'P2', 'P3',
                'P1', 'P2', 'P3', 'P1', 'P2', 'P3',
                'P1', 'P2', 'P3', 'P1', 'P2', 'P3',
                'P1', 'P2', 'P3', 'P1', 'P2', 'P3',
                'P1', 'P2', 'P3', 'P1', 'P2', 'P3',
                'P1', 'P2', 'P3', 'P1', 'P2', 'P3',
                'P1', 'P2', 'P3', 'P1', 'P2', 'P3',
                'P1', 'P2', 'P3', 'P1', 'P2', 'P3',
                'P1', 'P2', 'P3', 'P1', 'P2', 'P3',
                'P1', 'P2', 'P3', 'P1', 'P2', 'P3',
                'P1', 'P2', 'P3', 'P1', 'P2', 'P3',
                'P1', 'P2', 'P3', 'P1', 'P2', 'P3',
                'P1', 'P2', 'P3', 'P1', 'P2', 'P3',
                'P1', 'P2', 'P3', 'P1', 'P2', 'P3',
                'P1', 'P2', 'P3', 'P1', 'P2', 'P3',
                'P1', 'P2', 'P3', 'P1', 'P2', 'P3')
category <- c('Snacks', 'Beverages', 'Dairy', 'Snacks', 'Beverages', 'Dairy',
              'Snacks', 'Beverages', 'Dairy', 'Snacks', 'Beverages', 'Dairy',
              'Snacks', 'Beverages', 'Dairy', 'Snacks', 'Beverages', 'Dairy',
              'Snacks', 'Beverages', 'Dairy', 'Snacks', 'Beverages', 'Dairy',
              'Snacks', 'Beverages', 'Dairy', 'Snacks', 'Beverages', 'Dairy',
              'Snacks', 'Beverages', 'Dairy', 'Snacks', 'Beverages', 'Dairy',
              'Snacks', 'Beverages', 'Dairy', 'Snacks', 'Beverages', 'Dairy',
              'Snacks', 'Beverages', 'Dairy', 'Snacks', 'Beverages', 'Dairy',
              'Snacks', 'Beverages', 'Dairy', 'Snacks', 'Beverages', 'Dairy',
              'Snacks', 'Beverages', 'Dairy', 'Snacks', 'Beverages', 'Dairy',
              'Snacks', 'Beverages', 'Dairy', 'Snacks', 'Beverages', 'Dairy',
              'Snacks', 'Beverages', 'Dairy', 'Snacks', 'Beverages', 'Dairy',
              'Snacks', 'Beverages', 'Dairy', 'Snacks', 'Beverages', 'Dairy',
              'Snacks', 'Beverages', 'Dairy', 'Snacks', 'Beverages', 'Dairy',
              'Snacks', 'Beverages', 'Dairy', 'Snacks', 'Beverages', 'Dairy',
              'Snacks', 'Beverages', 'Dairy', 'Snacks', 'Beverages', 'Dairy',
              'Snacks', 'Beverages', 'Dairy', 'Snacks', 'Beverages', 'Dairy',
              'Snacks', 'Beverages', 'Dairy', 'Snacks', 'Beverages', 'Dairy')
brand <- c('YourBrand', 'YourBrand', 'YourBrand', 'YourBrand', 'YourBrand', 'YourBrand',
           'YourBrand', 'YourBrand', 'YourBrand', 'YourBrand', 'YourBrand', 'YourBrand',
           'YourBrand', 'YourBrand', 'YourBrand', 'YourBrand', 'YourBrand', 'YourBrand',
           'YourBrand', 'YourBrand', 'YourBrand', 'YourBrand', 'YourBrand', 'YourBrand',
           'YourBrand', 'YourBrand', 'YourBrand', 'YourBrand', 'YourBrand', 'YourBrand',
           'YourBrand', 'YourBrand', 'YourBrand', 'YourBrand', 'YourBrand', 'YourBrand',
           'YourBrand', 'YourBrand', 'YourBrand', 'YourBrand', 'YourBrand', 'YourBrand',
           'YourBrand', 'YourBrand', 'YourBrand', 'YourBrand', 'YourBrand', 'YourBrand',
           'YourBrand', 'YourBrand', 'YourBrand', 'YourBrand', 'YourBrand', 'YourBrand',
           'YourBrand', 'YourBrand', 'YourBrand', 'YourBrand', 'YourBrand', 'YourBrand',
           'YourBrand', 'YourBrand', 'YourBrand', 'YourBrand', 'YourBrand', 'YourBrand',
           'YourBrand', 'YourBrand', 'YourBrand', 'YourBrand', 'YourBrand', 'YourBrand',
           'YourBrand', 'YourBrand', 'YourBrand', 'YourBrand', 'YourBrand', 'YourBrand',
           'YourBrand', 'YourBrand', 'YourBrand', 'YourBrand', 'YourBrand', 'YourBrand',
           'YourBrand', 'YourBrand', 'YourBrand', 'YourBrand', 'YourBrand', 'YourBrand',
           'YourBrand', 'YourBrand', 'YourBrand', 'YourBrand', 'YourBrand', 'YourBrand',
           'YourBrand', 'YourBrand', 'YourBrand', 'YourBrand', 'YourBrand', 'YourBrand',
           'YourBrand', 'YourBrand', 'YourBrand', 'YourBrand', 'YourBrand', 'YourBrand')
distribution_status <- c(1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
                         1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
                         1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
                         1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
                         1, 1, 1, 1, 0, 1, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 1, 1,
                         1, 1, 1, 1, 0, 1, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 1, 1)
in_stock <- c(1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
              1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
              1, 1, 1, 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
              1, 1, 1, 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
              1, 1, 1, 1, 0, 1, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 1, 1,
              1, 1, 1, 1, 0, 1, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 1, 1)
shelf_count <- c(4, 5, 3, 4, 5, 3, 3, 4, 3, 3, 4, 3, 4, 5, 3, 4, 5, 3,
                 4, 5, 3, 4, 5, 3, 3, 4, 3, 3, 4, 3, 4, 5, 3, 4, 5, 3,
                 4, 5, 3, 4, 5, 3, 3, 4, 3, 3, 4, 3, 4, 5, 3, 4, 5, 3,
                 4, 5, 3, 4, 5, 3, 3, 4, 3, 3, 4, 3, 4, 5, 3, 4, 5, 3,
                 3, 4, 3, 3, 0, 3, 3, 3, 2, 3, 3, 0, 4, 5, 3, 4, 5, 3,
                 3, 4, 3, 3, 0, 3, 3, 3, 2, 3, 3, 0, 4, 5, 3, 4, 5, 3)
units_sold <- c(520, 680, 360, 500, 650, 340, 410, 540, 310, 395, 525,
                300, 455, 610, 325, 440, 595, 315, 535, 700, 370, 510,
                665, 350, 420, 555, 320, 405, 535, 310, 465, 625, 335, 
                450, 605, 325, 525, 690, 365, 505, 420, 345, 415, 550,
                315, 400, 530, 305, 460, 620, 330, 445, 600, 320, 515,
                675, 355, 500, 390, 335, 405, 540, 305, 390, 520, 295, 
                450, 610, 320, 435, 590, 310, 455, 610, 340, 440, 0, 
                325, 400, 495, 270, 385, 480, 0, 445, 600, 315, 430, 
                580, 305, 445, 600, 335, 430, 0, 320, 395, 490, 265,
                380, 470, 0, 440, 590, 310, 425, 570, 300)
revenue <- c(2594.80, 2373.20, 2156.40, 2495.00, 2268.50, 2036.60,
             2168.90, 2046.60, 1949.90, 2089.55, 1989.75, 1887.00,
             2179.45, 2067.90, 1881.75, 2107.60, 2017.05, 1823.85,
             2669.65, 2443.00, 2216.30, 2544.90, 2320.85, 2096.50,
             2221.80, 2103.45, 2012.80, 2142.45, 2027.65, 1949.90,
             2227.35, 2118.75, 1939.65, 2155.50, 2050.95, 1881.75,
             2619.75, 2408.10, 2186.35, 2519.95, 1465.80, 2066.55,
             2195.35, 2084.50, 1981.35, 2116.00, 2008.70, 1918.45,
             2203.40, 2101.80, 1910.70, 2131.55, 2034.00, 1852.80,
             2569.85, 2355.75, 2126.45, 2495.00, 1361.10, 2006.65,
             2142.45, 2046.60, 1918.45, 2063.10, 1970.80, 1855.55, 
             2155.50, 2067.90, 1852.80, 2083.65, 2000.10, 1794.90,
             2270.45, 2128.90, 2036.60, 2195.60, 0, 1946.75,
             2116.00, 1876.05, 1698.30, 2036.65, 1819.20, 0, 
             2131.55, 2034.00, 1823.85, 2059.70, 1966.20, 1765.95,
             2220.55, 2094.00, 2006.65, 2145.70, 0, 1916.80,
             2089.55, 1857.10, 1666.85, 2010.20, 1781.30, 0,
             2107.60, 2000.10, 1794.90, 2035.75, 1932.30, 1737.00)
store_traffic <- c(8500, 8500, 8500, 8200, 8200, 8200, 7000, 7000, 7000,
                   6800, 6800, 6800, 7600, 7600, 7600, 7400, 7400, 7400,
                   8600, 8600, 8600, 8300, 8300, 8300, 7100, 7100, 7100,
                   6900, 6900, 6900, 7700, 7700, 7700, 7550, 7550, 7550,
                   8550, 8550, 8550, 8250, 8250, 8250, 7050, 7050, 7050,
                   6850, 6850, 6850, 7650, 7650, 7650, 7500, 7500, 7500,
                   8500, 8500, 8500, 8200, 8200, 8200, 7000, 7000, 7000,
                   6800, 6800, 6800, 7600, 7600, 7600, 7450, 7450, 7450,
                   8400, 8400, 8400, 8100, 8100, 8100, 6950, 6950, 6950,
                   6750, 6750, 6750, 7550, 7550, 7550, 7400, 7400, 7400,
                   8350, 8350, 8350, 8050, 8050, 8050, 6900, 6900, 6900,
                   6700, 6700, 6700, 7500, 7500, 7500, 7350, 7350, 7350)
competitor_units <- c(410, 590, 300, 430, 610, 310, 390, 520, 280, 400,
                      535, 290, 420, 570, 305, 430, 580, 310, 420, 600,
                      310, 440, 615, 315, 395, 525, 285, 405, 540, 295,
                      425, 575, 310, 435, 585, 315, 430, 620, 315, 450, 
                      640, 320, 400, 535, 290, 410, 545, 300, 430, 585,
                      315, 440, 595, 320, 440, 630, 320, 455, 650, 325, 
                      405, 540, 295, 415, 550, 305, 435, 590, 320, 445,
                      600, 325, 470, 660, 330, 480, 700, 335, 410, 570,
                      320, 420, 580, 340, 440, 595, 325, 450, 610, 330,
                      480, 675, 335, 490, 725, 340, 415, 580, 325, 425,
                      590, 355, 445, 600, 330, 455, 620, 335)
competitor_distribution <- c(1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
                             1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
                             1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
                             1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
                             1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
                             1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1)
lost_distribution_flag <- c(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
                       0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
                       0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
                       0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
                       0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0,
                       0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0)
out_of_stock_days <- c(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
                       0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
                       0, 0, 0, 0, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
                       0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
                       0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0,
                       0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0)
df <- data.frame(week = week, retailer = retailer, region = region, store_id = store_id,
           product_id = product_id, category = category, brand = brand, 
           distribution_status = distribution_status, in_stock = in_stock,
           shelf_count = shelf_count, units_sold = units_sold, revenue = revenue,
           store_traffic = store_traffic, competitor_units = competitor_units,
           competitor_distribution = competitor_distribution, 
           lost_distribution_flag = lost_distribution_flag, out_of_stock_days = out_of_stock_days)

# Did sales decline because of lower demand or lower velocity?
# Total Units = Distribution * Velocity
# Weekly Distribution + Velocity Summary
weekly_summary <- df %>%
  group_by(week, product_id) %>%
  summarise(
    distributed_stores = sum(distribution_status == 1),
    total_units = sum(units_sold),
    total_revenue = sum(revenue),
    velocity_per_distributed_store = ifelse(
      distributed_stores > 0,
      total_units / distributed_stores,
      NA_real_
    ),
    .groups = 'drop'
  )
weekly_summary
# Total Units over Time by Product
ggplot(weekly_summary, aes(x = week, y = total_units, color = product_id, group = product_id)) +
  geom_point(size = 3) +
  geom_line(linewidth = 1.2) +
  labs(
    title = 'Total Units by Week Relative to Product',
    x = 'Week',
    y = 'Total Units',
    color = 'Product'
  )
# Distribution Over Time by Product
ggplot(weekly_summary, aes(x = week, y = distributed_stores, group = product_id)) +
  geom_point(size = 3, alpha = 0.8) +
  geom_line(linewidth = 1.2, alpha = 0.7) +
  facet_wrap(~product_id) +
  labs(
    title = 'Distributed Stores over Time by Product',
    x = 'Week',
    y = 'Number of Distributed Stores',
    color = 'Product'
  )
# Velocity Over Time by Product
ggplot(weekly_summary, aes(x = week, y = velocity_per_distributed_store, color = product_id,
                           group = product_id)) +
  geom_point(size = 2) +
  geom_line(linewidth = 1.2) +
  labs(
    title = 'Velocity per Distributed Store Over Time by Product',
    x = 'Week',
    y = 'Units per Distributed Store',
    color = 'Product'
  )

# Distribution and Velocity Together vs Time by Product
weekly_summary %>%
  mutate(
    product_offset = case_when(
      product_id == 'P1' ~ -0.08,
      product_id == 'P2' ~ 0,
      product_id == 'P3' ~ 0.08
    ),
    distributed_stores_jittered = distributed_stores + product_offset
  ) %>%
  pivot_longer(
    cols = c(distributed_stores_jittered, velocity_per_distributed_store),
    names_to = 'metric',
    values_to = 'value'
  ) %>%
  ggplot(aes(x = week, y = value, color = product_id, group = product_id)) +
  geom_point(size = 3) +
  geom_line(linewidth = 1.2) +
  facet_wrap(~metric, 
             labeller = labeller(metric = c(
               'distributed_stores_jittered' = 'Distributed Stores',
               'velocity_per_distributed_store' = 'Velocity Per Distributed Store'
             )),
             scales = 'free_y') +
  labs(
    title = 'Distributed Stores and Velocity per Distributed Store Over Time by Product',
    subtitle = 'Small vertical offset added so overlapping product trends are visible',
    x = 'Week',
    y = 'Value',
    color = 'Product'
  )
# Check if there is an issue with a particular retailer
retailer_summary <- df %>%
  group_by(week, retailer, product_id) %>%
  summarise(
    distributed_stores = sum(distribution_status),
    total_units = sum(units_sold),
    velocity_per_distributed_store = ifelse(
      distributed_stores > 0,
      total_units / distributed_stores,
      NA_real_
    ),
    .groups = 'drop'
  )

retailer_summary %>%
  mutate(
    product_offset = case_when(
      product_id == 'P1' ~ -0.08,
      product_id == 'P2' ~ 0,
      product_id == 'P3' ~ 0.08
    ),
    distributed_stores_jittered = distributed_stores + product_offset
  ) %>%
  pivot_longer(
    cols = c(distributed_stores_jittered, velocity_per_distributed_store),
    names_to = 'metric',
    values_to = 'value'
  ) %>%
  ggplot(aes(x = week, y = value, color = product_id, group = product_id)) +
  geom_point(size = 2) + 
  geom_line(linewidth = 1.1) +
  facet_grid(metric ~ retailer, labeller = labeller(metric = c(
    'distributed_stores_jittered' = 'Distributed Stores',
    'velocity_per_distributed_store' = 'Velocity Per Distributed Store'
  )), scales = 'free_y')

decomposition <- weekly_summary %>%
  group_by(product_id) %>%
  summarise(
    first_week = first(week),
    last_week = last(week),
    first_units = first(total_units),
    last_units = last(total_units),
    unit_change = last_units - first_units,
    first_distribution = first(distributed_stores),
    last_distribution = last(distributed_stores),
    distribution_change = last_distribution - first_distribution,
    first_velocity = first(velocity_per_distributed_store),
    last_velocity = last(velocity_per_distributed_store),
    velocity_change = last_velocity - first_velocity,
    .groups = 'drop'
  )

print(decomposition, width = Inf)

# Which products lost the most distribution?
df
product_distribution <- df %>%
  group_by(week, product_id, category) %>%
  summarise(
    distributed_stores = sum(distribution_status == 1),
    lost_distribution = sum(lost_distribution_flag == 1),
    total_units = sum(units_sold),
    total_revenue = sum(revenue)
  )

print(product_distribution, width = Inf)
# Compare first and last week distribution
distribution_change <- product_distribution %>%
  group_by(product_id, category) %>%
  summarise(
    first_week = first(week),
    last_week = last(week),
    first_distribution = first(distributed_stores),
    last_distribution = last(distributed_stores),
    distribution_change = last_distribution - first_distribution,
    pct_distribution_change = distribution_change / first_distribution,
    total_lost_distribution_flags = sum(lost_distribution)
  ) %>%
  arrange(distribution_change)

print(distribution_change, width = Inf)
# Distribution over Time by Product
product_distribution %>%
  mutate(
    product_offset = case_when(
      product_id == 'P1' ~ -0.08,
      product_id == 'P2' ~ 0,
      product_id == 'P3' ~ 0.08
    ),
    distributed_stores_jittered = distributed_stores + product_offset
  ) %>%
ggplot(aes(x = week, y = distributed_stores_jittered, 
                                 color = product_id, group = product_id)) +
  geom_point(size = 3) +
  geom_line(linewidth = 1.2) +
  labs(
    title = 'Distributed Stores Over Time by Product',
    x = 'Week', 
    y = 'Number of Distributed Stores',
    color = 'Product'
  )

# Distribution Change by Product
distribution_change %>%
  mutate(
    product_id = fct_reorder(product_id, distribution_change)
  ) %>%
  ggplot(aes(
    x = product_id,
    y = distribution_change, 
    fill = product_id
  )) +
  geom_col() +
  coord_flip() +
  geom_hline(yintercept = 0, linetype = 'dashed') +
  labs(
    title = 'Distribution Change by Product',
    x = 'Product', 
    y = 'Change in Distributed Stores',
    fill = 'Product'
  )
# Percent Distribution Change by Product 
distribution_change %>%
  mutate(
    product_id = fct_reorder(product_id, pct_distribution_change)
  ) %>%
  ggplot(aes(
    x = product_id,
    y = pct_distribution_change,
    fill = product_id
  )) +
  geom_col() +
  coord_flip() +
  geom_hline(yintercept = 0, linetype = 'dashed') +
  scale_y_continuous(labels = percent_format(accuracy = 1)) +
  labs(
    title = 'Percent Distribution Change by Product',
    x = 'Product',
    y = '% Change in Distributed Stores',
    fill = 'Product'
  )

# Retailer-level product distribution 
df
retailer_product_distribution <- df %>%
  group_by(retailer, product_id, category, week) %>%
  summarise(
    distributed_stores = sum(distribution_status == 1),
    lost_distribution_count = sum(lost_distribution_flag == 1),
    total_units = sum(units_sold),
    total_revenue = sum(revenue)
  )

print(retailer_product_distribution, width = Inf)

retailer_distribution_change <- retailer_product_distribution %>%
  group_by(retailer, product_id, category) %>%
  summarise(
    first_distribution = first(distributed_stores),
    last_distribution = last(distributed_stores), 
    distribution_change = last_distribution - first_distribution,
    pct_distribution_change = distribution_change / first_distribution,
    total_lost_distribution_flags = sum(lost_distribution_count)
  ) %>%
  arrange(distribution_change)
print(retailer_distribution_change, width = Inf)

# Distribution Change by Product and Retailer
retailer_distribution_change %>%
  ggplot(aes(x = product_id, y = distribution_change, fill = product_id)) +
  geom_col() +
  geom_hline(yintercept = 0, linetype = 'dashed') +
  facet_wrap(~retailer) +
  labs(
    title = 'Distribution Change by Product and Retailer',
    x = 'Product',
    y = 'Change in Distributed Stores',
    fill = 'Product'
  )
# Where was distribution lost?
df %>%
  filter(lost_distribution_flag == 1 | distribution_status == 0) %>%
  select(
    week, 
    retailer,
    region,
    store_id,
    product_id,
    category,
    distribution_status,
    lost_distribution_flag,
    units_sold,
    revenue,
    competitor_units
  ) %>%
  arrange(product_id, retailer, store_id, week)

# Which retailers or regions are driving distribution loss?
df

retailer_loss <- df %>%
  group_by(retailer) %>%
  summarise(
    total_store_product_weeks = n(),
    distributed_store_product_weeks = sum(distribution_status == 1),
    lost_distribution_events = sum(lost_distribution_flag == 1),
    zero_distribution_weeks = sum(distribution_status == 0),
    total_units = sum(units_sold),
    total_revenue = sum(revenue),
    .groups = 'drop'
  ) %>%
  mutate(
    distribution_loss_rate = zero_distribution_weeks / total_store_product_weeks
  ) %>%
  arrange(desc(zero_distribution_weeks))

print(retailer_loss, width = Inf)

# Where is the issue located (Central, East, or West)?
region_loss <- df %>%
  group_by(region) %>%
  summarise(
    total_store_product_weeks = n(),
    distributed_store_product_weeks = sum(distribution_status == 1),
    lost_distribution_events = sum(lost_distribution_flag == 1),
    zero_distribution_weeks = sum(distribution_status == 0),
    total_units = sum(units_sold),
    total_revenue = sum(revenue)
  ) %>%
  mutate(
    distribution_loss_rate = zero_distribution_weeks /total_store_product_weeks
  ) %>%
  arrange(desc(zero_distribution_weeks))

print(region_loss, width = Inf)
# How is the issue allocated between retailer and region?
retailer_region_loss <- df %>%
  group_by(retailer, region) %>%
  summarise(
    total_store_product_weeks = n(),
    distributed_store_product_weeks = sum(distribution_status == 1),
    lost_distribution_events = sum(lost_distribution_flag == 1),
    zero_distribution_weeks = sum(distribution_status == 0),
    total_units = sum(units_sold),
    total_revenue = sum(revenue)
  ) %>%
  mutate(
    distribution_loss_rate = zero_distribution_weeks / total_store_product_weeks
  ) %>%
  arrange(desc(zero_distribution_weeks))

print(retailer_region_loss, width = Inf)

# Which retailer is driving distribution loss?
retailer_loss %>%
  mutate(
    retailer = fct_reorder(retailer, zero_distribution_weeks)
  ) %>%
  ggplot(aes(x = retailer, y = zero_distribution_weeks,
             fill = retailer)) +
  geom_col() +
  coord_flip() +
  labs(
    title = 'Zero Distribution Weeks by Retailer',
    x = 'Retailer', 
    y = 'Zero Distribution Weeks',
    fill = 'Retailer'
  )

# Which region is driving distribution loss?
region_loss %>%
  mutate(
    region = fct_reorder(region, zero_distribution_weeks)
  ) %>%
  ggplot(aes(x = region, y = zero_distribution_weeks, 
             fill = region)) +
  geom_col() +
  coord_flip() +
  labs(
    title = 'Zero Distribution Weeks by Region', 
    x = 'Region', 
    y = 'Zero Distribution Weeks', 
    fill = 'Region'
  )
 
# Heatmap of retailer x product distribution loss
retailer_product_distribution <- df %>%
  group_by(retailer, product_id) %>%
  summarise(
    lost_distribution_events = sum(lost_distribution_flag == 1),
    zero_distribution_weeks = sum(distribution_status == 0), 
    total_revenue = sum(revenue)
  )

print(retailer_product_distribution, width = Inf)


ggplot(retailer_product_distribution, aes(x = product_id, y = retailer, 
                                          fill = zero_distribution_weeks)) +
  geom_tile() +
  labs(
    title = 'Distribution Loss Heatmap by Retailer and Product',
    x = 'Product ID', 
    y = 'Retailer',
    fill = 'Distribution Loss in Weeks'
  )

# Heatmap of region x product distribution loss
region_product_distribution <- df %>%
  group_by(region, product_id) %>%
  summarise(
    lost_distribution_events = sum(lost_distribution_flag == 1),
    zero_distribution_weeks = sum(distribution_status == 0),
    total_revenue = sum(revenue)
  )

print(region_product_distribution, width = Inf)

ggplot(region_product_distribution, aes(x = product_id, y = region, 
                                        fill = zero_distribution_weeks)) +
  geom_tile() +
  labs(
    x = 'Product ID', 
    y = 'Region', 
    fill = 'Distribution Loss in Weeks'
  )

# Distribution loss over time by retailer
retailer_week_loss <- df %>%
  group_by(week, retailer) %>%
  summarise(
    lost_distribution_events = sum(lost_distribution_flag == 1),
    zero_distribution_weeks = sum(distribution_status == 0),
    total_revenue = sum(revenue)
  )


ggplot(retailer_week_loss, aes(x = week, y = zero_distribution_weeks,
                              group = retailer)) +
  geom_point(size = 3) +
  geom_line(linewidth = 1.2) +
  facet_wrap(~retailer) +
  labs(
    title = 'Distribution Loss Over Time by Retailer',
    x = 'Week',
    y = 'No-Distribution Store-Product Weeks'
  )

# Now, let us separate distribution loss from stockouts
# Some stores carry the product, but it is out of stock. Not the same as distribution loss.
df
availability_issue <- df %>%
  mutate(
    issue_type = case_when(
      distribution_status == 0 ~ 'Lost Distribution',
      distribution_status == 1 & in_stock == 0 ~ 'Stockout',
      TRUE ~ 'Available'
    )
  ) %>%
  group_by(retailer, region, issue_type) %>%
  summarise(
    store_product_weeks = n(),
    total_units = sum(units_sold),
    total_revenue = sum(revenue),
    .groups = 'drop'
  )

availability_issue  

availability_issue %>%
  filter(issue_type != 'Available') %>%
  ggplot(aes(x = retailer, y = store_product_weeks, 
             fill = issue_type)) +
  geom_col(position = 'dodge') + 
  facet_wrap(~region) +
  labs(
    title = 'Availability Issues by Retailer and Region',
    x = 'Retailer', 
    y = 'Store-Product Weeks',
    fill = 'Issue Type'
  )

# How much revenue was lost from distribution loss?
df <- df %>%
  mutate(
    avg_revenue_per_unit = ifelse(
      units_sold > 0, 
      revenue / units_sold,
      NA_real_
    )
  )

baseline_velocity <- df %>%
  filter(distribution_status == 1, in_stock == 1) %>%
  group_by(retailer, region, product_id) %>%
  summarise(
    baseline_units_per_store = mean(units_sold),
    baseline_revenue_per_unit = mean(avg_revenue_per_unit, na.rm = TRUE),
    .groups = 'drop'
  )

baseline_velocity
# Joining baseline back to normal data
lost_sales <- df %>%
  left_join(
    baseline_velocity,
    by = c('retailer', 'region', 'product_id')
  )
lost_sales
# Estimate expected units if distributed
lost_sales <- lost_sales %>%
  mutate(
    expected_units_if_distributed = case_when(
      distribution_status == 0 ~ baseline_units_per_store,
      TRUE ~ units_sold
    ),
    lost_units = case_when(
      distribution_status == 0 ~ expected_units_if_distributed - units_sold, 
      TRUE ~ 0
    ),
    lost_revenue = lost_units * baseline_revenue_per_unit
  )
lost_sales
# Summarize lost revenue by product
lost_revenue_by_product <- lost_sales %>%
  group_by(product_id, category) %>%
  summarise(
    lost_distribution_weeks = sum(distribution_status == 0),
    estimated_lost_units = sum(lost_units, na.rm = TRUE),
    estimated_lost_revenue = sum(lost_revenue, na.rm = TRUE),
    .groups = 'drop'
  ) %>%
  arrange(desc(estimated_lost_revenue))

lost_revenue_by_product 

# Summarize lost revenue by retailer
lost_revenue_by_retailer <- lost_sales %>%
  group_by(retailer) %>%
  summarise(
    lost_distribution_weeks = sum(distribution_status == 0),
    estimated_lost_units = sum(lost_units, na.rm = TRUE),
    estimated_lost_revenue = sum(lost_revenue, na.rm = TRUE),
    .groups = 'drop'
  ) %>%
  arrange(desc(estimated_lost_revenue))

lost_revenue_by_retailer

# Summarize lost revenue by retailer and product
lost_revenue_by_retailer_product <- lost_sales %>%
  group_by(retailer, product_id) %>%
  summarise(
    lost_distribution_weeks = sum(distribution_status == 0),
    estimated_lost_units = sum(lost_units, na.rm = TRUE),
    estimated_lost_revenue = sum(lost_revenue, na.rm = TRUE),
    .groups = 'drop'
  ) %>%
  arrange(desc(estimated_lost_revenue))

lost_revenue_by_retailer_product

# Plot lost revenue by product
lost_revenue_by_product
lost_revenue_by_product %>%
  mutate(
    product_id = fct_reorder(product_id, estimated_lost_revenue)
  ) %>%
ggplot(aes(x = product_id, y = estimated_lost_revenue,
                                    fill = category)) +
  geom_col() +
  coord_flip() +
  scale_y_continuous(labels = dollar_format()) +
  labs(
    title = 'Estimated Revenue Loss Due to Distribution by Product',
    x = 'Product ID',
    y = 'Estimated Lost Revenue',
    fill = 'Category'
  )

lost_revenue_by_retailer
lost_revenue_by_retailer %>%
  mutate(
    retailer = fct_reorder(retailer, estimated_lost_revenue)
  ) %>%
  ggplot(aes(x = retailer, y = estimated_lost_revenue, fill = retailer)) +
  geom_col() +
  coord_flip() +
  scale_y_continuous(labels = dollar_format()) +
  labs(
    title = 'Estimated Lost Revenue due to Distribution Loss by Retailer',
    x = 'Retailer', 
    y = 'Estimated Lost Revenue',
    fill = 'Retailer'
  )

lost_revenue_by_retailer_product
# Retailer x Product Heatmap
lost_revenue_by_retailer_product %>%
  ggplot(aes(x = product_id, y = retailer, fill = estimated_lost_revenue)) +
  geom_tile() +
  scale_fill_continuous(labels = dollar_format()) +
  labs(
    title = 'Estimated Lost Revenue from Distribution Loss by Product ID and Retailer',
    x = 'Product ID', 
    y = 'Retailer',
    fill = 'Estimated Loss Revenue'
  )

lost_revenue_by_week <- lost_sales %>%
  group_by(week, retailer, product_id) %>%
  summarise(
    estimated_lost_revenue = sum(lost_revenue, na.rm = TRUE),
    .groups = 'drop'
  )

lost_revenue_by_week %>%
  filter(estimated_lost_revenue > 0)
ggplot(lost_revenue_by_week, aes(x = week, y = estimated_lost_revenue,
                                group = product_id)) +
  geom_point(size = 3, position = position_dodge(width = 0.4)) +
  geom_line(linewidth = 1.2) +
  facet_grid(product_id ~ retailer) +
  scale_y_continuous(labels = scales::dollar_format()) +
  labs(
    title = 'Estimated Lost Revenue over Time by Retailer and Product',
    x = 'Week',
    y = 'Estimated Lost Revenue'
  )
# Alternative - historical avg units per distributed store - actual units
lost_sales_alt <- lost_sales %>%
  mutate(
    lost_units_alt = round(pmax(baseline_units_per_store - units_sold, 0), 2),
    lost_revenue_alt = round(lost_units_alt * baseline_revenue_per_unit, 2)
  )


lost_sales %>%
  filter(distribution_status == 1 & in_stock == 0)

lost_sales %>%
  filter(distribution_status == 0)

lost_sales <- lost_sales %>%
  mutate(
    issue_type = case_when(
      distribution_status == 0 ~ 'Lost Distribution',
      distribution_status == 1 & in_stock == 0 ~ 'Stockout',
      TRUE ~ 'Available'
    ),
    expected_units = baseline_units_per_store,
    lost_units_issue = case_when(
      issue_type %in% c('Lost Distribution', 'Stockout') ~
        pmax(expected_units - units_sold, 0),
      TRUE ~ 0
    ),
    lost_revenue_issue = lost_units_issue * baseline_revenue_per_unit
  )

lost_sales
lost_revenue_by_issue <- lost_sales %>%
  group_by(issue_type) %>%
  summarise(
    total_units_issue = sum(lost_units_issue),
    total_revenue_issue = sum(lost_revenue_issue)
  )

lost_revenue_by_issue %>%
  filter(issue_type != 'Available') %>%
  ggplot(aes(x = issue_type, y = total_revenue_issue, 
                                  fill = issue_type)) +
  geom_col() +
  coord_flip() +
  scale_y_continuous(labels = scales::dollar_format()) +
  labs(
    title = 'Total Revenue Loss due to Distribution and Stockouts',
    x = 'Issue Type',
    y = 'Total Revenue Loss',
    fill = 'Issue Type'
  )

# Is the issue distribution loss or stockouts?
df
baseline_velocity <- df %>%
  filter(distribution_status == 1 & in_stock == 1) %>%
  group_by(retailer, region, product_id) %>%
  summarise(
    baseline_units_sold = mean(units_sold),
    baseline_revenue_per_unit = mean(avg_revenue_per_unit)
  )

baseline_velocity

lost_sales <- df %>%
  left_join(baseline_velocity,
  by = c('retailer', 'region', 'product_id')
  )
lost_sales

lost_sales <- lost_sales %>%
  mutate(
    expected_units_distributed = case_when(
        distribution_status == 0 ~ baseline_units_sold,
        distribution_status == 1 & in_stock == 0 ~ baseline_units_sold,
        TRUE ~ units_sold),
    lost_units = case_when(
      distribution_status == 0 ~ baseline_units_sold - units_sold,
      distribution_status == 1 & in_stock == 0 ~baseline_units_sold - units_sold,
      TRUE ~ 0
    ),
    lost_revenue = lost_units * baseline_revenue_per_unit
  )

lost_sales %>%
  filter(distribution_status == 0)

lost_sales %>%
  filter(distribution_status == 1 & in_stock == 0)

lost_sales <- lost_sales %>%
  mutate(
    issue_type = case_when(
      distribution_status == 0 ~ 'Distribution Loss',
      distribution_status == 1 & in_stock == 0 ~ 'Stockout',
      TRUE ~ 'Available'
    ),
    expected_units = baseline_units_sold,
    lost_units = case_when(
      issue_type %in% c('Distribution Loss', 'Stockout') ~
        pmax(expected_units - units_sold, 0),
      TRUE ~ 0
    ),
    lost_revenue = lost_units * baseline_revenue_per_unit
  )

lost_sales

lost_sales %>%
  filter((distribution_status == 1 & in_stock == 0) | (distribution_status == 0))


# Summarize Issue Type Overall
overall_issue_summary <- lost_sales %>%
  group_by(issue_type) %>%
  summarise(
    store_product_weeks = n(),
    total_units = sum(units_sold),
    total_revenue = sum(revenue),
    total_out_of_stock_days = sum(out_of_stock_days),
    avg_out_of_stock_days = mean(out_of_stock_days),
    total_lost_revenue = sum(lost_revenue),
    total_lost_units = sum(lost_units)
  )

print(overall_issue_summary, width = Inf)

# We can take a look at issue type count
overall_issue_summary %>%
  filter(issue_type != 'Available') %>%
  mutate(
    issue_type = fct_reorder(issue_type, store_product_weeks)
  ) %>%
  ggplot(aes(x = issue_type, y = store_product_weeks, fill = store_product_weeks)) +
    geom_col() +
    coord_flip() +
    labs(
      title = 'Overall Issue Summary by Count',
      x = 'Issue Type', 
      y = 'Count of Issue Type',
      fill = 'Issue Type'
    )
# Issue Type by Retailer
lost_sales
issue_type_retailer_summary <- lost_sales %>%
  group_by(retailer, issue_type) %>%
  summarise(
    store_product_weeks = n(),
    total_units = sum(units_sold),
    total_revenue = sum(revenue),
    total_out_of_stock_days = sum(out_of_stock_days),
    total_lost_units = sum(lost_units),
    total_lost_revenue = sum(lost_revenue)
  )
  
print(issue_type_retailer_summary, width = Inf)

ggplot(issue_type_retailer_summary, aes(x = retailer, y = store_product_weeks,
                                        fill = issue_type)) +
  geom_col(position = 'dodge') +
  labs(
    title = 'Count of Issue Type by Retailer',
    x = 'Retailer', 
    y = 'Store-Product Combination (Weeks)',
    fill = 'Issue Type'
  )
# Product Overview
product_issue_summary <-
lost_sales %>%
  group_by(product_id, issue_type) %>%
  summarise(
    store_product_weeks = n(), 
    total_units = sum(units_sold),
    total_revenue = sum(revenue),
    total_out_of_stock_days = sum(out_of_stock_days),
    total_lost_units = sum(lost_units),
    total_lost_revenue = sum(lost_revenue)
  )

print(product_issue_summary, width = Inf)

product_issue_summary %>%
  mutate(
    product_id = fct_reorder(product_id, store_product_weeks)
  ) %>%
ggplot(aes(x = product_id, y = store_product_weeks,
                                  fill = issue_type)) +
  geom_col(position = 'dodge') +
  labs(
    title = 'Count of Issue Type by Product',
    x = 'Product', 
    y = 'Store Product Weeks', 
    fill = 'Issue Type'
  )

# Retailer x Product Heatmap
retailer_product_summary <- lost_sales %>%
  group_by(retailer, product_id, issue_type) %>%
  summarise(
    store_product_weeks = n(),
    total_out_of_stock_days = sum(out_of_stock_days),
    total_lost_units = sum(lost_units),
    total_lost_revenue = sum(lost_revenue)
  )

print(retailer_product_summary, width = Inf)

ggplot(retailer_product_summary, aes(x = retailer, y = product_id,
                                     fill = store_product_weeks)) +
  geom_tile() +
  facet_grid(~issue_type) +
  labs(
    title = 'Store-Product Weeks by Product and Retailer for Issue Type',
    x = 'Retailer', 
    y = 'Product ID',
    fill = 'Issue Count'
  )

# Out-of-stock severity
out_of_stock_summary <- lost_sales %>%
  group_by(retailer, product_id) %>% 
  summarise(
    stock_status = sum(in_stock == 0),
    total_units_sold = sum(units_sold),
    total_revenue = sum(revenue),
    total_out_of_stock_days = sum(out_of_stock_days)
  ) %>%
  arrange(desc(total_out_of_stock_days))

out_of_stock_summary  

ggplot(out_of_stock_summary, aes(x = product_id, y = total_out_of_stock_days, 
                                 fill = product_id)) +
  geom_col(position = 'dodge') +
  facet_wrap(~retailer) +
  labs(
    title = 'Out of Stock Days by Product and Retailer',
    x = 'Product', 
    y = 'Total Out of Stock Days',
    fill = 'Product'
  )

# Time Trend: Availability Over Time for Out of Stock Days

lost_sales
weekly_issue_summary <- lost_sales %>%
  group_by(week, issue_type) %>%
  summarise(
    store_product_weeks = n(),
    total_out_of_stock_days = sum(out_of_stock_days),
    total_units_sold = sum(units_sold),
    total_revenue = sum(revenue),
    total_lost_units = sum(lost_units),
    total_lost_revenue = sum(lost_revenue)
  )

print(weekly_issue_summary, width = Inf)

ggplot(weekly_issue_summary, aes(x = week, y = store_product_weeks,
                                 group = issue_type, color = issue_type)) +
  geom_point(size = 3) +
  geom_line(linewidth = 1.2) +
  labs(
    title = 'Availability Issues Over Time',
    x = 'Week',
    y = 'Store Product Weeks',
    color = 'Issue Type'
  )
# Lost Revenue by Issue
revenue_issue_summary <- lost_sales %>%
  group_by(issue_type) %>%
  summarise(
    total_lost_revenue = sum(lost_revenue),
    total_lost_units = sum(lost_units)
  )
revenue_issue_summary

ggplot(revenue_issue_summary, aes(x = issue_type, y = total_lost_revenue,
                                  fill = issue_type)) +
  geom_col() + 
  scale_y_continuous(labels = dollar_format()) +
  labs(
    x = 'Issue Type',
    y = 'Total Lost Revenue',
    fill = 'Issue Type'
  )

# Did competitor sales increase where our availability declined?
# Check how many units our competitor and we sold per issue type
issue_units_summary <- lost_sales %>%
  group_by(issue_type) %>%
  summarise(
    total_competitor_units = sum(competitor_units),
    total_units = sum(units_sold),
    avg_units_sold = mean(units_sold),
    avg_competitor_units = mean(competitor_units),
    store_product_weeks = n(),
    .groups = 'drop'
  )
print(issue_units_summary, width = Inf)
issue_units_summary %>%
  select(issue_type, avg_units_sold, avg_competitor_units) %>%
  pivot_longer(
    cols = c(avg_units_sold, avg_competitor_units),
    names_to = 'metric',
    values_to = 'value'
  ) %>%
  ggplot(aes(x = issue_type, y = value, fill = metric)) +
  geom_col(position = 'dodge') +
  labs(
    title = 'Average Units Sold vs Competitor Units Sold by Metric',
    x = 'Issue Type',
    y = 'Average Units',
    fill = 'Metric'
  )


issue_units_summary %>%
  select(issue_type, total_units, total_competitor_units) %>%
  pivot_longer(
    cols = c(total_units, total_competitor_units),
    names_to = 'metric',
    values_to = 'value'
  ) %>%
  ggplot(aes(x = issue_type, y = value, fill = metric)) +
  geom_col(position = 'dodge') +
  labs(
    title = 'Total Units Sold vs Competitor Units Sold by Metric',
    x = 'Issue Type',
    y = 'Average Units',
    fill = 'Metric'
  )
# How do competitor units and units_sold differ by product?
product_issue_summary <- lost_sales %>%
  group_by(product_id, issue_type) %>%
  summarise(
    store_product_weeks = n(),
    total_competitor_units = sum(competitor_units),
    total_units = sum(units_sold),
    avg_competitor_units = mean(competitor_units),
    avg_units = mean(units_sold)
  )

print(product_issue_summary, width = Inf)

product_issue_summary %>%
  pivot_longer(
    cols = c(avg_competitor_units, avg_units),
    names_to = 'metric',
    values_to = 'value'
  ) %>%
  ggplot(aes(x = issue_type, y = value, fill = metric)) +
  geom_col(position = 'dodge') +
  facet_wrap(~product_id) +
  labs(
    title = 'Average Units Sold and Competitor Units Sold by Issue Type and Product',
    x = 'Issue Type', 
    y = 'Value',
    fill = 'Metric'
  )

print(product_issue_summary, width = Inf)

ggplot(product_issue_summary, 
       aes(x = avg_competitor_units, y = avg_units, color = issue_type)) +
  geom_point(size = 3) +
  facet_wrap(~product_id) +
  labs(
    title = 'Our Average Units Sold vs Competitor Average Units Sold by 
    Availability Issue',
    x = 'Average Competitor Units',
    y = 'Average Units Sold',
    color = 'Issue Type'
  )

lost_sales %>%
  group_by(retailer, product_id, issue_type) %>%
  summarise(
    avg_competitor_units = mean(competitor_units),
    avg_units_sold = mean(units_sold)
  ) %>%
  ggplot(aes(x = product_id, y = retailer, fill = avg_competitor_units)) +
  geom_tile() +
  facet_wrap(~issue_type) +
  labs(
    title = 'Competitor Units During Availability Issues',
    x = 'Product', 
    y = 'Retailer',
    fill = 'Avg Competitor Units'
  )

# Competitor Distribution (separate competitor demand) from competitor availability
lost_sales <- lost_sales %>%
  mutate(
    competitor_availability = case_when(
      competitor_distribution == 1 ~ 'Competitor Distributed',
      competitor_distribution == 0 ~ 'Competitor Not Distributed',
      TRUE ~ 'Review'
    ),
    availability_scenario = case_when(
      issue_type == 'Available' &
        competitor_availability == 'Competitor Distributed' ~
        'Both Available',
      
      issue_type %in% c('Lost Distribution', 'Stockout') &
        competitor_availability == 'Competitor Distributed' ~
        'We Unavailable, Competitor Available',
      
      issue_type %in% c('Lost Distribution', 'Stockout') &
        competitor_availability == 'Competitor Not Distributed' ~
        'Both Unavailable',
      
      issue_type == 'Available' & competitor_availability == 
        'Competitor Not Distributed' ~ 'We Available, Competitor Unavailable',
      
      TRUE ~ 'Review'
    )
  )
# Competitor Sales by Scenario
scenario_summary <- lost_sales %>%
  group_by(availability_scenario) %>%
  summarise(
    total_competitor_units = sum(competitor_units),
    total_units = sum(units_sold),
    avg_competitor_units = mean(competitor_units),
    avg_units = mean(units_sold),
    store_product_weeks = n(),
    avg_store_traffic = mean(store_traffic),
    .groups = 'drop'
  ) %>%
  arrange(desc(avg_competitor_units))

print(scenario_summary, width = Inf)

# Competitor Units by Scenario
# What scenario do competitors sell the most units?
ggplot(scenario_summary, aes(x = availability_scenario, 
                             y = avg_competitor_units,
                             fill = availability_scenario)) +
  geom_col() +
  coord_flip() +
  labs(
    title = 'Average Competitor Units by Availability Scenario',
    x = 'Availability Scenario', 
    y = 'Average Competitor Units',
    fill = 'Availability Scenario'
  )

# Compare our units and competitor units together
scenario_summary %>%
  select(availability_scenario, avg_units, avg_competitor_units) %>%
  pivot_longer(
    cols = c(avg_units, avg_competitor_units),
    names_to = 'metric',
    values_to = 'value'
  ) %>%
  ggplot(aes(x = availability_scenario, y = value, fill = metric)) +
  geom_col(position = 'dodge') +
  coord_flip() +
  labs(
    title = 'Our Units and Our Competitors" Average Units by Availability Scenario',
    x = 'Availability Scenario', 
    y = 'Value', 
    fill = 'Metric'
  )

# Product Overview (which products are most vulnerable to competitor substitution?)
product_scenario_summary <- lost_sales %>%
  group_by(product_id, availability_scenario) %>%
  summarise(
    store_product_weeks = n(),
    total_competitor_units = sum(competitor_units),
    total_units_sold = sum(units_sold),
    avg_competitor_units = mean(competitor_units),
    avg_units_sold = mean(units_sold),
    .groups = 'drop'
  )

print(product_scenario_summary, width = Inf)

product_scenario_summary %>%
  select(product_id, availability_scenario, avg_competitor_units, avg_units_sold) %>%
  pivot_longer(
    cols = c(avg_units_sold, avg_competitor_units),
    names_to = 'metric',
    values_to = 'value'
  ) %>%
  ggplot(aes(
     x = availability_scenario,
     y = value,
     fill = metric
  )) +
  geom_col(position = 'dodge') +
  coord_flip() +
  facet_wrap(~product_id) +
  labs(
    title = 'Our Units and Competitor Units by Product and Availability Scenario',
    x = 'Availability Scenario', 
    y = 'Average Units', 
    fill = 'Metric'
  )

# Which retailers are benefiting the most from availability problems?
retailer_scenario_summary <- lost_sales %>% 
  group_by(retailer, availability_scenario) %>%
  summarise(
    store_product_weeks = n(),
    total_competitor_units = sum(competitor_units),
    total_units_sold = sum(units_sold),
    avg_competitor_units = mean(competitor_units),
    avg_units_sold = mean(units_sold)
  )

print(retailer_scenario_summary, width = Inf) 

retailer_scenario_summary %>%
  ggplot(aes(x = availability_scenario, 
         y = avg_competitor_units,
         fill = availability_scenario)) +
  geom_col() +
  coord_flip() +
  facet_wrap(~retailer) +
  labs(
    title = 'Our Competitor Units by Retailer and Availability Scenario',
    x = 'Availability Scenario',
    y = 'Average Units',
    fill = 'Scenario'
  )

# Creating a competitive substitution variable
lost_sales
lost_sales <- lost_sales %>%
  mutate(
    substitution_risk = case_when(
      issue_type %in% c('Distribution Loss', 'Stockout') &
        competitor_distribution == 1 &
        competitor_units > median(competitor_units, na.rm = TRUE) ~
        'High Substitution Risk',
      issue_type %in% c('Distribution Loss', 'Stockout') &
        competitor_distribution == 1 ~
        'Moderate Substitution Risk',
      TRUE ~ 'Lower Risk'
    )
  )


competitive_substitution <- lost_sales %>%
  group_by(retailer, product_id, substitution_risk) %>%
  summarise(
    store_product_weeks = n(),
    total_competitor_units = sum(competitor_units),
    total_units_sold = sum(units_sold),
    avg_competitor_units = mean(competitor_units),
    avg_units_sold = mean(units_sold)
  )

print(competitive_substitution, width = Inf)

competitive_substitution %>%
  ggplot(aes(x = retailer, y = product_id, fill = avg_competitor_units)) +
  geom_tile() +
  facet_wrap(~substitution_risk) +
  labs(title = 'Competitive Substitution Risk by Retailer',
       x = 'Product',
       y = 'Retailer',
       fill = 'Competitor Units')

# Products with weakest velocity (calculation first by distribution, then store traffic)
lost_sales

distributed_stores = sum(distribution_status == 1)

lost_sales %>%
  group_by(product_id) %>%
  summarise(
    velocity_per_distributed_store = sum(units_sold)/sum(distribution_status == 1),
    distribution = sum(distribution_status == 1),
    total_units_sold = sum(units_sold)
  ) %>%
  ggplot(aes(x = product_id, y = velocity_per_distributed_store,
             fill = product_id)) +
  geom_col() +
  coord_flip() +
  labs(
    x = 'Product ID', 
    y = 'Velocity by Store and Week',
    fill = 'Product ID'
  )

lost_sales <- lost_sales %>%
  mutate(
    velocity_by_store_traffic = units_sold/store_traffic
  )

lost_sales %>%
  group_by(product_id) %>%
  summarise(
    total_units_sold = sum(units_sold),
    total_store_traffic = sum(store_traffic),
    velocity_by_store_traffic = mean(velocity_by_store_traffic)
  ) %>%
  ggplot(aes(x = product_id, y = velocity_by_store_traffic,
             fill = product_id)) +
  geom_col() +
  coord_flip() +
  labs(
    x = 'Product ID', 
    y = 'Velocity by Store Traffic',
    fill = 'Product ID'
  )

# Velocity by Product and Retailer
retailer_product_velocity <- lost_sales %>%
  filter(distribution_status == 1) %>%
  group_by(retailer, product_id, category) %>%
  summarise(
    store_product_weeks = n(),
    total_units = sum(units_sold),
    total_revenue = sum(revenue),
    velocity_by_distributed_store = total_units / store_product_weeks,
    revenue_by_distributed_store = total_revenue / store_product_weeks,
    .groups = 'drop'
  ) %>%
  arrange(velocity_by_distributed_store)

print(retailer_product_velocity, width = Inf)

retailer_product_velocity %>%
  ggplot(aes(
    x = product_id, 
    y = velocity_by_distributed_store,
    fill = product_id
  )) +
  geom_col() +
  facet_wrap(~retailer) +
  labs(
    title = 'Product Velocity by Retailer',
    x = 'Product',
    y = 'Average Units per Distributed Store-Week',
    fill = 'Product'
  )

# Velocity by Time
# Is weak velocity persistent or temporary?
weekly_product_velocity <- lost_sales %>%
  filter(distribution_status == 1) %>%
  group_by(week, product_id, category) %>%
  summarise(
    distributed_stores = n(),
    total_units = sum(units_sold),
    velocity = total_units / distributed_stores
  )

weekly_product_velocity

ggplot(weekly_product_velocity, aes(
  x = week,
  y = velocity,
  color = product_id,
  group = product_id
)) +
  geom_line(linewidth = 1.2) +
  geom_point(size = 3) +
  labs(
    title = 'Product Velocity Over Time',
    x = 'Week',
    y = 'Units per Distributed Store',
    color = 'Product'
  )

# Which stores should sales team prioritize?
# Look at high store traffic, lost distribution, high competitor units,
# strong historical velocity
lost_sales
store_priority <- lost_sales %>%
  group_by(retailer, region, store_id, product_id, category) %>%
  summarise(
    weeks_observed = n(),
    distributed_weeks = sum(distribution_status == 1),
    avg_store_traffic = mean(store_traffic),
    lost_distribution = sum(distribution_status == 0),
    stockout_weeks = sum(distribution_status == 1 & in_stock == 0),
    total_out_of_stock = sum(out_of_stock_days),
    total_units = sum(units_sold),
    total_revenue = sum(revenue),
    total_competitor_units = sum(competitor_units),
    competitor_distributed_weeks = sum(competitor_distribution == 1),
    avg_shelf_count = mean(shelf_count),
    estimated_lost_units = sum(lost_units),
    estimated_lost_revenue = sum(lost_revenue),
    .groups = 'drop'
  ) %>%
  mutate(
    availability_issue_weeks = lost_distribution + stockout_weeks,
    competitor_pressure = total_competitor_units / weeks_observed
  ) %>%
  arrange(desc(availability_issue_weeks), desc(total_competitor_units))

store_priority <- store_priority %>%
  mutate(
    priority_score =
      estimated_lost_revenue * 0.40 +
      total_competitor_units * 0.25 +
      avg_store_traffic * 0.20 +
      total_out_of_stock * 0.15
  ) %>%
  arrange(desc(priority_score))

store_priority <- store_priority %>%
  mutate(
    sales_team_action = case_when(
      lost_distribution > 0 &
        estimated_lost_revenue > 0 &
        total_competitor_units > median(total_competitor_units,
                                        na.rm = TRUE) ~
        'High Priority: Recover Distribution',
      
      stockout_weeks > 0 &
        estimated_lost_revenue > 0 ~
        'High Priority: Fix Stockouts',
      
      availability_issue_weeks > 0 &
        estimated_lost_revenue > 0 ~
        'Medium Priority: Availability Follow-Up',
      
      total_competitor_units > median(total_competitor_units, na.rm = TRUE) &
        total_units < median(total_units, na.rm = TRUE) ~
        'Review: Competitor Pressure',
      
      TRUE ~ 'Lower Priority'
    )
  ) %>%
  arrange(desc(priority_score))



print(store_priority, width = Inf)


ggplot(store_priority, aes(x = estimated_lost_revenue, 
                           y = total_competitor_units,
                           color = sales_team_action,
                           size = avg_store_traffic)) +
  geom_point(alpha = 0.8) +
  facet_wrap(~product_id) +
  labs(
    title = 'Store Prioritization: Lost Revenue vs Competitor Pressure',
    x = 'Estimated Lost Revenue',
    y = 'Total Competitor Units',
    color = 'Retailer',
    size = 'Avg Store Traffic'
  )

store_priority %>%
  mutate(
    store_product_label = paste(retailer, store_id, product_id, sep = ' | '),
    store_product_label = fct_reorder(store_product_label, priority_score)
  ) %>%
  slice_max(priority_score, n = 10) %>%
  ggplot(aes(
    x = store_product_label,
    y = priority_score,
    fill = sales_team_action
  )) +
  geom_col() +
  coord_flip() +
  labs(
    title = 'Top 10 Store-Product Priorities for Sales Team',
    x = 'Retailer | Store | Product', 
    y = 'Priority Score',
    fill = 'Recommended Action'
  )

store_issue_summary <- lost_sales %>%
  group_by(retailer, store_id, product_id, issue_type) %>%
  summarise(
    store_product_weeks = n(),
    estimated_lost_revenue = sum(lost_revenue, na.rm = TRUE),
    .groups = 'drop'
  )

store_issue_summary %>%
  filter(issue_type != 'Available') %>%
  ggplot(aes(
    x = product_id,
    y = store_product_weeks,
    fill = issue_type
  )) +
  geom_col(position = 'dodge') +
  facet_wrap(~retailer) +
  labs(
    title = 'Availability Issues by Retailer and Product',
    x = 'Product',
    y = 'Store-Product Weeks',
    fill = 'Issue Type'
  )


lost_sales

# Did shelf space reductions hurt performance?
shelf_summary <- lost_sales %>%
  filter(distribution_status == 1, in_stock == 1) %>%
  group_by(product_id, shelf_count) %>%
  summarise(
    store_product_weeks = n(),
    avg_units_sold = mean(units_sold),
    total_units_sold = sum(units_sold),
    avg_revenue = mean(revenue),
    avg_store_traffic = mean(store_traffic),
    .groups = 'drop'
  ) %>%
  arrange(product_id, shelf_count)

print(shelf_summary, width = Inf)

ggplot(shelf_summary, aes(x = shelf_count,
                           y = total_units_sold,
                           color = product_id)) +
  geom_point(size = 3, alpha = 0.75) +
  geom_smooth(method = 'lm', se = FALSE) +
  labs(
    title = 'Shelf Count vs Units Sold',
    x = 'Shelf Count', 
    y = 'Units Sold',
    color = 'Product'
  )

# Facet by Product
ggplot(shelf_summary, aes(
  x = shelf_count,
  y = total_units_sold
)) +
  geom_point(size = 3, alpha = 0.75) +
  geom_smooth(method = 'lm', se = FALSE) +
  facet_wrap(~product_id, scales = 'free_y') +
  labs(
    title = 'Shelf Count vs Units Sold by Product',
    x = 'Shelf Count',
    y = 'Units Sold'
  )

# How productive is each shelf facing?
lost_sales <- lost_sales %>%
  mutate(
    units_per_facing = units_sold / shelf_count,
    revenue_per_facing = revenue / shelf_count
  )

shelf_productivity <- lost_sales %>%
  group_by(product_id, shelf_count) %>%
  summarise(
    avg_units_sold = mean(units_sold),
    avg_units_per_facing = mean(units_per_facing),
    avg_revenue_per_facing = mean(revenue_per_facing),
    .groups = 'drop'
  )

shelf_productivity

ggplot(shelf_productivity, aes(
  x = shelf_count,
  y = avg_units_per_facing,
  color = product_id,
  group = product_id
 )) +
  geom_line(linewidth = 1.2) +
  geom_point(size = 3) +
  labs(
    title = 'Units per Facing by Shelf Count',
    x = 'Shelf Count',
    y = 'Average Units per Facing',
    color = 'Product'
  )

lm(units_sold ~ shelf_count + store_traffic + product_id + retailer + region,
   data = lost_sales)

# What actions should the business take?
store_product_summary <- lost_sales %>%
  group_by(store_id, product_id) %>%
  summarise(
    lost_distribution = sum(distribution_status == 0),
    velocity_distributed_store = sum(units_sold)/sum(distribution_status == 1),
    in_stock = sum(in_stock == 1),
    stockout = sum(in_stock == 0),
    total_revenue = sum(revenue),
    avg_revenue = mean(revenue),
    total_units = sum(units_sold),
    avg_units = mean(units_sold),
    avg_store_traffic = mean(store_traffic),
    avg_shelf_count = mean(shelf_count),
    competitor_distribution = sum(competitor_distribution == 1),
    total_competitor_units = sum(competitor_units),
    avg_competitor_units = mean(competitor_units),
    out_of_stock = sum(out_of_stock_days)
  )


store_product_summary <- store_product_summary %>%
  mutate(
    high_historical_velocity = 
      velocity_distributed_store >= median(velocity_distributed_store, na.rm = TRUE),
    
    high_demand = 
      avg_units >= median(avg_units, na.rm = TRUE),
    
    high_competitor_pressure = 
      avg_competitor_units >= median(avg_competitor_units, na.rm = TRUE),
    
    high_traffic = 
      avg_store_traffic >= median(avg_store_traffic, na.rm = TRUE)
    
  )

store_product_summary <- store_product_summary %>%
  mutate(
    action_bucket = case_when(
      lost_distribution > 0 &
        high_historical_velocity ~
        'Recover Distribution',
      
      in_stock < 6 &
        high_demand ~
        'Fix Stockouts / Replenishment',
      
      lost_distribution == 0 &
        in_stock == 6 &
        high_historical_velocity == FALSE ~
        'Improve Demand / Merchandising',
      
      lost_distribution > 0 & 
        high_competitor_pressure ~
        'Urgent Competitive Recovery',
      
      avg_shelf_count < median(avg_shelf_count, na.rm = TRUE) &
        high_historical_velocity == FALSE ~
        'Review Shelf Space',
      
      TRUE ~
        'Monitor / Lower Priority'
    )
  )

store_product_summary <- store_product_summary %>%
  mutate(
    recommended_action = case_when(
      
      action_bucket == 'Recover Distribution' ~
        'Sales team should renegotiate distribution and restore shelf placement.',
      
      action_bucket == 'Fix Stockouts / Replenishment' ~
        'Coordinate with supply chain and retailer replenishment teams to improve in-stock levels.',
      
      action_bucket == 'Improve Demand / Merchandising' ~
        'Review pricing, promotion, display support, packaging, or local demand generation.',
      
      action_bucket == 'Urgent Competitive Recovery' ~
        'Prioritize retailer conversation because competitors may be capturing demand while we are unavailable.',
      
      action_bucket == 'Review Shelf Space' ~
        'Assess whether shelf facings are too low and whether additional shelf space would improve velocity.',
      
      TRUE ~
        'Continue monitoring: no immediate action needed.'
    )
  ) %>%
  arrange(action_bucket, desc(total_competitor_units), desc(velocity_distributed_store))


print(store_product_summary, width = Inf)

# How many store-product combinations need each type of action?
store_product_summary %>%
  count(action_bucket) %>%
  ggplot(aes(
    x = action_bucket, 
    y = n,
    fill = action_bucket
  )) +
  geom_col() +
  coord_flip() +
  labs(
    title = 'Store-Product Action Classification',
    x = 'Recommended Action',
    y = 'Number of Store-Product Combinations',
    fill = 'Action'
  )

ggplot(store_product_summary, aes(
  x = avg_units,
  y = avg_competitor_units,
  color = action_bucket,
  size = avg_store_traffic
)) +
  geom_point(alpha = 0.8) +
  facet_wrap(~product_id) +
  labs(
    title = 'Action Prioritization: Historical Velocity vs Competitor Pressure',
    x = 'Avg Units',
    y = 'Avg Competitor Units',
    color = 'Action Bucket',
    size = 'Avg Store Traffic'
  )

store_product_summary %>%
  group_by(product_id, action_bucket) %>%
  summarise(
    store_product_count = n(),
    .groups = 'drop'
  ) %>%
  ggplot(aes(
    x = product_id,
    y = store_product_count,
    fill = action_bucket
  )) +
  geom_col(position = 'dodge') +
  coord_flip() +
  labs(
    title = 'Store Product Count by Product ID Filled on Action Bucket',
    x = 'Product',
    y = 'Store Product Count',
    fill = 'Action Bucket'
  )

store_product_summary %>%
  filter(in_stock < 6) %>%
  ggplot(aes(
    x = product_id,
    y = out_of_stock,
    fill = store_id
  )) +
  geom_col(position = 'dodge') +
  labs(
    title = 'Stockout Severity by Retailer and Product',
    x = 'Product',
    y = 'Total Out of Stock Days',
    fill = 'Retailer'
  )






































































