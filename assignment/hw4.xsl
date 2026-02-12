<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="html" indent="yes" />

  <xsl:template match="/">
    <html>
      <head>
        <title>ABC Financial Startup</title>
        <style type="text/css">
          body { font-family: "Trebuchet MS", "Segoe UI", Arial, sans-serif; margin: 32px; color: #1f2933; background: #f7f9fb; }
          h1 { text-align: center; letter-spacing: 0.5px; margin-bottom: 16px; }
          .card { max-width: 840px; margin: 0 auto; background: #ffffff; padding: 24px 28px; border-radius: 14px; box-shadow: 0 10px 24px rgba(15, 23, 42, 0.08); }
          img { display: block; margin: 16px auto 24px auto; max-width: 100%; height: auto; border-radius: 10px; }
          p { line-height: 1.6; margin: 10px 0; }
          .label { font-weight: 600; color: #0f4c5c; }
        </style>
      </head>
      <body>
        <div class="card">
          <h1>ABC Financial Startup</h1>
          <img src="financialstartup.jpg" alt="ABC Financial Startup" />

          <p>
            ABC Financial Startup provides personalized financial planning, investment guidance, and long-term wealth strategies
            for individuals and families across the region. Our mission is to make smart financial decisions simple, transparent,
            and achievable for every client.
          </p>

          <p>
            <span class="label">Client Count:</span>
            <xsl:value-of select="count(/Accounts/Client)" />
          </p>

          <p>
            <span class="label">Client Names:</span>
            <xsl:for-each select="/Accounts/Client">
              <xsl:if test="position() &gt; 1">
                <xsl:choose>
                  <xsl:when test="position() = last()">, and </xsl:when>
                  <xsl:otherwise>, </xsl:otherwise>
                </xsl:choose>
              </xsl:if>
              <xsl:value-of select="concat(Name/First, ' ', Name/Last)" />
            </xsl:for-each>
          </p>

          <p>
            <span class="label">Long-Term Clients (over 7 years):</span>
            <xsl:value-of select="count(/Accounts/Client[Years &gt; 7])" />
          </p>
        </div>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>
