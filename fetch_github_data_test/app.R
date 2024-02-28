library(shiny)
library(httr)
library(readr)

# Function to fetch data from GitHub
fetchDataFromGitHub <- function(repo, path, token = NULL) {
  url <- sprintf("https://raw.githubusercontent.com/%s/master/%s", repo, path)
  response <- GET(url)
  if (http_status(response)$category == "Success") {
    content <- content(response, as = "text")
    return(content)
  } else {
    stop("Failed to fetch data from GitHub:", http_status(response)$reason)
  }
}

# Define UI
ui <- fluidPage(
  titlePanel("GitHub Data Fetching Example"),
  sidebarLayout(
    sidebarPanel(
      # Placeholder for inputs if needed
    ),
    mainPanel(
      tableOutput("github_data_table")
    )
  )
)

# Define server logic
server <- function(input, output, session) {
  
  # Function to fetch and display data from GitHub
  output$github_data_table <- renderTable({
    # Fetch data from GitHub
    github_data <- fetchDataFromGitHub("economica-thomas-mayr/api_test", "fetch_github_data_test/sample_data.csv")
    
    # Process the fetched CSV data using read_csv()
    data_frame <- read_csv(github_data)
    
    # Return the processed data to display in the table
    return(data_frame)
  })
}

# Run the application
shinyApp(ui = ui, server = server)
