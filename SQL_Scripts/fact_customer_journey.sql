WITH cleaned AS (
    SELECT 
        JourneyID,
        CustomerID,
        ProductID,
        CONVERT(DATE, VisitDate) AS VisitDate,
        UPPER(LTRIM(RTRIM(Stage))) AS Stage,
        Action,
        Duration,


        AVG(CAST(Duration AS FLOAT)) OVER (
            PARTITION BY CONVERT(DATE, VisitDate)
        ) AS avg_day_duration,

        ROW_NUMBER() OVER (
            PARTITION BY 
                JourneyID,
                CustomerID,
                ProductID,
                CONVERT(DATE, VisitDate),
                UPPER(LTRIM(RTRIM(Stage))),
                Action,
                Duration
            ORDER BY JourneyID
        ) AS row_num

    FROM customer_journey
)

SELECT 
    JourneyID,
    CustomerID,
    ProductID,
    CONVERT(VARCHAR, VisitDate, 101) AS VisitDate,
    Stage,
    Action,
    

    COALESCE(Duration, avg_day_duration) AS Duration

FROM cleaned
WHERE row_num = 1;