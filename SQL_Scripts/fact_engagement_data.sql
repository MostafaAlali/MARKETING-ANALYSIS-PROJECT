SELECT 
    EngagementID,
    ContentID,
    UPPER(REPLACE(REPLACE(ContentType, 'SOCIALMEDIA', 'SOCIAL MEDIA'), 'NEWSLETTER', 'NEWS LETTER')) AS ContentType_Cleaned,
    Likes,
    CONVERT(VARCHAR, EngagementDate, 101) AS Date_Eng,
    CampaignID,
    ProductID,
    LEFT(ViewsClicksCombined, CHARINDEX('-', ViewsClicksCombined) - 1) AS Views,
    RIGHT(ViewsClicksCombined, LEN(ViewsClicksCombined) - CHARINDEX('-', ViewsClicksCombined)) AS Clicks
FROM engagement_data
