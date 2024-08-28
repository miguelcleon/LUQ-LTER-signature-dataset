# Load necessary libraries
library(tidyverse)
library(EML)

# Define the paths to your EML files
eml_files <- list(
  "./EML/knb-lter-luq.23.4630183.xml",
  "./EML/knb-lter-luq.54.945760.xml",
  "./EML/knb-lter-luq.88.559516.xml",
  "./EML/knb-lter-luq.107.9996740.xml",
  "./EML/knb-lter-luq.14.470058.xml",
  "./EML/knb-lter-luq.16.538564.xml",
  "./EML/knb-lter-luq.17.573687.xml",
  "./EML/knb-lter-luq.20.4923064.xml",
  "./EML/knb-lter-luq.127.1676179.xml",
  "./EML/knb-lter-luq.162.862759.xml",
  "./EML/knb-lter-luq.174.2110862.xml",
  "./EML/knb-lter-luq.111.1441412.xml"
)

# Function to safely extract metadata
safe_extract <- function(x, field, default = NULL) {
  if (is.list(x) && field %in% names(x)) {
    return(x[[field]])
  } else {
    return(default)
  }
}

# Helper function to handle conversion of lists to character vectors safely
safe_to_chr <- function(x) {
  if (is.list(x)) {
    return(paste(unlist(x), collapse = " "))
  } else {
    return(as.character(x))
  }
}

# Function to safely extract descriptions
safe_description_extract <- function(description) {
  if (is.null(description) || length(description) == 0) {
    return("No description available")
  } else if (is.atomic(description)) {
    return(safe_to_chr(description))
  } else if (is.list(description)) {
    para <- safe_extract(description$section, "para", "No description available")
    return(safe_to_chr(para))
  } else {
    return("No description available")
  }
}

# Function to extract relevant metadata from each EML file
extract_metadata <- function(eml_path) {
  eml <- read_eml(eml_path)

  # Debugging: Print the structure of the EML dataset
  print(paste("Processing file:", eml_path))
  print(str(eml$dataset))

  title <- safe_extract(eml$dataset, "title", "No Title") %>% safe_to_chr()

  # Safely extract creators
  creators <- eml$dataset$creator %>%
    map_chr(function(creator) {
      name <- safe_extract(creator, "individualName")
      if (!is.null(name)) {
        return(safe_extract(name, "givenName", "Unknown") %>% safe_to_chr())
      } else {
        return("Unknown")
      }
    })

  pub_date <- safe_extract(eml$dataset, "pubDate", "Unknown") %>% safe_to_chr()

  # Safely extract abstract
  abstract <- eml$dataset$abstract %>%
    map_chr(function(abstract) {
      para <- safe_extract(abstract, "para", "No abstract available")
      return(safe_to_chr(para))
    })

  # Safely extract keywords
  keywords <- eml$dataset$keywordSet %>%
    map(function(keywordSet) {
      safe_extract(keywordSet, "keyword", NULL) %>% safe_to_chr()
    }) %>%
    flatten_chr() %>%
    unique()

  # Safely extract coverage
  coverage <- safe_extract(eml$dataset, "coverage", list()) %>% safe_to_chr()

  # Safely extract methods with improved error handling
  methods <- eml$dataset$methods$methodStep %>%
    map_chr(function(methodStep) {
      description <- safe_extract(methodStep, "description", NULL)
      return(safe_description_extract(description))
    })

  # If methods is not of length 1, collapse it into a single string
  if (length(methods) > 1) {
    methods <- paste(methods, collapse = "\n")
  }

  # Debugging: Print the extracted values
  print(paste("Title:", title))
  print(paste("Creators:", creators))
  print(paste("Publication Date:", pub_date))
  print(paste("Abstract:", abstract))
  print(paste("Keywords:", keywords))
  print(paste("Coverage:", coverage))
  print(paste("Methods:", methods))

  list(
    title = title,
    creators = creators,
    pub_date = pub_date,
    abstract = abstract,
    keywords = keywords,
    coverage = coverage,
    methods = methods
  )
}

# Extract metadata from all EML files
metadata_list <- map(eml_files, extract_metadata)

# Combine the extracted metadata
combined_title <- paste("Synthetic Dataset Combining:", paste(map_chr(metadata_list, "title"), collapse = "; "))
combined_creators <- unique(flatten_chr(map(metadata_list, "creators")))
combined_pub_date <- Sys.Date()  # Use the current date for the publication date
combined_abstract <- paste(map_chr(metadata_list, "abstract"), collapse = "\n\n")
combined_keywords <- unique(flatten_chr(map(metadata_list, "keywords")))
combined_methods <- paste(map_chr(metadata_list, "methods"), collapse = "\n\n")

# Construct the coverage section
combined_coverage <- metadata_list %>%
  map("coverage") %>%
  compact() %>%
  map_dfr(~ as.data.frame(.x)) %>%
  distinct()

# Create the EML document
eml <- list(
  dataset = list(
    title = combined_title,
    creator = map(combined_creators, ~ list(individualName = list(givenName = .x))),
    pubDate = as.character(combined_pub_date),
    abstract = list(section = list(para = list(literalLayout = combined_abstract))),
    keywordSet = list(keyword = combined_keywords),
    coverage = combined_coverage,
    methods = list(methodStep = list(description = list(section = list(para = list(literalLayout = combined_methods))))),
    contact = list(individualName = list(givenName = "Miguel", surName="Leon"), electronicMailAddress = "your_email@example.com"),
    publisher = list(
      organizationName = "Luquillo LTER",
      electronicMailAddress = "miguel.leon@unh.edu",
      onlineUrl = "https://luquillo.lter.network/"
    ),
    intellectualRights = list(section = list(para = "This synthetic dataset is released under the Creative Commons license - Attribution - CC BY. Users of this data should cite appropriately in any publication. Coordination with the original authors is encouraged."))
  )
)

# Write the EML document to a file
write_eml(eml, "./EML/synthetic_dataset_metadata.xml")
