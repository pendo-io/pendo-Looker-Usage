# Description

This Pendo Usage Block allows you to go even deeper into your Pendo Usage data to explore things such as Monthly Active Users and Monthly Active Accounts, Top 10 Pages and Features by Visitor and Account, and supporting data such as Account Industry, User OS, Browser, and Browser version counts.  Using this information, you can gain insights into how your application is being used to help inform product direction.  You can also use this data to leverage another key feature within Pendo - using Guides to drive behavior of users of your application.

# Pendo Usage - Visualized with Looker

The Block was built using representative components to pull data from Pendo (Xplenty and the Pendo public API), transform it as necessary (ex. convert dates from epoch to human-readable, apply a hash to PII data like visitorId), load it into a data warehouse / repository (in this case, Snowflake), and visualize it via Looker.

Following are the step-by-step implementation instructions for implementing this Block:

Prerequisite:  The data extraction step leverages the Pendo public API.  This can be found by logging into your Pendo UI and navigating to Settings (lower left corner) -> Integrations -> Integration Keys.  If Integration Keys is greyed-out, please contact your Pendo CSM to inquire about pricing and activation the Pendo Integration API  package.

## Step 1 - Constructing the Pendo API calls used to build tables leveraged by this Block:

To get started and ensure your API calls will work as expected, open your favorite RESTful API client to build the API calls that will pull the Pendo data used by this Looker Block.

Go to [this GitHub repository](https://github.com/pendo-io/pendo-ETL-API-calls) and download each of the pre-defined calls.

All of these API calls use the following Type, URL and Header values:

```
Type = Post
URL = https://app.pendo.io/api/v1/aggregation
Headers:
X-Pendo-Integration-Key = <your Pendo Integration API Key>
Content-Type = application/json
```
**Please be sure to read each API call's README and follow the guidance and special handling noted in those documents.**

Run and refine each of these calls in your RESTful client so you have exactly the data you want to load and use for this dashboard Block.

## Step 2 - Extract and Transform the data then load it into Snowflake using Xplenty:

What is Xplenty?

Xplenty is a leading Extract, Transform and Load (ETL) tool to help you easily move data from one data source to another.

Why did we used Xplenty for this example?

Xplenty is the tool Pendo uses internally to move data from a variety of sources (Pendo, Marketo, Salesforce, etc.) into a reporting data warehouse for BI purposes.  It was handy and is super simple to us.

You could use whatever ETL tool, scripts, etc. you're comfortable with.  The following instructions should be useful in a general sense if you elect to use an alternative to Xplenty.

Repeat the below process for each of the API calls you downloaded.

**Getting started**
- Log in and click New Package
- Name the package, leave Type as Dataflow, leave Template set to Blank, and click Create Package.
- From within the Package, Build the Dataflow by clicking Add component.
- Select API - Rest API under Sources

**Build the API call**
- Leave authentication set to None. Click Next.
- Choose the POST method with the dropdown option
- Copy the API URL from your RESTful API client and paste into the URL field next to Post
- Copy the Key names and Values from your RESTful API client’s Headers and paste as keys and values under Headers
- Copy the request body your RESTful API client for the second API call you created above and paste it into the Body field
- Leave the Response type set to JSON. Enter `$.results[*]` into the Base record JSONPath Expression field. Click Next.

It might take a little while for the input fields to render (API is firing and bringing back column headings). Once it renders, click Select all in Available Fields to add all the columns to the Selected Fields. Click Save to close the API building interface.

With this API built in Xplenty, you can configure transformations and destinations to fulfill your specific use case. To add a transformation, click the + Add component button and select a transformation component. Add it to your package, connect it upstream to your Source and downstream to you Destination database, refresh available fields.

Xplenty makes transformations simple, although the syntax can be a little counterintuitive at first. [Review their documentation](http://community.xplenty.com/knowledgebase/articles/173787-xplenty-functions) to familiarize yourself with the available functions. Notably, we used the date transformation function to convert epoch time to a human-readable date before loading it into Snowflake.  In addition, the SHA256 hash function is a perfect way to protect PII data.

For this Block, we created the following in Snowflake:
- Warehouse = `COMPUTE_WH`
- Schema = `PENDO`
- Database = `PENDO`
- Tables = `VISITORS` `ACCOUNTS` `ALLFEATURES` `ALLPAGES` `FEATUREEVENTS` `PAGEEVENTS` `EVENTS`

The table column names are defined by the field names included in the `select` statement in the pre-defined API calls.  Please leave them as they are to ensure success with this Block.

We used Xplenty to transform all `date and time` values to a Date using the Xplenty Expression Builder.  Be sure to create all tables that contain `date and time` values with those columns being set to DATE format.

All other column/data values can be left as-is.

Now that your data is flowing into Xplenty and Transformed to your specifications, our example continues using Snowflake as a target destination.

Xplenty must first be allowed access to your Snowflake data warehouse and a selcted schema/database combination [as described in their documentation](http://community.xplenty.com/knowledgebase/articles/1827793-allowing-xplenty-access-to-my-snowflake-account).

**Note:** When setting up the Snowflake connection within Xplenty, be sure to input all data warehouse, schema and table names using **ALL CAPS** as Looker will not be able to excute queries against this data set if you don't.

**Add Snowflake Component**
- Click the Add Component button then, under Destinations, select Google BigQuery.
- Select a target connection, Click next
- Enter a name **in ALL CAPS** for a Target table you want to create. Set the checkboxes and Operation type to meet your data needs. Scroll down and click Next
- Click the Auto-fill button to match the Input Fields to the Destination Columns.
- Replace the Destination Columns with the same exact values that auto-populate but make those names all **UPPERCASE**
- Click Save.
- Click the Save & Run job button to see if what you built will run successfully. Select the cluster to run the job on, select the package you just created, and since there are no User or System variables to define in this case, skip the Edit package variables step and click Run Job.

You should be presented with a message indicating the job number and which cluster the job is running on. Click the job status icon in the left nav to open the job status panel. If all is well with your package it will move past 0% after a bit then show 50%. If there is a problem, it will go from 0% to Failed status.

The job will show 100% and running, but is only complete when the status changes to 100% and complete. When you see that status, the job ran successfully and the data is now available in Snowflake.

## Step 3 - Verifying the data is loaded into Snowflake:

What is Snowflake?

Snowflake is a cloud-based big data warehouse / lake solution.

Why did we used Snowflake for this example?

As we discuss Pendo advanced analytics with our customer base, we hear Snowflake come up as an solution that they're using for their BI analytics data repository needs.  Pendo uses Xplenty -> BiqQuery -> Looker internally (and it all works great!), so we decided to use Snowflake to show a variation in architecture to cover an emerging trend we're seeing in our customer base.

**Validate your data in Snowflake**
Open Snowflake and navigate to the project, schema and tables you just created. If all went as planned, you should see schema and table information that matches what you defined for the schema, database and columns in Xplenty.

For each table, click on the table name then click Preview in the lower left nav. You should see a preview of the data you loaded for that table in the panel. Check to see if what you’re viewing is what you expected.

If what you’re seeing isn’t what you expected, circle back through the steps, starting with the API call, and refine until you get the data you want.

## Step 4 - Visualizing your data with this Looker Block:

Pendo uses Looker as their BI Visualization tool.

As we were setting up Looker to connect to Snowflake, we discovered a couple of items that aren’t covered in [Looker’s documentation](https://docs.looker.com/setup-and-management/database-config/snowflake):

- When setting up your looker_user in Snowflake, the generic instructions assume you don’t already have a data warehouse, schema and table set up.  The instructions will need edits to remove the generic portion of the user addition script.
- When naming your tables in Xplenty, be sure to use **ALL CAPS** for table **AND** column names.  Looker’s SQL calls seem to only send **ALL CAPS** to Snowflake.
- Be sure you run `grant select on all tables in schema <schema.database> to role looker_role ;` for looker_user any time you change the database tables in Snowflake

Also, be sure to follow **ALL** of the steps under "Adding the Connection".  There are some check boxes that need to be checked that were missed the first time around which prevented queries from executing.

For this example, we used the following values for the Looker connection to Snowflake:
- Connection name = `pendosnowflake`
- Data group name = `pendo_sandbox_default_datagroup`

Now that you've connected Looker to Snowflake, it's time to implement this Block in your Looker environment.

If you don’t have a Github account, you should start by creating one so you can access and download the code for the Block.

After you create your Github account, you can now download the entire Pendo NPS Block from this Github repo directly into your Looker application by following the directions outlined [here](https://docs.looker.com/data-modeling/getting-started/manage-projects#cloning_a_public_git_repository).

Assuming you followed the above steps to the letter, your Pendo Usage Model, View, and Dashboard should be ready to explore.  Congratulations!

Some things to check if the Block doesn't run right away:
- Navigate to the Pendo_Usage Model - update your connection in the model object if you used anything other than `pendosnowflake` as the connection name.
- While still in the Pendo_Usage Model - update your datagroup in the model object if you used anything other than `pendo_sandbox_default_datagroup` as the datagroup name.

If you need additional help, please contact help@pendo.io for assistance.
