# US Wildfires
- Open Datasource From: [Kaggle](https://www.kaggle.com/datasets/rtatman/188-million-us-wildfires)

## Power BI
- US Wildfires Power BI Report: [Wildfires Power BI](https://www.mediafire.com/file/2x1qq6er3rz41u8/US+Wildfires+Power+BI.pbix/file)

![US Wildfires Report](https://img2.pic.in.th/pic/Wildfires-power-bi.png)

#### Choose columns to create the report
```sql
SELECT
	OBJECTID,
	FIRE_YEAR,
	CONT_DOY,
	FIRE_SIZE,
	FIRE_SIZE_CLASS,
	STAT_CAUSE_DESCR,
	State
FROM Fires
```

#### Create a table to optimize data usage in Power BI
```sql
CREATE TABLE fire_details AS
SELECT
	OBJECTID,
	FIRE_YEAR,
	CONT_DOY,
	FIRE_SIZE,
	FIRE_SIZE_CLASS,
	STAT_CAUSE_DESCR,
	State
FROM Fires
```

#### This report allows you to select a year and state to view the following information:
- Fire count
- Average days to control fires
- Total fire size
- Fire size per day
- Causes of fires
- Fire sizes by state
- Distribution of fire sizes by cause
- Wildfires by cause

#### The report includes:
4 Scorecards:
- Fire Count
- Average Days to Control Fire
- Total Fire Size
- Fire Size per Day
  - New measure: Fire Size per Day = SUM(Fires[Fire_size]) / 365
  
1 Table:
- Fire Size, Cause

1 Clustered Bar Chart:
- Fire Size, State

1 Pie Chart:
- Fire Size, Cause

1 Stacked Column Chart:
- Cause, Cause Count

2 Drop-down Lists:
- Year
- State

### This report can be used for:
- Managing risk when buying or renting land in the area.
- Assisting government agencies in monitoring and preparing necessary resources.
- Raising awareness of wildfires.
