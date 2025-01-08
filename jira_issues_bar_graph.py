import matplotlib.pyplot as plt
from jira import JIRA
from datetime import datetime, timedelta
import calendar

# Connect to Jira
jira = JIRA(server='https://your-jira-server.com', basic_auth=('username', 'password'))

# Get the current date
today = datetime.today()

# Prepare data for the last 12 months
months = []
issue_counts = []

for i in range(12):
    # Calculate the first day of the month
    first_day = (today.replace(day=1) - timedelta(days=i*30)).replace(day=1)
    # Calculate the last day of the month
    last_day = first_day.replace(day=calendar.monthrange(first_day.year, first_day.month)[1])

    # JQL query to get issues created in the month
    jql = f'created >= {first_day.strftime("%Y-%m-%d")} AND created <= {last_day.strftime("%Y-%m-%d")}'
    issues = jira.search_issues(jql)

    # Append month and issue count
    months.append(first_day.strftime("%b %Y"))
    issue_counts.append(len(issues))

# Plot the bar graph
plt.figure(figsize=(10, 6))
plt.bar(months, issue_counts, color='skyblue')
plt.xlabel('Month')
plt.ylabel('Number of Open Issues')
plt.title('Number of Jira Issues Opened in the Last 12 Months')
plt.xticks(rotation=45)
plt.tight_layout()
plt.show()
