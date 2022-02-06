#### Preamble ####
# Purpose: Download dataset from opendatatoronto
# Author: Kimlin Chin
# Date: 30 January 2022
# Contact: kimlin.chin@mail.utoronto.ca
# License: MIT


#### Workspace setup ####
library(opendatatoronto)
library(tidyverse)

#### Data download ####
# from https://open.toronto.ca/dataset/fire-incidents/

# get package
package <- show_package("64a26694-01dc-4ec3-aa87-ad8509604f50")
package

resources <- list_package_resources(package)
resources

fire_incidents <-
  filter(resources, row_number() == 1) %>% get_resource()


#### Save Data ####
write_csv(
  fire_incidents,
  "inputs/data/fire_incidents.csv"
)



