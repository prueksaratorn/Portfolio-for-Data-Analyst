# US Wildfires
- 24 years of geo-referenced wildfire records
- Fire Data from 1992 - 2015 in US

### Procedures
1. Data is almost clear; nothing needs to be prepared or cleaned. All the details that I want are there.
2. Analyze the data and create queries.


2.1. Number of Fires by Year (จำนวนไฟป่าในแต่ละปี)
```sql
SELECT FIRE_YEAR AS Year, COUNT(*) AS NumberOfFires
FROM Fires
GROUP BY FIRE_YEAR
ORDER BY FIRE_YEAR
```

2.2. Number of Fires by cause (สาเหตุการเกิดไฟป่า)
```sql
SELECT STAT_CAUSE_DESCR AS Cause, COUNT(*) AS NumberOfFires
FROM Fires
GROUP BY STAT_CAUSE_DESCR
ORDER BY COUNT(*) DESC
```

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

2.5. Total Number of Fires (จำนวนไฟป่าที่เกิด)
```sql
SELECT COUNT(*) AS TotalNumberOfFires
FROM Fires
```

2.6. Number of Fires by Agency Preparing Fire Report (จำนวนของไฟป่าที่ถูกรายงานโดยหน่วยงาน)
```sql
SELECT NWCG_REPORTING_AGENCY AS AgencyPreparingFireReport, COUNT(*) AS NumberOfFires
FROM Fires
GROUP BY NWCG_REPORTING_AGENCY
ORDER BY COUNT(*) DESC
```

2.7. Number of Fires by Fire Size Class (จำนวนไฟป่า แบ่งตามขนาด)
```sql
SELECT FIRE_SIZE_CLASS AS FireSizeClass, COUNT(*) AS NumberOfFires
FROM Fires
GROUP BY FIRE_SIZE_CLASS
ORDER BY FIRE_SIZE_CLASS
```

2.8. Number of Fires by State (จำนวนไฟป่า แบ่งตามรัฐ)
```sql
SELECT State, COUNT(*) AS NumberOfFires
FROM NWCG_UnitIDActive_20170109
GROUP BY State
ORDER BY State
```
