<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:template match="/">
        <html>
            <body>
                <h1>MENUS</h1>
                <table border="1">
                    <tr style="color:blue">
                        <td>ID</td>
                        <td>Tipo De Menu</td>
                        <td>Plato</td>
                        <td>Ingredientes</td>
                        <td>Precio</td>
                        <td>COLOR DISTINCION</td>
                    </tr>
                    <xsl:for-each select="/arepazo/menu">
                        <xsl:variable name="id" select="@id" />
                        <tr>
                            <td>
                                <xsl:value-of select="$id"/>
                            </td>
                            <td>
                                <xsl:value-of select="@tipo"/>
                            </td>
                            <td>
                                <xsl:value-of select="nombre"/>
                            </td>
                            <td>
                                <ul>
                                    <xsl:for-each select="ingrediente">
                                        <li>
                                            <xsl:value-of select="." /> (<xsl:value-of select="@cantidad" /> kg)
                                        </li>
                                    </xsl:for-each>
                                </ul>
                            </td>
                            <td>
                                <xsl:value-of select="precio"/>
                            </td>
                           
                            <xsl:choose>
                                <xsl:when test="@tipo='Comida'">
                                    <td style="background-color:orange;width:65px"></td>
                                </xsl:when>
                                <xsl:when test="@tipo='Bebidas'">
                                    <td style="background-color:blue;width:65px"></td>
                                </xsl:when>
                                <xsl:when test="@tipo='Postres'">
                                    <td style="background-color:green;width:65px"></td>
                                </xsl:when>
                                <xsl:otherwise>
                                    <td></td>
                                </xsl:otherwise>
                            </xsl:choose>
                            
                        </tr>
                    </xsl:for-each>
                </table>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>