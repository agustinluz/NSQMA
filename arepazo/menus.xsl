<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:template match="/">
        <html>
            <body>
                <h1>MENUS</h1>
                <table border="1">
                    <tr style="color:blue">
                        <td>Tipo De Menu</td>
                        <td>Plato</td>
                        <td>Ingredientes</td>
                    </tr>
                    <xsl:for-each select="/arepazo/menu">
                        <xsl:variable name="id" select="@id" />
                    </xsl:for-each>
                </table>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>