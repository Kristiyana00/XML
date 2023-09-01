<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" >
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
                     <th>Tracks without atributes</th>
                     <th>Tracks with atributes</th>
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
            <!-- Изолзваме шаблона title, селектиращ стойността на елемента title. -->
            <xsl:apply-templates select="title"/>
         </td>
         <td>
            <!-- Изолзваме шаблона year, селектиращ стойността на елемента year. -->
            <xsl:apply-templates select="year"/>
         </td>
         <td>
            <!-- Създаваме order list. -->
            <ol>
               <!-- Използваме шаблона tracklist/track без атрибутите. -->
               <xsl:apply-templates select="tracklist/track" mode="withoutAttributes"/>
            </ol>
         </td>
         <td>
            <!-- Създаваме order list. -->
            <ol>
               <!-- Използваме шаблона tracklist/track с атрибутите. -->
               <xsl:apply-templates select="tracklist/track" mode="withAttributes"/>
            </ol>
         </td>
      </tr>
   </xsl:template>
   <!-- Създаваме темплейт, който match-ва catalog/cd/tracklist/track с атрибути. -->
   <xsl:template match="catalog/cd/tracklist/track" mode="withAttributes">
      <li>
         <!-- Извеждаме стойността на текущия елемент-->
         <xsl:apply-templates select="text()"/>
         <!-- За всеки атрибут извеждаме неговото име и стойност. -->
         <xsl:for-each select="@*">
            <br/>Име на атрибута:<xsl:value-of select="name()"/> - стойност на атрибута: <xsl:value-of select="."/>
         </xsl:for-each>
      </li>
   </xsl:template>
   <!-- Създаваме темплейт, който match-ва catalog/cd/tracklist/track без атрибути. -->
   <xsl:template match="catalog/cd/tracklist/track" mode="withoutAttributes">
      <li>
         <!-- Извеждаме стойността на текущия елемент -->
         <xsl:apply-templates select="text()"/>
      </li>
   </xsl:template>
</xsl:stylesheet>