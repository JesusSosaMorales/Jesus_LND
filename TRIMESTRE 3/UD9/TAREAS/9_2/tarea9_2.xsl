<?xml version="1.0" encoding="UTF-8"?>
<!-- New document created with EditiX at Tue May 18 14:51:23 BST 2021 -->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

	<xsl:output method="html"/>
	<xsl:template match="/">
	<html>
		<body>
			<h2>Noticias con la palabra "abril" en el área de contenido:</h2>
			<table width="1000px;" style="border-style: solid; border-color: pink;">
				<tr>
					<td bgcolor="pink" style="width: 25%; text-align: left; border-style: solid; border-color: pink">TITULO</td>
					<td bgcolor="pink" style="width: 75%; text-align: left; border-style: solid; border-color: pink">CONTENIDO</td>
				</tr>
				<xsl:apply-templates select="/rss/channel/item[contains(description, 'abril')]" mode="abril"/>
			</table>
			<br/>
			<table width="1000px;" style="border-style: solid; border-color: pink;">
				<tr>
					<td bgcolor="pink" style="width: 25%; text-align: left; border-style: solid; border-color: pink">FECHA</td>
					<td bgcolor="pink" style="width: 25%; text-align: left; border-style: solid; border-color: pink">TITULO</td>
					<td bgcolor="pink" style="width: 50%; text-align: left; border-style: solid; border-color: pink">CONTENIDO</td>
				</tr>
				<xsl:apply-templates select="/rss/channel/item" mode="sc"/>
			</table>
		</body>
	</html>
	</xsl:template>
	
	<xsl:template match="item" mode="abril">
		<tr>
			<td bgcolor="pink" style="text-align: left; border-style: solid; border-color: pink"><xsl:value-of select="title"/></td>
			<td style="text-align: left;"><xsl:value-of select="description"/></td>
		</tr>
	</xsl:template>
	
	<xsl:template match="item" mode="sc">
		<xsl:choose>
			<xsl:when test="title[contains(text(), 'S/C')]">
				<tr>
					<td bgcolor="pink" style="text-align: left; border-style: solid; border-color: pink"><xsl:value-of select="pubDate"/></td>
					<td style="text-align: left;"><xsl:value-of select="title"/></td>
					<td style="text-align: left;"><xsl:value-of select="description"/></td>

				</tr>
			</xsl:when>
			<xsl:when test="title[contains(text(), 'Santa Cruz de Tenerife')]">
				<tr>
					<td bgcolor="pink" style="text-align: left; border-style: solid; border-color: pink"><xsl:value-of select="pubDate"/></td>
					<td style="text-align: left;"><xsl:value-of select="title"/></td>
					<td style="text-align: left;"><xsl:value-of select="description"/></td>
				</tr>
			</xsl:when>
		</xsl:choose>
	</xsl:template>
</xsl:stylesheet>
