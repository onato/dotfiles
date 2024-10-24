#!/bin/bash

# Replace these variables with your actual Jira details
JIRA_DOMAIN="intellum.atlassian.net"
JIRA_USERNAME="swilliams@intellum.com"

# Start from July 2024
START_YEAR=2024
START_MONTH=7

# Get the current year and month
CURRENT_YEAR=$(date +%Y)
CURRENT_MONTH=$(date +%m)

# Loop over each month from July 2024 to the current month
YEAR=$START_YEAR
MONTH=$START_MONTH

while [ $YEAR -lt $CURRENT_YEAR ] || ([ $YEAR -eq $CURRENT_YEAR ] && [ $MONTH -le $CURRENT_MONTH ]); do
  # Format the month as two digits
  MONTH_PADDED=$(printf "%02d" $MONTH)

  # Jira JQL query to find issues assigned to you and marked as done in the specific month
  JQL="assignee = currentUser() AND statusCategory = Done AND statusCategoryChangedDate >= startOfMonth($YEAR-$MONTH_PADDED) AND statusCategoryChangedDate < startOfMonth($YEAR-$((MONTH+1)))"

  # URL encode the JQL query
  ENCODED_JQL=$(echo $JQL | jq -sRr @uri)

  # Jira API endpoint
  JIRA_API_URL="https://$JIRA_DOMAIN/rest/api/2/search?jql=$ENCODED_JQL"

  # Fetch the count of issues from Jira
  ISSUE_COUNT=$(curl -s -u $JIRA_USERNAME:$JIRA_API_TOKEN -X GET \
    -H "Content-Type: application/json" $JIRA_API_URL |
    jq '.total')

  # Print the count of issues for the month
  echo "Year: $YEAR, Month: $MONTH_PADDED, Done Issues: $ISSUE_COUNT"

  # Increment the month and year
  MONTH=$((MONTH+1))
  if [ $MONTH -gt 12 ]; then
    MONTH=1
    YEAR=$((YEAR+1))
  fi
done
