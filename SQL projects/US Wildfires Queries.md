# US Wildfires
- Open Datasource From: [Kaggle](https://www.kaggle.com/datasets/rtatman/188-million-us-wildfires)

## Procedures
### 1. Data is almost clear; nothing needs to be prepared or cleaned.
### 2. Analysis Objectives:
- To identify and analyze the yearly trends in the occurrence of wildfires.
- To determine the most common causes of wildfires.
- To map out and analyze the geographic distribution of wildfires.
- To provide detailed information on wildfire incidents, including the handling and management by different agencies.
- To assess the total number of wildfire incidents over a given period.
- To categorize wildfires based on their size and analyze the distribution of fire sizes.
- To analyze the number of wildfires occurring in different states.


2.1. Number of Fires by Year (จำนวนไฟป่าในแต่ละปี)
```sql
SELECT FIRE_YEAR AS Year, COUNT(*) AS NumberOfFires
FROM Fires
GROUP BY FIRE_YEAR
ORDER BY FIRE_YEAR
```
![q1](https://img5.pic.in.th/file/secure-sv1/q1.png)

2.2. Number of Fires by cause (สาเหตุการเกิดไฟป่า)
```sql
SELECT STAT_CAUSE_DESCR AS Cause, COUNT(*) AS NumberOfFires
FROM Fires
GROUP BY STAT_CAUSE_DESCR
ORDER BY COUNT(*) DESC
```
![q2](https://img2.pic.in.th/pic/q2.png)

2.3. Geographic Distribution of Fires (รัฐที่เกิดไฟป่าบ่อย)
```sql
SELECT
    nw.State,
    COUNT(*) AS NumberOfFires
FROM Fires fi
JOIN NWCG_UnitIDActive_20170109 nw
ON fi.OBJECTID = nw.OBJECTID
GROUP BY nw.State
ORDER BY NumberOfFires DESC
```
![q3](https://img5.pic.in.th/file/secure-sv1/q3.png)

2.4. Details of Fires (รายละเอียดไฟป่าและผู้จัดการ)
```sql
SELECT
    fi.OBJECTID,
    fi.SOURCE_SYSTEM_TYPE AS TypeOfDatabase,
    fi.NWCG_REPORTING_AGENCY AS AgencyPreparingFireReport,
    fi.SOURCE_REPORTING_UNIT_NAME AS NameAgencyUnit,
    fi.FIRE_YEAR AS Year,
    fi.STAT_CAUSE_DESCR AS Cause,
    fi.CONT_DOY AS ControlDay,
    fi.FIRE_SIZE AS FireSize,
    fi.FIRE_SIZE_CLASS AS FireSizeClass,
    nw.GeographicArea,
    nw.WildlandRole AS WildlandRole,
    nw.UnitType,
    nw.State,
    nw.Country
FROM Fires fi
JOIN NWCG_UnitIDActive_20170109 nw
ON fi.OBJECTID = nw.OBJECTID
```
![q4](https://img2.pic.in.th/pic/q4.png)

2.5. Total Number of Fires by Year (จำนวนไฟป่าที่เกิดในแต่ละปี)
```sql
SELECT FIRE_YEAR ,COUNT(*) AS TotalNumberOfFires
FROM Fires
GROUP BY FIRE_YEAR
```
![q5](https://img2.pic.in.th/pic/q5.png)

2.6. Number of Fires by Agency Preparing Fire Report (จำนวนของไฟป่าที่ถูกรายงานโดยหน่วยงาน)
```sql
SELECT NWCG_REPORTING_AGENCY AS AgencyPreparingFireReport, COUNT(*) AS NumberOfFires
FROM Fires
GROUP BY NWCG_REPORTING_AGENCY
ORDER BY COUNT(*) DESC
```
![q6](https://img5.pic.in.th/file/secure-sv1/q6.png)

2.7. Number of Fires by Fire Size Class (จำนวนไฟป่า แบ่งตามขนาด)
```sql
SELECT FIRE_SIZE_CLASS AS FireSizeClass, COUNT(*) AS NumberOfFires
FROM Fires
GROUP BY FIRE_SIZE_CLASS
ORDER BY FIRE_SIZE_CLASS
```
![q7](https://img5.pic.in.th/file/secure-sv1/q7.png)

2.8. Number of Fires by State (จำนวนไฟป่า แบ่งตามรัฐ)
```sql
SELECT State, COUNT(*) AS NumberOfFires
FROM NWCG_UnitIDActive_20170109
GROUP BY State
ORDER BY NumberOfFires DESC
```
![q8](https://img2.pic.in.th/pic/q8.png)

### 3. Analysis data consists of:
- Number of Fires by Year: แสดงแนวโน้มของการเกิดไฟป่าในแต่ละปี แสดงถึงการเปลี่ยนแปลงของการเกิดไฟป่าในแต่ละปี
- Number of Fires by Cause: ระบุสาเหตุการเกิดไฟป่าที่พบบ่อยที่สุด แสดงถึง สาเหตุหลักของการเกิดไฟป่า สามารถวางแผนเพื่อลดปัจจัยการเกิดไฟป่าได้
- Geographic Distribution of Fires: แสดงรัฐที่เกิดไฟป่าบ่อยที่สุด แสดงถึง รัฐที่เกิดไฟป่าบ่อย โดยทางรัฐนั้นๆจะได้จัดสรรทรัพยากรเพื่อป้องกันหรือช่วยเหลือได้อย่างเพียงพอ
- Details of Fires: แสดงข้อมูลเกี่่ยวกับเหตุการณ์ไฟป่าและรายละเอียดของหน่วยงานที่จัดการดูแล
- Total Number of Fires by Year: แสดงจำนวนไฟป่ารวมทั้งหมดในแต่ละปี สามารถนำข้อมูลนี้มาใช้ในการประเมินจำนวนเหตุการณ์ไฟป่าที่เกิดขึ้น
- Number of Fires by Reporting Agency: แสดงหน่วยงานที่รายงานไฟป่ามากที่สุด เพื่อในอนาคตจะได้สามารถประเมินถึงการเพิ่มทรัพยากรให้กับหน่วยงานต่างๆ เพื่อการจัดการไฟป่าได้อย่างมีประสิทธิภาพ
- Number of Fires by Fire Size Class: แบ่งประเภทไฟป่าตามขนาด แสดงถึง ระดับของไฟ โดยที่หน่วยงานที่จัดการจะได้จัดสรรทรัพยากรเพื่อ take action ต่อไฟป่าที่เกิดขึ้นได้อย่างเพียงพอ
- Number of Fires by State: แสดงจำนวนไฟป่าตามรัฐต่างๆ

### 4. Summarize Data
#### These data can be used for:
- การวางแผนและป้องกันไฟป่าในอนาคต จากการระบุแนวโน้วไฟป่าในแต่ละปี ว่ามีมากขึ้นหรือน้อยลง เพื่อให้สามารถจัดการวางแผนป้องกันและจัดสรรทรัพยากรได้
- วางแผนและการบริหารจัดการไฟป่า จากการใช้ข้อมูล จำนวนไฟป่าที่เกิดในรัฐต่างๆจากรายงานที่เก็บโดยหน่วยงานต่างๆ เพื่อให้หน่วยงานต่างๆสามารถวางแผนมาตรการในการลดการเกิดไฟป่า

