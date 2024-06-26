<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:template match="/">
        <html>
            <body>
                <h1>Equipos</h1>
                <table border="1">
                    <tr style="color:blue">
                        <td>Id</td>
                        <td>Nombre</td>
                        <td>Ciudad</td>
                        <td>Capacidad</td>
                        <td>Favor Arbitral</td>
                        <td>PJL</td>
                        <td>PJV</td>
                        <td>Partidos</td>
                        <td>Ganados</td>
                        <td>Perdidos</td>
                        <td>Empates</td>
                        <td>Puntos</td>
                    </tr>
                    <xsl:for-each select="/laliga/equipos/equipo">
                        <xsl:variable name="id" select="@id" />
                               
                        <tr>
                            <td>
                                <xsl:value-of select="$id" />
                            </td>
                            <td>
                                <xsl:value-of select="nombre" />
                            </td>

                            <td>
                                <xsl:value-of select="ciudad" />
                            </td>

                            <td>
                                <xsl:value-of select="capacidad" />
                            </td>
                            <xsl:choose>
                                <xsl:when test="ciudad='Madrid'">
                                    <td style="background-color:red;width:20px"></td>
                                </xsl:when>
                                <xsl:otherwise>
                                    <td></td>
                                </xsl:otherwise>
                            </xsl:choose>
                            <td>
                                <xsl:value-of select="count(/laliga/partidos/partido[local/nombre/@idEquipo=$id])" />
                            </td>
                            <td>
                                <xsl:value-of select="count(/laliga/partidos/partido[visitante/nombre/@idEquipo=$id])" />
                            </td>
                            <td>
                                <xsl:value-of select="count(/laliga/partidos/partido[local/nombre/@idEquipo=$id]
                                ) + 
                                count(/laliga/partidos/partido[visitante/nombre/@idEquipo=$id])" />
                            </td>   
                            <td>
                                <xsl:value-of select="count(/laliga/partidos/partido
                                    [
                                        local/nombre/@idEquipo=$id
                                        and 
                                        local/nombre/@goles > visitante/nombre/@goles
                                    ]
                                    ) +
                                    
                                    count(/laliga/partidos/partido
                                    [
                                        visitante/nombre/@idEquipo=$id
                                        and 
                                        visitante/nombre/@goles > local/nombre/@goles
                                    ]
                                    ) 
                                    " />
                                
                            </td>
                            <td>
                                <xsl:value-of select="count(/laliga/partidos/partido
                                    [
                                        local/nombre/@idEquipo=$id
                                        and 
                                        visitante/nombre/@goles > local/nombre/@goles
                                    ]
                                    ) +
                                    
                                    count(/laliga/partidos/partido
                                    [
                                        visitante/nombre/@idEquipo=$id
                                        and 
                                        local/nombre/@goles > visitante/nombre/@goles
                                    ]
                                    ) 
                                    " />
                            </td>
                            <td>
                                <xsl:value-of select="count(/laliga/partidos/partido
                                [
                                        local/nombre/@idEquipo=$id
                                        and 
                                        local/nombre/@goles = visitante/nombre/@goles
                                    ]
                                    ) +
                                    
                                    count(/laliga/partidos/partido
                                    [
                                        visitante/nombre/@idEquipo=$id
                                        and 
                                        visitante/nombre/@goles = local/nombre/@goles
                                    ]
                                    ) 
                                    " />
                            </td>
                            <td>
                                <xsl:value-of select="(count(/laliga/partidos/partido
                                [
                                    local/nombre/@idEquipo=$id
                                    and 
                                    local/nombre/@goles > visitante/nombre/@goles
                                ]
                                ) +
                                
                                count(/laliga/partidos/partido
                                [
                                    visitante/nombre/@idEquipo=$id
                                    and 
                                    visitante/nombre/@goles > local/nombre/@goles
                                ]
                                ) ) *3
                                +
                                count(/laliga/partidos/partido
                                [
                                        local/nombre/@idEquipo=$id
                                        and 
                                        local/nombre/@goles = visitante/nombre/@goles
                                    ]
                                    ) +
                                    
                                    count(/laliga/partidos/partido
                                    [
                                        visitante/nombre/@idEquipo=$id
                                        and 
                                        visitante/nombre/@goles = local/nombre/@goles
                                    ]
                                    ) *1 
                                    " /> 
                            </td>
                        </tr>
                    </xsl:for-each>
                </table>
                <table border="1">
                    <tr>
                        <td>Id</td>
                        <td>NombreLocal</td>
                        <td>MARCADOR</td>
                        <td>NombreVisitante</td>
                        <td>VICTORIA</td>
                    </tr>
                    <xsl:for-each select="/laliga/partidos/partido">
                        <xsl:variable name="id" select="@id" />
                        <tr>
                           <td>
                                <xsl:value-of select="$id"/>
                           </td>
                           <td>
                                <xsl:value-of select="local/nombre"/>
                           </td>
                           <td>
                                <xsl:value-of select="local/nombre/@goles"/>
                                -
                                <xsl:value-of select="visitante/nombre/@goles"/>
                           </td>
                           <td>
                                <xsl:value-of select="visitante/nombre"/>
                           </td>

                            <xsl:choose>
                                <xsl:when test="local/nombre/@goles > visitante/nombre/@goles">
                                    <td style="background-color:blue;width:65px"></td>
                            </xsl:when>
                                
                                
                                <xsl:when test="local/nombre/@goles = visitante/nombre/@goles">
                                    <td style="background-color:green;width:65px"></td>
                                </xsl:when>
                                
                                <xsl:when test="visitante/nombre/@goles > local/nombre/@goles">
                                    <td style="background-color:red;width:65px"></td>
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