<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:template match="/">
        <!--Създаваме html документ. -->
        <html>
            <body>
                <!-- Създаваме таблица, коятао има следните характеристики.-->
                <table border="4" bordercolor="pink" cellspacing="1" cellpadding="3">
                    <thead>
                        <tr>
                            <!-- Заглавия на колоните на таблицата.-->
                            <th>CD Title</th>
                            <th>Year</th>
                            <th>Tracks</th>
                        </tr>
                    </thead>
                    <tbody>
                        <!-- Използваме template-a catalog в тялото на таблицата. -->
                        <xsl:apply-templates select="catalog"/>
                    </tbody>
                </table>
            </body>
        </html>
    </xsl:template>
    <!-- Създаваме темплейт, който match-ва cd.-->
    <xsl:template match="cd">
        <tr>
            <td>
                <!-- Изолзваме шаблона title. -->
                <xsl:apply-templates select="title"/>
                <!-- За всеки елемент title и неговите атрибути извеждаме следната информация. -->
                <xsl:for-each select="title/@*">
                    <!-- Извеждаме информация за името на атрибута и неговата стойност. -->
                    <br/>Име на атрибута: <xsl:value-of select="name()"/> - стойност на атрибута: <xsl:value-of select="."/>
                </xsl:for-each>
            </td>
            <td>
                <!-- Изолзваме шаблона year. -->
                <xsl:apply-templates select="year"/>
                <!-- За всеки елемент year и неговите атрибути извеждаме следната информация. -->
                <xsl:for-each select="year/@*">
                <!-- Извеждаме информация за името на атрибута и неговата стойност. -->
                    <br/>Име на атрибута: <xsl:value-of select="name()"/> - стойност на атрибута: <xsl:value-of select="."/>
                </xsl:for-each>
            </td>
            <td>
                <ol>
                    <xsl:apply-templates select="tracklist/track"/>
                </ol>
            </td>
        </tr>
    </xsl:template>
    <!-- Създаваме темплейт, който match-ва catalog/cd/tracklist/track.-->
    <xsl:template match="catalog/cd/tracklist/track">
            <li>
                <xsl:apply-templates select="text()"/>
                <!-- За всеки атрибут -->
                <xsl:for-each select="@*">
                    <!-- Извеждаме информация за името на атрибута и неговата стойност. -->
                    <br/>Име на атрибута: <xsl:value-of select="name()"/> - стойност на атрибута: <xsl:value-of select="."/>
                </xsl:for-each>
            </li>
    </xsl:template>
</xsl:stylesheet>