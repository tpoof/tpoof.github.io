<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <xsl:output method="html" indent="yes" encoding="UTF-8"/>
  <xsl:strip-space elements="*"/>

  <xsl:template match="/">
    <html>
      <head>
        <title>List of Clients</title>

        <style type="text/css">
          table { border-collapse: collapse; }
          th, td { border: 2px solid blue; padding: 6px 10px; }
          th { text-align: center; }
          td.money { text-align: right; }
          td.low { color: red; font-weight: bold; }
        </style>
      </head>

      <body>
        <h1>List of Clients</h1>

        <table>
          <tr>
            <th>name</th>
            <th>phone</th>
            <th>email</th>
            <th>account_total</th>
          </tr>

          <xsl:for-each select="Accounts/Client">
            <tr>
              <td>
                <xsl:value-of select="concat(Name/First, ' ', Name/Last)"/>
              </td>

              <td>
                <xsl:value-of select="Phone"/>
              </td>

              <td>
                <xsl:value-of select="E-mail"/>
              </td>

              <xsl:variable name="acct" select="number(normalize-space(Account_Total))"/>

              <xsl:choose>
                <xsl:when test="$acct &lt;= 80000">
                  <td class="money low">
                    <xsl:text>$</xsl:text>
                    <xsl:value-of select="format-number($acct, '#,##0')"/>
                  </td>
                </xsl:when>
                <xsl:otherwise>
                  <td class="money">
                    <xsl:text>$</xsl:text>
                    <xsl:value-of select="format-number($acct, '#,##0')"/>
                  </td>
                </xsl:otherwise>
              </xsl:choose>

            </tr>
          </xsl:for-each>
        </table>
      </body>
    </html>
  </xsl:template>

</xsl:stylesheet>
